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
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conList();
                conLocation();
                conProduct();
            }
        }

        private void conList()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT SP.StockProductID, P.ProductName, SP.CurrentStock, SP.StockUnit, W.WarehouseLocation, SP.StockProductStatus " +
                    "FROM StockProduct AS SP, Product AS P, Warehouse AS W " +
                    "WHERE SP.ProductID = P.ProductID AND SP.WarehouseID = W.WarehouseID " +
                    "ORDER BY NEWID()", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                        "<tr>" +
                                            "<th> Product </th>" +
                                            "<th> Current Stock </th>" +
                                            "<th> Unit </th>" +
                                            "<th> Location </th>" +
                                            "<th> Status </th>" +
                                        "</tr>" +
                                    "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StockProduct.aspx?stockproductid=" + sdr.GetValue(0) + "'>" +
                                            "<td>" + sdr.GetValue(1) + "</td>" +
                                            "<td>" + sdr.GetValue(2) + "</td>" +
                                            "<td>" + sdr.GetValue(3) + "</td>" +
                                            "<td>" + sdr.GetValue(4) + "</td>" +
                                            "<td>" + sdr.GetValue(5) + "</td>" +
                                        "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            prod_list.InnerHtml = str;
                        }
                    }
                }
            }
        }

        private void conProduct()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selected = ddlProduct.SelectedValue;
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT SP.StockProductID, P.ProductName, SP.CurrentStock, SP.StockUnit, W.WarehouseLocation, SP.StockProductStatus " +
                    "FROM StockProduct AS SP, Product AS P, Warehouse AS W " +
                    "WHERE SP.ProductID = P.ProductID AND SP.WarehouseID = W.WarehouseID AND P.ProductCategory = \'" + selected + "\'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                        "<tr>" +
                                            "<th> Product </th>" +
                                            "<th> Reorder Level </th>" +
                                            "<th> Reorder Amount </th>" +
                                            "<th> Target Stock Level </th>" +
                                            "<th> Quantity in Stock </th>" +
                                        "</tr>" +
                                    "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StockProduct.aspx?stockproductid=" + sdr.GetValue(0) + "'>" +
                                            "<td>" + sdr.GetValue(1) + "</td>" +
                                            "<td>" + sdr.GetValue(2) + "</td>" +
                                            "<td>" + sdr.GetValue(3) + "</td>" +
                                            "<td>" + sdr.GetValue(4) + "</td>" +
                                            "<td>" + sdr.GetValue(5) + "</td>" +
                                        "</tr>";
                            }

                            str += "</tbody> </table>";

                            product.InnerHtml = str;
                        }
                    }
                }
            }
        }

        private void conLocation()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selected = ddlLocation.SelectedValue;
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT SP.StockProductID, P.ProductName, SP.CurrentStock, SP.StockUnit, W.WarehouseLocation, SP.StockProductStatus " +
                    "FROM StockProduct AS SP, Product AS P, Warehouse AS W " +
                    "WHERE SP.ProductID = P.ProductID AND SP.WarehouseID = W.WarehouseID AND W.WarehouseID = \'" + selected + "\'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                        "<tr>" +
                                            "<th> Product </th>" +
                                            "<th> Reorder Level </th>" +
                                            "<th> Reorder Amount </th>" +
                                            "<th> Target Stock Level </th>" +
                                            "<th> Quantity in Stock </th>" +
                                        "</tr>" +
                                    "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StockProduct.aspx?stockproductid=" + sdr.GetValue(0) + "'>" +
                                            "<td>" + sdr.GetValue(1) + "</td>" +
                                            "<td>" + sdr.GetValue(2) + "</td>" +
                                            "<td>" + sdr.GetValue(3) + "</td>" +
                                            "<td>" + sdr.GetValue(4) + "</td>" +
                                            "<td>" + sdr.GetValue(5) + "</td>" +
                                        "</tr>";
                            }

                            str += "</tbody> </table>";

                            location.InnerHtml = str;
                        }
                    }
                }
            }
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selected = ddlLocation.SelectedValue;
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT SP.StockProductID, P.ProductName, SP.CurrentStock, SP.StockUnit, W.WarehouseLocation, SP.StockProductStatus " +
                    "FROM StockProduct AS SP, Product AS P, Warehouse AS W " +
                    "WHERE SP.ProductID = P.ProductID AND SP.WarehouseID = W.WarehouseID AND W.WarehouseID = \'" + selected + "\'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                        "<tr>" +
                                            "<th> Product </th>" +
                                            "<th> Reorder Level </th>" +
                                            "<th> Reorder Amount </th>" +
                                            "<th> Target Stock Level </th>" +
                                            "<th> Quantity in Stock </th>" +
                                        "</tr>" +
                                    "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StockProduct.aspx?stockproductid=" + sdr.GetValue(0) + "'>" +
                                            "<td>" + sdr.GetValue(1) + "</td>" +
                                            "<td>" + sdr.GetValue(2) + "</td>" +
                                            "<td>" + sdr.GetValue(3) + "</td>" +
                                            "<td>" + sdr.GetValue(4) + "</td>" +
                                            "<td>" + sdr.GetValue(5) + "</td>" +
                                        "</tr>";
                            }

                            str += "</tbody> </table>";

                            location.InnerHtml = str;
                        }
                    }
                }
            }
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selected = ddlProduct.SelectedValue;
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT SP.StockProductID, P.ProductName, SP.CurrentStock, SP.StockUnit, W.WarehouseLocation, SP.StockProductStatus " +
                    "FROM StockProduct AS SP, Product AS P, Warehouse AS W " +
                    "WHERE SP.ProductID = P.ProductID AND SP.WarehouseID = W.WarehouseID AND P.ProductCategory = \'" + selected + "\'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                        "<tr>" +
                                            "<th> Product </th>" +
                                            "<th> Reorder Level </th>" +
                                            "<th> Reorder Amount </th>" +
                                            "<th> Target Stock Level </th>" +
                                            "<th> Quantity in Stock </th>" +
                                        "</tr>" +
                                    "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StockProduct.aspx?stockproductid=" + sdr.GetValue(0) + "'>" +
                                            "<td>" + sdr.GetValue(1) + "</td>" +
                                            "<td>" + sdr.GetValue(2) + "</td>" +
                                            "<td>" + sdr.GetValue(3) + "</td>" +
                                            "<td>" + sdr.GetValue(4) + "</td>" +
                                            "<td>" + sdr.GetValue(5) + "</td>" +
                                        "</tr>";
                            }

                            str += "</tbody> </table>";

                            product.InnerHtml = str;
                        }
                    }
                }
            }
        }
    }
}