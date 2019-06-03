using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //compare login details with the ones from the database, if all user credentials are valid, logs the user in.
        protected void LogInButton_Click(object sender, ImageClickEventArgs e)
        {
            string username = textUsername.Text;
            string password = textPassword.Text;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + username + "' and password='" + password + "'", con);
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


        //proceed to registration form
        protected void RegisterButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        //adds the new account information into the database after the inputs are checked on the client side.
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string username = usernameText.Text;
            string password = passwordText.Text;
            string email = emailText.Text;


            try
            {
                SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                con.Open();

                SqlCommand cmd = new SqlCommand(@"INSERT INTO Account (username, password, email, accountType) VALUES (@username, @password, @email, @accountType)", con);
                cmd.Parameters.Add(new SqlParameter("username", username));
                cmd.Parameters.Add(new SqlParameter("password", password));
                cmd.Parameters.Add(new SqlParameter("email", email));
                cmd.Parameters.Add(new SqlParameter("accountType", "User"));

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("RegisterSuccessful.aspx");
            }
            catch (SqlException ee)
            {
                RegErrorMsg.Text = "Account already existed";
            }


            
            
            
        }
        //cancel registration and redirect user back to main page.
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        //logs, the user out, removes all the contents in the session and redirect to main page.
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
    }
}