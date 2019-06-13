<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebRole1.Register" %>

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
        .auto-style12 {
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
    <form id="form1" runat="server" class="auto-style12">

        <div style="background-color:black;" id="Div1" runat="server" class="auto-style6">
            
                <p class="auto-style1">
            
                &nbsp;&nbsp;<asp:ImageButton ID="HomePageButton" runat="server" Height="32px" ImageUrl="~/ImageAssets/CoffeeMachineLogo.png" PostBackUrl="~/MainPage.aspx" CssClass="auto-style17" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <%if (Session["username"] == null)
                    {%>
                    
        <asp:TextBox ID="textUsername" runat="server"  placeholder="Username" Width="120px" CssClass="auto-style3"></asp:TextBox>
        

            &nbsp;<asp:TextBox ID="textPassword" runat="server" placeholder="Password" TextMode="Password" Width="120px" CssClass="auto-style2" ></asp:TextBox>
                    <asp:Label ID="ErrorMsg" runat="server" CssClass="auto-style15" Font-Names="Arial" ForeColor="Red"></asp:Label>
        
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:ImageButton ID="LogInButton" runat="server" Height="42px" ImageUrl="~/ImageAssets/LogInLogo.png" Width="79px" OnClick="LogInButton_Click" CssClass="auto-style5" />
                     <asp:ImageButton ID="ImageButton1" runat="server" Height="42px" ImageUrl="~/ImageAssets/SignUpLogo.png" Width="79px" OnClick="RegisterButton_Click" CssClass="auto-style4" />

                    <%} %>                   
                    <%else
                        {
                            UserAccountButton.Text = Session["username"].ToString();%>
                    <asp:LinkButton ID="UserAccountButton" runat="server" Font-Names="Arial Black" ForeColor="#6699FF" CssClass="auto-style14" OnClick="UserAccountButton_Click" ></asp:LinkButton>
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
                <br />&nbsp;

        
                <br />
                <br />
                </p>
                </div>

        <div>
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="Larger" Text="REGISTRATION FORM"></asp:Label>
            <br />
            <br />
            <asp:Label ID="RegErrorMsg" runat="server" Font-Names="Arial" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" Text="Username:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="usernameText" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Font-Names="Arial Black" Text="Password:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="passwordText" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Font-Names="Arial Black" Text="Email:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="emailText" runat="server" Width="249px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="registerButton" runat="server" OnClientClick="return validate()" Onclick="RegisterButton_Click"  Text="Register" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Cancel" />

            <script type="text/javascript">
                function validate()
                {
                    //validate user inputs. If anything is not valid, this function returns false and will not execute onClick function.

                    var username = document.getElementById("usernameText").value;
                    var password = document.getElementById("passwordText").value;
                    var usernamelength = username.length;
                    var paswordlength = password.length;
                    var email = document.getElementById("emailText").value;
                    var emailpattern = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/; //standard pattern for email
                    var alphanumericpattern = /^[a-zA-Z0-9]*$/; //standard pattern for alphanumeric characters without spaces

                    if (username == "") {
                        alert("Username cannot be empty");
                        return false;
                    }
                    if (usernamelength < 4) {
                        alert("Username must be at least 4 characters long");
                        return false;
                    }
                    if (password == "") {
                        alert("Password cannot be empty");
                        return false;
                    }
                    if (paswordlength < 4) {
                        alert("Password must be at least 4 characters long");
                        return false;
                    }
                    if (username != "") {
                        if (!username.match(alphanumericpattern)) {
                            alert("username must be alphanumeric (A-Z, a-z, 0-9)");
                            return false;
                        }
                    }
                    if (email == "") {
                        alert("Email cannot be empty");
                        return false;
                    }
                    if (email != "") {
                        if (!email.match(emailpattern)) {
                            alert("Invalid email format");
                            return false;
                        }
                        return true;
                    }
                    
                }
            </script>
        </div>
    </form>
</body>
</html>
