using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using Entity;

namespace BuissnessLayer
{
   public class Content_BL
    {
        #region 
        //code for update content 
        public int SaveContent(string content,string id)
        {
            int rowsAffected = new ContentDL().SaveContent(content,id);
            return rowsAffected;
        }

        public List<ContentOl> GetContent(string id)
        {
            List<ContentOl> content = new ContentDL().GetContent(id);
            return content.ToList();
        }
        #endregion
    }
}
