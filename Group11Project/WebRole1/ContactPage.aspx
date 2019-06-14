<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="WebRole1.ContactPage" %>

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
                    <%if (Session["username"] == null)
                    {%>
        <asp:TextBox ID="textUsername" runat="server"  placeholder="Username" Width="120px" CssClass="auto-style3"></asp:TextBox>
        

            &nbsp;<asp:TextBox ID="textPassword" runat="server" placeholder="Password" TextMode="Password" Width="120px" CssClass="auto-style2" ></asp:TextBox>
                    <asp:Label ID="ErrorMsg" runat="server" CssClass="auto-style15" Font-Names="Arial" ForeColor="Red"></asp:Label>

        
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:ImageButton ID="LogInButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogInLogo.png" Width="79px" OnClick="LogInButton_Click" CssClass="auto-style5" />
                     <asp:ImageButton ID="RegisterButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/SignUpLogo.png" Width="79px" OnClick="RegisterButton_Click" CssClass="auto-style4" />

                    <%} %>                    <%else
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
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="CONTACT"></asp:Label>

            <br />
            <br />
            <asp:LinkButton  ID="LinkButton1" OnClientClick="return showcontent1(event)" runat="server" Font-Names="Arial">View Contact Information</asp:LinkButton>
            <br />

            <p id="ContentText1"></p><br />

            <script type="text/javascript">
                function showcontent1() {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            document.getElementById("ContentText1").innerHTML = xmlhttp.responseText;
                        }
                    };
                    xmlhttp.open("GET", "SupportInformation.txt", true);
                    xmlhttp.send();

                    event.preventDefault();
                    return false;
                }
            </script>

            <br />
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="CREDITS"></asp:Label>
            <br />
            <br />
          

            <asp:LinkButton ID="ViewContact" runat="server" OnClientClick="return showcontent(event)" Font-Names="Arial">View Credits</asp:LinkButton>
            <p id="ContentText"></p>

            <script type="text/javascript">
                // fetch from a text file and display the contents
                function showcontent() {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            document.getElementById("ContentText").innerHTML = xmlhttp.responseText;
                        }
                    };
                    xmlhttp.open("GET", "ContactInformation.txt", true);
                    xmlhttp.send();

                    event.preventDefault();
                    return false;  //prevents from refreshing the page
                }
            </script>





            <br />

    </form>
        
        
</body>
</html>
