using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Collections;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Data.Sql;
using System.Web.Security;
using BlogEntitiesModel;
using System.Drawing;
using System.IO;


/****************************************************************************************
				.-"^`\                                                 /`^"-.
			.'   ___\                                                 /___   `.
		 /    /.---.                                               .---.\    \
		|    //     '-.  ______________________________________ .-'     \\    |
		|   ;|         \/-------------------------------------//         |;   |
		\   ||       |\_)DEVELOPED BY: ZAKERIA HASSAN         (_/|       ||   /
		 \  | \  . \ ;  | PROFESSOR: IAN TIPSON               || ; / .  / |  /
			'\_\ \\ \ \ \ |COURSE: INT422 SECTION: B            ||/ / / // /_/'
						\\ \ \ \|EMAIL: zmhassan@learn.senecac.on.ca  |/ / / //
					 `'-\_\_\ STUDENT-ID: 063-437-073               /_/_/-'`
							'-------< FINAL PROJECT >--------------'
 
****************************************************************************************/





/// <summary>
/// Summary description for BlogManager
/// </summary>
public class BlogManager
{
    //..Properties
    //public static BlogEntry beBIG = new BlogEntry();
    protected string connection;
    public string errormessage;
    public string user;
    public string uRole;



    /*************************************************************
     *  @type: method/CONSTRUCTOR:
     *  @usage: initializes the properties
     *  @return: nothing
     **************************************************************/
    public BlogManager()
    {
        errormessage = string.Empty;
        user = string.Empty;
        uRole = string.Empty;
        connection = string.Empty;

    }




    #region CMD insert query

    /* public static void InsertPost(post pt)
    {



        string query = "INSERT INTO [int422_121b07].[dbo].[posts](author, title,content,created,comments,cat_id)" +
                "VALUES('" + pt.author + "','" + pt.title + "','" + pt.content + "'," + pt.created.ToString() +
                ",0 ,'" + pt.cat_id + "')";
        //var con = BlogManager.getConString();
        //var cstr = con.ConnectionString;
        SqlConnection sconn = new SqlConnection(BlogManager.getConString());
        //StringBuilder sb = new StringBuilder();
        try
        {

            // 1. Instantiate a new command with a query and connection
            //           SqlCommand cmd = new SqlCommand("select CategoryName from Categories", conn);

            // 2. Call Execute reader to get query results
            //        SqlDataReader rdr = cmd.ExecuteReader();

            sconn.Open();
            SqlCommand cmd = new SqlCommand(query, sconn);
            //SqlDataReader reader = cmd.ExecuteReader();
            cmd.ExecuteNonQuery();

        }
        catch (Exception)
        {

        }
        finally
        {

            sconn.Close();
        }


    }
     */
    #endregion


    /*************************************************************
     *  @type: Print an array of articles by searching linq query for post id
     *  @usage: just pass in a post_id
     *  @return: it will return a string which contains the div that will be displayed on the blog.
     *  
     **************************************************************/




    public string[] PrintArticle(int post_id)
    {


        string[] strb = new string[] { };
        StringBuilder sb = new StringBuilder();

        try
        {
            using (BlogEntities be = new BlogEntities())
            {
                IQueryable<post> qry = from z in be.posts
                                       where z.post_id == post_id
                                       select z;
                blogDiv(qry, ref strb, false);

            }
        }
        catch
        {
            throw new UnableToAccessBlogEntry();
        }

        return strb;

    }

    /*************************************************************
     *  @type: method 
     *  @usage: initializes the properties
     *  @return: it will return a string which contains the div that will be displayed on the blog.
     *  
     **************************************************************/


    public string[] PrintBlogEntry(string categoryId, bool partial = false)
    {
        int i = 0;
        string blogtitle = string.Empty;
        string blogcontent = string.Empty;
        string[] sb = new string[] { };

        try
        {
            using (BlogEntities be = new BlogEntities())
            {


                var bcontent = from z in be.posts
                               where z.cat_id.Equals(categoryId)
                               select z;

                blogDiv(bcontent, ref sb, partial);

            }
        }
        catch
        {
            throw new UnableToAccessBlogEntry();
        }


        return sb;



    }



