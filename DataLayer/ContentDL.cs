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
    public class ContentDL
    {
        string dbConnection = @"Data Source=PREMAL;Initial Catalog=DesaiEcom;Integrated Security=True";
        public int SaveContent(string content, string id)
        {
            try
            {
                ContentOl objContentOl = new ContentOl();
                objContentOl.content = content;
                objContentOl.ModifiedDate = DateTime.UtcNow.AddHours(5.5);
                using (IDbConnection db = new SqlConnection(dbConnection))
                {
                    string sqlQuery = "update Content_Master Set Content_Desc='" + content + "', ModifiedDate='" + objContentOl.ModifiedDate + "' where ContentId='" + id+"'"; 
                    int rowsAffected = db.Execute(sqlQuery, objContentOl);
                    return rowsAffected;
                }                

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
