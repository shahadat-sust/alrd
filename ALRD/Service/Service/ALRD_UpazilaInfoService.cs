using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_UpazilaInfoService
    {
        public ALRD_UpazilaInfoService()
        {
		
        }

        public static SH.Dao.IALRD_UpazilaInfoDao GetService()
        {
            return new SH.Dao.ALRD_UpazilaInfoDao();
        }
    }
}