    /*************************************************************
     *  @type: gets reference to buffer and takes a IQueryable post generic list and returns either a partial blog or a full blog  
     *  @usage: if you are using the initial blog you should only pass in false for partial but if you would like to see the whole article then just pass in the true for
     *          partial
     *  @return: it will sets a string by reference which contains the div that will be displayed on the blog but returns nothing.
     *  
     **************************************************************/

    public void blogDiv(IQueryable<post> bcontent, ref string[] buff, bool partial)
    {
        buff = new string[bcontent.Count()];
        int i = 0;
        try
        {
            foreach (var p in bcontent)
            {
                if (!partial)
                {
                    buff[i] = "<div class='blogentry'><div class='socMedia'></div>" + "<div class='blogMedia'><h3>" + p.title + "</h3><p>" +
                        p.content + "</p>" + "</div><h5>Edited By:" + p.author + "</h3>Date Added:" +
                        p.created.ToString() + "</div><br /><br />";
                    i++;
                }
                else
                {
                    int len = (p.content.Length < 100) ? p.content.Length : 100;
                    buff[i] = "<div class='blogentry'><div class='socMedia'></div>" + "<div class='blogMedia'><h3>" + p.title + "</h3><p>" +
                      p.content.Substring(0, len) + "</p>" + "<a class='ui-widget-shadow' id='readMore2' href='" + @"./Article.aspx?article=" +
                      p.post_id.ToString() + "'>... Read More</a></div><h5>Edited By:" + p.author + "</h3>Date Added:" +
                      p.created.ToString() + "</div><br /><br />";
                    i++;

                }
            }
        }
        catch
        {
            throw new UnableToAccessBlogEntry();
        }


    }



    /*************************************************************
     *  @type: this is used for my search algorithm to find a specific string and if one is not provided it will sort the output. 
     *  @usage: takes in a search string, category, type of sort required and if you would like to get part of a blog or the whole thing.
     *  @return: it will return a string which contains the div that will be displayed on the blog.
     *  
     **************************************************************/

    public string[] printBlogAndSort(string search, string category, string sortType, bool partial = false)
    {
        string[] sb = new string[] { };
        IQueryable<post> qry;

        try
        {
            using (BlogEntities be = new BlogEntities())
            {

                if (sortType == "Date")
                {
                    if (search == string.Empty)
                    {
                        qry = from p in be.posts
                              orderby p.created
                              where p.cat_id.Contains(category)
                              select p;
                    }
                    else
                    {
                        DateTime date = DateTime.Parse(search);
                        qry = from p in be.posts
                              orderby p.created
                              where p.cat_id.Contains(category) && p.created.Day == date.Day && p.created.Month == date.Month
                              select p;
                    }
                }
                else
                {
                    if (search == string.Empty)
                    {

                        qry = from p in be.posts
                              orderby p.title
                              where p.cat_id.Contains(category)
                              select p;
                    }
                    else
                    {
                        qry = from p in be.posts
                              orderby p.title
                              where p.cat_id.Contains(category) && p.title.ToLower() == search.ToLower()
                              select p;

                    }

                }
                blogDiv(qry, ref sb, partial);

            }
        }
        catch
        {
            throw new UnableToSearchData();
        }

        return sb;

    }


    #region GETTitle method is not need

    /*
    public IQueryable<string> getTitle(string categoryId, string gtitle, string searchfor)
    {
        IQueryable<string> btitle = null;
        using (BlogEntities be = new BlogEntities())
        {
            if (categoryId != string.Empty && gtitle == string.Empty)
            {
                btitle = from z in be.posts
                         where z.cat_id.Contains(categoryId)
                         select z.title;
            }
            else
            {
                if (gtitle == "Title")
                {
                    btitle = from z in be.posts
                             orderby z.title
                             where z.cat_id.Contains(categoryId)
                             select z.title;
                }
                else if (gtitle == "Date")
                {
                    //var dateAsString = "2008/01/01";

                    var date = DateTime.Parse(searchfor);

                    //var query = context.Orders.Where(o => o.OrderDate == date);
                    btitle = from z in be.posts
                             orderby z.created
                             where z.cat_id.Contains(categoryId) && z.created == date
                             select z.title;


                }
            }

        }
        return btitle;

    }

    */
    #endregion


