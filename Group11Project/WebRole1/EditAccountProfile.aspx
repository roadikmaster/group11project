<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAccountProfile.aspx.cs" Inherits="WebRole1.EditAccountProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server" class="auto-style7"> 
        <div style="background-color:black;" id="Div1" runat="server" class="auto-style6">
            <asp:Menu ID="Menu1" runat="server" style="font-family:Arial Black" Orientation="Horizontal" CssClass="menu" StaticSubMenuIndent="16px" >
                <Items>
                    <asp:MenuItem ImageUrl="~/ImageAssets/CoffeeMachineLogo.png"  NavigateUrl="MainPage.aspx" />
                    <asp:MenuItem Text="HOME" NavigateUrl="MainPage.aspx" />
                    <asp:MenuItem Text="FEATURES" NavigateUrl="Features.aspx" />
                    <asp:MenuItem Text="ABOUT US" NavigateUrl="AboutUsPage.aspx" />
                    <asp:MenuItem Text="CONTACT" NavigateUrl="ContactPage.aspx" />
                    <asp:MenuItem Text="SHOP" NavigateUrl="Shop.aspx" />

                        
                </Items>

            </asp:Menu>

            <p class="auto-style1">
            
            &nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                  
                <%  try
                    {
                        UserAccountButton.Text = Session["username"].ToString();
                    }
                    catch (Exception ee)
                    {
                        Response.Redirect("MainPage.aspx");
                    }%>
                <asp:LinkButton ID="UserAccountButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style14" OnClick="UserAccountButton_Click" ></asp:LinkButton>
                <asp:ImageButton ID="LogOutButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogOutLogo.png" Width="79px" CssClass="auto-style13" OnClick="LogOutButton_Click" />
                <asp:ImageButton ID="ViewMyCartButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/ViewMyCart.png" Width="79px" OnClick="ViewMyCartButton_Click" CssClass="auto-style4" />
                   
            <br />
            <br />
                    
            <br />&nbsp;

        
            <br />
            <br />
            </p>
            </div>

        <br />
        <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="EDIT YOUR ACCOUNT PROFILE"></asp:Label>

        <br />
        <asp:Label ID="ErrorMsg" runat="server" Font-Names="Arial" ForeColor="Red"></asp:Label>

        <br />
        <br />
        <br />
            
            
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Email:"></asp:Label>
        <asp:TextBox ID="EmailText" runat="server" CssClass="auto-style15" ></asp:TextBox>
            
            
        <br />
        <br />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" OnClientClick="return validate()" OnClick="EditButton_Click">Edit</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="CancelButton" runat="server" Font-Bold="True" Font-Names="Arial" OnClick="CancelButton_Click">Cancel</asp:LinkButton>
            
        <script type="text/javascript">
            function validate() {
                var email = document.getElementById("EmailText").value;
                var emailpattern = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;

                if (email == "") {
                    alert("Email cannot be empty.\n Click Cancel if not changing email");
                    return false;
                }
                if (email != "") {
                    if (!email.match(emailpattern)) {
                        alert("Invalid email format");
                        return false;
                    }
                    return true;
                }
            }
        </script>
            
</form>
</body>
</html>