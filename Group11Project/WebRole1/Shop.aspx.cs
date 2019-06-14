using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class Shop : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
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
            header3.Text = "Category";
            header.Cells.Add(header3);
            TableHeaderCell header4 = new TableHeaderCell();
            header4.Text = "Price";
            header.Cells.Add(header4);
            TableHeaderCell header5 = new TableHeaderCell();
            header5.Text = "Details";
            header.Cells.Add(header5);


            TableRow row;
            TableCell cell1;
            TableCell cell2;
            TableCell cell3;
            TableCell cell4;
            TableCell cell5;

            
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Product WHERE isDeleted=0", con);
            SqlDataReader reader = cmd.ExecuteReader();



            if (reader.HasRows)
            {
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
                    cell4.Text = reader[5].ToString();
                    row.Cells.Add(cell4);

                    cell5 = new TableCell();
                    Button addbutton = new Button();
                    addbutton.ID = reader[0].ToString();
                    addbutton.Text = "Details";
                    addbutton.Click += new EventHandler(this.ViewDetails_Click);
                    cell5.Controls.Add(addbutton);
                    row.Cells.Add(cell5);

                    table.Rows.Add(row);

                }

            }

            else
            {

                
            }
            
            PlaceHolder1.Controls.Add(table);
            

            con.Close();


        }

        protected void LogInButton_Click(object sender, ImageClickEventArgs e)
        {
            string username = textUsername.Text;
            string password = textPassword.Text;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Account where username='" + username + "' and password='" + password + "' and isDeleted=0", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["username"] = username;
                    string accountType = reader.GetString(4);
                    Session["accountType"] = accountType;
                }

                Server.Transfer("MainPage.aspx");
            }
            else
            {
                ErrorMsg.Text = "Invalid login details";
            }

            con.Close();

        }
        

        protected void RegisterButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Register.aspx");
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

        protected void SearchButton_Click(object sender, EventArgs e)
        {

            PlaceHolder1.Controls.Clear();

            string keyword = SearchText.Text;
            string category = "Drink";

            
            
            
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd;
            
            if (keyword.Equals(""))
            {
                cmd = new SqlCommand(@"SELECT * FROM Product WHERE isDeleted=0", con);
            }
            else
            {
                cmd = new SqlCommand(@"SELECT * FROM Product WHERE name=@productname AND category=@category AND isDeleted=0", con);
                cmd.Parameters.Add(new SqlParameter("productname", keyword));
                cmd.Parameters.Add(new SqlParameter("category", category));
            }
            
            SqlDataReader reader = cmd.ExecuteReader();
           
            if (reader.HasRows)
            {
                int count = 0;

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
                header3.Text = "Category";
                header.Cells.Add(header3);
                TableHeaderCell header4 = new TableHeaderCell();
                header4.Text = "Price";
                header.Cells.Add(header4);
                TableHeaderCell header5 = new TableHeaderCell();
                header5.Text = "Details";
                header.Cells.Add(header5);


                TableRow row;
                TableCell cell1;
                TableCell cell2;
                TableCell cell3;
                TableCell cell4;
                TableCell cell5;
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
                    cell4.Text = reader[5].ToString();
                    row.Cells.Add(cell4);

                    cell5 = new TableCell();
                    Button addbutton = new Button();
                    addbutton.ID = reader[0].ToString();
                    addbutton.Text = "Details";
                    addbutton.Click += new EventHandler(this.ViewDetails_Click);
                    cell5.Controls.Add(addbutton);
                    row.Cells.Add(cell5);

                    table.Rows.Add(row);

                    count++;

                }
                PlaceHolder1.Controls.Add(table);
                ResultLabel.Text = "Search gave " + count.ToString() + " results.";
            }
            
            else
            {
                ResultLabel.Text = "Search gave 0 results.";
            }

            
            con.Close();
        }

        private void ViewDetails_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            Session["productID"] = button.ID;
            Server.Transfer("ProductDetails.aspx");
        }


    }
}