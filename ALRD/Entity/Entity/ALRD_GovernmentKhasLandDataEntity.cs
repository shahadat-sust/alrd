using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_GovernmentKhasLandDataEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_GovernmentKhasLandDataEntity : BaseEntity
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

        public decimal? TotalKhasLandAgri { get; set; }
        public decimal? TotalKhasLandNonAgri { get; set; }
        public decimal? DistributedKhasLandAgri { get; set; }
        public decimal? DistributedKhasLandNonAgri { get; set; }
        public decimal? DistributableKhasLandAgri { get; set; }
        public decimal? DistributableKhasLandNonAgri { get; set; }
        public decimal? NoOfFamilyGotKhasLandAgri { get; set; }
        public decimal? NoOfFamilyGotKhasLandNonAgri { get; set; }
        public decimal? IllegalOccupiedKhasLandAgri { get; set; }
        public decimal? IllegalOccupiedKhasLandNonAgri { get; set; }
        public decimal? KhasLandWithSuitCaseAgri { get; set; }
        public decimal? KhasLandWithSuitCaseNonAgri { get; set; }
        
        

        #endregion

        #region Constructor

        public ALRD_GovernmentKhasLandDataEntity()
            : base()
        {
        }

        public ALRD_GovernmentKhasLandDataEntity(IDataReader reader)
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

                if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandAgri"))) TotalKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandNonAgri"))) TotalKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributedKhasLandAgri"))) DistributedKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("DistributedKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributedKhasLandNonAgri"))) DistributedKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("DistributedKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandAgri"))) DistributableKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandNonAgri"))) DistributableKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyGotKhasLandAgri"))) NoOfFamilyGotKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyGotKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyGotKhasLandNonAgri"))) NoOfFamilyGotKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyGotKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("IllegalOccupiedKhasLandAgri"))) IllegalOccupiedKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("IllegalOccupiedKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("IllegalOccupiedKhasLandNonAgri"))) IllegalOccupiedKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("IllegalOccupiedKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("KhasLandWithSuitCaseAgri"))) KhasLandWithSuitCaseAgri = reader.GetDecimal(reader.GetOrdinal("KhasLandWithSuitCaseAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("KhasLandWithSuitCaseNonAgri"))) KhasLandWithSuitCaseNonAgri = reader.GetDecimal(reader.GetOrdinal("KhasLandWithSuitCaseNonAgri"));
                
                
                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
