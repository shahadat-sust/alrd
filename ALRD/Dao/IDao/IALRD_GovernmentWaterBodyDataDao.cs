using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_GovernmentWaterBodyDataDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_GovernmentWaterBodyDataEntity entity);

        long Update(ALRD_GovernmentWaterBodyDataEntity entity, bool isPertial = false);

        long Add(ALRD_GovernmentWaterBodyDataEntity entity);

        long SaveList(IList<ALRD_GovernmentWaterBodyDataEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_GovernmentWaterBodyDataEntity> GetAll(ALRD_GovernmentWaterBodyDataEntity entity);

        #endregion GetAll
		
		
    }
}
