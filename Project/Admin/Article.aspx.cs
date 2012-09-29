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
    public int post_id { get; set;}
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)   
        initArticle();
           

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


    protected int getPostId()
    {

        try
        {
            post_id = Convert.ToInt16(Request.QueryString["article"]);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        return post_id;

    }


    protected void insertComment(object sender, EventArgs e)
    {
        try
        {
            if (ctxtContent.Content != string.Empty && txtcname.Text != string.Empty)
            {
                getPostId();
                bmo.AddComment(ctxtContent.Content, post_id, User.Identity.Name, DateTime.Now);
                lblcommentList.Text = bmo.getComments(post_id);
            }
            else
            {
                throw new Exception("You must display fill in textboxes");
            }

        }
        catch (Exception ex)
        {
            lblServerMessage.Font.Size = FontUnit.Larger;
            lblServerMessage.Text = ex.Message;
            lblServerMessage.BackColor = System.Drawing.Color.LightYellow;
            lblServerMessage.ForeColor = System.Drawing.Color.IndianRed;
            ctxtContent.Focus();

        }


    }



    protected void hideOrShowComments(object sender, EventArgs e)
    {
        if (pnlComments.Visible == true)
        {
            pnlComments.Visible = false;
        }
        else
        {
            pnlComments.Visible = true;
        }

    }
}