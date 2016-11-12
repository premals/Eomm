using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class LoginOL
    {
        public string username
        {
            get
            {
                return m_username;
            }
            set
            {
                m_username = value;
            }
        }
        private string m_username;
        public string password
        {
            get
            {
                return m_password;
            }
            set
            {
                m_password = value;
            }
        }
        private string m_password;
        public int UserId
        {
            get
            {
                return m_UsetId;
            }
            set
            {
                m_UsetId = value;
            }
        }
        private int m_UsetId;
    }

}
