using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Sklep.BusinessLayer;
using E_Sklep.DataLayer;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace E_Sklep.Admin
{
    public partial class OrderHandling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetZamowienia();
        }

        protected void zambtn_Click(object sender, EventArgs e)
        {
           
        }

        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString.ToString();
            }
        }
        private void GetZamowienia()
        {

            
            
            string sql = "SELECT * FROM Zamowienia";
            SqlConnection connection = new SqlConnection(ConnectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "Zamowienia");
            connection.Close();
            zamgv.DataSource = ds;
            zamgv.DataBind();
                 
            
        }

        private void Zrealizuj()
        { 
        
        }

       
    }
}