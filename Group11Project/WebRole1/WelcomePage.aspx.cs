using System;
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
            if (Session["username"].ToString() != null)
            {
                Label2.Text = Session["username"].ToString();
            }
            
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void AccountProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountProfile.aspx");
        }

        protected void FunctionButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TempFunction.aspx");
        }
    }
}