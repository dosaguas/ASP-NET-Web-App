using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Public_CreateNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        // This fires after the user was successfully created

        // Add the new user to the "Member" role

        Roles.AddUserToRole(CreateUserWizard1.UserName, "Member");



        // Redirect to welcome page

        Response.Redirect("~/Member/Default.aspx");


    }
}