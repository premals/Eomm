<%@ WebHandler Language="C#" Class="BrandImage" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public class BrandImage : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        SqlConnection con = new SqlConnection(@"Data Source=HP\SQLEXPRESS;Initial Catalog=DesaiEcom;Connection Timeout=180;User ID=sa;Password=sa@123");
        DataTable dt=new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter("select max(Id) as ID from  Brands", con);
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fname;
                    if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                    {
                        string[] testfiles = file.FileName.Split(new char[] { '\\' });
                        fname = testfiles[testfiles.Length - 1];
                    }
                    else
                    {
                        fname = dt.Rows[0]["ID"].ToString() + '_' + (file.FileName);
                    }
                    fname = Path.Combine(context.Server.MapPath("~/BrandImage/"), fname);
                    file.SaveAs(fname);
                }
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("File Uploaded Successfully!");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}