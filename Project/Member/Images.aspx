<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Images.aspx.cs" Inherits="Member_Images" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <link href="../CSS/imgGallery.css" rel="stylesheet" type="text/css" />
    <!--Slider -->
    <link rel="stylesheet" type="text/css" href="../Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css" />
    <script type="text/javascript" src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-ui-1.8.18.custom.min.js"
        type="text/javascript"></script>
    <!--Slider -->
    <script type="text/javascript" src="../Scripts/imagesSlideShow.js"></script>v
    <script type="text/javascript" src="../Scripts/slides.min.jquery.js"></script>

    <style type="text/css">
        #uploadItem
        {
            padding: 20px;
            margin: 50px;
        }
    </style>
    <script type="text/javascript">



        $(function () {
            var imgsarray = new Array('/Project/Handler.ashx?id=16',
                                      '/Project/Handler.ashx?id=17',
                                      '/Project/Handler.ashx?id=18',
                                      '/Project/Handler.ashx?id=19',
                                      '/Project/Handler.ashx?id=20',
                                      '/Project/Handler.ashx?id=21',
                                      '/Project/Handler.ashx?id=22',
                                      '/Project/Handler.ashx?id=23',
                                      '/Project/Handler.ashx?id=24',
                                      '/Project/Handler.ashx?id=25',
                                      '/Project/Handler.ashx?id=26',
                                      '/Project/Handler.ashx?id=27');

            var counter = imgsarray.length;
            var $SlideShow = $('#imgSlideShow');

            $SlideShow.attr('src', imgsarray[counter - 1]);
            setInterval(Slider, 5000);
            function Slider() {
                $SlideShow.effect("slide", "{}", 500, function () {
                    $(this).attr('src', imgsarray[(imgsarray.length++) % counter])
                 .effect("drop", "{}", 500, function () { $(this).removeAttr("style").hide().fadeIn(); });
                });
            }
        });

    
    


    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <fieldset id="VideoWrapper">
        <legend>Image Gallery</legend>
        <div id="VideoFrame">
            <asp:UpdatePanel ID="UPSlideShow" ClientIDMode="Static" ChildrenAsTriggers="true" runat="server">
                <ContentTemplate>
                    <asp:Image ID="imgSlideShow" ClientIDMode="Static" runat="server" CssClass="imgSlideShow"/>
                </ContentTemplate>
            </asp:UpdatePanel>
            <h3 id="videoCaption">
            </h3>
            <hr />
            <br />
           
                <h3>Photos:</h3>
                <asp:Panel ID="videoPlaylist" runat="server">
                <div class="scroll-pane ui-widget ui-widget-header ui-corner-all">
                    <div class="scroll-content">
                        <div class="scroll-content-item ui-widget-header">
                            <a href="/Project/Handler.ashx?id=15">
                                <asp:Image ID="Image3" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=16" /></a></div>
                        <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=16">
                            <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=16" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=17">
                            <asp:Image ID="Image2" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=17" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=18">
                            <asp:Image ID="Image8" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=18" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=19">
                            <asp:Image ID="Image9" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=19" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=20">
                            <asp:Image ID="Image10" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=20" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=21">
                            <asp:Image ID="Image11" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=21" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=22">
                            <asp:Image ID="Image12" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=22" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=23">
                            <asp:Image ID="Image13" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=23" /></a></div>
                    <div class="scroll-content-item ui-widget-header">
                        <a href="/Project/Handler.ashx?id=24">
                            <asp:Image ID="Image14" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=24" /></a></div>
                 <div class="scroll-content-item ui-widget-header">
                    <a href="/Project/Handler.ashx?id=25">
                        <asp:Image ID="Image4" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=25" /></a></div>
               <div class="scroll-content-item ui-widget-header">
                <a href="/Project/Handler.ashx?id=26">
                    <asp:Image ID="Image5" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=26" /></a></div>
                <div class="scroll-content-item ui-widget-header">
                <a href="/Project/Handler.ashx?id=27">
                    <asp:Image ID="Image7" runat="server" Height="120px" Width="120px" ImageUrl="/Project/returnImageThumb.aspx?id=27" /></a></div>
        
        </div></div>
        <div class="scroll-bar-wrap ui-widget-content ui-corner-bottom">
            <div class="scroll-bar">
            </div>
        </div>
     
    </asp:Panel>
       </div>         
    </fieldset>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <!-- UPLOAD AREA::::-->
    <br />
    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="uploadItem"
        Corners="All" Radius="20" runat="server">
    </asp:RoundedCornersExtender>
    <asp:Panel ClientIDMode="Static" ID="uploadItem" Width="75%" Height="300px" runat="server"
        BackColor="#FFFFFF">
       
        <h5>Allowed File Types:
    images, psd, pdf, bmp, gif, jpg, png, txt, mov, mpg and mpeg 
    </h5>
        <h4>
            File To Upload:
        </h4>
        <asp:FileUpload ID="fuImage" runat="server" />
        <br />
        <asp:Button ID="updFileUpload" OnClick="uploadBinaryFile" runat="server" Text="Save" />
    </asp:Panel>

<script type="text/javascript" language="javascript">

	    //<![CDATA[


    //Play list

    $(function () {
        //scrollpane parts
        var scrollPane = $(".scroll-pane"),
			scrollContent = $(".scroll-content");

        //build slider
        var scrollbar = $(".scroll-bar").slider({
            slide: function (event, ui) {
                if (scrollContent.width() > scrollPane.width()) {
                    scrollContent.css("margin-left", Math.round(
						ui.value / 100 * (scrollPane.width() - scrollContent.width())
					) + "px");
                } else {
                    scrollContent.css("margin-left", 0);
                }
            }
        });

        //append icon to handle
        var handleHelper = scrollbar.find(".ui-slider-handle")
		.mousedown(function () {
		    scrollbar.width(handleHelper.width());
		})
		.mouseup(function () {
		    scrollbar.width("100%");
		})
		.append("<span class='ui-icon ui-icon-grip-dotted-vertical'></span>")
		.wrap("<div class='ui-handle-helper-parent'></div>").parent();

        //change overflow to hidden now that slider handles the scrolling
        scrollPane.css("overflow", "hidden");

        //size scrollbar and handle proportionally to scroll distance
        function sizeScrollbar() {
            var remainder = scrollContent.width() - scrollPane.width();
            var proportion = remainder / scrollContent.width();
            var handleSize = scrollPane.width() - (proportion * scrollPane.width());
            scrollbar.find(".ui-slider-handle").css({
                width: handleSize,
                "margin-left": -handleSize / 2
            });
            handleHelper.width("").width(scrollbar.width() - handleSize);
        }

        //reset slider value based on scroll content position
        function resetValue() {
            var remainder = scrollPane.width() - scrollContent.width();
            var leftVal = scrollContent.css("margin-left") === "auto" ? 0 :
				parseInt(scrollContent.css("margin-left"));
            var percentage = Math.round(leftVal / remainder * 100);
            scrollbar.slider("value", percentage);
        }

        //if the slider is 100% and window gets larger, reveal content
        function reflowContent() {
            var showing = scrollContent.width() + parseInt(scrollContent.css("margin-left"), 10);
            var gap = scrollPane.width() - showing;
            if (gap > 0) {
                scrollContent.css("margin-left", parseInt(scrollContent.css("margin-left"), 10) + gap);
            }
        }

        //change handle position on window resize
        $(window).resize(function () {
            resetValue();
            sizeScrollbar();
            reflowContent();
        });
        //init scrollbar size
        setTimeout(sizeScrollbar, 10); //safari wants a timeout
    });
	

 //]]>

</script>

</asp:Content>
