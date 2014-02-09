using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_GovernmentForestryBodyDataService
    {
        public ALRD_GovernmentForestryBodyDataService()
        {
		
        }

        public static SH.Dao.IALRD_GovernmentForestryBodyDataDao GetService()
        {
            return new SH.Dao.ALRD_GovernmentForestryBodyDataDao();
        }
    }
}
