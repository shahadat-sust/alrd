using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_DivisionInfoEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_DivisionInfoEntity : BaseEntity
    {
        #region Properties

        public long? COMPID { get; set; }
        public string DESCRIPT { get; set; }

        #endregion

        #region Constructor

        public ALRD_DivisionInfoEntity()
            : base()
        {
        }

        public ALRD_DivisionInfoEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {

                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DESCRIPT"))) DESCRIPT = reader.GetString(reader.GetOrdinal("DESCRIPT"));
                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
