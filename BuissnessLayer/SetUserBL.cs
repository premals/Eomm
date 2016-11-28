using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using Entity;

namespace BuissnessLayer
{
    public class SetUserBL
    {
        public int setUSer(LoginOL setUser)
        {
            int rowAffected = new SetUserDL().SetUserPermition(setUser);
            return rowAffected;
        }
    }
}
