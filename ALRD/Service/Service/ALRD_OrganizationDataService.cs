using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class ALRD_OrganizationDataService
    {
        public ALRD_OrganizationDataService()
        {
		
        }

        public static SH.Dao.IALRD_OrganizationDataDao GetService()
        {
            return new SH.Dao.ALRD_OrganizationDataDao();
        }
    }
}
