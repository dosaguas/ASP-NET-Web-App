using System;   
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Authentication;
using BlogEntitiesModel;
using System.Web.Security;

public partial class Main : System.Web.UI.MasterPage
{
    public String SharedInfo
    {
        get { return (String)Session["SharedInfo"]; }
        set { Session["SharedInfo"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Roles.IsUserInRole("Administrator")) {

            mnNavBar.DataSourceID = SiteMapAdmin.ID;
            breadCrumb.SiteMapProvider = SiteMapAdmin.SiteMapProvider;
           
        }
        else if (Roles.IsUserInRole("Member"))
        {
            mnNavBar.DataSourceID = SiteMapMember.ID;
            breadCrumb.SiteMapProvider = SiteMapMember.SiteMapProvider;

        }
        else {

            mnNavBar.DataSourceID = SiteMapDefault.ID;
            breadCrumb.SiteMapProvider = SiteMapDefault.SiteMapProvider;
        }

    }

    

}
