<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUploadFile.ascx.cs" Inherits="UserControls_ucUploadFile" %>

<h4>To Upload a file you must provide the following information:</h4>

Type of file:<asp:DropDownList ID="ddlFileType" runat="server">
    <asp:ListItem Value="0">-choose-</asp:ListItem>
    <asp:ListItem>Video</asp:ListItem>
    <asp:ListItem>Picture</asp:ListItem>
</asp:DropDownList>
<asp:HiddenField ID="HiddenField1" runat="server" />

<br />
File:
<asp:FileUpload ID="fileUpload" runat="server" />

