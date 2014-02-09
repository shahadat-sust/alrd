using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_SecurityUserRoleMappingEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_SecurityUserRoleMappingEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public long? UserID { get; set; }
        public long? RoleDetailID { get; set; }

        #endregion

        #region Constructor

        public ALRD_SecurityUserRoleMappingEntity()
            : base()
        {
        }

        public ALRD_SecurityUserRoleMappingEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UserID"))) UserID = reader.GetInt64(reader.GetOrdinal("UserID"));
                if (!reader.IsDBNull(reader.GetOrdinal("RoleDetailID"))) RoleDetailID = reader.GetInt64(reader.GetOrdinal("RoleDetailID"));

                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
