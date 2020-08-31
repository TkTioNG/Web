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
    public partial class SalesReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conMonth();
                conSalesperson();
                conProduct();
            }
        }
                           
        private void conMonth()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(C.CustID) FROM Customer as C", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            custno.Value = sdr.GetValue(0).ToString();                        
                        }
                    }
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(O.OrderNo) FROM \"Order\" AS O", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            orderno.Value = sdr.GetValue(0).ToString();
                            paymentno.Value = sdr.GetValue(0).ToString();
                        }
                    }
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(OL.OrderNo), SUM(OL.Quantity) FROM OrderLine AS OL", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            transno.Value = sdr.GetValue(0).ToString();
                            soldno.Value = sdr.GetValue(1).ToString();
                        }
                    }
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT SUM(OL.Quantity * P.UnitPrice) FROM OrderLine AS OL, StockProduct AS SP, Product AS P " +
                    "WHERE OL.StockProductID = SP.StockProductID AND SP.ProductID = P.ProductID", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            revenue.InnerHtml = "Total Revenue(RM): " + sdr.GetValue(0).ToString();
                        }
                    }
                    con.Close();
                }
            }
        }

        private void conSalesperson()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT S.SalespersonID, S.SalespersonName, COUNT(DISTINCT O.OrderNo), COUNT(OL.OrderNo), SUM(OL.Quantity * P.UnitPrice) " +
                    "FROM Salesperson AS S, \"Order\" AS O, OrderLine AS OL, StockProduct AS SP, Product AS P " +
                    "WHERE S.SalespersonID = O.SalespersonID AND O.OrderNo = OL.OrderNo AND OL.StockProductID = SP.StockProductID AND " +
                    "SP.ProductID = P.ProductID " +
                    "GROUP BY S.SalespersonID, S.SalespersonName " +
                    "ORDER BY 5 DESC", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        Boolean test = false;
                        if (sdr.HasRows)
                        {
                            test = true;
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th> No. </th>" +
                                    "<th> ID </th>" +
                                    "<th> Name </th>" +
                                    "<th> No. of Orders </th>" +
                                    "<th> No. of Transaction </th>" +
                                    "<th> Revenue (RM) </th>" + "</thead> <tbody>";
                            int index = 1;
                            while (sdr.Read())
                            {
                                str += "<tr>" +
                                    "<td>" + index + "</td>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "</tr>";

                                if (index == 1)
                                {
                                    topsalesperson.InnerHtml = "Top Salesperson: " + sdr.GetValue(1).ToString(); 
                                    topsalespersontotal.InnerHtml = "Total Sales: RM " + sdr.GetValue(4).ToString();
                                }
                                index ++;
                            }

                            str += "</tbody> </table>";

                            bySalesperson.InnerHtml = str;
                        }
                    }
                    con.Close();
                }
            }
        }

        private void conProduct()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT TOP 10 P.ProductID, P.ProductName, COUNT(DISTINCT O.OrderNo), SUM(OL.Quantity), SUM(OL.Quantity * P.UnitPrice) " +
                    "FROM Product AS P, StockProduct AS SP, OrderLine AS OL, \"Order\" AS O " +
                    "WHERE P.ProductID = SP.ProductID AND SP.StockProductID = OL.StockProductID AND OL.OrderNo = O.OrderNo " +
                    "GROUP BY P.ProductID, P.ProductName " +
                    "ORDER BY 5 DESC", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        Boolean test = false;
                        if (sdr.HasRows)
                        {
                            test = true;
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th> No. </th>" +
                                    "<th> ID </th>" +
                                    "<th> Product </th>" +
                                    "<th> No. of Orders </th>" +
                                    "<th> No. of Units Sold </th>" +
                                    "<th> Revenue (RM) </th>" + "</thead> <tbody>";
                            int index = 1;
                            while (sdr.Read())
                            {
                                str += "<tr>" +
                                    "<td>" + index + "</td>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "</tr>";

                                if (index == 1)
                                {
                                    topproduct.InnerHtml = "Top Product: " + sdr.GetValue(1).ToString();
                                    topproducttotal.InnerHtml = "Total Sales: RM " + sdr.GetValue(4).ToString();
                                }
                                index++;
                            }

                            str += "</tbody> </table>";

                            byProduct.InnerHtml = str;
                        }
                    }
                    con.Close();
                }
            }
        }
    }
}