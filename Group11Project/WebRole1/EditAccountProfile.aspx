﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAccountProfile.aspx.cs" Inherits="WebRole1.EditAccountProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 161px">
            //TODO: Edit user profile<br />
            <br />
            Email Address:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NewEmailTextBox" runat="server" ></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="EditButton" runat="server" Height="26px" OnClick="EditButton_Click" Text="Edit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Cancel" />
        </div>
    </form>
</body>
</html>
