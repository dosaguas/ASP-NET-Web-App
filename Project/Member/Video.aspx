<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="Member_Video" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="ASPNetFlashVideo.NET3" Namespace="ASPNetFlashVideo" TagPrefix="ASPNetFlashVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Video.css" rel="stylesheet" type="text/css" />
    <script src="../media/swfobject/swfobject.js" type="text/javascript"></script>
    <link href="../Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.18.custom/js/jquery-ui-1.8.18.custom.min.js"
        type="text/javascript"></script>
   
    <!--This is for the comments to hide and show comments-->
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.5.1.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <asp:ScriptManager ID="smAjax" EnableCdn="true" runat="server">
            </asp:ScriptManager>
            <asp:RoundedCornersExtender ID="RoundedCornersExtender3" TargetControlID="VideoFrame"
        Corners="All" Radius="20" runat="server">
    </asp:RoundedCornersExtender>
    <fieldset id="VideoWrapper">
        <legend>Video Gallery</legend>
        
            <asp:Panel ID="VideoFrame" ClientIDMode="Static" runat="server" Width="1100px" Height="700px" BackColor="#009">
           
            <!-- 
          <script src="../media/wmvplayer/silverlight.js" type="text/javascript"></script>

         <script type='text/javascript' src="../media/wmvplayer/wmvplayer.js"></script>
	<script type="text/javascript">
	    var cnt = document.getElementById("mediaspace");
	    var src = '../media/wmvplayer/wmvplayer.xaml';
	    var cfg = {
	        file: '../media/W7PhOS.mp4',
	        image: '../media/wmvplayer/preview.jpg',
	        height: '400',
	        width: '800'

	    };
	    var ply = new jeroenwijering.Player(cnt, src, cfg);
	</script>
  -->
            <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -FLASH- -->
            
            <div id="mediaspace">
           
           <video width="800" clientidmode="Static"  height="400" id="videoplayer" runat="server" src="../VideoService.aspx?id=8" type="video/mp4"  controls="controls">
             Your browser does not support the video tag.
             <embed id="ifHtml5PlayerNotSupported" type="video/mp4" clientidmode="Static"  src="../VideoService.aspx?id=8" runat="server"  width="800px" height="400px" />
            </video>
           </div>
            <br />
            Select video to play:
            <asp:DropDownList ID="ddlVideoToPlay" ClientIDMode="Static" CssClass="ui-accordion-header"
                runat="server" DataSourceID="VideoDataSource" AutoPostBack="true"  DataTextField="Title" OnSelectedIndexChanged="changeVideo"
                DataValueField="binID">
            </asp:DropDownList>
            <asp:EntityDataSource ID="VideoDataSource" runat="server" ConnectionString="name=BlogEntities"
                DefaultContainerName="BlogEntities" EnableFlattening="False" EntitySetName="videos"
                EntityTypeFilter="video" Select="it.[Title], it.[binID]">
            </asp:EntityDataSource>
        <asp:Panel ID="videoPlaylist" runat="server">
                <div class="scroll-pane ui-widget ui-widget-header ui-corner-all">
                    <div class="scroll-content">
                        <div class="scroll-content-item ui-widget-header">
                    <a href="Video.aspx?id=1">
                        <asp:Image ID="Image7" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/Tour of Windows Phone.png" />
                    </a>
                        </div>
                        <div class="scroll-content-item ui-widget-header">
                <a href="Video.aspx?id=2">
                    <asp:Image ID="Image2" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/Drive and Maps.png" />
                </a>
                        </div>
                    <div class="scroll-content-item ui-widget-header">
                   <a href="Video.aspx?id=3">
                    <asp:Image ID="Image3" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/Features of Windows Phone.png" />
                </a>
                        </div>
                    <div class="scroll-content-item ui-widget-header">
                    <a href="Video.aspx?id=4">
                    <asp:Image ID="Image4" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/Marketplace.png" />
                </a>
                        
                        </div>
                    <div class="scroll-content-item ui-widget-header">
                 <a href="Video.aspx?id=5">
                    <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/Ad We Love WP7.png" />
                </a>
              
                    </div>
                    <div class="scroll-content-item ui-widget-header">
              
                   <a href="Video.aspx?id=5">
                    <asp:Image ID="Image5" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/New Windows Phone.png" />
               </a>
                    
                    </div>
                    
                    <div class="scroll-content-item ui-widget-header">
                       
                    <a href="Video.aspx?id=6">
                    <asp:Image ID="Image6" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/Newest Windows Phone.png" />
                </a>
                       
                       </div>
                       <div class="scroll-content-item ui-widget-header">
                    <a href="Video.aspx?id=8">
                        <asp:Image ID="Image8" runat="server" Height="120px" Width="120px" ImageUrl="~/images/thumb/WPhone 7 First ad.png" />
                    </a>
                       
                       </div>
                      
        
        </div></div>
       
    </asp:Panel>
        </asp:Panel>
        <h3 id="videoCaption">
        </h3>
        <hr />
        <br />


       <!-- begining of sample panel -->

         
    </fieldset>

    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <!-- UPLOAD AREA::::-->
    <br />
   
</asp:Content>

