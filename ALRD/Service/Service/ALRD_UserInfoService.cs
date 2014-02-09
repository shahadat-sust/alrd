using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_UserInfoService
    {
        public ALRD_UserInfoService()
        {
		
        }

        public static SH.Dao.IALRD_UserInfoDao GetService()
        {
            return new SH.Dao.ALRD_UserInfoDao();
        }
    }
}
