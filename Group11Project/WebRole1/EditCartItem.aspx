<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCartItem.aspx.cs" Inherits="WebRole1.EditCartItem" %>


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
        .auto-style2 {
            position: absolute;
            left: 1002px;
            top: 43px;
        }
        .auto-style3 {
            position: absolute;
            left: 1002px;
            top: 19px;
        }
        .auto-style4 {
            position: absolute;
            left: 1243px;
            top: 19px;
        }
        .auto-style5 {
            position: absolute;
            left: 1154px;
            top: 19px;
            right: 35px;
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
            left: 1003px;
            top: 70px;
            width: 227px;
            height: 19px;
        }
        .auto-style16 {
            text-decoration:none;
            position: absolute;
            left: 658px;
            top: 29px;
        }
      
        .auto-style17 {
            position: absolute;
            top: 24px;
            left: 15px;
            right: 942px;
            width: 43px;
        }
      
    </style>
</head>
<body>
    <body bgcolor="#B6B6B6">
        <form id="form1" runat="server" class="auto-style7">



            <div style="background-color: black;" id="Div1" runat="server" class="auto-style6">

                <p class="auto-style1">
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="HomePageButton" runat="server" Height="32px" ImageUrl="~/ImageAssets/CoffeeMachineLogo.png" PostBackUrl="~/MainPage.aspx" CssClass="auto-style17" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <%if (Session["username"] == null)
                    {%>
                    <asp:TextBox ID="textUsername" runat="server" placeholder="Username" Width="120px" CssClass="auto-style3"></asp:TextBox>


                    &nbsp;<asp:TextBox ID="textPassword" runat="server" placeholder="Password" TextMode="Password" Width="120px" CssClass="auto-style2"></asp:TextBox>
                    <asp:Label ID="ErrorMsg" runat="server" CssClass="auto-style15" Font-Names="Arial" ForeColor="Red"></asp:Label>


                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:ImageButton ID="LogInButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogInLogo.png" Width="79px" OnClick="LogInButton_Click" CssClass="auto-style5" />
                    <asp:ImageButton ID="RegisterButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/SignUpLogo.png" Width="79px" OnClick="RegisterButton_Click" CssClass="auto-style4" />

                    <%} %><%else
                        {
                            UserAccountButton.Text = Session["username"].ToString();%>
                    <asp:LinkButton ID="UserAccountButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style14" OnClick="UserAccountButton_Click"></asp:LinkButton>
                    <asp:ImageButton ID="LogOutButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogOutLogo.png" Width="79px" CssClass="auto-style13" OnClick="LogOutButton_Click" />
                    <asp:ImageButton ID="ViewMyCartButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/ViewMyCart.png" Width="79px" OnClick="ViewMyCartButton_Click" CssClass="auto-style4" />
                  
                    <%} %>

                    <br />
                    <asp:LinkButton ID="HomeButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style8" OnClick="HomeButton_Click">HOME</asp:LinkButton>
                    <asp:LinkButton ID="FeaturesButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style9" OnClick="FeaturesButton_Click">FEATURES</asp:LinkButton>
                    <asp:LinkButton ID="AboutUsButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style10" OnClick="AboutUsButton_Click">ABOUT US</asp:LinkButton>
                    <asp:LinkButton ID="ContactButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style11" OnClick="ContactButton_Click">CONTACT</asp:LinkButton>
                    <asp:LinkButton ID="ShopButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style16" OnClick="ShopButton_Click">SHOP</asp:LinkButton>
                    <br />

                    <br />
                    &nbsp;

        
                <br />
                    <br />
                </p>
            </div>

            <br />

            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="CART ITEM DETAILS"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Product ID: "></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="IDLabel" runat="server" Font-Names="Arial"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Text="Quantity: "></asp:Label>
            <asp:Button ID="DecreaseButton" runat="server" OnClientClick="return decrease('1')" Text="-" Width="26px" />
            &nbsp;<asp:TextBox ID="QuantityText" runat="server" Width="28px" ></asp:TextBox>
            &nbsp;<asp:Button ID="IncreaseButton" runat="server" OnClientClick="return increase('100')" Text="+" Width="26px" />
            &nbsp;
            <asp:Button ID="EditCartItemButton" runat="server" OnClick="EditCartItemButton_Click" Text="Edit Quantity" class="add"/>
            &nbsp;&nbsp;
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back to Cart" />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Text="Name: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="NameLabel" runat="server" Font-Names="Arial"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="ErrorLabel" runat="server" Font-Names="Arial" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Text="Category: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="CategoryLabel" runat="server" Font-Names="Arial"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Text="Price: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="PriceLabel" runat="server" Font-Names="Arial"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Text="Description: "></asp:Label>

            &nbsp;
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>

            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Text="Image: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:PlaceHolder ID="ImagePlaceHolder" runat="server"></asp:PlaceHolder>
            <br />
            <br />


            <script type="text/javascript">
                var itemCount = 0;        
                var input=parseInt(document.getElementById("QuantityText").value);
                function decrease(min) {
                    input = parseInt(input) - 1;
                    if (input <= parseInt(min)) {
                     input = min;
                    }
                    document.getElementById("QuantityText").value = input;
                    return false;
                }

                function increase(max) {
                    
                     input= parseInt(input) + 1;               

                    if (input >= parseInt(max)) {
                      input.value = max;
                    }
                
                    document.getElementById("QuantityText").value = input;
                        return false;
             }
            </script>
        </form>
    </body>
</html>



