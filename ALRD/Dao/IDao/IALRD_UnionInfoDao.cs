using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_UnionInfoDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_UnionInfoEntity entity);

        long Update(ALRD_UnionInfoEntity entity, bool isPertial = false);

        long Add(ALRD_UnionInfoEntity entity);

        long SaveList(IList<ALRD_UnionInfoEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_UnionInfoEntity> GetAll(ALRD_UnionInfoEntity entity);

        #endregion GetAll
		
		
    }
}
