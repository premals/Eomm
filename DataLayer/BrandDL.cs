using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Entity;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class BrandDL
    {
        #region GetAllBrands
        public List<BrandOL> GetAllBrands()
        {
            using (IDbConnection db = new SqlConnection(@"Data Source=HP\SQLEXPRESS;Initial Catalog=DesaiEcom;Connection Timeout=180;User ID=sa;Password=sa@123"))
            {
                return db.Query<BrandOL>
                ("Select * From Brands Where IsDeleted=False").ToList();
            }
        }
        #endregion

        #region GetById
        public BrandOL GetById(int id)
        {
            using (IDbConnection db = new SqlConnection(@"Data Source=HP\SQLEXPRESS;Initial Catalog=DesaiEcom;Connection Timeout=180;User ID=sa;Password=sa@123"))
            {
                return db.Query<BrandOL>("Select * From Brands WHERE Id = @Id", new { id }).SingleOrDefault();
            }
        }
        #endregion
    }
}
