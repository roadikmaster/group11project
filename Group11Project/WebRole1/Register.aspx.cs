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
                                Server.Transfer("Register.aspx");
                            }
                            else
                            {
                                Response.Redirect("Register.aspx");
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

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string username = usernameText.Text;
            string password = passwordText.Text;
            string email = emailText.Text;

            if (username != "" && password != "" && email != "")
            {

                try
                {
                    SqlConnectionStringBuilder con = new SqlConnectionStringBuilder();
                    con.DataSource = "ljagervidb.database.windows.net";
                    con.UserID = "rootroot";
                    con.Password = "Root1234";
                    con.InitialCatalog = "group11projectDB";

                    using (SqlConnection connection = new SqlConnection(con.ConnectionString))
                    {
                        
                        using (SqlCommand command = new SqlCommand())
                        {
                            command.Connection = connection;            
                            command.CommandType = CommandType.Text;
                            command.CommandText = "INSERT into Account (username, password, email) VALUES (@username, @password, @email)";
                            command.Parameters.AddWithValue("@username", username);
                            command.Parameters.AddWithValue("@password", password);
                            command.Parameters.AddWithValue("@email", email);

                            try
                            {
                                connection.Open();
                                int a = command.ExecuteNonQuery();
                                connection.Close();

                                Response.Redirect("RegisterSuccessful.aspx");
                            }
                            catch (SqlException ee)
                            {
                                Console.WriteLine("Account existed");
                                connection.Close();

                                Response.Redirect("Register.aspx");

                            }
                            

                        }

                        
                    }


                }
                catch (SqlException err)
                {

                }

                
            }
            else
            {
                Response.Redirect("Register.aspx");
            }
            
            
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void LogOutButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = null;
            Server.Transfer("Register.aspx");
        }

        protected void UserAccountButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        
    }
}