using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_SecurityFormEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_SecurityFormEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public long? MenuID { get; set; }
        public string FormName { get; set; }
        public string FormType { get; set; }
        public string FormCaption { get; set; }
        
        // REF 
        public string MenuName { get; set; }
        public string MenuCode { get; set; }

        #endregion

        #region Constructor

        public ALRD_SecurityFormEntity()
            : base()
        {
        }

        public ALRD_SecurityFormEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuID"))) MenuID = reader.GetInt64(reader.GetOrdinal("MenuID"));
                if (!reader.IsDBNull(reader.GetOrdinal("FormName"))) FormName = reader.GetString(reader.GetOrdinal("FormName"));
                if (!reader.IsDBNull(reader.GetOrdinal("FormType"))) FormType = reader.GetString(reader.GetOrdinal("FormType"));
                if (!reader.IsDBNull(reader.GetOrdinal("FormCaption"))) FormCaption = reader.GetString(reader.GetOrdinal("FormCaption"));

                if (!reader.IsDBNull(reader.GetOrdinal("MenuName"))) MenuName = reader.GetString(reader.GetOrdinal("MenuName"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuCode"))) MenuCode = reader.GetString(reader.GetOrdinal("MenuCode"));

                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
