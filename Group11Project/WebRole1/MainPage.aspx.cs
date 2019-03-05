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
            Div1.Attributes.Add("style", "background-color:Black;");
            

        }

        protected void LogInButton_Click(object sender, ImageClickEventArgs e)
        {
            string username = textUsername.Text;
            string password = textPassword.Text;

            try
            {
                SqlConnectionStringBuilder con = new SqlConnectionStringBuilder();
                con.DataSource = "ljagervidb.database.windows.net";
                con.UserID = "rootroot";
                con.Password = "Root1234";
                con.InitialCatalog = "group11projectDB";

                using (SqlConnection connection = new SqlConnection(con.ConnectionString))
                {
                    connection.Open();

                    

                    string sql = "select * from account where username='" + username + "' and password='" + password + "'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["username"] = username;
                                Session["accountID"] = reader["accountID"].ToString();
                                Session["email"] = reader["email"].ToString();
                                Server.Transfer("MainPage.aspx");
                            }
                            else
                            {
                                Response.Redirect("MainPage.aspx");
                            }
                        }
                    }

                    connection.Close();
                }


            }
            catch (SqlException err)
            {

            }


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
    }
}