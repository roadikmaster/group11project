<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="WebRole1.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 53px;
        }
        .auto-style1 {
            margin-left: 240px;
        }
        .auto-style4 {
            position: absolute;
            left: 1243px;
            top: 19px;
        }
        .auto-style6 {
            height: 78px;
        }
        .auto-style7 {
            height: 53px;
            width: 1350px;
        }
        .auto-style13 {
            position: absolute;
            left: 1153px;
            top: 19px;
        }
        .auto-style14 {
            position: absolute;
            text-align:right;
            left: 958px;
            top: 29px;
        }
        .menu ul
        {
            width:150px;
        }
        .menu ul li
        {
            background-color: black;
            text-decoration: none;
            padding: 8px;
            margin: 3px;
        }
        .menu ul li a
        {
            color:#6699FF;
        }
        .menu ul li a:hover
        {
            font-weight:bold;
        }
        </style>
</head>
<body>
    <body bgcolor="#B6B6B6">
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
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="ACCOUNT MANAGEMENT"></asp:Label>

            <br />
            <br />
            <asp:LinkButton ID="AccountProfileButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="AccountProfileButton_Click">Account Profile</asp:LinkButton>

            <br />
            <br />
            <br />
            <%if (Session["accountType"].Equals("Admin"))
                    {%>        
                        <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="ADMINISTRATOR FUNCTIONS"></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="AdminModifyAccountButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="AdminModifyAccountButton_Click">Modify Account of Another User</asp:LinkButton>
                        <br />
            <asp:LinkButton ID="AddProductButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="AddProductButton_Click">Add New Product</asp:LinkButton>
                        <br />
            <asp:LinkButton ID="ModifyDeleteProduct" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="ModifyDeleteProduct_Click">Modify/Remove Product</asp:LinkButton>
            <br />
            <asp:LinkButton ID="ChangeOrderStatusButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="ChangeOrderStatusButton_Click">Change Order Status</asp:LinkButton>
                        <br />
                        <br />
            <%} %>
            
            
            <asp:Label ID="Label3" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="ORDER MANAGEMENT"></asp:Label>
            <br />
            <br />
            <asp:LinkButton ID="ViewCartButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="ViewCartButton_Click">View Cart</asp:LinkButton>

            <br />
            

            <asp:LinkButton ID="ViewCurrentOrdersButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="ViewCurrentOrdersButton_Click">View Current Orders</asp:LinkButton>
            <br />
            <asp:LinkButton ID="OrdersHistoryButton" runat="server" Font-Names="Arial" Font-Underline="False" OnClick="OrdersHistoryButton_Click">Orders History</asp:LinkButton>
            

            <br />
            <br />
            

    </form>
        
        
</body>
</html>
