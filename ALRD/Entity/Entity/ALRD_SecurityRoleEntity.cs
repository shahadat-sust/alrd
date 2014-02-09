using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_SecurityRoleEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_SecurityRoleEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public string RoleName { get; set; }
        public string ShortName { get; set; }
        public string LongDescription { get; set; }

        #endregion

        #region Constructor

        public ALRD_SecurityRoleEntity()
            : base()
        {
        }

        public ALRD_SecurityRoleEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("RoleName"))) RoleName = reader.GetString(reader.GetOrdinal("RoleName"));
                if (!reader.IsDBNull(reader.GetOrdinal("ShortName"))) ShortName = reader.GetString(reader.GetOrdinal("ShortName"));
                if (!reader.IsDBNull(reader.GetOrdinal("LongDescription"))) LongDescription = reader.GetString(reader.GetOrdinal("LongDescription"));

                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
