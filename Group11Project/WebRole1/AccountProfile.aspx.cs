using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class AccountProfile : System.Web.UI.Page
    {
        //get user data collected by the login page earlier
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["accountID"].ToString();
            Label2.Text = Session["username"].ToString();
            Label3.Text = Session["email"].ToString();
        }

        //send user back to Welcome Page
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomePage.aspx");
        }

        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void EditAccountInfoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditAccountProfile.aspx");
        }
    }
}