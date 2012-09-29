using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BlogEntitiesModel;
public partial class UserControls_PlayVideoFromBlob : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private DataTable retVideo(object id) {
        DataTable dt = new DataTable();
        BlogEntities be= new BlogEntities();

        var qry = (from q in be.binaries
                                  where q.binID == (int)id
                                  select q).ToList();
        foreach (var item in qry)
        {
         //TO BE CONTINUED...   
            
        }
        return dt;
    } 

}

/*
 private DataTable GetSpecificVideo(object i)
//pass the id of the video
{
    string connectionString = 
      ConfigurationManager.ConnectionStrings[
      "uploadConnectionString"].ConnectionString;
    SqlDataAdapter adapter = new SqlDataAdapter("SELECT Video, ID " + 
                             "FROM Videos WHERE ID = @id", connectionString);
    adapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = (int)i;
    DataTable table = new DataTable();
    adapter.Fill(table);
    return table;
}
protected void ButtonShowVideo_Click(object sender, EventArgs e)
{
    Repeater1.DataSource = GetSpecificVideo(2);
    //the video id (2 is example)

    Repeater1.DataBind();
}
 */