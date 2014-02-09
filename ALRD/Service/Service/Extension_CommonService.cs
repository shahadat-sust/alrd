using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace SH.Service
{
    public class Extension_CommonService
    {
        public Extension_CommonService()
        {
		
        }

        public static SH.Dao.IExtension_CommonDao GetService()
        {
            return new SH.Dao.Extension_CommonDao();
        }
    }
}
