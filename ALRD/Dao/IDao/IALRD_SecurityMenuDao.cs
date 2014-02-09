using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;

namespace SH.Dao
{
    public partial interface IALRD_SecurityMenuDao
    {

        #region Save Update Delete List Single Entity

        long Delete(ALRD_SecurityMenuEntity entity);

        long Update(ALRD_SecurityMenuEntity entity, bool isPertial = false);

        long Add(ALRD_SecurityMenuEntity entity);

        long SaveList(IList<ALRD_SecurityMenuEntity> list);

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_SecurityMenuEntity> GetAll(ALRD_SecurityMenuEntity entity);

        #endregion GetAll
		
		
    }
}
