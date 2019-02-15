<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountProfile.aspx.cs" Inherits="WebRole1.AccountProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Your Account Profile<br />
            <br />
            Account ID:
            <br />
            Username:<br />
            Email:<br />
            <br />
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back" />
        </div>
    </form>
</body>
</html>
