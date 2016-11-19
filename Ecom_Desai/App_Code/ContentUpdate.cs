using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BuissnessLayer;
using Entity;

/// <summary>
/// Summary description for ContentUpdate
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ContentUpdate : System.Web.Services.WebService
{

    public ContentUpdate()
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

    public int InsertContent(string Content,string Id)
    {
        int id = Convert.ToInt32(Id);
        int rowAffect = new Content_BL().SaveContent(Content,Id);
        return rowAffect;
    }

}
