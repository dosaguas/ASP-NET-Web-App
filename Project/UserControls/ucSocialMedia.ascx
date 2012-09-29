<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSocialMedia.ascx.cs"
    Inherits="UserControls_ucSocialMedia" %>
<div class="demo">
    <div id="resizable" class="ui-widget-content">
        <div id="ssmedia">
            <div id="fb-root">
            </div>
            <div class="fb-like" data-href="http://wedevelop.org" data-send="true" data-layout="button_count"
                data-width="450" data-show-faces="true" data-colorscheme="dark" data-font="segoe ui">
            </div>
            <script type="text/javascript">
                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                    fjs.parentNode.insertBefore(js, fjs);
                } (document, 'script', 'facebook-jssdk'));
    
    
            </script>
            <!-- TWITTER -->
            <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.wedevelop.org"
                data-text="Windows Software Development" data-via="prospect1010" data-size="large"
                data-related="prospect1010" data-hashtags="OpenSourceDevelopment">Tweet</a>
            <script type="text/javascript" language="javascript">                !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
        </div>
    </div>
</div>

