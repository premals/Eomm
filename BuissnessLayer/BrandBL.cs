using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using Entity;

namespace BuissnessLayer
{
    public class BrandBL
    {
        public List<BrandOL> GetAllBrands()
        {
            List<BrandOL> objbrand = new List<BrandOL>();
            objbrand = new BrandDL().GetAllBrands();
            return objbrand;
        }
    }
}
