using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_SecurityUserRoleMappingDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_SecurityUserRoleMappingEntity entity);

        long Update(ALRD_SecurityUserRoleMappingEntity entity, bool isPertial = false);

        long Add(ALRD_SecurityUserRoleMappingEntity entity);

        long SaveList(IList<ALRD_SecurityUserRoleMappingEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_SecurityUserRoleMappingEntity> GetAll(ALRD_SecurityUserRoleMappingEntity entity);

        #endregion GetAll
		
		
    }
}
