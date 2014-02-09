using System;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Data;

namespace SH.Entity
{
    [Serializable()]
    [DataContract(Name = "BaseEntity", Namespace = "http://www.mojoex.com/types")]
    public abstract class BaseEntity : ICloneable
    {
        public enum EntityState
        {
            /// <summary>
            /// Entity is unchanged
            /// </summary>
            Unchanged = 0,

            /// <summary>
            /// Entity is new
            /// </summary>
            Added = 1,

            /// <summary>
            /// Entity has been modified
            /// </summary>
            Changed = 2,

            /// <summary>
            /// Entity has been deleted
            /// </summary>
            Deleted = 3
        }

        private EntityState currentEntityState = EntityState.Added;

        [DataMember]
        public DateTime? CreatedOn { get; set; }

        [DataMember]
        public DateTime? UpdatedOn { get; set; }

        [DataMember]
        public long? CreatedBy { get; set; }

        [DataMember]
        public long? UpdatedBy { get; set; }


        [DataMember]
        public string SortExpression{ get; set;}

        [DataMember]
        public int bitVal1{ get; set; }

        [DataMember]
        public int bitVal2{ get; set; }

        [DataMember]
        public virtual int Key{ get; set; }

        [DataMember]
        public int CreatorId { get; set; }

        [DataMember]
        public int UpdatorId { get; set; }

        [DataMember]
        public bool IsSelected { get; set; }
        
        [DataMember]
        public string tempName { get; set; }

        [DataMember]
        public string tempName1 { get; set; }

        [DataMember]
        public string tempName2 { get; set; }

        [DataMember]
        public string tempName3 { get; set; }

        [DataMember]
        public string tempName4 { get; set; }

        [DataMember]
        public string tempName5 { get; set; }

        [DataMember]
        public string tempName6 { get; set; }

        [DataMember]
        public decimal decVal1 { get; set; }

        [DataMember]
        public decimal decVal2 { get; set; }

        [DataMember]
        public long TotalRecord { get; set; }

        [DataMember]
        public long ItemCount { get; set; }

        [DataMember]
        public long PageSize { get; set; }

        [DataMember]
        public long CurrentPage { get; set; }

        [DataMember]
        public DateTime? FromDate { get; set; }

        [DataMember]
        public DateTime? ToDate { get; set; }

        [DataMember]
        public DateTime FromDate2 { get; set; }

        [DataMember]
        public DateTime ToDate2 { get; set; }

        [DataMember]
        public int intVal1 { get; set; }

        [DataMember]
        public int intVal2 { get; set; }

        [DataMember]
        public int intVal3 { get; set; }

        [DataMember]
        public long lonVal1 { get; set; }

        [DataMember]
        public long lonVal2 { get; set; }

        [DataMember]
        public long sn { get; set; }

        [DataMember]
        public long lonVal_UserKey { get; set; }

        [DataMember]
        public int IntCurrentState { get; set; }

        [DataMember]
        public bool boolFlag1 { get; set; }

        [DataMember]
        public bool boolFlag2 { get; set; }

        [DataMember]
        public bool boolFlag3 { get; set; }

        [DataMember]
        public int Tag { get; set; }

        [DataMember]
        public long RowNumber { get; set; }

        [DataMember]
        public long RETURN_KEY { get; set; }

        [DataMember]
        public int QryOption { get; set; }

        protected byte[] _fileData;

        [DataMember]
        public byte[] FileData
        {
            get { return _fileData; }
            set { this._fileData = value; }
        }

        [DataMember]
        public EntityState CurrentState
        {
            get { return currentEntityState; }
            set { currentEntityState = value; }
        }

        protected BaseEntity()
        {
            //CreatedOn = UpdatedOn = DateTime.Now;
            this.currentEntityState = EntityState.Added;
        }

        protected void BaseLoadFromReader(IDataReader reader)
        {

            if (!reader.IsDBNull(reader.GetOrdinal("CreatedOn"))) CreatedOn = reader.GetDateTime(reader.GetOrdinal("CreatedOn"));
            if (!reader.IsDBNull(reader.GetOrdinal("UpdatedOn"))) UpdatedOn = reader.GetDateTime(reader.GetOrdinal("UpdatedOn"));
            if (!reader.IsDBNull(reader.GetOrdinal("CreatedBy"))) CreatedBy = reader.GetInt64(reader.GetOrdinal("CreatedBy"));
            if (!reader.IsDBNull(reader.GetOrdinal("UpdatedBy"))) UpdatedBy = reader.GetInt64(reader.GetOrdinal("UpdatedBy"));
        }

        protected void OnChnaged()
        {
            this.currentEntityState = EntityState.Changed;
        }

        protected void AcceptChnaged()
        {
            this.currentEntityState = EntityState.Unchanged;
        }

        public void Remove()
        {
            this.currentEntityState = EntityState.Deleted;
        }

        object ICloneable.Clone()
        {
            return Clone();
        }

        public virtual BaseEntity Clone()
        {
            using (MemoryStream ms = new MemoryStream())
            {
                (new BinaryFormatter()).Serialize(ms, this);

                ms.Seek(0, SeekOrigin.Begin);

                return (new BinaryFormatter()).Deserialize(ms) as BaseEntity;
            }
        }
    }
}
