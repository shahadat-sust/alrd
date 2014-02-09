using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IExtension_ReportDao
    {

        #region GetAll

        IList<RPT_DistributedKashLandEntity> GetDistributedKashLand(RPT_DistributedKashLandEntity entity);
        IList<RPT_OrganizationDataEntity> GetOrganizationData(RPT_OrganizationDataEntity entity);
        #endregion GetAll
		
		
    }
}
