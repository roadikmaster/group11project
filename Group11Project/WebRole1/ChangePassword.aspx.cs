using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string inputAccountPassword = CurrentPasswordText.Text;
            string newPassword = NewPasswordText.Text;
            string retypeNewPasword = VerifyPasswordText.Text;
            string userRealPassword = null;
            bool correctPassword = false;
            

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + username + "' and isDeleted=0", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    userRealPassword = reader.GetString(2);
                }

            }

            con.Close();

           

            //check if user entered the password correctly
            if (inputAccountPassword.Equals(userRealPassword))
            {
                correctPassword = true;
            }

            
            

            //if user entered the old password correctly and the two new passwords aligned from the client side
            //update the new password in the database.
            if (correctPassword == true)
            {
                try
                {
                    con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    con.Open();

                    cmd = new SqlCommand(@"UPDATE Account SET password=@newpassword WHERE username=@username and isDeleted=0", con);
                    cmd.Parameters.Add(new SqlParameter("username", username));
                    cmd.Parameters.Add(new SqlParameter("newpassword", newPassword));

                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("WelcomePage.aspx");

                }
                catch (SqlException ee)
                {
                    //error will never happen
                }
                
            }

            

            //if user entered password incorrectly
            else
            {
                ErrorMsg.Text = "Incorrect Password";
               
            }



        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
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

        protected void AccountProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }
    }
}