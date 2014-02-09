using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_OrganizationDataDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_OrganizationDataEntity entity);

        long Update(ALRD_OrganizationDataEntity entity, bool isPertial = false);

        long Add(ALRD_OrganizationDataEntity entity);

        long SaveList(IList<ALRD_OrganizationDataEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_OrganizationDataEntity> GetAll(ALRD_OrganizationDataEntity entity);

        #endregion GetAll
		
		
    }
}
