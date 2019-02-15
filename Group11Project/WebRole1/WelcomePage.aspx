<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="WebRole1.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Welcome
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />

        </div>
        &nbsp;
        <asp:Button ID="AccountProfileButton" runat="server" OnClick="AccountProfileButton_Click" Text="Account Profile" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="FunctionButton" runat="server" Text="Function" OnClick="FunctionButton_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="LogOutButton" runat="server" OnClick="LogOutButton_Click" style="margin-left: 0px" Text="Log Out" />
        <div style="margin-left: 80px">
        </div>
    </form>
</body>
</html>
