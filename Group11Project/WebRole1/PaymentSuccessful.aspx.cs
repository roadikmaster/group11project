using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class PaymentSuccessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //transfer all the contents of the cart into an order list
            


            string username = Session["username"].ToString();
            string accountID = GetAccountID(username);
            string cartID = GetCartID(accountID);
            string sum = Session["sum"].ToString();
            
            GenerateOrderID(accountID, sum);

            string orderID = GetOrderID(accountID);


            List<string> productIDs = new List<string>();
            List<string> quantities = new List<string>();

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT productID, quantity FROM CartItem WHERE cartID=@cartID", con);
            cmd.Parameters.Add(new SqlParameter("cartID", cartID));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    productIDs.Add(reader[0].ToString());
                    quantities.Add(reader[1].ToString());
                }

            }
            con.Close();

            for (int i = 0; i < productIDs.Count; i++)
            {
                AddItemsToOrder(orderID, productIDs[i], quantities[i]);
            }
            
            ClearCart(username);

            IDLabel.Text = orderID;
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

        protected void ViewOrderButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCurrentOrders.aspx");
        }

        //remove all items from the cart
        protected void ClearCart(string username)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"DELETE FROM CartItem WHERE cartID IN (SELECT cartID FROM Cart WHERE accountID IN (SELECT accountID FROM Account WHERE username=@username))", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // create new order ID
        protected void GenerateOrderID(string id, string totalprice)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO [Order](accountID, totalPrice, status) VALUES (@accountID, @totalprice, @status) ", con);
            cmd.Parameters.Add(new SqlParameter("accountID", id));
            cmd.Parameters.Add(new SqlParameter("totalprice", totalprice));
            cmd.Parameters.Add(new SqlParameter("status", "PAYMENT RECEIVED"));
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // get user account ID
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

        // get newly generated ID
        protected string GetOrderID(string accountID)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT MAX(orderID) FROM [Order] WHERE accountID=@accountID", con);
            cmd.Parameters.Add(new SqlParameter("accountID", accountID));
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

        //add each item into the order list
        protected void AddItemsToOrder(string orderID, string productID, string quantity)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO OrderItem(orderID, productID, quantity) VALUES (@orderID, @productID, @quantity) ", con);
            cmd.Parameters.Add(new SqlParameter("orderID", orderID));
            cmd.Parameters.Add(new SqlParameter("productID", productID));
            cmd.Parameters.Add(new SqlParameter("quantity", quantity));
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //get user's cart ID
        protected string GetCartID(string accountID)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT cartID FROM Cart WHERE accountID=@accountID", con);
            cmd.Parameters.Add(new SqlParameter("accountID", accountID));
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