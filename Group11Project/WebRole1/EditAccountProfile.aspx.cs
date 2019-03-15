using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class EditAccountProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Div1.Attributes.Add("style", "background-color:Black;");

            string username = Session["username"].ToString();

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + username + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    EmailText.Attributes.Add("placeholder", reader.GetString(3).ToString());
                }
            }
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

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string newEmail = EmailText.Text;

            if (newEmail.Equals(""))
            {
                newEmail = EmailText.Attributes["placeholder"].ToString();
            }

            try
            {
                SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                con.Open();

                SqlCommand cmd = new SqlCommand(@"UPDATE Account SET email=@newemail WHERE username=@username", con);
                cmd.Parameters.Add(new SqlParameter("username", username));
                cmd.Parameters.Add(new SqlParameter("newemail", newEmail));

                cmd.ExecuteNonQuery();
                con.Close();
                
            }
            catch (SqlException ee)
            {
                //error will never happen
            }

            Response.Redirect("AccountProfile.aspx");
        }

        
    }
}