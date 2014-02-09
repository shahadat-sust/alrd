using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "RPT_DistributedKashLandEntity", Namespace = "http://www.GW2.com/types")]
    public partial class RPT_DistributedKashLandEntity : BaseEntity
    {
        #region Properties

        public int? FromMonth { get; set; }
        public int? FromYear { get; set; }
        public int? ToMonth { get; set; }
        public int? ToYear { get; set; }
        public string ReportType { get; set; }

        public long? UpazilaID { get; set; }
        public string UpazilaName { get; set; }

        public long? DistrictID { get; set; }
        public string DistrictName { get; set; }

        public long? DivisionID { get; set; }
        public string DivisionName { get; set; }

        public long? NoOfUpazila { get; set; }
        public long? NoOfUnion { get; set; }

        public decimal? TotalKhasLandAgri { get; set; }
        public decimal? TotalKhasLandNonAgri { get; set; }
        public decimal? DistributableKhasLandAgri { get; set; }
        public decimal? DistributableKhasLandNonAgri { get; set; }
        public decimal? NonDistributableKashLand { get; set; }
        public decimal? NonDistributableAgriKashLand { get; set; }
        public decimal? NonDistributableNonAgriKashLand { get; set; }
        public decimal? NoOfFamilyGotKhasLandAgri { get; set; }
        public decimal? DistributedKashLand { get; set; }
        public decimal? IllegalOccupiedKhasLand { get; set; }

        
        public string Remarks { get; set; }

        #endregion

        #region Constructor

        public RPT_DistributedKashLandEntity()
            : base()
        {
        }

        public RPT_DistributedKashLandEntity(IDataReader reader, String Type)
        {
            this.LoadFromReader(reader, Type);
        }

        private void LoadFromReader(IDataReader reader, String Type)
        {
            if (reader != null && !reader.IsClosed)
            {

                if (Type != null && Type.Equals("Division"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("DivisionID"))) DivisionID = reader.GetInt64(reader.GetOrdinal("DivisionID"));
                    if (!reader.IsDBNull(reader.GetOrdinal("DivisionName"))) DivisionName = reader.GetString(reader.GetOrdinal("DivisionName"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfUpazila"))) NoOfUpazila = reader.GetInt64(reader.GetOrdinal("NoOfUpazila"));
                }
                if (Type != null && Type.Equals("District"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("DistrictID"))) DistrictID = reader.GetInt64(reader.GetOrdinal("DistrictID"));
                    if (!reader.IsDBNull(reader.GetOrdinal("DistrictName"))) DistrictName = reader.GetString(reader.GetOrdinal("DistrictName"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfUpazila"))) NoOfUpazila = reader.GetInt64(reader.GetOrdinal("NoOfUpazila"));
                }
                if (Type != null && Type.Equals("Upazila"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("UpazilaID"))) UpazilaID = reader.GetInt64(reader.GetOrdinal("UpazilaID"));
                    if (!reader.IsDBNull(reader.GetOrdinal("UpazilaName"))) UpazilaName = reader.GetString(reader.GetOrdinal("UpazilaName"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfUnion"))) NoOfUnion = reader.GetInt64(reader.GetOrdinal("NoOfUnion"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NonDistributableAgriKashLand"))) NonDistributableAgriKashLand = reader.GetDecimal(reader.GetOrdinal("NonDistributableAgriKashLand"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NonDistributableNonAgriKashLand"))) NonDistributableNonAgriKashLand = reader.GetDecimal(reader.GetOrdinal("NonDistributableNonAgriKashLand"));
                    if (!reader.IsDBNull(reader.GetOrdinal("IllegalOccupiedKhasLand"))) IllegalOccupiedKhasLand = reader.GetDecimal(reader.GetOrdinal("IllegalOccupiedKhasLand"));
                }

                if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandAgri"))) TotalKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandNonAgri"))) TotalKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandAgri"))) DistributableKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandNonAgri"))) DistributableKhasLandNonAgri = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandNonAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("NonDistributableKashLand"))) NonDistributableKashLand = reader.GetDecimal(reader.GetOrdinal("NonDistributableKashLand"));
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyGotKhasLandAgri"))) NoOfFamilyGotKhasLandAgri = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyGotKhasLandAgri"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributedKashLand"))) DistributedKashLand = reader.GetDecimal(reader.GetOrdinal("DistributedKashLand"));
                
            }
        }

        #endregion
    }

    
}
