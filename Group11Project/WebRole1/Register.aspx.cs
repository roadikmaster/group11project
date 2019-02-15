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
            Response.Redirect("LogIn.aspx");
        }
    }
}