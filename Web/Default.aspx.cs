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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.connection();
            }
        }

        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT C.* FROM Customer AS C", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvTesting.DataSource = dt;
                            gvTesting.DataBind();
                            lblCount.Text = gvTesting.Rows.Count.ToString();
                        }
                    }
                }
                // show shipment
                using (SqlCommand cmd = new SqlCommand("SELECT S.*, FORMAT(S.ShipmentTimestamp,'yyyy-mm-dd hh:mm:ss.fffffff') FROM Shipment AS S", con))
                {
                    con.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvShipment.DataSource = dt;
                            gvShipment.DataBind();
                            lblCount.Text = gvShipment.Rows.Count.ToString();
                        }
                    }
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if(sdr.HasRows)
                        {
                            string str = "<table class=\"table\">";

                            str += "<thead>" +
                                    "<td>" + sdr.GetName(0) + "</td>"+
                                    "<td>" + sdr.GetName(1) + "</td>"+
                                    "<td>" + sdr.GetName(2) + "</td>"+
                                    "<td>" + sdr.GetName(3) + "</td>"+
                                    "<td>" + sdr.GetName(4) + "</td>" + "</thead> <tbody>";

                            while(sdr.Read())
                            {
                                str += "<tr class='clickable-row' data-href='CustomerOrder.aspx?orderno=" + sdr.GetValue(0) + "'>" + 
                                    "<td>" + sdr.GetValue(0) + "</td>" +
                                    "<td>" + sdr.GetValue(1) + "</td>" +
                                    "<td>" + sdr.GetValue(2) + "</td>" +
                                    "<td>" + sdr.GetValue(3) + "</td>" +
                                    "<td>" + sdr.GetValue(4) + "</td>" +
                                    "</tr>";
                            }

                            str += "</tbody> </table>";

                            Console.WriteLine(str);

                            wow.InnerHtml = str;
                        }
                    }
                }
            }
        }
    }
}