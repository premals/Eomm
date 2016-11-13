using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Entity;
using BuissnessLayer;

/// <summary>
/// Summary description for Brands
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Brands : System.Web.Services.WebService
{

    public Brands()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    #region GetAllBrands
    [WebMethod]
    public List<BrandOL> GetAllBrands()
    {
        List<BrandOL> objbrand = new List<BrandOL>();
        objbrand = new BrandBL().GetAllBrands();
        return objbrand;
    }
    #endregion

    #region GetById
    [WebMethod]
    public BrandOL GetById(string id)
    {
        int Id = Convert.ToInt32(id);
        BrandOL objbrand = new BrandOL();
        objbrand = new BrandBL().GetById(Id);
        return objbrand;
    }
    #endregion

}
