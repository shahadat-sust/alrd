using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_DistrictInfoDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_DistrictInfoEntity entity);

        long Update(ALRD_DistrictInfoEntity entity, bool isPertial = false);

        long Add(ALRD_DistrictInfoEntity entity);

        long SaveList(IList<ALRD_DistrictInfoEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_DistrictInfoEntity> GetAll(ALRD_DistrictInfoEntity entity);

        #endregion GetAll
		
		
    }
}
