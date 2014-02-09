using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_SecurityUserEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_SecurityUserEntity : BaseEntity
    {
        #region Properties


        public long? COMPID { get; set; }
        public long? RoleID { get; set; }
        public long? ProfileID { get; set; }
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string BlockIPAccess { get; set; }
        public string BlockMacAccess { get; set; }
        public bool? Status { get; set; }
        public string AlternateEmail { get; set; }
        public string ActivationKey { get; set; }
        public bool? IsActivated { get; set; }

        public string RoleName { get; set; }
        public string StatusName { get; set; }
        public string Email { get; set; }
        public string UserNameLike { get; set; }
        public string PasswordDecripted { get; set; }
        public string PasswordPrevious { get; set; }

        #endregion

        #region Constructor

        public ALRD_SecurityUserEntity()
            : base()
        {
        }

        public ALRD_SecurityUserEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("RoleID"))) RoleID = reader.GetInt64(reader.GetOrdinal("RoleID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ProfileID"))) ProfileID = reader.GetInt64(reader.GetOrdinal("ProfileID"));
                if (!reader.IsDBNull(reader.GetOrdinal("FullName"))) FullName = reader.GetString(reader.GetOrdinal("FullName"));
                if (!reader.IsDBNull(reader.GetOrdinal("Password"))) Password = reader.GetString(reader.GetOrdinal("Password"));
                if (!reader.IsDBNull(reader.GetOrdinal("UserName"))) UserName = reader.GetString(reader.GetOrdinal("UserName"));
                if (!reader.IsDBNull(reader.GetOrdinal("BlockIPAccess"))) BlockIPAccess = reader.GetString(reader.GetOrdinal("BlockIPAccess"));
                if (!reader.IsDBNull(reader.GetOrdinal("BlockMacAccess"))) BlockMacAccess = reader.GetString(reader.GetOrdinal("BlockMacAccess"));
                if (!reader.IsDBNull(reader.GetOrdinal("AlternateEmail"))) AlternateEmail = reader.GetString(reader.GetOrdinal("AlternateEmail"));
                if (!reader.IsDBNull(reader.GetOrdinal("Status"))) Status = reader.GetBoolean(reader.GetOrdinal("Status"));
                if (!reader.IsDBNull(reader.GetOrdinal("IsActivated"))) IsActivated = reader.GetBoolean(reader.GetOrdinal("IsActivated"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActivationKey"))) ActivationKey = reader.GetString(reader.GetOrdinal("ActivationKey"));

                if (!reader.IsDBNull(reader.GetOrdinal("RoleName"))) RoleName = reader.GetString(reader.GetOrdinal("RoleName"));
                if (!reader.IsDBNull(reader.GetOrdinal("StatusName"))) StatusName = reader.GetString(reader.GetOrdinal("StatusName"));
                if (!reader.IsDBNull(reader.GetOrdinal("Email"))) Email = reader.GetString(reader.GetOrdinal("Email"));

                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
