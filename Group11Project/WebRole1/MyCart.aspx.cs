using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class MyCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
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


            PlaceHolder1.Controls.Add(table);
            */

            
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

        protected void PayButton_Click(object sender, EventArgs e)
        {

        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {

        }
    }
}