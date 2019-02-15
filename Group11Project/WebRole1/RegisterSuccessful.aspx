<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSuccessful.aspx.cs" Inherits="WebRole1.RegisterSuccessful" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Registration successful! Go to login page with your newly created account.<br />
            <br />
            <asp:Button ID="toLogInButton" runat="server" OnClick="toLogInButton_Click" Text="To Log In Page" />
        </div>
    </form>
</body>
</html>
