using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Sklep.DataLayer;
using E_Sklep.BusinessLayer;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;



namespace E_Sklep
{
    public partial class Default : System.Web.UI.Page
    {
        int ilosc_produktow;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCategoryName.Text = " Popularne Produkty w E-Sklepie";

            if (!IsPostBack)
            {
                GetCategory();
                GetProducts(0);
            }
        }

        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }

        private void GetProducts2(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID
            };

            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts2();
            dlProducts.DataBind();


        }
        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID
            };

            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts();
            dlProducts.DataBind();


        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();

            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                dt.Rows.Add(ProductID);
                Session["MyCart"] = dt;
                btnE_Sklep.Text = dt.Rows.Count.ToString();
                ilosc_produktow = Convert.ToInt32(btnE_Sklep.Text);
            }
            else 
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductID", typeof(string));
                dt.Rows.Add(ProductID);
                Session["MyCart"] = dt;
                btnE_Sklep.Text = dt.Rows.Count.ToString();
            }
        }

        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt32((((LinkButton)sender).CommandArgument));
            GetProducts2(CategoryID);
        }

        protected void lblLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Popularne Produkty w E-Sklepie";
            lblProducts.Text = "Produkty";
            pnlMyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlCategories.Visible = true;
            pnlProducts.Visible = true;

            GetProducts(0);
        }

        protected void btnE_Sklep_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["MyCart"];
            if (dt != null)
           
            {
             
                GetMyCart();
                lblCategoryName.Text = "Popularne Produkty w E-Sklepie";
                lblProducts.Text = "Realizacja zamówienia";
                pnlMyCart.Visible = true;
                pnlCheckOut.Visible = true;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
            }

            else
            {
            
            }
        }

        private void GetMyCart()
        {
            DataTable dt = (DataTable)Session["MyCart"];
            string productids = string.Empty;
           
        
            
       
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (i == 0 || dt.Rows.Count == 1)
                    {
                        productids = productids + dt.Rows[i]["ProductID"].ToString();
                    }
                    else
                    {
                        productids = productids + "," + dt.Rows[i]["ProductID"].ToString();
                    }
                }

                productids = "(" + productids + ")";
                if (dt.Rows.Count > 0)
                {
                    string query = "select * from Products where ProductID in" + productids + "";
                    DataTable dtProducts = GetData(query);
                    lblTotalProducts.Text = btnE_Sklep.Text;
                    dlCartProducts.DataSource = dtProducts;
                    dlCartProducts.DataBind();
                }
                else
                {
                    dlCartProducts.DataSource = null;
                    dlCartProducts.DataBind();
                    lblTotalProducts.Text = "0";
                }
            }
        

        public DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string Conn = WebConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
            SqlConnection con = new SqlConnection(Conn);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(dt);

            con.Close();
            return dt;
        }

       

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            string productID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            
            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];

                DataRow drr = dt.Select("ProductID=" + productID + "").FirstOrDefault();

                if (drr != null)
                    dt.Rows.Remove(drr);
               
                Session["MyCart"] = dt;
                btnE_Sklep.Text = dt.Rows.Count.ToString();   
            }
           
            GetMyCart();
            
        }

        protected void zamowButton_Click(object sender, EventArgs e)
        {
           
                if (imienazwtb.Text == "" || adrtb.Text == "" || teltb.Text == "" )
                {
                    alertlbl.Text = "Błednie wypełniony formularz";
                }
                else
                {
                    string productids = string.Empty;
                    DataTable dt = (DataTable)Session["MyCart"];

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (i == 0 || dt.Rows.Count == 1)
                        {
                            productids = productids + dt.Rows[i]["ProductID"].ToString();
                        }
                        else
                        {
                            productids = productids + "," + dt.Rows[i]["ProductID"].ToString();
                        }
                    }

                    Order k = new Order()
                    {
                        Dane = imienazwtb.Text,
                        Adres = adrtb.Text,
                        Telefon = teltb.Text,
                        Produkty = productids,

                    };
                    k.AddNewOrder();
                    alertlbl.Text = "Zamówienie przyjęte!";
                    ClearText();
                }
            }
            

        private void ClearText()
        {
            imienazwtb.Text = string.Empty;
            adrtb.Text = string.Empty;
            teltb.Text = string.Empty;
        }

        protected void btnE_Sklep_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = (DataTable)Session["MyCart"];
            if (dt != null)
            {

                GetMyCart();
                lblCategoryName.Text = "Popularne Produkty w E-Sklepie";
                lblProducts.Text = "Realizacja zamówienia";
                pnlMyCart.Visible = true;
                pnlCheckOut.Visible = true;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
            }

            



        }
    }
}