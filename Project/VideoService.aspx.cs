using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEntitiesModel;
public partial class VideoService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
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
                        Response.ContentType = BlogManager.getMimeType(bid);
                        blob = BlogManager.getBlob(bid);
                        Response.OutputStream.Write(blob, 0, blob.Length);
                        //Response.BinaryWrite(blob);
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
}