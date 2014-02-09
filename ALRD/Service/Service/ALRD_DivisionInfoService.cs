using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_DivisionInfoService
    {
        public ALRD_DivisionInfoService()
        {
		
        }

        public static SH.Dao.IALRD_DivisionInfoDao GetService()
        {
            return new SH.Dao.ALRD_DivisionInfoDao();
        }
    }
}
