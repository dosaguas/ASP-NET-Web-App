<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Article.aspx.cs" Inherits="Admin_Article" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<%--<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxObjectContainer" tagprefix="dx" %>

     --%>
<%@ Register Namespace="RichEditor" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <link href="../CSS/Article.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js" type="text/javascript"></script>

	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/themes/redmond/jquery-ui.css" />
    <script type="text/javascript" language="javascript">
    //<![CDATA[

        $(function () {

            $("#submitComment").button();
            $("#btnComments").button({ icons:
                            {
                                primary: "ui-icon-gear"
                                
                            }
                            });

        });


        //]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="ArticleFrame">
        <h1>
            <asp:Label ID="arTitle" runat="server" Text="" /></h1>
        <div id="topArticle" class="ui-widget-header">
        </div>
        <div id="bottomArticle" class="ui-widget-content">
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="arBody" runat="server" Text="" />
            <br />
            <br />
            <asp:Label ID="arAuthor" runat="server" Text="" />
            <br />
            <br />
            <asp:Label ID="arDate" runat="server" Text="" />
        </div>
        <asp:Button ID="btnComments" ClientIDMode="Static" runat="server" OnClick="hideOrShowComments" Text="Hide/Show Comments"  />
        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="pnlComments" Radius="20" Corners="All">
        </asp:RoundedCornersExtender>
        <%-- <ajaxToolkit:RoundedCornersExtender ID="rce" runat="server"
    TargetControlID="Panel1"
    Radius="6"
    Corners="All" />--%>

        <asp:Panel ID="pnlComments" runat="server" Visible="true" BorderColor="#6699FF" BorderStyle="Dashed" BackColor="White">
            <div id="commentsWrapper">
                <h1>Comments</h1>
                <div id="commentForm">
                <asp:Label ID="lblServerMessage" runat="server" Text=""></asp:Label>
                    
                    <asp:Label ID="cName" runat="server" Text="Name:*" /><asp:TextBox ID="txtcname" runat="server" /><br />
                    <asp:Label ID="cWebsite" runat="server" Text="Website:*" /><asp:TextBox ID="txtWebsite"
                        runat="server" /><br />
                    <asp:Label ID="cEmail" runat="server" Text="Email:*" />
                    <asp:TextBox ID="txtEmail" runat="server" /><br />
                    <!--TEXT EDITOR GOES HERE-->
                    
                    <cc1:Editor ID="ctxtContent" Width="75%" Height="300px" runat="server" />
                    <br />
                    <asp:Button ID="submitComment" ClientIDMode="Static" OnClick="insertComment" runat="server" Text="Submit Comment" />
                    <hr />
                    <div id="PostedCommentsWrapper">
                        <div id="PostedContent">
                            
                            <asp:Label ID="lblcommentList" runat="server" Text="" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
