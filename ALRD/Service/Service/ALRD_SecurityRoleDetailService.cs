using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_SecurityRoleDetailService
    {
        public ALRD_SecurityRoleDetailService()
        {
		
        }

        public static SH.Dao.IALRD_SecurityRoleDetailDao GetService()
        {
            return new SH.Dao.ALRD_SecurityRoleDetailDao();
        }
    }
}
