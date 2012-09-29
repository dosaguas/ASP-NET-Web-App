using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_Images : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /*
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.Slide[] printSlides(string contextKey)
    {
         return new AjaxControlToolkit.Slide[]
             {
                new AjaxControlToolkit.Slide("/Project/Handler.ashx?id=16", "windows", "pic1"),
                new AjaxControlToolkit.Slide("/Project/Handler.ashx?id=16", "phone", "this"),
                new AjaxControlToolkit.Slide("/Project/Handler.ashx?id=16", "windows7", "cool"),
                new AjaxControlToolkit.Slide("/Project/Handler.ashx?id=16", "web", "thia"),
                new AjaxControlToolkit.Slide("/Project/Handler.ashx?id=16", "shake", "make")
            };
    }
    */

    protected void uploadBinaryFile(object sender, EventArgs e)
    {
        BlogManager bmo = new BlogManager();
        try
        {
            if (bmo.Upload(fuImage) == true)
            {
                lblMessage.Text = "Your Image was successfully added to the database.";
            }
            else
            {
                throw new Exception(@"Sorry for some reason there was an error. Perhaps your filetype was not supported please contact the webmaster at: int422_121b07@mail.com");
            }
            //lblMessage.Text = "FileName: " + fuImage.FileName + " mimetype: " + fuImage.PostedFile.ContentType + " [Content]" + fuImage.PostedFile;
        }
        catch (Exception stderr)
        {
            lblMessage.Text = stderr.Message;

        }



    }
}