    /*************************************************************
     *  @type: adds a blog entry to database using entities 
     *  @usage: we will must provide he arguments to insert into the database
     *  @return: returns nothing
     *  
     **************************************************************/


    public bool AddBlogEntry(string title, string user, string content, string cat = "WEPHONE")
    {

        bool added = false;
        try
        {

            if (!string.IsNullOrEmpty(cat) && !string.IsNullOrEmpty(content))
            {

             
                using (BlogEntities be = new BlogEntities())
                {                               //This is auto increment using linq
                    post pt = post.Createpost(be.posts.Max(i => i.post_id) + 1, user, title, content, DateTime.Now);
                    pt.comments = false;
                    pt.cat_id = cat;
                    if (pt != null) added = true;

                    //var be = new BlogEntry();
                    be.AddToposts(pt);
                    be.SaveChanges();

                }
            }
        }
        catch
        {

            throw new UnableToAddObject();
        }

        return added;
    }

    /*************************************************************
    *  @type: adds a comment entry to database using entities 
    *  @usage: we will must provide he arguments to insert into the database
    *  @return: returns nothing
    *  
    **************************************************************/

    public void AddComment(string content, int post_id, string user, DateTime date)
    {
        try
        {
            if (!string.IsNullOrEmpty(content) && !string.IsNullOrEmpty(user) && !post_id.Equals(0))
            {
                StringBuilder cstr = new StringBuilder();
                BlogEntities ice = new BlogEntities();
                var nl = Environment.NewLine;

                //var qry = ice.Comments.Select(x => x.comment_id).ToList().Max();
                //int num = int.Parse(qry.Substring(1, 1)) + 1;
                string pk = "a" + ice.Comments.Count()+1;
                ice.AddToComments(Comment.CreateComment(pk, content, post_id, user, date));

                ice.SaveChanges();
            }

        }
        catch
        {

            throw new UnableToAddObject();
        }


        #region DIRTY CODE LINQ
        /* 
                     * 
                     * 
            var qry = from x in source.Foo
                     where x.SomeProp == "abc"
                        select x.Bar;

            var qry = source.Foo.Where(x => x.SomeProp == "abc").Select(x => x.Bar);

                     * 
                     * 
                     * 
                     * 
                     * 
                IQueryable<string> comID= from cid in ice.Comments
                                          where
               
                     * 
                     * StringBuilder ccomment = new StringBuilder();

                        BlogEntitiesModel.BlogEntities bec = new BlogEntitiesModel.BlogEntities();
                        
                        IQueryable<string> bcomments = from p in bec.posts
                                                       join c in bec.Comments
                                                       on p.post_id equals c.post_id 
                                                        select c.comment1;
                      
                      IQueryable<string> bcauth = from p in bec.posts
                                                       join c in bec.Comments
                                                       on p.post_id equals c.post_id
                                                       select p.author;
                      
                                                          
                      foreach (var prtComm in bcomments) {
                            ccomment.Append(prtComm+nl);
                        }

                      foreach (var prtcauth in bcauth)
                      {
                          ccomment.Append(prtcauth+nl);
                      }
                      
                 */
        #endregion



    }
    /*************************************************************
   *  @type: gets a commment entry to database using entities 
   *  @usage: we will must provide the post id to get the database comments related to that comment
   *  @return: returns the comments for the article.
   *  
   **************************************************************/


