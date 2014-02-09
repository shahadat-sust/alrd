using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_DistrictInfoEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_DistrictInfoEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public string DESCRIPT { get; set; }
        public long? DivisionID { get; set; }
        public string DivisionName { get; set; }

        #endregion

        #region Constructor

        public ALRD_DistrictInfoEntity()
            : base()
        {
        }

        public ALRD_DistrictInfoEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {

                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DESCRIPT"))) DESCRIPT = reader.GetString(reader.GetOrdinal("DESCRIPT"));
                if (!reader.IsDBNull(reader.GetOrdinal("DivisionID"))) DivisionID = reader.GetInt64(reader.GetOrdinal("DivisionID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DivisionName"))) DivisionName = reader.GetString(reader.GetOrdinal("DivisionName"));
                
                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
