using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_UserInfoEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_UserInfoEntity : BaseEntity
    {
        #region Properties

        public long? COMPID { get; set; }
        public string UserName { get; set; }
        public long? UserLevel { get; set; }
        public long? LoginID { get; set; }
        #endregion

        #region Constructor

        public ALRD_UserInfoEntity()
            : base()
        {
        }

        public ALRD_UserInfoEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {

                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UserName"))) UserName = reader.GetString(reader.GetOrdinal("UserName"));
                if (!reader.IsDBNull(reader.GetOrdinal("UserLevel"))) UserLevel = reader.GetInt64(reader.GetOrdinal("UserLevel"));
                if (!reader.IsDBNull(reader.GetOrdinal("LoginID"))) LoginID = reader.GetInt64(reader.GetOrdinal("LoginID"));
                BaseLoadFromReader(reader);
                
            }
        }

        #endregion
    }

    
}
