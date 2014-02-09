using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_OrganizationInfoDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_OrganizationInfoEntity entity);

        long Update(ALRD_OrganizationInfoEntity entity, bool isPertial = false);

        long Add(ALRD_OrganizationInfoEntity entity);

        long SaveList(IList<ALRD_OrganizationInfoEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_OrganizationInfoEntity> GetAll(ALRD_OrganizationInfoEntity entity);

        #endregion GetAll
		
		
    }
}
