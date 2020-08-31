using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web
{
    public partial class CustomerOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["orderno"]))
                {
                    int orderno = int.Parse(Request.QueryString["orderno"]);
                    conOrder(orderno);
                    conShipping(orderno);
                    conPayment(orderno);
                }
                else
                {
                    int orderno = 1000000001;
                    conOrder(orderno);
                    conShipping(orderno);
                    conPayment(orderno);
                }
            }
        }

        private void conOrder(int orderno)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                //O.OrderNo, O.Date, O.Time, O.From, O.To, O.OrderStatus
                //, C.CustName, C.CustEmail, S.SalespersonName 
                // O.CustID = C.CustID AND O.SalespersonID = S.SalespersonID AND
                //, Customer AS C, Salesperson AS S 
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT O.OrderNo, O.Date, O.Time, O.Froms, O.Tos, O.OrderStatus, C.CustName, C.CustContactNo, C.CustEmail, S.SalespersonName " +
                    "FROM \"Order\" AS O, Customer AS C, Salesperson AS S " +
                    "WHERE O.CustID = C.CustID AND O.SalespersonID = S.SalespersonID AND O.OrderNo=" + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            customer.Value = sdr.GetValue(6).ToString();
                            contact.Value = sdr.GetValue(7).ToString();
                            email.Value = sdr.GetValue(8).ToString();
                            status.Value = sdr.GetValue(5).ToString();
                            salesperson.Value = sdr.GetValue(9).ToString();
                            date.Value = sdr.GetDateTime(1).ToString("dd/MM/yyyy");
                            time.Value = sdr.GetValue(2).ToString();                            
                        }
                    }
                    con.Close();
                }

                Boolean hasRows = false;
                string str = "<table class=\"table\">";

                using (SqlCommand cmd = new SqlCommand(
                    "SELECT P.ProductName, P.UnitPrice, SP.StockProductID, OL.Quantity, OL.Discount, OL.OrderLineStatus, P.UnitPrice * OL.Quantity * (100 - OL.Discount) " +
                    "FROM OrderLine AS OL, StockProduct AS SP, Product AS P " +
                    "WHERE OL.StockProductID = SP.StockProductID AND SP.ProductID = P.ProductID " +
                    "AND OL.OrderNo = " + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            hasRows = true;
                            str += "<thead>" +
                                        "<th>" + sdr.GetName(0) + "</th>" +
                                        "<th>" + sdr.GetName(1) + "</th>" +
                                        "<th>" + sdr.GetName(3) + "</th>" +
                                        "<th>" + sdr.GetName(4) + "</th>" +
                                        "<th> Status </th>" +
                                        "<th> Sub Total </th>" + "</thead> <tbody>";
                            while (sdr.Read())
                            {
                                str += "<tr>" +
                                    "<td class='clickable-data' data-href='StockProduct.aspx?stockproduct=" + sdr.GetValue(2) + "'>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + "<input id=\"quantity\" type=\"text\" class=\"form-control editable\" runat=\"server\" value=\"" + sdr.GetValue(3) + "\" readonly>" + "</td>" +
                                    "<td>" + "<input id=\"discount\" type=\"text\" class=\"form-control editable\" runat=\"server\" value=\"" + sdr.GetValue(4) + "\" readonly>" + "</td>" +
                                    "<td>" + "<input id=\"orderstatus\" type=\"text\" class=\"form-control editable\" runat=\"server\" value=\"" + sdr.GetValue(5) + "\" readonly>" + "</td>" +
                                    "<td>" + string.Format("{0:0.00}", sdr.GetValue(6)) + "</td>" +
                                    "</tr>";    
                            }
                        }
                    }
                    con.Close();
                }

                using (SqlCommand cmd = new SqlCommand(
                    "SELECT SUM(P.UnitPrice * OL.Quantity * (100 - OL.Discount)) " +
                    "FROM OrderLine AS OL, StockProduct AS SP, Product AS P " +
                    "WHERE OL.StockProductID = SP.StockProductID AND SP.ProductID = P.ProductID " +
                    "AND OL.OrderNo = " + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            
                            str += "</tbody> <tfoot> <tr> <td></td> <td></td> <td></td> <td></td> <td id=\"total\"><b>Total</b></td> <td>" + string.Format("{0:0.00}", sdr.GetValue(0)) + "</td> </tr> </tfoot>";
                            str += "</table>";
                        }
                    }
                    con.Close();
                }

                if (hasRows)
                {
                    order_details.InnerHtml = str;
                }
            }
        }

        private void conShipping(int orderno)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT C.CustName, C.CustContactNo, D.DeliveryOrderNo, D.DeliveryDate, D.DeliveryTime, O.Froms, D.DeliveryAddress, S.ShipmentNo, S.ShipmentTimestamp, S.ShipmentLocation, S.Description " +
                    "FROM \"Order\" AS O, DeliveryOrder AS D, Shipment AS S, Customer AS C " +
                    "WHERE O.CustID = C.CustID AND O.OrderNo = D.OrderNo AND D.DeliveryOrderNo = S.DeliveryOrderNo AND O.OrderNo=" + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            sp_cust.Value = sdr.GetValue(0).ToString();
                            sp_contNo.Value = sdr.GetValue(1).ToString();
                            sp_DONo.Value = sdr.GetValue(2).ToString();
                            sp_date.Value = sdr.GetDateTime(3).ToString("dd/MM/yyyy");
                            sp_time.Value = sdr.GetValue(4).ToString();
                            sp_from.Value = sdr.GetValue(5).ToString();
                            sp_to.Value = sdr.GetValue(6).ToString();
                            sp_shipNo.Value = sdr.GetValue(7).ToString();

                            string str = "<table class=\"table\"> " +
                                        "<thead> " +
                                            "<th> Shipment No </th> " +
                                            "<th> Shipment Timestamp </th> " +
                                            "<th> Current Shipment Location </th> " +
                                            "<th> Description </th> " +
                                        "</thead> " +
                                        "<tbody> " +
                                            "<tr> " +
                                                "<td>" + sdr.GetValue(7) + "</td> " +
                                                "<td>" + sdr.GetValue(8) + "</td> " +
                                                "<td>" + sdr.GetValue(9) + "</td> " +
                                                "<td>" + sdr.GetValue(10) + "</td> " +
                                            "</tr> " +
                                        "</tbody> " +
                                        "<tfoot> <tr> <td></td> <td></td> <td></td> <td></td> </tr> </tfoot> </table>";

                            shipping_details.InnerHtml = str;
                        }
                    }
                    con.Close();
                }
            }
        }

        private void conPayment(int orderno)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT CP.CustPaymentID, CP.CustPaymentType, CP.CustPaymentDate, CP.CustPaymentTime, CP.CustPaymentAmount, CP.CustPaymentStatus " +
                    "FROM CustPayment AS CP " +
                    "WHERE CP.OrderNo=" + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            pm_payID.Value = sdr.GetValue(0).ToString();
                            pm_type.Value = sdr.GetValue(1).ToString();
                            pm_amount.Value = sdr.GetValue(4).ToString();
                            pm_date.Value = sdr.GetDateTime(2).ToString("dd/MM/yyyy");
                            pm_time.Value = sdr.GetValue(3).ToString();
                            pm_stat.Value = sdr.GetValue(5).ToString();
                    
                        }
                    }
                    con.Close();
                }
            }
        }
    }
}