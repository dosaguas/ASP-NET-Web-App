using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEntitiesModel;

public partial class returnImageThumb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        byte[] blob = new byte[] { };
        string ContentType = string.Empty;
        BlogEntities be = new BlogEntities();
        try
        {
            if (Request.QueryString["id"] != null)
            {
                int bid = Convert.ToInt16(Request.QueryString["id"]);

                if (bid > 0)
                {
                    blob = BlogManager.getBlobImageThumb(bid);
                    Response.ContentType = BlogManager.getMimeType(bid);
                    Response.BinaryWrite(blob);
                    //Response.OutputStream.Write(blob, 0, blob.Length);
                    Response.End();
                }
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }
}