    public string getComments(int post_id)
    {

        //string[] sb = new string[] { };
        string str = string.Empty;
        try
        {
            using (BlogEntities be = new BlogEntities())
            {
                var bcomments = from p in be.posts
                                join c in be.Comments
                                on p.post_id equals c.post_id
                                where c.post_id == post_id
                                select c;

                foreach (var x in bcomments)
                {
                    str += "<div class='blogentry'><div class='socMedia'></div><div class='blogMedia'><p>" + x.comment1 +
                        "</p><h5>Edited By:" + x.author + "</h3>Date Added:" + x.date.ToString() + "</div><br /><br />";
                }

            }
        }
        catch
        {
            throw new UnableToAccessBlogEntry();
        }
        return str;
    }



    #region USELESS CODE


    /*
     System.Configuration.Configuration rootWebConfig =
                System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            System.Configuration.ConnectionStringSettings connString;
            if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            {
                connString =rootWebConfig.ConnectionStrings.ConnectionStrings["NorthwindConnectionString"];
                if (connString != null)
                    Console.WriteLine("Northwind connection string = \"{0}\"",
                        connString.ConnectionString);
                else
                    Console.WriteLine("No Northwind connection string");
            }


     */


    /*
      
    public static List<string> getBlogEntry()
    {
        List<string> str;

        var blog = new BlogEntities();
       
        try
        {

         str = (from p in blog.posts
                  select p.content).ToList();


                 string currentLabel = from s2f in stream2FieldTypesTable
                      where s2f.s2fID == item.s2fID
                      select s2f.s2fLabel.ToString();

                 
              

        }
        //catch (Exception)
        //{
        //    if (blog.Connection.State == System.Data.ConnectionState.Open)
        //    {
        //        blog.Dispose();
        //    }
        //}
        ////        try
        //        {
        //            var theAlbum = context.Albums.Where(i => i.album_id == ID).First();
        //        }
        //        catch (Exception)
        //        {

        //            if (context.Connection.state == System.Data.ConnectionState.Open)
        //            {
        //                context.Dispose();
        //            }

        //            throw new IdentityMustBeUnique();
        //        }
        //        finally 
        //        {
        //            if (context.Connection.state == System.Data.ConnectionState.Open) 
        //            {
        //                context.Dispose();

        //            }


        //        }

   //     return str;
    
    
   //}
    */

    #endregion


    /*************************************************************
     *  @type: file upload 
     *  @usage: this will be used on the next stage of my project 
     *  @return: returns true if everything is successful
     *  
     **************************************************************/

    public bool Upload(FileUpload fu)
    {
        bool rtn = false;
        try
        {
            if (fu.PostedFile != null && fu.PostedFile.FileName != string.Empty)
            {

                using (BlogEntities be = new BlogEntities())
                {
                    byte[] blob = new byte[fu.PostedFile.ContentLength];
                    Stream fill = fu.FileContent;
                    fill.Read(blob, 0, fu.PostedFile.ContentLength);
                    be.AddTobinaries(binary.Createbinary(DateTime.Now, fu.FileName, blob, fu.PostedFile.ContentType, be.binaries.Max(i => i.binID) + 1));
                    be.SaveChanges();
                }

                rtn = true;
            }
        }
        catch
        {

            throw new UnableToAddObject();
        }


        return rtn;
    }



    /*************************************************************
     *  @type: file upload 
     *  @usage: this will be used on the next stage of my project 
     *  @return: returns true if everything is successful
     *  
     **************************************************************/

    public bool UploadVideo(FileUpload fu)
    {
        bool rtn = false;
        try
        {
            if (fu.PostedFile != null && fu.PostedFile.FileName != string.Empty)
            {

                using (BlogEntities be = new BlogEntities())
                {
                    byte[] blob = new byte[fu.PostedFile.ContentLength];
                    Stream fill = fu.FileContent;
                    fill.Read(blob, 0, fu.PostedFile.ContentLength);
                    video vinit = video.Createvideo(be.posts.Max(i => i.post_id) + 1, fu.PostedFile.FileName, blob, be.posts.Max(i => i.post_id) + 1, DateTime.Now);
                    be.AddTovideos(vinit);
                    be.SaveChanges();

                }

                rtn = true;
            }
            else
            {
                throw new UnableToUploadFile();
            }
        }
        catch
        {

            throw new UnableToAddObject();
        }


        return rtn;
    }




