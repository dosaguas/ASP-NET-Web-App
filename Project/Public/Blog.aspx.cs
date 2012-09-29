using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEntitiesModel;
using System.Data;
using System.Text;
public partial class Admin_Blog : System.Web.UI.Page
{
    public BlogEntities b = new BlogEntities();
    public bool sortMode = false;
    public string category
    {
        get
        {
            if (Session["cat"] == null) { return string.Empty; }
            else { return (string)Session["cat"]; }
        }
        set { Session["cat"] = value; }
    }
    //public int coolcount=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            SetCategory(sender, e);

        #region OLD LISTVIEW set datasource
        //listvblgone.DataSource = EntityDataSource1;
        ////listvblgone.DataSourceID = "posts";
        //listvblgone.DataBind();

        //if (!IsPostBack) {

        //  cat.SelectedIndex = 0;

        //}
        #endregion
        if (category != string.Empty)
        {
            PrintBlog();
            //  SetCategory(sender, e);
        }



    }


    public void PrintBlog()
    {

        try
        {
            BlogManager bmo = new BlogManager();
            StringBuilder sb = new StringBuilder();
            // string cat = category;

            string[] bgEntry = bmo.PrintBlogEntry(category, true);
            foreach (var x in bgEntry)
            {
                sb.Append(x);
            }
            lblError.Text = sb.ToString();

        }
        catch (Exception ex)
        {
            handleError(ex.Message, ex);
        }


    }

    protected void SetCategory(object sender, EventArgs e)
    {
        try
        {
            if (cat.SelectedIndex > 0)
            {
                category = cat.SelectedValue;
            }
            else
            {
                category = "WEPHONE";
            }
            PrintBlog();
        }
        catch (Exception ex)
        {
            handleError(ex.Message, ex);

        }
        //Response.Redirect(@"./Blog.aspx?cat="+cat.SelectedValue);
    }


    public void getBlogEntry()
    {

        var x = new BlogEntities();
        x.posts.Select(z => z.cat_id == "WEPHONE");

    }

    #region for tiny mce
    // protected void storeUserInput(object sender, EventArgs e) { 
    // TinyEditor= txtContent.Text;
    // txtContent.Text = "";
    // }
    #endregion

    protected void toggleButton_Click(object sender, EventArgs e)
    {
        if (toggleInsertMode.Visible.Equals(false))
        {
            toggleInsertMode.Visible = true;
        }
        else
        {
            toggleInsertMode.Visible = false;
        }
    }
    
    public string getCat()
    {
        //string cat = (category != string.Empty) ? category : "WEPHONE";
        return category;

    }

    protected void SearchSort(object sender, EventArgs e)
    {
        try
        {

            BlogManager bmo = new BlogManager();
            if (ddlSort.SelectedIndex > 0)
            {
                StringBuilder sb = new StringBuilder();
                string[] content = bmo.printBlogAndSort(searchBar.Text, getCat(), ddlSort.SelectedValue, true);
                foreach (var x in content)
                {
                    sb.Append(x);
                }
                lblError.Text = sb.ToString();

                //      result = BlogManager.SearchBlogEntries(ddlSort.SelectedValue, searchBar.Text);
            }
        }
        catch (Exception ex)
        {
            handleError(ex.Message, ex);
        }

    }


    protected void handleError(string msg, Exception ex)
    {
        lblServerMessage.Text = ex.Message;
        lblServerMessage.Text = msg;
        lblServerMessage.BackColor = System.Drawing.Color.LightYellow;
        lblServerMessage.ForeColor = System.Drawing.Color.IndianRed;
        PrintBlog();
    }

}