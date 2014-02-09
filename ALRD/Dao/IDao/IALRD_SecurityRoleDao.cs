using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_SecurityRoleDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_SecurityRoleEntity entity);

        long Update(ALRD_SecurityRoleEntity entity, bool isPertial = false);

        long Add(ALRD_SecurityRoleEntity entity);

        long SaveList(IList<ALRD_SecurityRoleEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_SecurityRoleEntity> GetAll(ALRD_SecurityRoleEntity entity);

        #endregion GetAll
		
		
    }
}
