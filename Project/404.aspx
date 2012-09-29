<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>
<%@ Register Src="~/UserControls/ucComments.ascx" TagPrefix="uc"  TagName="comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Scripts/jquery-ui-1.8.18.custom/css/dark-hive/jquery-ui-1.8.18.custom.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

You are have entered the wrong information into the page. 
Please contact the Webmaster to see if your account can be reactivated:<a href="mailto:mail@msn.com">mail@msn.com</a> 
<style type="text/css">
	//#resizable { width: 150px; height: 150px; padding: 0.5em; }
	//#resizable h3 { text-align: center; margin: 0; }
	
    </style>
	<!--<script type="text/javascript">
	   // $(function () {
	    //    $("#resizable").resizable();
	    //});
	</script>-->



<div id="blgdesc">	 
        <h3>Blog title</h3>
    <p>Hksancalscnaslcknaslcnaslcnaslcnaslcnaslcnaslcnalscnaslcnaslkncaslkcnaslnkcaslkcnsalkncaslcnaskl
     acnaslkcnaslkncaslkcnasklcnasklncslasnckaklscnasklcnasklcnasklcnasklcnasklcnasklcnasklcnaslcnaslcns
     Hksancalscnaslcknaslcnaslcnaslcnaslcnaslcnaslcnalscnaslcnaslkncaslkcnaslnkcaslkcnsalkncaslcnaskl
     acnaslkcnaslkncaslkcnasklcnasklncslasnckaklscnasklcnasklcnasklcnasklcnasklcnasklcnasklcnaslcnaslcns
     Hksancalscnaslcknaslcnaslcnaslcnaslcnaslcnaslcnalscnaslcnaslkncaslkcnaslnkcaslkcnsalkncaslcnaskl
     acnaslkcnaslkncaslkcnasklcnasklncslasnckaklscnasklcnasklcnasklcnasklcnasklcnasklcnasklcnaslcnaslcns..
     <a href="#">Read More</a>
     </p>
    </div>    
<uc:comment ID="blogComment" runat="server" ViewStateMode="Enabled" />
    
    




   
</asp:Content>

