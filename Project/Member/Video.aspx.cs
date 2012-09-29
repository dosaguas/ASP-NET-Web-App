using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_Video : System.Web.UI.Page
{
    public string bid = "1";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            videoplayer.Attributes.Add("src", "../VideoService.aspx?id=8");

        if (Request.QueryString["id"] != null)
        {
            videoplayer.Attributes.Remove("src");
            videoplayer.Attributes.Add("src", "../VideoService.aspx?id=" + Request.QueryString["id"]);
        }
    }

    protected void changeVideo(object sender, EventArgs e)
    {
        videoplayer.Attributes.Remove("src");
        videoplayer.Attributes.Add("src", "../VideoService.aspx?id=" + ddlVideoToPlay.SelectedValue);
    }

}