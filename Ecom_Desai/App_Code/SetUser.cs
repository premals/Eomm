using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Entity;
using BuissnessLayer;

/// <summary>
/// Summary description for SetUser
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SetUser : System.Web.Services.WebService
{

    public SetUser()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public int SetUserPermition(LoginOL Users)
    {
        int rowAffected = new SetUserBL().setUSer(Users);
        if(rowAffected > 0)
        {
            return rowAffected;
        }
        else
        {
            return 0;
        }
    }

}
