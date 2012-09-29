<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Admin_Blog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControls/ucRichEditor.ascx" TagPrefix="uc" TagName="RichEditor" %>
<%@ Register Src="~/UserControls/ucSocialMedia.ascx" TagPrefix="uc" TagName="social" %>
<%@ Register Src="~/UserControls/ucComments.ascx" TagPrefix="uc" TagName="comments" %>
<%@ Register Namespace="RichEditor" TagPrefix="cc" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
    
    <link href="../CSS/blog.css" rel="stylesheet" type="text/css" />
	<script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js" type="text/javascript"></script>
	
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/themes/redmond/jquery-ui.css" />

	<script type="text/javascript" language="javascript">
  //<![CDATA[

	    //This gives us a nice looking category split-up.
	    $(function () {

	        $("#radio").buttonset();

	        $(".tinyButton").button();

	        $("#SubmitBlogEntry").button();

	        $("#toggleButton").button();
	    });

	    $(function () {
	        $(".caption button:first").button({
	            icons: {
	                primary: "ui-icon-locked"
	            },
	            text: false
	        }).next().button({
	            icons: {
	                primary: "ui-icon-locked"
	            }
	        }).next().button({
	            icons: {
	                primary: "ui-icon-gear",
	                secondary: "ui-icon-triangle-1-s"
	            }
	        }).next().button({
	            icons: {
	                primary: "ui-icon-gear",
	                secondary: "ui-icon-triangle-1-s"
	            },
	            text: false
	        });
	    });

	    $(function () {
	        $(".organize input:first").button({
	            icons: {
	                primary: "ui-icon-gear",
	                secondary: "ui-icon-triangle-1-s"
	            },
	            text: true
	        }).next().button({
	            icons: {
	                primary: "ui-icon-gear",
	                secondary: "ui-icon-triangle-1-s"
	            }
	        }).next().button({
	            icons: {
	                primary: "ui-icon-gear",
	                secondary: "ui-icon-triangle-1-s"
	            }
	        }).next().button({
	            icons: {
	                primary: "ui-icon-gear",
	                secondary: "ui-icon-triangle-1-s"
	            },
	            text: true
	        });
	    })
        
        	//]]>

	   
	</script>


    <script type="text/javascript" language="javascript">

        function PrepareSort(th) {
            //var list= document.getElementById("ddlSort").
            //if($("ddlSort").select==)
            var slval = $('#ddlSort').val();
            if (slval == "Date") {

                $("#searchBar").datepicker();
                $("#searchBar").datepicker("option", "showAnim", "drop");

            } else if (slval == "Topic") {


                $("#searchBar").datepicker("destroy");
                var availableTags = [
			    "WEWEB",
                "WEWEB",
                "WEPHONE",
                "Windows Web Applications",
                "Windows WPF",
                "Windows Cloud"
		        ];
                $("#searchBar").autocomplete({
                    source: availableTags
                });

            } else {
                $("#searchBar").datepicker("destroy");
            }



        }

       
    </script>




 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server">
    </asp:ScriptManager>
    <asp:Label ID="lblServerMessage" runat="server" Text="Label"></asp:Label>
<fieldset id="BlogMainWrapper"><!-- BEGIN FIRST FIELDSET-->
Choose Which Category you would like to view:
<div id="radio">
 	<asp:RadioButtonList ID="cat" ClientIDMode="Static" ViewStateMode="Enabled" 
        OnSelectedIndexChanged="SetCategory" runat="server" 
		RepeatDirection="Horizontal" AutoPostBack="True">
		<asp:ListItem Value="WEPHONE" Selected="True">Window Phone</asp:ListItem>
	    <asp:ListItem Value="WEWEB">Windows Web</asp:ListItem>
        <asp:ListItem Value="WEAZURE">Windows Azure Cloud</asp:ListItem>
	</asp:RadioButtonList>
    </div>
<legend>Blog</legend>
Welcome to my blog get ready for some amazing articles...
<div class="ui-widget" id="searchBarWrapper">

    <asp:DropDownList ID="ddlSort" runat="server" onchange="PrepareSort(this)" ClientIDMode="Static">
        <asp:ListItem Value="0" Selected="True">-Choose-</asp:ListItem>
        <asp:ListItem>Date</asp:ListItem>
        <asp:ListItem>Title</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="search" OnClientClick="PrepareSort(this);" OnClick="SearchSort" CssClass="ui-widget-header" Text="Search:" runat="server" />
    
   <!-- <button id="search" class="ui-widget-header">Search: </button>  -->
     <asp:TextBox ID="searchBar" ClientIDMode="Static" AutoCompleteType="Search" runat="server" />
	<div class="organize">
<!--The blog entries will be organized by date, topic and author, and each entry will have a title.-->
	
	
</div>
</div>
<br />
<uc:social ID="social0" runat="server" EnableViewState="true" />
  	
	
    <!-- TODO: you must do the codebehind function to get this to display a panel or hide the panel -->
    <asp:Button ID="toggleButton" ClientIDMode="Static" runat="server" Text="Hide/Show Blog Insert Mode" onclick="toggleButton_Click" />
 
    <br />
    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
    TargetControlID="toggleInsertMode"
     Radius="20" Corners="All" />
    
<asp:Panel ID="toggleInsertMode" ClientIDMode="Static" runat="server" 
        Visible="true" BackColor="White"> 

</asp:Panel>
<fieldset id="BlogContentWrapper"> <!-- BEGIN OF LAST FIELDSET-->
<legend>Blog: <%=cat.SelectedItem %></legend>
<asp:Label ID="lblError" runat="server" Text=""></asp:Label>
</fieldset><!-- END OF LAST FIELDSET-->
	
	<asp:Panel ID="pnlToggleComments" runat="server">

	<uc:comments runat="server" ID="ucComments" EnableViewState="true" /> 
	</asp:Panel>
  

   
</fieldset><!-- END OF FIRST FIELDSET-->
   
   <script type="text/javascript">
       /*
       function cleanUp(t) {
       console.log(t);
       $.ajax({
       type: 'POST',
       url: '/Project/Admin/Blog.aspx',
       data: $("#txtContent").val,
       success: function (data) {
       $("#ajaxResponse").html(data);
       },
       failure: function () {
       console.log("ERROR HAS HAPPENED"
       $("#ajaxResponse").html()
       },
       dataType: 'jsonp'
       });
       }

       */
   </script>


</asp:Content>