    /*************************************************************
    *  @type: gets connection string 
    *  @usage: we will must provide the connection name to get the connection string
    *  @return: string 
    *  
    **************************************************************/
    public static byte[] getBlob(int bid)
    {
        byte[] blob = new byte[] { };

        List<byte[]> qry;
        try
        {
            using (BlogEntities be = new BlogEntities())
            {
                
                    qry = (from vid in be.binaries
                          where vid.binID == bid
                          select vid.Content).ToList();
                    blob = qry.First();
                    //foreach (byte[] m in qry)
                    //{
                    //    blob = m;
                    //}
                
            }
        }
        catch
        {
            throw new UnableToAccessVideo();
        }
        return blob;

    }

    public static byte[] getVideoBlob(int bid)
    {
        byte[] blob = new byte[] { };


        try
        {
            BlogEntities be = new BlogEntities();

            List<byte[]> qry = (from vid in be.videos
                                     where vid.videoID == bid
                                     select vid.Content).ToList();

            blob = qry.First();
            //foreach (var m in qry)
            //{
             //   blob = m.Content;
            //}


        }
        catch
        {
            throw new UnableToAccessVideo();
        }

        return blob;

    }


    public static byte[] getBlobImageThumb(int original)
    {
        byte[] blob = new byte[] { };

        try
        {
            blob = BlogManager.getBlob(original);
            MemoryStream msCopy = new MemoryStream(blob);

            System.Drawing.Image imCopy = new Bitmap(msCopy);

            if (imCopy.Width < 122)
            {
                return blob;
            }
            else
            {
                decimal ratio = (decimal)imCopy.Width / (decimal)imCopy.Height;
                int thumbWidth = 120;
                int thumbHeight = Convert.ToInt32(120 / ratio);

                Bitmap bm = new Bitmap(thumbWidth, thumbHeight);

                Graphics g = Graphics.FromImage(bm);

                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

                g.DrawImage(imCopy, new Rectangle(0, 0, thumbWidth, thumbHeight), 0, 0, imCopy.Width, imCopy.Height, GraphicsUnit.Pixel);

                g.Dispose();

                MemoryStream thumb = new MemoryStream();
                bm.Save(thumb, System.Drawing.Imaging.ImageFormat.Png);
                blob = thumb.GetBuffer();

            }
        }
        catch
        {
            throw new UnableToGenerateThumb();
        }

        return blob;
    }

    public static string getMimeType(int bid)
    {
        string ContentType = string.Empty;
        BlogEntities be = new BlogEntities();

        try
        {
            IQueryable<binary> qry = from vid in be.binaries
                                     where vid.binID == bid
                                     select vid;
            foreach (var m in qry)
            {
                ContentType = m.MimeType;
            }

        }
        catch
        {
            throw new UnableToAccessImage();
        }

        return ContentType;
    }

    public static IQueryable<video> getVideoIdByName(string tit)
    {
        BlogEntities be = new BlogEntities();
        IQueryable<video> qry;
        try
        {
            qry = from vid in be.videos
                  where vid.Title.Contains(tit)
                  select vid;

        }
        catch
        {
            throw new UnableToAccessVideo();
        }

        return qry;

    }


    /*************************************************************
    *  @type: gets connection string 
    *  @usage: we will must provide the connection name to get the connection string
    *  @return: string 
    *  
    **************************************************************/

    public static string getConString(string ConnectionName = "int422_121b07connStr")
    {
        return ConfigurationManager.ConnectionStrings[ConnectionName].ConnectionString;
        #region Dirty Connection String
        /*
    
            //LOGIC FOR READING WEB.Config
       
            //System.Configuration.Configuration rootConfig = WebConfigurationManager.OpenWebConfiguration("~/");

                        
            //ConnectionStringSettings connString;
            //if (rootConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            //{
    //        connString = rootConfig.ConnectionStrings.ConnectionStrings[ConnectionName];
            //    if (connString != null){}
            //}
    
            //return connString;
     * 
     * 
      */
        #endregion
    }



