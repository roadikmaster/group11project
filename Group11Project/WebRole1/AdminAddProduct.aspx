<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddProduct.aspx.cs" Inherits="WebRole1.AdminAddProduct" %>

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
            text-decoration:none;
            position: absolute;
            left: 658px;
            top: 29px;
        }
        
        .auto-style16 {
            margin-left: 0px;
        }
        
        </style>
</head>
<body>
    <body bgcolor="#B6B6B6">
        <form id="form1" runat="server" class="auto-style7">
        
        
            
            <div style="background-color:black;" id="Div1" runat="server" class="auto-style6">
            
                <p class="auto-style1">
            
                &nbsp;&nbsp;<asp:ImageButton style="position:absolute; top: 24px; left: 15px; right: 531px;" ID="HomePageButton" runat="server" Height="32px" ImageUrl="~/ImageAssets/CoffeeMachineLogo.png" PostBackUrl="~/MainPage.aspx"  Width="183px" />
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
                    <asp:LinkButton ID="HomeButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style8" OnClick="HomeButton_Click">HOME</asp:LinkButton>
                    <asp:LinkButton ID="FeaturesButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style9" OnClick="FeaturesButton_Click">FEATURES</asp:LinkButton>
                    <asp:LinkButton ID="AboutUsButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style10" OnClick="AboutUsButton_Click">ABOUT US</asp:LinkButton>
                    <asp:LinkButton ID="ContactButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style11"  OnClick="ContactButton_Click">CONTACT</asp:LinkButton>
                    <asp:LinkButton ID="ShopButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style15" OnClick="ShopButton_Click">SHOP</asp:LinkButton>
                <br />
                    
                <br />&nbsp;

        
                <br />
                <br />
                </p>
                </div>

            <br />
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="ADD NEW PRODUCT"></asp:Label>
            <br />
            <br />
            <asp:Label ID="MessageLabel" runat="server" Font-Names="Arial" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Product Name: (2-50 characters)"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NameText" runat="server" CssClass="auto-style16" Width="246px"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Text="Category: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CategoryText" runat="server" Width="241px"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Text="Description: (max 200 characters)"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DescriptionText" runat="server" Height="88px" TextMode="MultiLine" Width="244px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Text="Image URL: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ImageURLText" runat="server" Width="409px"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Text="Price: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PriceText" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="AddButton" runat="server" OnClientClick="return validate()"  OnClick="AddButton_Click" Text="Add New Product" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Back" Width="55px" />
            <br />
            <br />

            
            <script type="text/javascript">
                function validate() {
                    var productname = document.getElementById("NameText").value;
                    var category = document.getElementById("CategoryText").value;
                    var description = document.getElementById("DescriptionText").value;
                    var imageurl = document.getElementById("ImageURLText").value;
                    var price = document.getElementById("PriceText").value;
                    var pricepattern = /^\d+(?:\.\d{0,2})$/;
                    var urlpattern = /\.(jpeg|jpg|gif|png)$/;

                    if (productname == "") {
                        alert("Name cannot be empty");
                        return false;
                    }

                    if (productname != "") {
                        if (productname.length < 2 || productname.length > 50) {
                            alert("Name can only have 2-50 characters");
                            return false;
                        }
                        
                    }

                    if (category == "") {
                        alert("Category cannot be empty");
                        return false;
                    }

                    if (category != "") {
                        if (category.length > 20) {
                            alert("Category can only have max 20 characters");
                            return false;
                        }
                        
                    }
                    
                    if (description == "") {
                        alert("Description cannot be empty");
                        return false;
                    }

                    if (description != "") {
                        if (description.length > 200) {
                            alert("Description can only have max 200 characters");
                            return false;
                        }
                        
                    }

                    if (imageurl == "") {
                        alert("Image cannot be empty");
                        return false;
                    }

                    if (imageurl != "") {
                        if (!imageurl.match(urlpattern)) {
                            alert("Invalid Image URL");
                            return false;
                        }
                        
                    }

                    if (price == "") {
                        alert("Price cannot be empty");
                        return false;
                    }

                    if (price != "") {
                        if (!price.match(pricepattern)) {
                            alert("Price must be in decimal form with 2 decimal places");
                            return false;
                        }
                        return true;
                    }
                    
                }

            </script>
            

    </form>
        
        
</body>
</html>


