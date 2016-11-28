using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data;
using System.Data.SqlClient;
using Dapper;

namespace DataLayer
{
    public class SetUserDL
    {
        string dbConnection = @"Data Source=PREMAL;Initial Catalog=DesaiEcom;Integrated Security=True";
        public int SetUserPermition(LoginOL setUSer)
        {
            using (IDbConnection db = new SqlConnection(dbConnection))
            {
                string sqlQuery = "insert into Users(UserName,Password,IsDeleted,CreatedBy,CreatedDate)values('" + setUSer.username+"','"+ setUSer.password.Trim()+"','0','"+ setUSer.CreatedBy+"','" +DateTime.Now+"')";
                int rowsAffected = db.Execute(sqlQuery, setUSer);
                return rowsAffected;
            }
        }
    }
}