    #region MEMBERSHIP REGISTRATION CODE NO NEED FOR THIS AT THIS POINT IN THE PROJECt

    /*
    public static bool OpenDb(string db)
    {
        bool success = false;


        return success;

    }

    public void connect()
    {

        if (this.connection != string.Empty)
        {

            SqlConnection sc = new SqlConnection(connection);
            sc.Open();

        }


    }
    */

    /*
    public void Register_User(string username, string password, string email, string secretQ, string secretA, string role)
    {

        try
        {
            #region QuicKDirtyConnection
            //var con = BlogManager.getConString();
            //connection = con.ConnectionString;
            //SqlConnection sc = new SqlConnection(connection);
            //sc.Open();
            #endregion

            MembershipCreateStatus status;

            // obviously, you will replace generic data with your own...

            Membership.CreateUser(username, password, email, secretQ, secretA, true, out status);


            Roles.AddUserToRole(username, role);



        }
        catch (Exception ex)
        {

            this.errormessage = "The error: " + ex.Message;

        }
        finally
        {
            //This is a property
            this.user = username;
            this.uRole = role;
        }
    }
    */



    /*
        public static string getQuery(string query, string conn){
            string results;
            var con = BlogManager.getConString();
            var cstr = con.ConnectionString;
            SqlConnection sconn = new SqlConnection(cstr);
            StringBuilder sb = new StringBuilder();
            try
            {
            
                  // 1. Instantiate a new command with a query and connection
                //           SqlCommand cmd = new SqlCommand("select CategoryName from Categories", conn);

                  // 2. Call Execute reader to get query results
                  //        SqlDataReader rdr = cmd.ExecuteReader();
             
                SqlCommand cmd = new SqlCommand(query, sconn);
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read()) {
                    sb.Append(reader.ToString());
                }
                sconn.Open();
            }
            catch (Exception)
            {

            }
            finally {
            
                sconn.Close();
            }

            return sb.ToString();
        }
        */
    #endregion



}


#region BLOGENTRY IS UNNESSARY CODE THAT taking up space in your source code.
/*

public class BlogEntry : BlogEntities
{
    //Properties
    protected string title { get; set; }
    protected string content { get; set; }
    protected string author { get; set; }
    protected DateTime date { get; set; }
    protected string comments { get; set; }
    protected string cat_id { get; set; }
    protected bool isEmpty { get; set; }
    //Here is our constructor
    public BlogEntry()
    {
        title = string.Empty;
        content = string.Empty;
        author = string.Empty;
        date = DateTime.Today;
        comments = string.Empty;
        cat_id = string.Empty;
        isEmpty = true;
    }

    public BlogEntry(string t, string cont, string auth, DateTime dt, string com, string cat)
    {
        title = t;
        content = cont;
        author = auth;
        date = dt;
        comments = com;
        cat_id = cat;
        isEmpty = false;

    }
    public void createBlogEntry()
    {
        if (!title.Equals(string.Empty) && content.Equals(string.Empty) && author.Equals(string.Empty) && !date.Equals(null))
        {

            #region LONG WAY TO INSERT NEW POSTS

            //Logic to connect to database
            //var myConn = new SqlConnection(BlogManager.getConString());
            //myConn.Open();
            //var cmd = myConn.CreateCommand();
            //cmd.CommandText = "INSERT INTO posts (author,title,content,created,comments,cat_id) VALUES("+
            //    author + "," + title + "," + content + "," +comments+","+cat_id+")";
            //cmd.BeginExecuteNonQuery();
            //myConn.Close();
            #endregion

            // this code is on fire...            
            BlogEntitiesModel.post.Createpost(12, author, title, content, date);

        }

    }

    public IQueryable<string> SelectTitle(String title, int order)
    {
        // string str= String.Empty;
        string titleArray = string.Empty;
        IQueryable<string> str = from z in this.posts
                                 where z.title == title
                                 orderby order
                                 select z.title;
        //var x= str.OrderBy(x=> return x);


        //var pstr = this.posts.Select(z => z.title==title).OrderBy(1);


        //Here is an example of how to iterate through some string array.
        foreach (var x in str)
        {
            titleArray += x.ToString();
        }
        return str;

    }


    public IQueryable<string> SelectTitle(String title)
    {
        // string str= String.Empty;
        string titleArray = string.Empty;
        IQueryable<string> str = from z in this.posts
                                 where z.title == title
                                 select z.title;
        //var x= str.OrderBy(x=> return x);


        //var pstr = this.posts.Select(z => z.title==title).OrderBy(1);


        //Here is an example of how to iterate through some string array.
        foreach (var x in str)
        {
            titleArray += x.ToString();
        }
        return str;

    }


    public IQueryable<string> SelectPost(int post)
    {
        string titleArray = string.Empty;
        IQueryable<string> str = from z in this.posts
                                 where z.post_id == post
                                 select z.content;
        foreach (var x in str)
        {
            titleArray += x.ToString();
        }
        return str;
    }



}

*/

