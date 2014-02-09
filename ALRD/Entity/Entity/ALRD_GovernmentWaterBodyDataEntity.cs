using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_GovernmentWaterBodyDataEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_GovernmentWaterBodyDataEntity : BaseEntity
    {
        #region Properties

        public long? COMPID { get; set; }
        public long? CollectionMonth { get; set; }
        public long? CollCollectionYear { get; set; }
        public long? DivisionID { get; set; }
        public long? DistrictID { get; set; }
        public long? UpazilaID { get; set; }

        public string Remarks { get; set; }
        public string MonthName { get; set; }
        public string DivisionName { get; set; }
        public string DistrictName { get; set; }
        public string UpazilaName { get; set; }

        
        public decimal? NoOfWaterBody20Under { get; set; }
        public decimal? NoOfWaterBody20Over { get; set; }
        public decimal? AreaOfWaterbody20Under { get; set; }
        public decimal? AreaOfWaterbody20Over { get; set; }
        
        

        #endregion

        #region Constructor

        public ALRD_GovernmentWaterBodyDataEntity()
            : base()
        {
        }

        public ALRD_GovernmentWaterBodyDataEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("Remarks"))) Remarks = reader.GetString(reader.GetOrdinal("Remarks"));
                if (!reader.IsDBNull(reader.GetOrdinal("MonthName"))) MonthName = reader.GetString(reader.GetOrdinal("MonthName"));
                if (!reader.IsDBNull(reader.GetOrdinal("DivisionName"))) DivisionName = reader.GetString(reader.GetOrdinal("DivisionName"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistrictName"))) DistrictName = reader.GetString(reader.GetOrdinal("DistrictName"));
                if (!reader.IsDBNull(reader.GetOrdinal("UpazilaName"))) UpazilaName = reader.GetString(reader.GetOrdinal("UpazilaName"));

                if (!reader.IsDBNull(reader.GetOrdinal("CollectionMonth"))) CollectionMonth = reader.GetInt64(reader.GetOrdinal("CollectionMonth"));
                if (!reader.IsDBNull(reader.GetOrdinal("CollCollectionYear"))) CollCollectionYear = reader.GetInt64(reader.GetOrdinal("CollCollectionYear"));
                if (!reader.IsDBNull(reader.GetOrdinal("DivisionID"))) DivisionID = reader.GetInt64(reader.GetOrdinal("DivisionID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistrictID"))) DistrictID = reader.GetInt64(reader.GetOrdinal("DistrictID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UpazilaID"))) UpazilaID = reader.GetInt64(reader.GetOrdinal("UpazilaID"));

                
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfWaterBody20Under"))) NoOfWaterBody20Under = reader.GetDecimal(reader.GetOrdinal("NoOfWaterBody20Under"));
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfWaterBody20Over"))) NoOfWaterBody20Over = reader.GetDecimal(reader.GetOrdinal("NoOfWaterBody20Over"));
                if (!reader.IsDBNull(reader.GetOrdinal("AreaOfWaterbody20Under"))) AreaOfWaterbody20Under = reader.GetDecimal(reader.GetOrdinal("AreaOfWaterbody20Under"));
                if (!reader.IsDBNull(reader.GetOrdinal("AreaOfWaterbody20Over"))) AreaOfWaterbody20Over = reader.GetDecimal(reader.GetOrdinal("AreaOfWaterbody20Over"));
                
                
                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
