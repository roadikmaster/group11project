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
            //NewEmailTextBox.Text = Session["email"].ToString();
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string newEmail = NewEmailTextBox.Text;

            if (!newEmail.Equals(""))
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
                            command.CommandType = System.Data.CommandType.Text;
                            command.CommandText = "UPDATE Account SET email=@newemail WHERE username=@username";
                            command.Parameters.AddWithValue("@username", username);
                            command.Parameters.AddWithValue("@newemail", newEmail);

                            try
                            {
                                connection.Open();
                                int a = command.ExecuteNonQuery();
                                connection.Close();

                                Session["email"] = newEmail;
                                Server.Transfer("AccountProfile.aspx");

                            }
                            catch (SqlException ee)
                            {
                                //error will never happen
                            }

                        }
                    }

                    
                }
                catch (SqlException ee)
                {
                    //error will never happen
                }

                
                

                
            }

            else
            {
                Response.Redirect("EditAccountProfile.aspx");
            }
        }

        
    }
}