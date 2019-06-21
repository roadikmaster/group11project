<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrderContents.aspx.cs" Inherits="WebRole1.ViewOrderContents" %>

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
        <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="ORDER ITEM LIST"></asp:Label>
        <br />

            

            

        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Text="Order ID: "></asp:Label>
        <asp:Label ID="IDLabel" runat="server" Font-Bold="False" Font-Names="Arial"></asp:Label>

            

            

        <br />
        <br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="TOTAL PRICE: "></asp:Label>

            

            

        <asp:Label ID="PriceLabel" runat="server" Font-Bold="True" Font-Names="Arial"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="STATUS: " Font-Bold="True" Font-Names="Arial"></asp:Label>

            

            

        <asp:Label ID="StatusLabel" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red"></asp:Label>

            

            

</form>
</body>
</html>


