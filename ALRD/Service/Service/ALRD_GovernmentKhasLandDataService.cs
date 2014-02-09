using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_GovernmentKhasLandDataService
    {
        public ALRD_GovernmentKhasLandDataService()
        {
		
        }

        public static SH.Dao.IALRD_GovernmentKhasLandDataDao GetService()
        {
            return new SH.Dao.ALRD_GovernmentKhasLandDataDao();
        }
    }
}
