using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class AdminModifyProduct : System.Web.UI.Page
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

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            string id = IDText.Text;
            string name = NameText.Text;
            string category = CategoryList.SelectedItem.Value;
            string description = DescriptionText.Text;
            string image = ImageText.Text;
            string price = PriceText.Text;

            if (id.Equals(""))
            {
                MessageLabel.Text = "Please use Search button first";
            }

            else
            {
                SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                con.Open();

                SqlCommand cmd = new SqlCommand(@"UPDATE Product SET name=@name, category=@category, imageurl=@imageurl, description=@description, price=@price WHERE productID=@ID AND isDeleted=0", con);
                cmd.Parameters.Add(new SqlParameter("name", name));
                cmd.Parameters.Add(new SqlParameter("category", category));
                cmd.Parameters.Add(new SqlParameter("imageurl", image));
                cmd.Parameters.Add(new SqlParameter("description", description));
                cmd.Parameters.Add(new SqlParameter("price", price));
                cmd.Parameters.Add(new SqlParameter("ID", id));


                cmd.ExecuteNonQuery();
                con.Close();

                MessageLabel.Text = "Successfully update product information";
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string id = IDText.Text;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Product WHERE productID=@ID and isDeleted=0", con);
            cmd.Parameters.Add(new SqlParameter("ID", id));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    IDLabel.Text = reader[0].ToString();
                    NameText.Text = reader[1].ToString();
                    CategoryList.ClearSelection();
                    CategoryList.Items.FindByValue(reader[2].ToString()).Selected = true;
                    ImageText.Text = reader[3].ToString();
                    DescriptionText.Text = reader[4].ToString();
                    PriceText.Text = reader[5].ToString();
                }
            }
            else
            {
                MessageLabel.Text = "Product does not exist";
                IDLabel.Text = "";
            }

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string id = IDLabel.Text;

            if (id.Equals(""))
            {
                MessageLabel.Text = "Please use Search button first";
            }
            else
            {
                SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                con.Open();

                SqlCommand cmd = new SqlCommand(@"UPDATE Product SET isDeleted=1 WHERE productID=@ID AND isDeleted=0", con);
                cmd.Parameters.Add(new SqlParameter("ID", id));


                cmd.ExecuteNonQuery();
                con.Close();

                IDLabel.Text = "";
                NameText.Text = "";
                CategoryList.ClearSelection();
                CategoryList.Items.FindByValue("-Select-").Selected = true;
                ImageText.Text ="";
                DescriptionText.Text = "";
                PriceText.Text = "";

                MessageLabel.Text = "Successfully removed Product from the Shop";
            }

        }
    }
}