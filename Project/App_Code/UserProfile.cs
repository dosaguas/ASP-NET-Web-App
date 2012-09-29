using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserProfile
/// </summary>
[Serializable]
public class UserProfile
{
	
	//Properties
    public string uid {get; set;}
	public string fname {get; set;}
	public string lname {get; set;}
	public string role {get; set;}



		public UserProfile(){


		}

		public UserProfile(string fn, string ln, string rl){


		}

		public void create_user(){


		}

}