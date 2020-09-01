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
    public partial class StaffManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                conStaff();
            }
        }

        protected void btnBadAtt_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT StaffID, StaffName, StaffTitle, Department, StaffStatus " +
                    "FROM Staff " +
                    "WHERE StaffStatus LIKE '%Warn%'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th>Staff ID</th>" +
                                    "<th>Staff Name</th>" +
                                    "<th>Position</th>" +
                                    "<th>Department</th>" +
                                    "<th>Status</th>" + "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StaffDetails.aspx?staffid=" + sdr.GetValue(0) + "'>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            stafflist.InnerHtml = str;
                        }
                    }
                }
            }
        }

        protected void searchStaff(object sender, EventArgs e)
        {
            string search = searchbox.Text;
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT StaffID, StaffName, StaffTitle, Department, StaffStatus " +
                    "FROM Staff " +
                    "WHERE StaffID LIKE '%" + search + "%' OR " +
                    "StaffName LIKE '%" + search + "%' OR " +
                    "StaffTitle LIKE '%" + search + "%' OR " +
                    "Department LIKE '%" + search + "%' OR " + 
                    "StaffStatus LIKE '%" + search + "%'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th>Staff ID</th>" +
                                    "<th>Staff Name</th>" +
                                    "<th>Position</th>" +
                                    "<th>Department</th>" +
                                    "<th>Status</th>" + "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StaffDetails.aspx?staffid=" + sdr.GetValue(0) + "'>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            stafflist.InnerHtml = str;
                        }
                    }
                }
            }
        }

        private void conStaff()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT StaffID, StaffName, StaffTitle, Department, StaffStatus " +
                    "FROM Staff", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<th>Staff ID</th>" +
                                    "<th>Staff Name</th>" +
                                    "<th>Position</th>" +
                                    "<th>Department</th>" +
                                    "<th>Status</th>" + "</thead> <tbody>";

                            while (sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='StaffDetails.aspx?staffid=" + sdr.GetValue(0) + "'>" +
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            stafflist.InnerHtml = str;
                        }
                    }
                }
            }
        }
    }
}