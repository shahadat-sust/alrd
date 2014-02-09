using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_UnionInfoService
    {
        public ALRD_UnionInfoService()
        {
		
        }

        public static SH.Dao.IALRD_UnionInfoDao GetService()
        {
            return new SH.Dao.ALRD_UnionInfoDao();
        }
    }
}
