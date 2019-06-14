using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void LogInButton_Click(object sender, ImageClickEventArgs e)
        {
            string username = textUsername.Text;
            string password = textPassword.Text;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + username + "' and password='" + password + "' and isDeleted=0",con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["username"] = username;
                    string accountType = reader.GetString(4);
                    Session["accountType"] = accountType;
                }
                
                Server.Transfer("MainPage.aspx");
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

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }
    }
}