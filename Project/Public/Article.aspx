<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Article.aspx.cs" Inherits="Admin_Article" %>

<%@ Register Namespace="RichEditor" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Article.css" rel="stylesheet" type="text/css" />
   <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-ui-1.8.18.custom.min.js"
        type="text/javascript"></script>
    <link href="../Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css"
        rel="stylesheet" type="text/css" />
 
    <script type="text/javascript" language="javascript">
    //<![CDATA[

        $(function () {

            $("#submitComment").button();

        });


        //]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="ArticleFrame">
        <h1>
            <asp:Label ID="arTitle" runat="server" Text="" />
        </h1>
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
        <asp:Panel ID="Panel1" runat="server">
            <fieldset id="commentsWrapper">
                <legend>Comments</legend>
                <div id="commentForm">
                    <hr />
                    <div id="PostedCommentsWrapper">
                        <div id="PostedContent">
                            <asp:Label ID="lblcommentList" runat="server" Text="" />
                        </div>
                    </div>
                </div>
            </fieldset>
        </asp:Panel>
    </div>
</asp:Content>
