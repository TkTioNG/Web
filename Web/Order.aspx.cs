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
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conOrder();
            }
        }

        private void conOrder()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT O.* FROM \"Order\" AS O", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th>" + sdr.GetName(0) + "</th>" +
                                    "<th>" + sdr.GetName(1) + "</th>" +
                                    "<th>" + sdr.GetName(2) + "</th>" +
                                    "<th>" + sdr.GetName(3) + "</th>" +
                                    "<th>" + sdr.GetName(4) + "</th>" +
                                    "<th>" + sdr.GetName(5) + "</th>" +
                                    "<th>" + sdr.GetName(6) + "</th>" +
                                    "<th>" + sdr.GetName(7) + "</th>" + "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='CustomerOrder.aspx?orderno=" + sdr.GetValue(0) + "'>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "<td>" + sdr.GetValue(5) + "</td>" +
                                    "<td>" + sdr.GetValue(6) + "</td>" +
                                    "<td>" + sdr.GetValue(7) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            list.InnerHtml = str;
                        }
                    }
                }
            }
        }

        protected void searchOrder(object sender, EventArgs e)
        {
            string search = searchbox.Text;

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT O.* FROM \"Order\" AS O " +
                    "WHERE " + //OrderNo = " + search + " OR " +
                    "O.Date = '" + search + "' OR " +
                    "O.Time = '" + search + "' OR " +
                    "O.Froms LIKE '%" + search + "%' OR " +
                    "O.Tos LIKE '%" + search + "%' OR " +
                    "O.CustID LIKE '%" + search + "%' OR " +
                    "O.SalespersonID LIKE '%" + search + "%' OR " +
                    "O.OrderStatus LIKE '%" + search + "%'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th>" + sdr.GetName(0) + "</th>" +
                                    "<th>" + sdr.GetName(1) + "</th>" +
                                    "<th>" + sdr.GetName(2) + "</th>" +
                                    "<th>" + sdr.GetName(3) + "</th>" +
                                    "<th>" + sdr.GetName(4) + "</th>" +
                                    "<th>" + sdr.GetName(5) + "</th>" +
                                    "<th>" + sdr.GetName(6) + "</th>" +
                                    "<th>" + sdr.GetName(7) + "</th>" + "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='CustomerOrder.aspx?orderno=" + sdr.GetValue(0) + "'>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "<td>" + sdr.GetValue(5) + "</td>" +
                                    "<td>" + sdr.GetValue(6) + "</td>" +
                                    "<td>" + sdr.GetValue(7) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            list.InnerHtml = str;
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT O.* FROM \"Order\" AS O WHERE O.OrderStatus = 'Cancel'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th>" + sdr.GetName(0) + "</th>" +
                                    "<th>" + sdr.GetName(1) + "</th>" +
                                    "<th>" + sdr.GetName(2) + "</th>" +
                                    "<th>" + sdr.GetName(3) + "</th>" +
                                    "<th>" + sdr.GetName(4) + "</th>" +
                                    "<th>" + sdr.GetName(5) + "</th>" +
                                    "<th>" + sdr.GetName(6) + "</th>" +
                                    "<th>" + sdr.GetName(7) + "</th>" + "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='CustomerOrder.aspx?orderno=" + sdr.GetValue(0) + "'>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "<td>" + sdr.GetValue(5) + "</td>" +
                                    "<td>" + sdr.GetValue(6) + "</td>" +
                                    "<td>" + sdr.GetValue(7) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            list.InnerHtml = str;
                        }
                    }
                }
            }
        }
    }
}