using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_UserInfoDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_UserInfoEntity entity);

        long Update(ALRD_UserInfoEntity entity, bool isPertial = false);

        long Add(ALRD_UserInfoEntity entity);

        long SaveList(IList<ALRD_UserInfoEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_UserInfoEntity> GetAll(ALRD_UserInfoEntity entity);

        #endregion GetAll
		
		
    }
}
