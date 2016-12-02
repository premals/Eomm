using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Entity;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataLayer
{
    public class BrandDL
    {
        string dbConnection = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;
        #region GetAllBrands
        public List<BrandOL> GetAllBrands()
        {
            using (IDbConnection db = new SqlConnection(dbConnection))
            {
                return db.Query<BrandOL>
                ("Select * From Brands Where IsDeleted=0 or IsDeleted='False' ").ToList();
            }
        }
        #endregion

        #region GetById
        public BrandOL GetById(int id)
        {
            using (IDbConnection db = new SqlConnection(dbConnection))
            {
                return db.Query<BrandOL>("Select * From Brands WHERE Id = @Id", new { id }).SingleOrDefault();
            }
        }
        #endregion

        #region Edit
        public int Edit(int id, string name, string image)
        {
            BrandOL brandol = new BrandOL();
            brandol.Name = name;
            brandol.Id = id;
            brandol.Image = id+"_"+image;
            brandol.ModifiedBy = 1;
            brandol.ModifiedDate = DateTime.UtcNow.AddHours(5.5);
            using (IDbConnection db = new SqlConnection(dbConnection))
            {
                string sqlQuery = "UPDATE Brands SET Name = '" + name + "',Image='"+brandol.Image+"' ,LastModifiedBy=1 WHERE Id = " + id;
                int rowsAffected = db.Execute(sqlQuery, brandol);
                return rowsAffected;
            }
        }
        #endregion

        #region Delete
        public int Delete(int id)
        {
            BrandOL brandol = new BrandOL();
            brandol.Id = id;
            brandol.ModifiedBy = 1;
            brandol.ModifiedDate = DateTime.UtcNow.AddHours(5.5);
            using (IDbConnection db = new SqlConnection(dbConnection))
            {
                string sqlQuery = "UPDATE Brands SET IsDeleted = 1 , LastModifiedBy=1 WHERE Id = " + id;
                int rowsAffected = db.Execute(sqlQuery, brandol);
                return rowsAffected;
            }
        }
        #endregion

        #region Add
        public int Add(string name, string Image)
        {
            BrandOL brandol = new BrandOL();
            brandol.Name = name;
            brandol.Image = Image;
            brandol.CreatedBy = 1;
            brandol.CreatedDate = DateTime.UtcNow.AddHours(5.5);
            using (IDbConnection db = new SqlConnection(dbConnection))
            {
                string sqlQuery = "INSERT INTO Brands (Name,Image,CreatedBy,CreatedDate,IsDeleted) VALUES ('" + name + "','" + Image + "',1," + brandol.CreatedDate.ToString("dd/MM/yyyy") + ",0)";
                int rowsAffected = db.Execute(sqlQuery, brandol);
                return rowsAffected;
            }
        }
        #endregion
    }
}
