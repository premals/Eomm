using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DataLayer;

namespace BuissnessLayer
{
    public class ProductBL
    {
        #region GetAllProducts
        public List<ProductOL> GetAllProducts()
        {
            List<ProductOL> objproduct = new List<ProductOL>();
            objproduct = new ProductDL().GetAllProducts();
            return objproduct;
        }
        #endregion
    }
}
