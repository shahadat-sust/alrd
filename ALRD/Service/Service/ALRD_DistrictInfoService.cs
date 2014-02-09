using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_DistrictInfoService
    {
        public ALRD_DistrictInfoService()
        {
		
        }

        public static SH.Dao.IALRD_DistrictInfoDao GetService()
        {
            return new SH.Dao.ALRD_DistrictInfoDao();
        }
    }
}
