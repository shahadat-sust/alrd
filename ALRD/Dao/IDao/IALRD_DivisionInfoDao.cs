using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_DivisionInfoDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_DivisionInfoEntity entity);

        long Update(ALRD_DivisionInfoEntity entity, bool isPertial = false);

        long Add(ALRD_DivisionInfoEntity entity);

        long SaveList(IList<ALRD_DivisionInfoEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_DivisionInfoEntity> GetAll(ALRD_DivisionInfoEntity entity);

        #endregion GetAll
		
		
    }
}
