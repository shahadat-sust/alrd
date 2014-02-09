using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_SecurityMenuEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_SecurityMenuEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public string MenuName { get; set; }
        public string MenuCode { get; set; }

        #endregion

        #region Constructor

        public ALRD_SecurityMenuEntity()
            : base()
        {
        }

        public ALRD_SecurityMenuEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuName"))) MenuName = reader.GetString(reader.GetOrdinal("MenuName"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuCode"))) MenuCode = reader.GetString(reader.GetOrdinal("MenuCode"));

                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
