using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_GovernmentKhasLandDataDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_GovernmentKhasLandDataEntity entity);

        long Update(ALRD_GovernmentKhasLandDataEntity entity, bool isPertial = false);

        long Add(ALRD_GovernmentKhasLandDataEntity entity);

        long SaveList(IList<ALRD_GovernmentKhasLandDataEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_GovernmentKhasLandDataEntity> GetAll(ALRD_GovernmentKhasLandDataEntity entity);

        #endregion GetAll
		
		
    }
}
