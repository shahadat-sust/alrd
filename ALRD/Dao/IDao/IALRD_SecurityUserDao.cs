using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_SecurityUserDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_SecurityUserEntity entity);

        long Update(ALRD_SecurityUserEntity entity, bool isPertial = false);

        long Add(ALRD_SecurityUserEntity entity);

        long SaveList(IList<ALRD_SecurityUserEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_SecurityUserEntity> GetAll(ALRD_SecurityUserEntity entity);

        #endregion GetAll
		
		
    }
}
