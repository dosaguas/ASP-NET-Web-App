<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucHeader.ascx.cs" Inherits="UserControls_ucHeader" %>
<div id="header">
   <div id="navbar">
    <asp:LoginStatus ID="LoginStatus1" runat="server" />&nbsp;<asp:LoginName ID="LoginName1" runat="server" />
 
    </div>
     
 
 <div>
<asp:Menu ID="mnNavBar" runat="server" BackColor="#293955" 
    DynamicHorizontalOffset="20" Font-Names="Tahoma" Font-Size="1em" 
    ForeColor="#666666" StaticSubMenuIndent="10px" DynamicVerticalOffset="200" 
         Font-Overline="True" ItemWrap="True" 
         style="font-family: 'Segoe UI'" DataSourceID="SiteMapAdmin" 
         EnableTheming="True">
    <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <DynamicMenuStyle BackColor="#E3EAEB" />
    <DynamicSelectedStyle BackColor="#1C5E55" />
    <Items>
        <asp:MenuItem Text="HOME" Value="HOME"></asp:MenuItem>
        <asp:MenuItem Text="BLOG" Value="BLOG"></asp:MenuItem>
        <asp:MenuItem Text="ABOUT" Value="ABOUT"></asp:MenuItem>
        <asp:MenuItem Text="IMAGES" Value="IMAGES"></asp:MenuItem>
        <asp:MenuItem Text="VIDEOS" Value="VIDEOS"></asp:MenuItem>
    </Items>
    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticSelectedStyle BackColor="#1C5E55" />
</asp:Menu>

     <asp:SiteMapDataSource ID="SiteMapAdmin" runat="server" 
         SiteMapProvider="XmlSiteMapProvider" />

</div>

<div>
 </div>

    </div>

    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapAdmin" 
    ShowLines="True">
</asp:TreeView>


    