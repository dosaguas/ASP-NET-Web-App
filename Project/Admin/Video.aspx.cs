using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEntitiesModel;
public partial class Admin_Video : System.Web.UI.Page
{
    public string bid = "1";
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            videoplayer.Attributes.Add("src", "../VideoService.aspx?id=8");

        if (Request.QueryString["id"] != null) {
            videoplayer.Attributes.Remove("src");
            videoplayer.Attributes.Add("src", "../VideoService.aspx?id="+Request.QueryString["id"]);
        }
        //changeVideo(sender, e);
    }


    public void getID(string title)
    {
        //  string str = string.Empty;
        //IQueryable<video> vid = BlogManager.getVideoIdByName(ddlVideoToPlay.DataValueField);
        //foreach (var i in vid)
        // {
        //    bid = i.binID.ToString();
        //}

    }


    protected void changeVideo(object sender, EventArgs e)
    {
        videoplayer.Attributes.Remove("src");
        videoplayer.Attributes.Add("src", "../VideoService.aspx?id=" + ddlVideoToPlay.SelectedValue);

        //getID(ddlVideoToPlay.DataValueField);
        //  function changeVid() {
        //     var curvid = $("#ddlVideoToPlay").val;
        //    $("videoplayer").attr(src, "/VideoService.aspx?id="+curvid);
        // }
        //   IQueryable<video> vid= BlogManager.getVideoIdByName(ddlVideoToPlay.DataValueField);

    }


    protected void uploadBinaryFile(object sender, EventArgs e)
    {
        BlogManager bmo = new BlogManager();
        try
        {
            if (bmo.UploadVideo(fuImage) == true)
            {
                lblMessage.Text = "Your Image was successfully added to the database.";
            }
            else
            {
                throw new Exception("Sorry for some reason there was an error. Please try again in a few hours.");
            }
            //lblMessage.Text = "FileName: " + fuImage.FileName + " mimetype: " + fuImage.PostedFile.ContentType + " [Content]" + fuImage.PostedFile;
        }
        catch (Exception stderr)
        {
            Response.Write(stderr.Message);
            lblMessage.Text = stderr.Message;

         }



    }
}