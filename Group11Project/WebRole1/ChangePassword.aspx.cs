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
            string inputAccountPassword = CurrentPasswordTextBox.Text;
            string newPassword = NewPasswordTextBox.Text;
            string retypeNewPasword = RetypeNewPasswordTextBox.Text;
            string userRealPassword = null;
            bool correctPassword = false;
            bool alignedNewPassword = false;

            try
            {
                SqlConnectionStringBuilder con = new SqlConnectionStringBuilder();
                con.DataSource = "ljagervidb.database.windows.net";
                con.UserID = "rootroot";
                con.Password = "Root1234";
                con.InitialCatalog = "group11projectDB";

                //get the current password about this user
                using (SqlConnection connection = new SqlConnection(con.ConnectionString))
                {
                    connection.Open();

                    string sql = "select * from account where username='" + username + "'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                userRealPassword = reader["password"].ToString();   
                            }
                            
                        }
                    }

                    connection.Close();
                }


            }
            catch (SqlException err)
            {
                //error never happen
            }

            //check if user entered the password correctly
            if (inputAccountPassword.Equals(userRealPassword))
            {
                correctPassword = true;
            }

            //check if the two new password align with each other and are not empty
            if (newPassword.Equals(retypeNewPasword) && !newPassword.Equals("") && !retypeNewPasword.Equals(""))
            {
                alignedNewPassword = true;
            }

            //if user entered the correct password correctly and the two new passwords aligned
            //update the new password in the database.
            if (correctPassword == true && alignedNewPassword == true)
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
                            command.CommandText = "UPDATE Account SET password=@newpassword WHERE username=@username";
                            command.Parameters.AddWithValue("@username", username);
                            command.Parameters.AddWithValue("@newpassword", newPassword);

                            try
                            {
                                connection.Open();
                                int a = command.ExecuteNonQuery();
                                connection.Close();

                                Response.Redirect("AccountProfile.aspx");
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

            //if user entered the current password correctly but did not align the new passwords
            else if (correctPassword == true && alignedNewPassword == false)
            {
                //shows different message if a new password is empty or not.
                if(newPassword.Equals("") || retypeNewPasword.Equals(""))
                {
                    MsgLabel.Text = "New password must not be empty";
                    Server.Transfer("ChangePassword.aspx");
                }
                else
                {
                    MsgLabel.Text = "New password does not align";
                    Server.Transfer("ChangePassword.aspx");
                }
                
            }

            //if user entered password incorrectly
            else
            {

                MsgLabel.Text = "Incorrect Password";
                Server.Transfer("ChangePassword.aspx");
                
            }



        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }
    }
}