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

        protected void ViewMyCartButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void AccountProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }

        protected void AdminModifyAccountButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminModifyUserAccount.aspx");
        }

        protected void ViewHistoryButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewHistoryPage.aspx");
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddProduct.aspx");
        }

        protected void ViewCartButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }

        protected void ViewCurrentOrdersButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCurrentOrders.aspx");
        }

        protected void OrdersHistoryButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrdersHistory.aspx");
        }

        protected void ModifyDeleteProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminModifyProduct.aspx");
        }

        protected void ChangeOrderStatusButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminChangeOrderStatus.aspx");
        }

        protected void ViewCustomerOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminViewOrders.aspx");
        }
    }
}