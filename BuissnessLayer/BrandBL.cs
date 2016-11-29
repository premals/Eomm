using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using Entity;
using System.Web;

namespace BuissnessLayer
{
    public class BrandBL
    {
        #region GetAllBrands
        public List<BrandOL> GetAllBrands()
        {
            List<BrandOL> objbrand = new List<BrandOL>();
            objbrand = new BrandDL().GetAllBrands();
            return objbrand;
        }
        #endregion

        #region GetById
        public BrandOL GetById(int id)
        {
            BrandOL objbrand = new BrandOL();
            objbrand = new BrandDL().GetById(id);
            return objbrand;
        }
        #endregion

        #region Edit
        public int Edit(int id, string name, string image)
        {
            int rowsAffected = new BrandDL().Edit(id, name, image);
            return rowsAffected;
        }
        #endregion

        #region Delete
        public int Delete(int id)
        {
            int rowsAffected = new BrandDL().Delete(id);
            return rowsAffected;
        }
        #endregion

        #region Add
        public int Add(string name, string Image)
        {
            int rowsAffected = new BrandDL().Add(name, Image);
            return rowsAffected;
        }
        #endregion
    }
}
