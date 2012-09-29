<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-ui-1.8.18.custom.min.js"
        type="text/javascript"></script>
    <link href="../CSS/Default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server">
    </asp:ScriptManager>
    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="DefaultWrapper"
       runat="server" Radius="20" Corners="All">
    </asp:RoundedCornersExtender>
<asp:Panel  class="ui-widget-content" runat="server" ID="DefaultWrapper" ClientIDMode="Static">
    <asp:Twitter ID="Twitter1" ScreenName="Prospect1010" runat="server">
    </asp:Twitter>

<fieldset>
<legend><h1 class="ui-widget-header">Windows Enterprise Development</h1></legend>

<div id="defaultContent" >

We would officially like to announce the start of Open source Windows Enterprise Development also known as WEDEVELOP. We develop open source applications on the windows platform, web applications that are cross platform and we will be working on an open source conferencing application called Big Blue Button which will be our main focus. As we progress, our members will be exposed to the latest technology out and gain skills & experience on various developing languages such as C++, C#, PHP, Java, Javascript, HTML5. For our graphic designers we will have you guys focus on CSS, HTML5, and designing the UI for our applications.

As we pursue a success we must be those who don't just dream about success we need to wakeup and live it. We encourage all Seneca full time students to get involved with any of our project because it will only be in there advantage to tap into this technology. Here are some examples of how you can contribute: a communication student will help us interview various students to aid us in getting feedback on our club progress and performance, graphic designers are welcome to design the GUI for our applications, of course a programmer is required for programming applications, students might also join our club to present various presentations for our workshops and much more.

Finally, we encourage all our members to get involved in this open source community and collaborate their ideas to make technology better. If you would like your ideas to to be heard we do too, just click on the comments page and send us your feedback.




</div>


</fieldset>




</asp:Panel>



</asp:Content>

