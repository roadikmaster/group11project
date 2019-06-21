<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrdersHistory.aspx.cs" Inherits="WebRole1.ViewOrdersHistory" %>

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
                                  
                <%
                    try
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
        <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="YOUR ORDERS HISTORY"></asp:Label>
        <br />

            

            

        <br />
        <br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

            

            

        <br />
        <br />
        <br />

            

            

</form>
</body>
</html>



