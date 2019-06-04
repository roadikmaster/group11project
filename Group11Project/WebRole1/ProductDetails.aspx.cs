using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebRole1.Model;

namespace WebRole1
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string value = Session["productID"].ToString();
            IDLabel.Text = value;
        
      
        SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Product WHERE productID=@id AND isDeleted=0", con);
            cmd.Parameters.Add(new SqlParameter("id", value));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    NameLabel.Text = reader[1].ToString();
                    CategoryLabel.Text = reader[2].ToString();
                    string imageurl ="<image src='" + reader[3].ToString() + "' />";
                    ImagePlaceHolder.Controls.Add(new Literal { Text = imageurl});
                    PriceLabel.Text = reader[5].ToString();
                    string descriptiontext = "<p style= \"font-family:arial;\">" + reader[4].ToString() + "</p>";
                    Literal1.Text = descriptiontext;
                }
                
            }

            con.Close();

            
            if (Session["username"] == null)
            {
                IncreaseButton.Enabled = false;
                DecreaseButton.Enabled = false;
                QuantityText.Enabled = false;
                AddToCartButton.Enabled = false;
                ErrorLabel.Text = "You must be logged in to be able to add items to cart!";

            }

        }

        protected void LogInButton_Click(object sender, ImageClickEventArgs e)
        {
            string username = textUsername.Text;
            string password = textPassword.Text;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + username + "' and password='" + password + "' and isDeleted=0", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["username"] = username;
                    string accountType = reader.GetString(4);
                    Session["accountType"] = accountType;
                }

                Server.Transfer("ProductDetails.aspx");
            }
            else
            {
                ErrorMsg.Text = "Invalid login details";
            }

            con.Close();
        }



        protected void RegisterButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void LogOutButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = null;
            Server.Transfer("MainPage.aspx");
        }

        protected void UserAccountButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void FeaturesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Features.aspx");
        }

        protected void AboutUsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUsPage.aspx");
        }

        protected void ContactButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactPage.aspx");
        }

        protected void ShopButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            

            string 


            ErrorLabel.Text = "Successfully added item to your cart";
        }
    }
}