using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_GovernmentForestryBodyDataDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_GovernmentForestryBodyDataEntity entity);

        long Update(ALRD_GovernmentForestryBodyDataEntity entity, bool isPertial = false);

        long Add(ALRD_GovernmentForestryBodyDataEntity entity);

        long SaveList(IList<ALRD_GovernmentForestryBodyDataEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_GovernmentForestryBodyDataEntity> GetAll(ALRD_GovernmentForestryBodyDataEntity entity);

        #endregion GetAll
		
		
    }
}
