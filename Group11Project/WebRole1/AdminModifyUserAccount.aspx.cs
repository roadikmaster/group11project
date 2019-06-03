using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class AdminModifyUserAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        protected void EditUserAccountButton_Click(object sender, EventArgs e)
        {
            string accountID = UserAccountIDText.Text;
            string newemail = UserEmailText.Text;

            if (!accountID.Equals(""))
            {
                if (newemail.Equals(""))
                {
                    newemail = UserEmailText.Attributes["placeholder"].ToString();
                }

                try
                {
                    SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    con.Open();

                    SqlCommand cmd = new SqlCommand(@"UPDATE Account SET email=@newemail WHERE accountID=@accountID", con);
                    cmd.Parameters.Add(new SqlParameter("accountID", accountID));
                    cmd.Parameters.Add(new SqlParameter("newemail", newemail));

                    cmd.ExecuteNonQuery();
                    con.Close();


                }
                catch (SqlException ee)
                {
                    MessageLabel.Text = "Failed to edit User's Account";
                    UserAccountIDText.Text = "";
                    UserUsernameText.Text = "";
                    UserEmailText.Text = "";
                    UserEmailText.Attributes.Add("placeholder", "");
                }

                MessageLabel.Text = "Successfully edited User's account info";

            }
            else
            {
                MessageLabel.Text = "Please use the Search button first";
            }
        }

        protected void DeleteUserButton_Click(object sender, EventArgs e)
        {
            string accountID = UserAccountIDText.Text;

            if (!accountID.Equals(""))
            {
                try
                {
                    SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    con.Open();

                    SqlCommand cmd = new SqlCommand(@"DELETE FROM Account WHERE accountID=@accountID", con);
                    cmd.Parameters.Add(new SqlParameter("accountID", accountID));
                    
                    cmd.ExecuteNonQuery();
                    con.Close();

                    


                }
                catch (SqlException ee)
                {
                    MessageLabel.Text = "Failed to delete User's Account";
                    UserAccountIDText.Text = "";
                    UserUsernameText.Text = "";
                    UserEmailText.Text = "";
                    UserEmailText.Attributes.Add("placeholder", "");
                }

                MessageLabel.Text = "Successfully deleted User's Account";
                UserAccountIDText.Text = "";
                UserUsernameText.Text = "";
                UserEmailText.Text = "";
                UserEmailText.Attributes.Add("placeholder", "");


            }
            else
            {
                MessageLabel.Text = "Please use the Search button first";
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchType = "";
            string searchText = SearchText.Text;
            int userID = -1;

            bool validInput = true;

            if(SearchList.Items.FindByText("ID").Selected == true)
            {
                searchType = "ID";
            }
            else if(SearchList.Items.FindByText("Username").Selected == true)
            {
                searchType = "Username";
            }

            //get account information about the user based on account ID.
            if (searchType.Equals("ID"))
            {
                try
                {
                    userID = Convert.ToInt32(searchText);
                }
                catch (Exception ee)
                {
                    validInput = false;
                }

                if(validInput == true)
                {
                    SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where accountID='" + userID + "'", con);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            UserAccountIDText.Text = reader.GetInt32(0).ToString();
                            UserUsernameText.Text = reader.GetString(1);
                            UserEmailText.Attributes.Add("placeholder", reader.GetString(3).ToString());
                        }
                        MessageLabel.Text = "";
                    }
                    else
                    {
                        MessageLabel.Text = "User not found";
                        UserAccountIDText.Text = "";
                        UserUsernameText.Text = "";
                        UserEmailText.Text = "";
                        UserEmailText.Attributes.Add("placeholder", "");
                    }
                }
                else
                {
                    MessageLabel.Text = "Please input only numbers";
                    UserAccountIDText.Text = "";
                    UserUsernameText.Text = "";
                    UserEmailText.Text = "";
                    UserEmailText.Attributes.Add("placeholder", "");
                }

            }

            // get account information about the user based on username.
            if (searchType.Equals("Username"))
            {
                SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                con.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + searchText + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        UserAccountIDText.Text = reader.GetInt32(0).ToString();
                        UserUsernameText.Text = reader.GetString(1);
                        UserEmailText.Attributes.Add("placeholder", reader.GetString(3).ToString());
                    }
                    MessageLabel.Text = "";
                }
                else
                {
                    MessageLabel.Text = "User not found";
                    UserAccountIDText.Text = "";
                    UserUsernameText.Text = "";
                    UserEmailText.Text = "";
                    UserEmailText.Attributes.Add("placeholder", "");
                }
                
            }

            
        }

        
    }
}