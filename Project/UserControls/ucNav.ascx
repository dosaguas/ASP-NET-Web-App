<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucNav.ascx.cs" Inherits="UserControls_ucNav" %>

 <div>
<asp:Menu ID="mnNavBar" runat="server" BackColor="#293955" 
    DynamicHorizontalOffset="20" Font-Names="Tahoma" Font-Size="1em" 
    ForeColor="#666666" StaticSubMenuIndent="10px" DynamicVerticalOffset="200" 
         Font-Overline="True" ItemWrap="True" Orientation="Horizontal" 
         style="font-family: 'Segoe UI'" DataSourceID="siteMapNavigation">
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

     <asp:SiteMapDataSource ID="siteMapNavigation" runat="server" />

</div>

<div>
 </div>