#endregion





/*
 *  BELOW ARE ALL THE EXCEPTIONS THAT WE WILL HAVE FOR THIS APPLICATIONS....
 * 
 */



/// <summary>
/// General exception to throw when unable to change album name
/// includes default error message
/// </summary>
public class UnableToEditAlbum : ApplicationException
{
    public UnableToEditAlbum(string msg = "Unable to edit Album Name, please try again later.")
        : base(msg)
    {
    }
}

/// <summary>
/// General exception to throw when unable to add a record
/// includes default error message
/// </summary>
public class UnableToAddObject : ApplicationException
{
    public UnableToAddObject(string msg = "Unable to add record")
        : base(msg)
    {
    }
}

/// <summary>
/// ID insertion exception that includes a default error message
/// </summary>
public class IdentityMustBeUnique : ApplicationException
{
    //call base constructor and pass a message
    //user can pass a new message or allow the default to be passed
    public IdentityMustBeUnique(string msg = "ID must be unique")
        : base(msg)
    {
    }

}

/// <summary>
/// ID existence exception that includes a default error message
/// </summary>
public class IdentityMustExist : ApplicationException
{
    //call base constructor and pass a message
    //user can pass a new message or allow the default to be passed
    public IdentityMustExist(string msg = "ID must exist")
        : base(msg)
    {
    }

}

/// <summary>
/// ethrow this when empty strings are encountered
/// </summary>
public class FieldsMustNotBeBlank : ApplicationException
{
    public FieldsMustNotBeBlank(string msg = "All text fields must be filled in.")
        : base(msg)
    {
    }
}

public class UnableToGenerateThumb : ApplicationException
{
    public UnableToGenerateThumb(string msg = "Unable to generate thumb") : base(msg) { }
}

public class UnableToAccessImage : ApplicationException
{
    public UnableToAccessImage(string msg = "Unable to access image") : base(msg) { }
}


public class UnableToAccessVideo : ApplicationException
{
    public UnableToAccessVideo(string msg = "Unable to access video please try again later.") : base(msg) { }
}

public class CanNotRetrieveBinary : ApplicationException
{
    public CanNotRetrieveBinary(string msg = "Unable to access binary file") : base(msg) { }
}


public class UnableToUploadFile : ApplicationException
{
    public UnableToUploadFile(string msg = "Unable to upload  file") : base(msg) { }
}



public class UnableToAccessData : ApplicationException
{
    public UnableToAccessData(string msg = "Unable to access data") : base(msg) { }
}



public class UnableToSearchData : ApplicationException
{
    public UnableToSearchData(string msg = "Please try a different search term because No such item exist in our database.") : base(msg) { }
}

public class UnableToAccessBlogEntry : ApplicationException
{
    public UnableToAccessBlogEntry(string msg = "We are unable to retrieve the desired blog posting") : base(msg) { }
}
