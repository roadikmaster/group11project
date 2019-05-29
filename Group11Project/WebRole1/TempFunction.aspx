<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TempFunction.aspx.cs" Inherits="WebRole1.TempFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            //TODO: Implement the main project features here<br />
            <br />
            <br />
            t:&nbsp;&nbsp;&nbsp;
            <asp:Label ID="tLabel" runat="server"></asp:Label>
            <br />
            x:&nbsp;&nbsp;&nbsp; <asp:Label ID="xLabel" runat="server"></asp:Label>
            <br />
            y:&nbsp;&nbsp;&nbsp;
            <asp:Label ID="yLabel" runat="server"></asp:Label>
            <br />
            z:&nbsp;&nbsp;&nbsp;
            <asp:Label ID="zLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="RecordButton" runat="server" OnClick="RecordButton_Click" Text="Record" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="StopButton" runat="server" OnClick="StopButton_Click" Text="Stop" />
            <br />
            <br />
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back" />
        </div>
    </form>
</body>
</html>
