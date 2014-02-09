using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_UpazilaInfoDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_UpazilaInfoEntity entity);

        long Update(ALRD_UpazilaInfoEntity entity, bool isPertial = false);

        long Add(ALRD_UpazilaInfoEntity entity);

        long SaveList(IList<ALRD_UpazilaInfoEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_UpazilaInfoEntity> GetAll(ALRD_UpazilaInfoEntity entity);

        #endregion GetAll
		
		
    }
}
