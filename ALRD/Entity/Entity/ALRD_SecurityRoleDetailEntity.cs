using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_SecurityRoleDetailEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_SecurityRoleDetailEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public long? RoleID { get; set; }
        public long? FormID { get; set; }
        public bool? CanInsert { get; set; }
        public bool? CanUpdate { get; set; }
        public bool? CanDelete { get; set; }
        public bool? IsVisible { get; set; }
        
        // REF 
        public string FormName { get; set; }
        public string RoleName { get; set; }
        public string MenuName { get; set; }
        public string MenuCode { get; set; }
        public long? MenuID { get; set; }

        #endregion

        #region Constructor

        public ALRD_SecurityRoleDetailEntity()
            : base()
        {
        }

        public ALRD_SecurityRoleDetailEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("RoleID"))) RoleID = reader.GetInt64(reader.GetOrdinal("RoleID"));
                if (!reader.IsDBNull(reader.GetOrdinal("FormID"))) FormID = reader.GetInt64(reader.GetOrdinal("FormID"));
                if (!reader.IsDBNull(reader.GetOrdinal("CanInsert"))) CanInsert = reader.GetBoolean(reader.GetOrdinal("CanInsert"));
                if (!reader.IsDBNull(reader.GetOrdinal("CanUpdate"))) CanUpdate = reader.GetBoolean(reader.GetOrdinal("CanUpdate"));
                if (!reader.IsDBNull(reader.GetOrdinal("CanDelete"))) CanDelete = reader.GetBoolean(reader.GetOrdinal("CanDelete"));
                if (!reader.IsDBNull(reader.GetOrdinal("IsVisible"))) IsVisible = reader.GetBoolean(reader.GetOrdinal("IsVisible"));

                if (!reader.IsDBNull(reader.GetOrdinal("FormName"))) FormName = reader.GetString(reader.GetOrdinal("FormName"));
                if (!reader.IsDBNull(reader.GetOrdinal("RoleName"))) RoleName = reader.GetString(reader.GetOrdinal("RoleName"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuID"))) MenuID = reader.GetInt64(reader.GetOrdinal("MenuID"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuName"))) MenuName = reader.GetString(reader.GetOrdinal("MenuName"));
                if (!reader.IsDBNull(reader.GetOrdinal("MenuCode"))) MenuCode = reader.GetString(reader.GetOrdinal("MenuCode"));

                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
