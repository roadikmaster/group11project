using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class ViewOrderContents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderID = Session["orderID"].ToString();
            IDLabel.Text = orderID;
            string sum = GetPrice(orderID);
            string status = GetStatus(orderID);

            PriceLabel.Text = sum + " SEK";
            StatusLabel.Text = status;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT OrderItem.productID,name,quantity FROM Product, OrderItem WHERE OrderItem.productID = Product.productID AND orderID=@orderID", con);
            cmd.Parameters.Add(new SqlParameter("orderID", orderID));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                Table table = new Table();
                table.BorderWidth = 1;

                TableHeaderRow header = new TableHeaderRow();
                table.Rows.Add(header);
                TableHeaderCell header1 = new TableHeaderCell();
                header1.Text = "Product ID";
                header.Cells.Add(header1);
                TableHeaderCell header2 = new TableHeaderCell();
                header2.Text = "Name";
                header.Cells.Add(header2);
                TableHeaderCell header3 = new TableHeaderCell();
                header3.Text = "Quantity";
                header.Cells.Add(header3);
                

                TableRow row;
                TableCell cell1;
                TableCell cell2;
                TableCell cell3;
                

                while (reader.Read())
                {
                    row = new TableRow();

                    cell1 = new TableCell();
                    cell1.Text = reader[0].ToString();
                    row.Cells.Add(cell1);

                    cell2 = new TableCell();
                    cell2.Text = reader[1].ToString();
                    row.Cells.Add(cell2);

                    cell3 = new TableCell();
                    cell3.Text = reader[2].ToString();
                    row.Cells.Add(cell3);

                    table.Rows.Add(row);
                }

                PlaceHolder1.Controls.Add(table);
            }
            con.Close();
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

        protected string GetPrice(string orderID)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT totalPrice FROM Orders WHERE orderID=@orderID", con);
            cmd.Parameters.Add(new SqlParameter("orderID",orderID));
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

        protected string GetStatus(string orderID)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT status FROM Orders WHERE orderID=@orderID", con);
            cmd.Parameters.Add(new SqlParameter("orderID", orderID));
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