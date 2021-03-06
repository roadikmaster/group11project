﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebRole1
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string value = Session["productID"].ToString();
            IDLabel.Text = value;
            QuantityText.Attributes.Add("readonly", "readonly");
        
      
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Product WHERE productID=@id AND isDeleted=0", con);
            cmd.Parameters.Add(new SqlParameter("id", value));
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    NameLabel.Text = reader[1].ToString();
                    CategoryLabel.Text = reader[2].ToString();
                    string imageurl ="<image src='" + reader[3].ToString() + "' />";
                    ImagePlaceHolder.Controls.Add(new Literal { Text = imageurl});
                    PriceLabel.Text = reader[5].ToString();
                    string descriptiontext = "<p style= \"font-family:arial;\">" + reader[4].ToString() + "</p>";
                    Literal1.Text = descriptiontext;
                }
                
            }

            con.Close();

            
            if (Session["username"] == null)
            {
                IncreaseButton.Enabled = false;
                DecreaseButton.Enabled = false;
                QuantityText.Enabled = false;
                AddToCartButton.Enabled = false;
                ErrorLabel.Text = "You must be logged in to be able to add items to cart!";

            }

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

                Server.Transfer("ProductDetails.aspx");
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

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            
            string productID = Session["productID"].ToString();
            string quantity = QuantityText.Text;
            string username = Session["username"].ToString();
            string cartID;

            cartID = getCartID(username);

            if (cartID.Equals("none"))
            {
                newCart(username);
                
            }

            cartID = getCartID(username);

            try
            {
                insertItemToCart(cartID, productID, quantity);

                ErrorLabel.Text = "Successfully added item to your cart.";
            }
            catch (SqlException ee)
            {
                ErrorLabel.Text = "You already added this item into your cart.";
                
            }
        }

        protected string getCartID(string username)
        {
            string result;

            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Cart WHERE accountID IN (SELECT accountID FROM Account WHERE username=@username)", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
            SqlDataReader reader = cmd.ExecuteReader();
            
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    result = reader[0].ToString();
                    con.Close();
                    return result;
                }

            }
            con.Close();
            return "none";
        }

        protected void newCart(string username)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Cart(accountID) SELECT accountID FROM Account WHERE username=@username", con);
            cmd.Parameters.Add(new SqlParameter("username", username));
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void insertItemToCart(string cartID, string productID, string quantity)
        {
            SqlConnection con = new SqlConnection("Server=tcp:ljagervidb.database.windows.net,1433;Initial Catalog=group11projectDB;Persist Security Info=False;User ID=rootroot;Password=Root1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            con.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO CartItem(cartID, productID, quantity) VALUES (@cartID, @productID, @quantity)", con);
            cmd.Parameters.Add(new SqlParameter("cartID", cartID));
            cmd.Parameters.Add(new SqlParameter("productID", productID));
            cmd.Parameters.Add(new SqlParameter("quantity", quantity));
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}