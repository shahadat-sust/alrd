using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_SecurityUserService
    {
        public ALRD_SecurityUserService()
        {
		
        }

        public static SH.Dao.IALRD_SecurityUserDao GetService()
        {
            return new SH.Dao.ALRD_SecurityUserDao();
        }
    }
}
