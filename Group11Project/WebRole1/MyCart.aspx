<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="WebRole1.MyCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="styles.css" />
    
    
    
    <style type="text/css">
        .auto-style16 {
            position: absolute;
            left: 111px;
            top: 157px;
            right: 598px;
        }
    </style>
    
    
    
</head>
<body>
        <form id="form1" runat="server" class="auto-style7" style="vertical-align:top">
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
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="CART"></asp:Label>
            <br />
            <br />
            
            
            <asp:Button ID="ClearButton" runat="server" OnClick="ClearButton_Click" Text="Clear Cart" />
            
            <br />
            <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" Font-Size="X-Large" ForeColor="Red"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="TotalPriceLabel" runat="server" Font-Names="Arial Black" Font-Size="X-Large" ForeColor="Red"></asp:Label>
            
            <br />
            <br />
            
            
            <br />
            <br />

            

    </form>
    <form id="form2" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" class="auto-style16">
        <input type="hidden" name="cmd" value="_xclick" />
        <input type="hidden" name="business" value="group11project@test.com" />

        <input type="hidden" name="item_name" value="Cart Orders - <%= Session["username"].ToString() %> " />
        <input type="hidden" name="amount" value="<%= Session["sum"].ToString() %>" /> 
        <input type="hidden" name="currency_code" value="SEK" /> 
        
        <% if (Session["sum"].ToString().Equals("0"))
            {
                %>
            <input type="submit" value="Pay with Paypal" disabled="disabled" />
        <%} %>
        <% else {%>
            <input type="submit" value="Pay with Paypal" />
        <%} %>
        <input type="hidden" name="return" value="http://localhost:51963/PaymentSuccessful.aspx" />
        <input type="hidden" name="cancel_return" value="http://localhost:51963/PaymentFailed.aspx" />

    </form>
       
    </body>
</html>


