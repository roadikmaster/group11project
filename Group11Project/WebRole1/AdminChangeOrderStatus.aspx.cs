using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class AdminChangeOrderStatus : System.Web.UI.Page
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

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        protected void ChangeButton_Click(object sender, EventArgs e)
        {
            string ID = ResultIDLabel.Text;
            string status = null;

            try
            {
                status = StatusList.SelectedItem.Value;
            }
            catch
            {
                ResultLabel.Text = "Please use the search function first";
            }
            

            if (status != null && !ID.Equals(""))
            {

                try
                {
                    SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"UPDATE Orders SET status=@status WHERE orderID=@ID", con);
                    cmd.Parameters.Add(new SqlParameter("ID", ID));
                    cmd.Parameters.Add(new SqlParameter("status", status));

                    cmd.ExecuteNonQuery();
                    con.Close();

                    ResultLabel.Text = "Successfully changed Order Status";
                }

                catch (SqlException ee)
                {
                    ResultLabel.Text = "Please use the search function first";
                }
            }
            else
            {
                ResultLabel.Text = "Please use the search function first";
            }

            
            
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string ID = IDText.Text;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT status FROM Orders WHERE orderID=@ID", con);
            cmd.Parameters.Add(new SqlParameter("ID", ID));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    string status = reader[0].ToString();

                    if (status.Equals("PAYMENT RECEIVED"))
                    {
                        StatusList.SelectedValue = "PAYMENT RECEIVED";
                    }
                    else if (status.Equals("COMPLETED"))
                    {
                        StatusList.SelectedValue = "COMPLETED";
                    }
                    else if (status.Equals("CANCELLED"))
                    {
                        StatusList.SelectedValue = "CANCELLED";
                    }
                    ResultIDLabel.Text = ID;
                }
            }

            else
            {
                ResultLabel.Text = "Order ID does not exist";
                ResultIDLabel.Text = "";
            }
        }
    }
}