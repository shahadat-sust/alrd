using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_SecurityRoleDetailDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_SecurityRoleDetailEntity entity);

        long Update(ALRD_SecurityRoleDetailEntity entity, bool isPertial = false);

        long Add(ALRD_SecurityRoleDetailEntity entity);

        long SaveList(IList<ALRD_SecurityRoleDetailEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_SecurityRoleDetailEntity> GetAll(ALRD_SecurityRoleDetailEntity entity);

        IList<ALRD_SecurityRoleDetailEntity> GetAllByRoleID(ALRD_SecurityRoleDetailEntity entity);

        #endregion GetAll
		
		
    }
}
