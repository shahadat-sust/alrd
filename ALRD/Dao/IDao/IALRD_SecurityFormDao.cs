using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_SecurityFormDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_SecurityFormEntity entity);

        long Update(ALRD_SecurityFormEntity entity, bool isPertial = false);

        long Add(ALRD_SecurityFormEntity entity);

        long SaveList(IList<ALRD_SecurityFormEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_SecurityFormEntity> GetAll(ALRD_SecurityFormEntity entity);

        #endregion GetAll
		
		
    }
}
