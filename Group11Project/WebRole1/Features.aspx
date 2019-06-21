<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="WebRole1.Features" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <body font="Arial">
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
                    <%if (Session["username"] == null)
                    {%>
        <asp:TextBox ID="textUsername" runat="server"  placeholder="Username" Width="120px" CssClass="auto-style3"></asp:TextBox>
        

            &nbsp;<asp:TextBox ID="textPassword" runat="server" placeholder="Password" TextMode="Password" Width="120px" CssClass="auto-style2" ></asp:TextBox>
                    <asp:Label ID="ErrorMsg" runat="server" CssClass="auto-style15" Font-Names="Arial" ForeColor="Red"></asp:Label>

        
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:ImageButton ID="LogInButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogInLogo.png" Width="79px" OnClick="LogInButton_Click" CssClass="auto-style5" />
                     <asp:ImageButton ID="RegisterButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/SignUpLogo.png" Width="79px" OnClick="RegisterButton_Click" CssClass="auto-style4" />

                    <%} %>                   
                    <%else
                        {
                            UserAccountButton.Text = Session["username"].ToString();%>
                    <asp:LinkButton ID="UserAccountButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style14" OnClick="UserAccountButton_Click" ></asp:LinkButton>
                     <asp:ImageButton ID="LogOutButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogOutLogo.png" Width="79px" CssClass="auto-style13" OnClick="LogOutButton_Click" />
                    <asp:ImageButton ID="ViewMyCartButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/ViewMyCart.png" Width="79px" OnClick="ViewMyCartButton_Click" CssClass="auto-style4" />
                    <%} %>
                   
                <br />
                    
                <br />
                    
                <br />&nbsp;

        
                <br />
                <br />
                </p>
                </div>

            <br />
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="FEATURES"></asp:Label>

            <br />
            <br />
            <p style="font-family:Arial">
                <b> FAST DELIVERY! </b> <br /><br />
                Our medications will be delivered to your home within maximum of 5 working days.&nbsp;
            </p>
            <p style="font-family:Arial">
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <img src="ImageAssets/DeliveryBox.png" style="position:center"/></p>
            <p style="font-family:Arial">
                <b> TRACK YOUR CURRENT AND PAST ORDERS! </b> <br /><br />
                You can check your current status of each orders you made as well as view the contents <br />
                of each order you made.
            </p>
            <p style="font-family:Arial">
                

                <img src="ImageAssets/CurrentOrdersAdvert.png" style="position:center"/></p>
            <p style="font-family:Arial">
                

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                

                <img src="ImageAssets/OrderItemListAdvert.png" style="position:center"/></p>
            <br />
            <br />
            <p style="font-family:Arial">
                <b> PAY YOUR ORDERS VIA PAYPAL! </b> <br /><br />
                Paying your orders have made easier and safer thanks to our partnership with PayPal.
            </p>
            <p style="font-family:Arial">
                

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                

                <img src="ImageAssets/PayPalLogo.png" style="position:center"/></p>
    </form>  
</body>
</html>
