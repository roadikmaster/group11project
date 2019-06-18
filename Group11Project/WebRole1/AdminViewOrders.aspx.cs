using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class AdminViewOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Orders ", con);

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
                header2.Text = "Account ID";
                header.Cells.Add(header2);
                TableHeaderCell header3 = new TableHeaderCell();
                header3.Text = "Total Price";
                header.Cells.Add(header3);
                TableHeaderCell header4 = new TableHeaderCell();
                header4.Text = "Status";
                header.Cells.Add(header4);
                TableHeaderCell header5 = new TableHeaderCell();
                header5.Text = "View Order Contents";
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
                    cell4.Text = reader[3].ToString();
                    row.Cells.Add(cell4);

                    cell5 = new TableCell();
                    Button viewbutton = new Button();
                    viewbutton.ID = reader[0].ToString();
                    viewbutton.Text = "View Order Contents";
                    viewbutton.Click += new EventHandler(this.Viewbutton_Click);
                    cell5.Controls.Add(viewbutton);
                    row.Cells.Add(cell5);

                    table.Rows.Add(row);

                    
                }
                PlaceHolder1.Controls.Add(table);
                
            }
            else
            {
                string text = "There are current no orders available";
                PlaceHolder1.Controls.Add(new Literal { Text = text });

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

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            PlaceHolder1.Controls.Clear();

            string ID = IDText.Text;
            string type = IDList.SelectedItem.Value;
            string status = StatusList.SelectedItem.Value;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd;
            
            
            if (ID.Equals("") && status.Equals("ALL"))
            {
                cmd = new SqlCommand(@"SELECT * FROM Orders", con);
            }

            else if (ID.Equals("") && !status.Equals("ALL"))
            {
                cmd = new SqlCommand(@"SELECT * FROM Orders WHERE status=@status", con);
                cmd.Parameters.Add(new SqlParameter("status", status));
            }

            else if (!ID.Equals("") && type.Equals("Account ID") && status.Equals("ALL"))
            {
                cmd = new SqlCommand(@"SELECT * FROM Orders WHERE accountID=@ID", con);
                cmd.Parameters.Add(new SqlParameter("ID", ID));
            }

            else if (!ID.Equals("") && type.Equals("Account ID") && !status.Equals("ALL"))
            {
                cmd = new SqlCommand(@"SELECT * FROM Orders WHERE accountID=@ID AND status=@status", con);
                cmd.Parameters.Add(new SqlParameter("ID", ID));
                cmd.Parameters.Add(new SqlParameter("status", status));
            }

            else if (!ID.Equals("") && type.Equals("Order ID") && status.Equals("ALL"))
            {
                cmd = new SqlCommand(@"SELECT * FROM Orders WHERE orderID=@ID", con);
                cmd.Parameters.Add(new SqlParameter("ID", ID));
            }

            else 
            {
                cmd = new SqlCommand(@"SELECT * FROM Orders WHERE orderID=@ID AND status=@status", con);
                cmd.Parameters.Add(new SqlParameter("ID", ID));
                cmd.Parameters.Add(new SqlParameter("status", status));
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
                header1.Text = "Order ID";
                header.Cells.Add(header1);
                TableHeaderCell header2 = new TableHeaderCell();
                header2.Text = "Account ID";
                header.Cells.Add(header2);
                TableHeaderCell header3 = new TableHeaderCell();
                header3.Text = "Total Price";
                header.Cells.Add(header3);
                TableHeaderCell header4 = new TableHeaderCell();
                header4.Text = "Status";
                header.Cells.Add(header4);
                TableHeaderCell header5 = new TableHeaderCell();
                header5.Text = "View Order Contents";
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
                    cell4.Text = reader[3].ToString();
                    row.Cells.Add(cell4);

                    cell5 = new TableCell();
                    Button viewbutton = new Button();
                    viewbutton.ID = reader[0].ToString();
                    viewbutton.Text = "View Order Contents";
                    viewbutton.Click += new EventHandler(this.Viewbutton_Click); 
                    cell5.Controls.Add(viewbutton);
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

        

        private void Viewbutton_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            Session["orderID"] = button.ID;
            Response.Redirect("ViewOrderContents.aspx"); 
            
        }
        
    }
}