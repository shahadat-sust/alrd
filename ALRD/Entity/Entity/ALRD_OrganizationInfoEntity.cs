using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_OrganizationInfoEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_OrganizationInfoEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public string DESCRIPT { get; set; }
        public string NameOfCEO { get; set; }
        public string TelephoneNo { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
        public string WebSite { get; set; }
        public string Fax { get; set; }
        public bool? Status { get; set; }
        public string StatusName { get; set; }
        
        #endregion

        #region Constructor

        public ALRD_OrganizationInfoEntity()
            : base()
        {
        }

        public ALRD_OrganizationInfoEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DESCRIPT"))) DESCRIPT = reader.GetString(reader.GetOrdinal("DESCRIPT"));
                if (!reader.IsDBNull(reader.GetOrdinal("Status"))) Status = reader.GetBoolean(reader.GetOrdinal("Status"));
                if (!reader.IsDBNull(reader.GetOrdinal("NameOfCEO"))) NameOfCEO = reader.GetString(reader.GetOrdinal("NameOfCEO"));
                if (!reader.IsDBNull(reader.GetOrdinal("TelephoneNo"))) TelephoneNo = reader.GetString(reader.GetOrdinal("TelephoneNo"));
                if (!reader.IsDBNull(reader.GetOrdinal("MobileNo"))) MobileNo = reader.GetString(reader.GetOrdinal("MobileNo"));
                if (!reader.IsDBNull(reader.GetOrdinal("Email"))) Email = reader.GetString(reader.GetOrdinal("Email"));
                if (!reader.IsDBNull(reader.GetOrdinal("WebSite"))) WebSite = reader.GetString(reader.GetOrdinal("WebSite"));
                if (!reader.IsDBNull(reader.GetOrdinal("Fax"))) Fax = reader.GetString(reader.GetOrdinal("Fax"));
                if (!reader.IsDBNull(reader.GetOrdinal("StatusName"))) StatusName = reader.GetString(reader.GetOrdinal("StatusName"));
                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
