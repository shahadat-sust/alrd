using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_SecurityMenuService
    {
        public ALRD_SecurityMenuService()
        {
		
        }

        public static SH.Dao.IALRD_SecurityMenuDao GetService()
        {
            return new SH.Dao.ALRD_SecurityMenuDao();
        }
    }
}
