<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUploadVideo.ascx.cs" Inherits="UserControls_ucUploadVideo" %>


<h2>Please feel free to upload a video or image" </h2>
<asp:FileUpload ID="FileUpload1" runat="server" />
<br />

<br />
Mime Type:
<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Value="0">-choose-</asp:ListItem>
    <asp:ListItem>mp4</asp:ListItem>
    <asp:ListItem>swf</asp:ListItem>
</asp:DropDownList>

