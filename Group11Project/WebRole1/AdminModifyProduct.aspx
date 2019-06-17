<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminModifyProduct.aspx.cs" Inherits="WebRole1.AdminModifyProduct" %>

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
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="EDIT/REMOVE PRODUCT FROM SHOP"></asp:Label>
            <br />

            

            

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Product ID: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="IDText" runat="server" Width="45px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchButton" runat="server" Text="Search Product" OnClientClick="return validID()" OnClick="SearchButton_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="CURRENT PRODUCT INFORMATION"></asp:Label>
            <br />
            <br />
            <asp:Label ID="MessageLabel" runat="server" Font-Names="Arial" Font-Underline="False" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Text="Product ID: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="IDLabel" runat="server" Font-Names="Arial"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Text="Name: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NameText" runat="server" Width="133px"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Text="Category: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="CategoryList" runat="server">
                <asp:ListItem>-Select-</asp:ListItem>
                <asp:ListItem>Medicine</asp:ListItem>
                <asp:ListItem>Hygiene</asp:ListItem>
                <asp:ListItem>Dietary Supplement</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Text="Description: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DescriptionText" runat="server" Height="53px" TextMode="MultiLine" Width="313px"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Text="Image URL: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ImageText" runat="server" Width="307px"></asp:TextBox>
            <br />
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial" Text="Price: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PriceText" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="EditButton" runat="server" OnClientClick="return validateInput()" OnClick="EditButton_Click" Text="Edit Product" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteButton" runat="server" Text="Remove Product" OnClick="DeleteButton_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Cancel/Back" />
            <br />
            <br />

            <script>
                function validID() {
                    var ID = document.getElementById("IDText").value;

                    if (ID == "") {
                        alert("ID cannot be empty");
                        return false;
                    }

                    if (isNaN(ID)) {
                        alert("Not a number");
                        return false;
                    }
                    return true;
                }

                function validateInput() {

                    
                    var productname = document.getElementById("NameText").value;
                    var categorylist = document.getElementById("CategoryList");
                    var category = categorylist.options[categorylist.selectedIndex].value;
                    var description = document.getElementById("DescriptionText").value;
                    var imageurl = document.getElementById("ImageText").value;
                    var price = document.getElementById("PriceText").value;
                    var pricepattern = /^\d+(?:\.\d{0,2})$/;
                    var urlpattern = /\.(jpeg|jpg|gif|png)$/;

                    if (ID = "") {
                        alert("Please use search button first");
                        return false;
                    }

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

                    if (category == "-Select-") {
                        alert("Please choose a category");
                        return false;
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


