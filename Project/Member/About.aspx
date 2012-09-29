<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Member_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../CSS/About.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css" />
    <style type="text/css">

#aboutWrapper {
    background: none repeat scroll 0 0 #FFFFFF;
   // height: 100%;
    margin: 0 auto;
    padding: 20px;
    text-align: left;
    width: 80%;
    }
    body {
font:normal 13px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    letter-spacing:0;
    text-shadow:0 1px 0 rgba(255,255,255,.8);
    -webkit-font-smoothing: subpixel-antialiased;

}

#frame
{

    width:90%
    margin:0px;
    padding:20px;
    }
#aboutWrapper
{ 
    border-left:1px solid #000;
    margin:0px;
    padding:20px;
   //height:80%;
   //width:100%;
  background: url("images/ui-bg_diagonals-thick_26_2293f7_40x40.png") repeat scroll 50% 50% rgb(34, 147, 247); 
    font-family: Tahoma; font-variant: normal; font-style: normal; 
}


picWrapper
{
// height:500px;
//  width:300px;
 float:left;
    }

#imgSelf
{
    height: 200px;
    width: 300px; 
      
    
    }
    
    
#descOfSelf
{
  //  height:500px;
   // width:300px;
    float:right;
    border-left:1px solid #000;
  }


</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <fieldset id="aboutWrapper">
        <legend>About Us:</legend>
        <div id="picWrapper">
            <asp:Image ID="imgSelf" runat="server" ImageUrl="~/images/About.png" />
        </div>
        <div id="descOfSelf">
            <h3>
                Name:ZAKERIA HASSAN</h3>
            <h2>
                Occupation: The Best Dame Developer There ever was!</h2>
            <h1>
                BIOGRAPHY:</h1>
            Hello and thank you for viewing my website. This page was made to let you know about
            my dreams, aspirations, and the reason why I am pursuing a web development career.
            The reason why I am pursuing computer programming is due to my passion, interests
            and personality attributes which is a natural fit within the Seneca College program.
            I have six year's experience producing websites with an emphasis with client side
            programming such as javascript. Furthermore - being employed by Apple as a Technical
            Support specialist has solidified my enjoyment with technology. I entered the Seneca
            College program knowing that there is ample knowledge to acquire and that I am committed
            and devoted to be the best that I can be.
            <br />
            Currently, I am working as a lab monitor within Seneca College facility and I am
            thrilled with working offsite developing dynamic xhtml with CSS 1.0, CSS 2.0 and
            CSS3, as well as flash action scripts, graphic design, xml and learning server side
            programming such as JAVA. During my time studying technology I have been interested
            in Web Development more than any other area of study. With these current and past
            experiences, it certainly provides a strong foundation in my Web design career.
            My drive and pursuit for the understanding and perfection of web development lies
            within and continues to grow stronger.
            <br />
        </div>
    </fieldset>
</asp:Content>

