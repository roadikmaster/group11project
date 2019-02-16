<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebRole1.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 241px">
    <form id="form1" runat="server">
        <div>
            Change Password<br />
            <br />
            Current Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CurrentPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            New Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            Confirm New Password:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="RetypeNewPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="MsgLabel" runat="server" ForeColor="#CC0000" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="ChangePasswordButton" runat="server" OnClick="ChangePasswordButton_Click" Text="Change Password" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Cancel" />
        </div>
    </form>
</body>
</html>
