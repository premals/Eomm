using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entity;

namespace DataLayer
{
    public class LoginDL
    {
        public List<LoginOL> CheckLogin(string username, string password)
        {
            List<LoginOL> oblistol = new List<LoginOL>();
            sqlfunc sqf = new sqlfunc();
            sqf.cmd.CommandText = "CheckLogin";
            sqf.cmd.Parameters.AddWithValue("@UserName", username);
            sqf.cmd.Parameters.AddWithValue("@Password", password);
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(sqf.cmd);
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                LoginOL objlogin = new LoginOL();
                objlogin.username = dt.Rows[0]["UserName"].ToString();
                objlogin.password = dt.Rows[0]["Password"].ToString();
                oblistol.Add(objlogin);
            }
            sqf.Dispose();
            return oblistol;
        }
    }
}
