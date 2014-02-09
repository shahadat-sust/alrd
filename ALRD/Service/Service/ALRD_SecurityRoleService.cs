using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_SecurityRoleService
    {
        public ALRD_SecurityRoleService()
        {
		
        }

        public static SH.Dao.IALRD_SecurityRoleDao GetService()
        {
            return new SH.Dao.ALRD_SecurityRoleDao();
        }
    }
}
