using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_OrganizationInfoService
    {
        public ALRD_OrganizationInfoService()
        {
		
        }

        public static SH.Dao.IALRD_OrganizationInfoDao GetService()
        {
            return new SH.Dao.ALRD_OrganizationInfoDao();
        }
    }
}
