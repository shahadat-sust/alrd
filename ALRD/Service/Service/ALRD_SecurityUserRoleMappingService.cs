using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_SecurityUserRoleMappingService
    {
        public ALRD_SecurityUserRoleMappingService()
        {
		
        }

        public static SH.Dao.IALRD_SecurityUserRoleMappingDao GetService()
        {
            return new SH.Dao.ALRD_SecurityUserRoleMappingDao();
        }
    }
}
