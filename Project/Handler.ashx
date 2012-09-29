<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BlogEntitiesModel;
using System.Linq.Expressions;
using System.Linq;
using System.IO;

[Serializable]
public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        BlogEntities be = new BlogEntities();
        string ContentType = string.Empty;
        Byte[] blob = new Byte[] { };
        if (context.Request.QueryString["title"] != string.Empty || context.Request.QueryString["id"] != string.Empty)
        {
            try
            {

                if (context.Request.QueryString["title"] != null) {

                    string title = context.Request.QueryString["title"];
                    if (title != string.Empty) {

                        IQueryable<binary> qrytitle = from vid in be.binaries
                                                      where vid.Title == title
                                                      select vid;
                        foreach (var t in qrytitle)
                        {
                            ContentType = t.MimeType;
                            blob = t.Content;
                        }
                        context.Response.ContentType = ContentType;
                        context.Response.OutputStream.Write(blob, 0, blob.Length);
                        context.Response.End();
                     
                    }


                }
                else
                {



                    if (context.Request.QueryString["id"] != null)
                    {
                        int bid = Convert.ToInt16(context.Request.QueryString["id"]);
                        if (bid > 0)
                        {
                            IQueryable<binary> qry = from vid in be.binaries
                                                     where vid.binID == bid
                                                     select vid;
                            foreach (var m in qry)
                            {
                                ContentType = m.MimeType;
                                blob = m.Content;
                            }
                          //  context.Response.Cache.SetExpires(DateTime.Now.AddDays(3));
                         //   context.Response.AddHeader("content-disposition", "attachment; filename=Video.mp4");
                            context.Response.ContentType = ContentType;
                            context.Response.BinaryWrite(blob);
                           // context.Response.OutputStream.Write(blob, 0, blob.Length);
                            //context.Response.Flush();
                            //context.Response.Close(); 
                        
                            context.Response.End();
                        }
                    }    
                }
                
            }
            catch (Exception ex)
            {
                context.Response.Write("WE HAVE THE FOLLOWING ERROR: "+ ex.Message);
                
            }
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}


/*
 using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public class VideoHandler : IHttpHandler 
{
    
    public void ProcessRequest (HttpContext context) 
    {
        string connectionString = 
          ConfigurationManager.ConnectionStrings[
          "uploadConnectionString"].ConnectionString;

        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("SELECT Video, Video_Name" + 
                         " FROM Videos WHERE ID = @id", connection);
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = 
                           context.Request.QueryString["id"];
        try
        {
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.Default);
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    context.Response.ContentType = reader["Video_Name"].ToString();
                    context.Response.BinaryWrite((byte[])reader["Video"]);
                }
            }
        }
        finally
        {
            connection.Close();
        }
    }
 
    public bool IsReusable 
    {
        get {
            return false;
        }
    }
}
 
 
 */