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
    public partial class OrderForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["orderno"]))
                {
                    int orderno = int.Parse(Request.QueryString["orderno"]);
                    conInvoice(orderno);
                }
            }
        }

        private void conInvoice(int orderno)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                //O.OrderNo, O.Date, O.Time, O.From, O.To, O.OrderStatus
                //, C.CustName, C.CustEmail, S.SalespersonName 
                // O.CustID = C.CustID AND O.SalespersonID = S.SalespersonID AND
                //, Customer AS C, Salesperson AS S 
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT I.BillTo, C.CustName, D.DeliveryAddress, I.InvoiceIssueDate, I.InvoiceNo, I.InvoiceTerms, I.DueDate, I.InvoiceStatus " +
                    "FROM DeliveryOrder AS D, Invoice AS I, Customer AS C " +
                    "WHERE D.DeliveryOrderNo = I.DeliveryOrderNo AND D.CustID = C.CustID AND D.OrderNo=" + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            billTo.InnerHtml = sdr.GetValue(0).ToString();
                            shipname.InnerHtml = sdr.GetValue(1).ToString();
                            shipto.InnerHtml = sdr.GetValue(2).ToString();
                            issuedate.InnerHtml = sdr.GetDateTime(3).ToString("dd/MM/yyyy");
                            invoiceno.InnerHtml = sdr.GetValue(4).ToString();
                            terms.InnerHtml = sdr.GetValue(5).ToString();
                            duedate.InnerHtml = sdr.GetDateTime(6).ToString("dd/MM/yyyy");
                            status.InnerHtml = sdr.GetValue(7).ToString();
                        }
                    }
                    con.Close();
                }

                using (SqlCommand cmd = new SqlCommand(
                    "SELECT P.ProductName, OL.Quantity, P.UnitPrice, P.UnitPrice * OL.Quantity * (100 - OL.Discount) " +
                    "FROM OrderLine AS OL, StockProduct AS SP, Product AS P " +
                    "WHERE OL.StockProductID = SP.StockProductID AND SP.ProductID = P.ProductID AND OL.OrderNo = " + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {                            
                            int count = 1;
                            decimal sum = 0;

                            string str = "<table class=\"table\">";
                            str += "<thead>" +
                                        "<tr style=\"height:38px;\">" +
                                            "<th> No </th>" +
                                            "<th> Product </th>" +
                                            "<th> Quantity </th>" +
                                            "<th> Unit Price </th>" +
                                            "<th> Sub Total (RM) </th>" +
                                        "</tr>" +
                                    "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr style=\"height:44px;\">" +
                                            "<td>" + count + "</td>" +
                                            "<td style=\"text-align: left;\">" + sdr.GetValue(0) + "</td>" +
                                            "<td>" + sdr.GetValue(1) + "</td>" +
                                            "<td>" + string.Format("{0:0.00}", sdr.GetValue(2)) + "</td>" +
                                            "<td>" + string.Format("{0:0.00}", sdr.GetValue(3)) + "</td>" +
                                        "</tr>";

                                sum += Math.Round(sdr.GetDecimal(3), 2);
                                count++;
                            }

                            str += "</tbody> <tfoot>" +
                                    "<tr style=\"height:38px;\">" +
                                        "<td>&nbsp;</td>" +
                                        "<td>&nbsp;</td>" +
                                        "<td>&nbsp;</td>" +
                                        "<td><strong>Total</strong></td>" +
                                        "<td><strong>" + string.Format("{0:0.00}", sum) + "</strong></td>" +
                                    "</tr>" +
                                   "</tfoot>";

                            str += "</table>";

                            table.InnerHtml = str;
                        }
                    }
                    con.Close();
                }

                using (SqlCommand cmd = new SqlCommand(
                    "SELECT O.OrderNo, S.SalespersonName " +
                    "FROM \"Order\" AS O, Salesperson AS S " +
                    "WHERE O.SalespersonID = S.SalespersonID AND O.OrderNo=" + orderno, con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            salesperson.InnerHtml = sdr.GetValue(1).ToString();
                        }
                    }
                    con.Close();
                }
            }
        }
    }
}