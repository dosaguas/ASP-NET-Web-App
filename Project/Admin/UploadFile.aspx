<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="UploadFile.aspx.cs" Inherits="UploadFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<fieldset style="text-align:left; width: 800px; height:350px;">
    <asp:Panel ID="pnlRespond" Visible="false" runat="server">
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    </asp:Panel>

    <legend><h1>User Upload Widget:</h1></legend>
    <br />
    <br />
    <asp:Label ID="typeFile" runat="server" Text="File Type: "></asp:Label>
    <br />
     <asp:Label runat="server" ID="ttlFile" Text="Title"></asp:Label>
    <asp:TextBox runat="server" ID="txtTTLFILE" />
     <br />
 
        <asp:FileUpload ID="fuUpload" runat="server" />
    <br />
    <fieldset style="text-align:right; width: 400px; height:100px;">
    <legend>Allowed File Types:</legend>
    images, psd, pdf, bmp, gif, jpg, png, txt, mov, mpg and mpeg 
    
    <br />
    </fieldset>
<br />   
         <asp:Button ID="Button1" runat="server" Text="Button" OnClick="AddBinary" />
</fieldset>
</asp:Content>

