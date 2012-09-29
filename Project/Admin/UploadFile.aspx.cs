using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEntitiesModel;
public partial class UploadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddBinary(object sender, EventArgs e)
    {
        //get access to database...
        BlogManager bmo = new BlogManager();
        try
        {
            if (bmo.Upload(fuUpload)) {
                pnlRespond.Visible = true;
                lblResult.Text = "We where successful with the upload of the file.";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }
}