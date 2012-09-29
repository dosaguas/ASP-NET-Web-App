    <%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="Admin_About" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/About.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/jquery-ui-1.8.18.custom/css/excite-bike/jquery-ui-1.8.18.custom.css" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:AnimationExtender ID="AnimationExtender1" runat="server" TargetControlID="aboutWrapper">
    <Animations>
    <OnMouseOut>
      <FadeOut Duration=".5" Fps="40" />
    </OnMouseOut>
     <OnMouseOver>
      <FadeIn Duration=".5" Fps="20" />
    </OnMouseOver>

    </Animations>
    </asp:AnimationExtender>

    <asp:Panel ID="aboutWrapper" ClientIDMode="Static" runat="server" BackColor="#2E6E9E">
        <h1>About Us:</h1>
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
</asp:Panel>
</asp:Content>
