﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountProfile.aspx.cs" Inherits="WebRole1.AccountProfile" %>

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
        .auto-style8 {
            text-decoration: none;
            position: absolute;
            left: 240px;
            top: 29px;
        }
        .auto-style9 {
            text-decoration:none;
            position: absolute;
            left: 313px;
            top: 29px;
        }
        .auto-style10 {
            text-decoration:none;
            position: absolute;
            left: 430px;
            top: 29px;
        }
        .auto-style11 {
            text-decoration:none;
            position: absolute;
            left: 544px;
            top: 29px;
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
        .auto-style18 {
            text-decoration:none;
            position: absolute;
            left: 658px;
            top: 29px;
        }
        .auto-style19 {
            position: absolute;
            top: 24px;
            left: 15px;
            right: 941px;
            width: 44px;
        }
        </style>
</head>
<body>
    <body bgcolor="#B6B6B6">
        <form id="form1" runat="server" class="auto-style7">
        
        
            
            <div style="background-color:black;" id="Div1" runat="server" class="auto-style6">
            
                <p class="auto-style1">
            
                &nbsp;&nbsp;<asp:ImageButton ID="HomePageButton" runat="server" Height="32px" ImageUrl="~/ImageAssets/CoffeeMachineLogo.png" PostBackUrl="~/MainPage.aspx" CssClass="auto-style19" />
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
                    <asp:LinkButton ID="HomeButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style8" OnClick="HomeButton_Click">HOME</asp:LinkButton>
                    <asp:LinkButton ID="FeaturesButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style9" OnClick="FeaturesButton_Click">FEATURES</asp:LinkButton>
                    <asp:LinkButton ID="AboutUsButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style10" OnClick="AboutUsButton_Click">ABOUT US</asp:LinkButton>
                    <asp:LinkButton ID="ContactButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style11"  OnClick="ContactButton_Click">CONTACT</asp:LinkButton>
                    <asp:LinkButton ID="ShopButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style18" OnClick="ShopButton_Click">SHOP</asp:LinkButton>
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