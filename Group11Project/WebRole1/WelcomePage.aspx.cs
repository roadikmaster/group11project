﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class WelcomePage : System.Web.UI.Page
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

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void AccountProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }

        protected void FunctionButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TempFunction.aspx");
        }

        protected void AdminModifyAccountButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminModifyUserAccount.aspx");
        }

        protected void ViewHistoryButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewHistoryPage.aspx");
        }
        

    }
}