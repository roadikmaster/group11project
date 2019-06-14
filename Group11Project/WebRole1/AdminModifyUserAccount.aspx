<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminModifyUserAccount.aspx.cs" Inherits="WebRole1.AdminModifyUserAccount" %>

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
            left: 307px;
            top: 237px;
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
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" Font-Size="X-Large" Text="MODIFY USER'S ACCOUNT"></asp:Label>

            <br />
            <br />
            <asp:Label ID="MessageLabel" runat="server" Font-Names="Arial" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Enter User Account ID/Username:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="SearchText" runat="server"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchButton" runat="server" Text="View/Search" OnClientClick="return checkcontent()" OnClick="SearchButton_Click" />

            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Text="Search Mode:"></asp:Label>
            <asp:RadioButtonList ID="SearchList" runat="server" RepeatDirection="Horizontal" CssClass="auto-style15" Font-Names="Arial" >
                <asp:ListItem Selected="True" Text="ID" Value="ID">ID</asp:ListItem>
                <asp:ListItem Text="Username" Value="Username">Username</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial Black" Text="USER ACCOUNT INFORMATION"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Text="Account ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="UserAccountIDText" runat="server" Font-Names="Arial"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Text="Username:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="UserUsernameText" runat="server" Font-Bold="False" Font-Names="Arial"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Text="Email:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="UserEmailText" runat="server" Width="300px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="EditUserAccountButton" runat="server" Font-Bold="True" Font-Names="Arial" OnClientClick="return validate()" OnClick="EditUserAccountButton_Click">EDIT USER&#39;S ACCOUNT</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="DeleteUserButton" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" OnClick="DeleteUserButton_Click">DELETE USER&#39;S ACCOUNT</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="CancelButton" runat="server" Font-Bold="True" Font-Names="Arial" OnClick="CancelButton_Click">CANCEL / BACK</asp:LinkButton>
            <br />
            <br />

            <script type="text/javascript">
                function validate() {
                    var text = document.getElementById("SearchText").value;
                    var email = document.getElementById("UserEmailText").value;
                    var emailpattern = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;

                    if (text == "") {
                        alert("Please use the search button first");
                        return false;
                    }
                    if (email == "") {
                        alert("Email cannot be empty.\nClick Cancel if not changing Account Information.");
                        return false;
                    }
                    if (email != "") {
                        if (!email.match(emailpattern)) {
                            alert("Invalid email address");
                            return false;
                        }
                        return true;
                    }
                }

                function checkcontent() {
                    var text = document.getElementById("SearchText").value;

                    if (text == "") {
                        alert("Search field cannot be empty");
                        return false;
                    }

                    return true;
                }
            </script>
            
    </form>
        
        
</body>
</html>
