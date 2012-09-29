using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*try
        {
            MembershipCreateStatus status;

            // obviously, you will replace generic data with your own...
            Membership.DeleteUser("ian");
            Membership.DeleteUser("zmhassan");


            Membership.CreateUser("ian", "iambored#123", "ian@mail.com", "favorite color", "pink", true, out status);

            Membership.CreateUser("zmhassan", "iambored#123", "zmhassan@mail.com", "favorite color", "pink", true, out status);

            Roles.AddUserToRole("ian", "Administrator");

            Roles.AddUserToRole("zmhassan", "Administrator");

            Response.Write("Done");

        }
        catch (Exception ex)
        {
            Response.Write("The error: " + ex.Message);
        }
        */
    }
}