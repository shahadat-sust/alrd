using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class Extension_ReportService
    {
        public Extension_ReportService()
        {
		
        }

        public static SH.Dao.IExtension_ReportDao GetService()
        {
            return new SH.Dao.Extension_ReportDao();
        }
    }
}
