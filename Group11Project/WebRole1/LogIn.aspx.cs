using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogInButton_Click(object sender, EventArgs e)
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
                                Session["Value"] = username.ToString();
                                Response.Redirect("WelcomePage.aspx");
                            }
                            else
                            {
                                Response.Redirect("LogIn.aspx");
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

        protected void registerButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}