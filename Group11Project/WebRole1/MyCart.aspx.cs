using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class MyCart : System.Web.UI.Page
    {
        //display the cart items in a table as well as create 2 buttons per table row
        //one for editing the quantity, another for deleting the item from cart.

        double sum = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT Product.productID,name,quantity,price FROM Account,CartItem,Cart,Product WHERE Product.productID=CartItem.productID AND Cart.cartID=CartItem.cartID AND Account.accountID=Cart.accountID AND username=@username", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
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
                TableHeaderCell header4 = new TableHeaderCell();
                header4.Text = "Price per Item";
                header.Cells.Add(header4);
                TableHeaderCell header5 = new TableHeaderCell();
                header5.Text = "Price";
                header.Cells.Add(header5);
                TableHeaderCell header6 = new TableHeaderCell();
                header6.Text = "Details/Edit";
                header.Cells.Add(header6);
                TableHeaderCell header7 = new TableHeaderCell();
                header7.Text = "Delete";
                header.Cells.Add(header7);

                TableRow row;
                TableCell cell1;
                TableCell cell2;
                TableCell cell3;
                TableCell cell4;
                TableCell cell5;
                TableCell cell6;
                TableCell cell7;
                
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

                    cell4 = new TableCell();
                    cell4.Text = reader[3].ToString();
                    row.Cells.Add(cell4);

                    cell5 = new TableCell();
                    cell5.Text = multiply(double.Parse(reader[2].ToString()), double.Parse(reader[3].ToString())).ToString("F2", CultureInfo.InvariantCulture);
                    row.Cells.Add(cell5);
                    sum += double.Parse(cell5.Text);

                    cell6 = new TableCell();
                    Button editbutton = new Button();
                    editbutton.ID = reader[0].ToString();
                    editbutton.Text = "Edit";
                    editbutton.Click += new EventHandler(this.Editbutton_Click);
                    cell6.Controls.Add(editbutton);
                    row.Cells.Add(cell6);

                    cell7 = new TableCell();
                    Button deletebutton = new Button();
                    deletebutton.ID = "D" + reader[0].ToString();
                    deletebutton.Text = "Delete";
                    deletebutton.Click += new EventHandler(this.Deletebutton_Click);
                    cell7.Controls.Add(deletebutton);
                    row.Cells.Add(cell7);

                    table.Rows.Add(row);
                }

                PlaceHolder1.Controls.Add(table);

                Label2.Text = "TOTAL: ";
                TotalPriceLabel.Text = sum.ToString("F2", CultureInfo.InvariantCulture) + " SEK";
                Session["sum"] = sum;
            }

            else
            {
                string text = "<p style='font-family:Arial'> You currently have no items in your cart</p>";
                PlaceHolder1.Controls.Add(new Literal { Text = text });
                ClearButton.Enabled = false;
                Session["sum"] = "0";
            }
            con.Close();

            
        }

        //remove this product from the cart
        //refreshes the page to display the new price
        private void Deletebutton_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;

            string username = Session["username"].ToString();
            
            string value = button.ID;
            char[] extract = value.ToCharArray();

            StringBuilder sb = new StringBuilder();
            for (int i = 1; i < extract.Length; i++)
            {
                sb.Append(extract[i]);
            }

            string productID = sb.ToString();

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"DELETE FROM CartItem WHERE cartID IN (SELECT cartID FROM Cart WHERE accountID IN (SELECT accountID FROM Account WHERE username=@username) AND productID=@productID)", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
            cmd.Parameters.Add(new SqlParameter("productID", productID));
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("MyCart.aspx");
        }

        //redirect user to the product details page he/she can change quantity of the item.
        private void Editbutton_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;

            


            Session["cartItemID"] = button.ID;

            Response.Redirect("EditCartItem.aspx");
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
        
        //clear all contents from the cart
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"DELETE FROM CartItem WHERE cartID IN (SELECT cartID FROM Cart WHERE accountID IN (SELECT accountID FROM Account WHERE username=@username))", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("MyCart.aspx");
        }

        //quantity * price per quantity
        protected double multiply(double a, double b)
        {
            double result = a * b;
            return Math.Round(result, 2);
        }

        
        
        
    }
}