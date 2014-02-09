using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_GovernmentWaterBodyDataService
    {
        public ALRD_GovernmentWaterBodyDataService()
        {
		
        }

        public static SH.Dao.IALRD_GovernmentWaterBodyDataDao GetService()
        {
            return new SH.Dao.ALRD_GovernmentWaterBodyDataDao();
        }
    }
}
