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
            Account ID:&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            Username:&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back" />
        </div>
    </form>
</body>
</html>
