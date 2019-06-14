<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountProfile.aspx.cs" Inherits="WebRole1.AccountProfile" %>

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
        
        .auto-style15 {
            position: absolute;
            left: 147px;
            top: 161px;
        }
        
        .auto-style16 {
            position: absolute;
            left: 147px;
            top: 182px;
            width: 300px;
        }
        
        .auto-style17 {
            position: absolute;
            left: 147px;
            top: 202px;
            width: 400px;
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
                                  
                    <% try
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
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="YOUR ACCOUNT PROFILE"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Account ID:"></asp:Label>
            <asp:Label ID="AccountIDText" runat="server" CssClass="auto-style15" Font-Names="Arial"></asp:Label>

            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Text="Username:"></asp:Label>
            <asp:Label ID="UsernameText" runat="server" Font-Names="Arial" CssClass="auto-style16"></asp:Label>

            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Text="Email:"></asp:Label>
            <asp:Label ID="EmailText" runat="server" Font-Names="Arial" CssClass="auto-style17"></asp:Label>

            <br />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" Font-Names="Arial" OnClick="EditButton_Click">Edit Account Profile</asp:LinkButton>

            <br />
            <asp:LinkButton ID="ChangePasswordButton" runat="server" Font-Names="Arial" ForeColor="Red" OnClick="ChangePasswordButton_Click">Change Password</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="BackButton" runat="server" Font-Bold="True" Font-Names="Arial" OnClick="BackButton_Click">BACK</asp:LinkButton>
            <br />

    </form>
        
        
</body>
</html>