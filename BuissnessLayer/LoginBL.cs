using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DataLayer;

namespace BuissnessLayer
{
    public class LoginBL
    {
        public List<LoginOL> CheckLogin(string username, string password)
        {
            List<LoginOL> oblistol = new List<LoginOL>();
            LoginDL objlgdl = new LoginDL();
            oblistol = objlgdl.CheckLogin(username, password);
            return oblistol;
        }
    }
}
