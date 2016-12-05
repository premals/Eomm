using System.Collections.Generic;
using System.Linq;
using Entity;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using System.Configuration;

namespace DataLayer
{
    public class ProductDL
    {
        string dbConnection = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;

        #region GetAllProducts
        public List<ProductOL> GetAllProducts()
        {
            try
            {
                using (IDbConnection db = new SqlConnection(dbConnection))
                {
                    return db.Query<ProductOL>
                    ("Select * From Products Where IsDeleted=0 or IsDeleted='False' ").ToList();
                }
            }
            catch(SqlException se)
            {
                throw se;
            }

        }
        #endregion


    }
}
