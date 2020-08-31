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
    public partial class StockProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["stockproductid"]))
                {
                    string stockproductid = Request.QueryString["stockproductid"];
                    conStockProduct(stockproductid);
                }
                else
                {
                    string stockproductid = "P00001W00001";
                    conStockProduct(stockproductid);
                }
            }
        }

        private void conStockProduct(string stockproductid)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT P.ProductName, P.ProductCategory, SP.ReorderLevel, SP.TargetStockLevel, P.Manufacturer, P.Supplier, P.Model, P.Description, P.Comments, " +
                    "SP.CurrentStock, SP.StockUnit, W.WarehouseLocation, SP.StockProductStatus " +
                    "FROM StockProduct AS SP, Product AS P, Warehouse AS W " +
                    "WHERE SP.ProductID = P.ProductID AND SP.WarehouseID = W.WarehouseID AND SP.StockProductID = \'" + stockproductid + "\'", con))
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();

                            txtID.Value = stockproductid;
                            productname.InnerHtml= sdr.GetValue(0).ToString();                            
                            txtCategory.Value = sdr.GetValue(1).ToString();
                            txtReorderLevel1.Value = sdr.GetValue(2).ToString();
                            txtTargetStockLevel.Value = sdr.GetValue(3).ToString();
                            txtManufacturer.Value = sdr.GetValue(4).ToString();
                            txtSupplier.Value = sdr.GetValue(5).ToString();
                            txtModel.Value = sdr.GetValue(6).ToString();
                            txtDescription.Value = sdr.GetValue(7).ToString();
                            txtComments.Value = sdr.GetValue(8).ToString();
                            txtCurrentStock.Value = sdr.GetValue(9).ToString();
                            txtStockUnit.Value = sdr.GetValue(10).ToString();
                            txtLocation.Value = sdr.GetValue(11).ToString();

                        }
                    }
                }
            }
        }
    }
}