<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucComments.ascx.cs" Inherits="UserControls_ucComments" %>
<div id="fb-root"></div>


<script type="text/javascript" language="javascript">    

(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));

</script>

<div id="comSection">
    <div class="fb-comments" data-href="http://wedevelop.com" data-num-posts="4" data-width="470" data-colorscheme="dark"></div>
</div>