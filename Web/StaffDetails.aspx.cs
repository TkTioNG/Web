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
    public partial class StaffDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["staffid"]))
                {
                    string staffid = Request.QueryString["staffid"];
                    conStaffDetails(staffid);
                }
                else
                {
                    string staffid = "SS0001";
                    conStaffDetails(staffid);
                }
            }
        }

        private void conStaffDetails(string staffid)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT StaffID, StaffName, StaffEmail, StaffContactNo, StaffTitle, Department, StaffSalary, WorkingDay, WorkingHour, WeekendHour, StaffStatus " +
                    "FROM Staff " +
                    "WHERE StaffID = '" + staffid + "'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            txtstaffid.Value = sdr.GetString(0);
                            staffname.Value = sdr.GetString(1);
                            email.Value = sdr.GetString(2);
                            contact.Value = sdr.GetString(3);
                            position.Value = sdr.GetString(4);
                            department.Value = sdr.GetString(5);
                            salary.Value = sdr.GetDecimal(6).ToString();
                            workday.Value = sdr.GetString(7);
                            weekday.Value = sdr.GetString(8);
                            weekend.Value = sdr.GetString(9);
                            status.Value = sdr.GetString(10);
                        }
                    }
                }
            }
        }
    }
}