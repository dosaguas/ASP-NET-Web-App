using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEntitiesModel;
using System.Text;
using System.Diagnostics;

public partial class Admin_Article : System.Web.UI.Page
{
    public BlogManager bmo = new BlogManager();
    public int post_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            initArticle();
        }
    }

    protected void initArticle()
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            getPostId();
            string[] str = bmo.PrintArticle(post_id);
            lblcommentList.Text = bmo.getComments(post_id);

            foreach (var item in str)
            {
                sb.Append(item);
            }
            arBody.Text = sb.ToString();


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void getPostId()
    {

        try
        {
            post_id = Convert.ToInt16(Request.QueryString["article"]);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }


}