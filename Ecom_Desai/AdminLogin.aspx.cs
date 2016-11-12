using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BuissnessLayer;
using Entity;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region CheckLogin

    [WebMethod]
    public static string CheckLogin(string UserName, string Password)
    {
        string str;
        LoginBL objlgbl = new LoginBL();
        List<LoginOL> objloginol = new List<LoginOL>();
        objloginol = objlgbl.CheckLogin(UserName, Password);
        if (objloginol.Count > 0)
        {
            HttpContext.Current.Session["UserName"] = objloginol[0].username;
            str = "1";
            return str;
        }
        else
        {
            str = "0";
            return str;
        }
    }

    #endregion
}