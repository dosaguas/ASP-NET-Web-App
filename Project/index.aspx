<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h1>INDEX.HTML</h1>
<br />

<br />
User <%=User.ToString() %>
<br />
User Name: <%=User.Identity.Name %>


<br />

User Role: <%=User.IsInRole("Administrator") %>

Is the user authenticated<%=User.Identity.IsAuthenticated %>
</asp:Content>

