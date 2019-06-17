using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class AdminAddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            string name = NameText.Text;
            string category = CategoryList.SelectedItem.Value;
            string description = DescriptionText.Text;
            string url = ImageURLText.Text;
            string price = PriceText.Text;

            try
            {
                SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                con.Open();

                SqlCommand cmd = new SqlCommand(@"INSERT INTO Product (name, category, imageURL, description, price, isDeleted) VALUES (@name, @category, @url, @description, @price, @isDeleted)", con);
                cmd.Parameters.Add(new SqlParameter("name", name));
                cmd.Parameters.Add(new SqlParameter("category", category));
                cmd.Parameters.Add(new SqlParameter("url", url));
                cmd.Parameters.Add(new SqlParameter("description", description));
                cmd.Parameters.Add(new SqlParameter("price", price));
                cmd.Parameters.Add(new SqlParameter("isDeleted", "0"));

                cmd.ExecuteNonQuery();
                con.Close();

                MessageLabel.Text = "Successfully added new product in the Shop.";

            }
            catch (SqlException ee)
            {
                MessageLabel.Text = "Failed to add product. Product already existed in the shop";
            }

            
        }
    }
}