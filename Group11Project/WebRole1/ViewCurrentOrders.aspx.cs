using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class ViewCurrentOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //view all current orders of a user
            //only displays orders that haven't received by the user.

            string username = Session["username"].ToString();
            string accountID = GetAccountID(username);


            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Orders WHERE accountID=@accountID AND status='PAYMENT RECEIVED' ORDER BY orderID DESC", con);
            cmd.Parameters.Add(new SqlParameter("accountID", accountID));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {

                Table table = new Table();
                table.BorderWidth = 1;

                TableHeaderRow header = new TableHeaderRow();
                table.Rows.Add(header);
                TableHeaderCell header1 = new TableHeaderCell();
                header1.Text = "Order ID";
                header.Cells.Add(header1);
                TableHeaderCell header2 = new TableHeaderCell();
                header2.Text = "Price";
                header.Cells.Add(header2);
                TableHeaderCell header3 = new TableHeaderCell();
                header3.Text = "Status";
                header.Cells.Add(header3);
                TableHeaderCell header4 = new TableHeaderCell();
                header4.Text = "View Contents";
                header.Cells.Add(header4);

                TableRow row;
                TableCell cell1;
                TableCell cell2;
                TableCell cell3;
                TableCell cell4;
                

                while (reader.Read())
                {
                    row = new TableRow();

                    cell1 = new TableCell();
                    cell1.Text = reader[0].ToString();
                    row.Cells.Add(cell1);

                    cell2 = new TableCell();
                    cell2.Text = reader[2].ToString();
                    row.Cells.Add(cell2);

                    cell3 = new TableCell();
                    cell3.Text = reader[3].ToString();
                    row.Cells.Add(cell3);

                    cell4 = new TableCell();
                    Button viewbutton = new Button();
                    viewbutton.ID = reader[0].ToString();
                    viewbutton.Text = "View Contents";
                    viewbutton.Click += new EventHandler(this.Viewbutton_Click);
                    cell4.Controls.Add(viewbutton);
                    row.Cells.Add(cell4);

                    table.Rows.Add(row);
                }

                PlaceHolder1.Controls.Add(table);

                
            }
            else
            {
                string text = "<p style='font-family:Arial'> You currently have no Orders placed!</p>";
                PlaceHolder1.Controls.Add(new Literal { Text = text });
            }

        }

        private void Viewbutton_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;

            Session["orderID"] = button.ID;

            Response.Redirect("ViewOrderContents.aspx");
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

        protected string GetAccountID(string username)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT accountID FROM Account WHERE username=@username", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    return reader[0].ToString();
                }

            }
            con.Close();
            return "null";
        }
    }
}