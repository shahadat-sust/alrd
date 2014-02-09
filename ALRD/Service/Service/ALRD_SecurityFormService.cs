using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_SecurityFormService
    {
        public ALRD_SecurityFormService()
        {
		
        }

        public static SH.Dao.IALRD_SecurityFormDao GetService()
        {
            return new SH.Dao.ALRD_SecurityFormDao();
        }
    }
}
