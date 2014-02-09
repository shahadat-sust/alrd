using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "RPT_OrganizationDataEntity", Namespace = "http://www.GW2.com/types")]
    public partial class RPT_OrganizationDataEntity : BaseEntity
    {
        #region Properties

        public long? CollCollectionYear { get; set; }
        public long? FromYear { get; set; }
        public long? ToYear { get; set; }
        public long? DivisionID { get; set; }
        public long? DistrictID { get; set; }
        public long? UpazilaID { get; set; }
        public long? UnionID { get; set; }
        public string Remarks512 { get; set; }
        public string YearName { get; set; }
        public string ReportType { get; set; }

        public decimal? NoOfFamilyFishingOrg45 { get; set; }
        public decimal? NoOfRegFisherFolkCoOrg46 { get; set; }
        public decimal? NoOfFisherFolkCoOrg47 { get; set; }
        public decimal? NoOfLitigationKhasWaterOrg48 { get; set; }
        public decimal? NoOfMovKhasWaterOrg49 { get; set; }
        public decimal? NoOfCaseEvictionKhasWaterOrg410 { get; set; }
        public decimal? NoOfInitiativeGathOrg411 { get; set; }
        public decimal? NoOfInitiativeRallyOrg411 { get; set; }
        public decimal? NoOfInitiativeMemoOrg411 { get; set; }
        public decimal? NoOfInitiativeLegalOrg411 { get; set; }
        public decimal? NoOfInitiativeMeetOrg411 { get; set; }
        public decimal? NoOfInitiativeOthOrg411 { get; set; }
        public decimal? NoOfInitiativeOrg411 { get; set; }

        public decimal? TotalKhasLandGov11 { get; set; }
        public decimal? DistributedKhasLandGov12 { get; set; }
        public decimal? DistributableKhasLandGov13 { get; set; }
        public decimal? IllegalOccupiedKhasLandGov16 { get; set; }

        public decimal? TotalKhasLandOrg21 { get; set; }
        public decimal? DistributedKhasLandOrg22 { get; set; }
        public decimal? DistributableKhasLandOrg23 { get; set; }

        public decimal? TotalLandlessFamilyGov14 { get; set; }
        public decimal? NoOfFamilyGotKhasLandGov15 { get; set; }

        public decimal? TotalLandlessFamilyOrg24 { get; set; }
        public decimal? NoOfFamilyGotKhasLandOrg25 { get; set; }
        public decimal? NoOfFamilyEvictedKhasLandOrg26 { get; set; }
        public decimal? NoOfViolenceKhasLandOrg27 { get; set; }
        public decimal? NoOfLitigationKhasLandOrg28 { get; set; }
        public long? NoOfInitiativeGathOrg29 { get; set; }
        public long? NoOfInitiativeRallyOrg29 { get; set; }
        public long? NoOfInitiativeMemoOrg29 { get; set; }
        public long? NoOfInitiativeLegalOrg29 { get; set; }
        public long? NoOfInitiativeMeetOrg29 { get; set; }
        public long? NoOfInitiativeOthOrg29 { get; set; }
        public long? NoOfInitiativeOrg29 { get; set; }

        public decimal? NoOfFamilyAgriComm59 { get; set; }

        public decimal? TotalLand51 { get; set; }
        public decimal? TotalPrivateProp52 { get; set; }
        public decimal? TotalAgriLand53 { get; set; }
        public decimal? TotalNonAgriLand54 { get; set; }
        public decimal? TotalForestLand55 { get; set; }
        public decimal? TotalCommLan56 { get; set; }
        public decimal? TotalAgriCommLastYear57 { get; set; }
        public decimal? TotalAgriComm58 { get; set; }
        public decimal? TotalCharLand510 { get; set; }
        public decimal? NatAgriCommTobacco511 { get; set; }
        public decimal? NatAgriCommRubber511 { get; set; }
        public decimal? NatAgriCommBricks511 { get; set; }
        public decimal? NatAgriCommIndustry511 { get; set; }
        public decimal? NatAgriComm511 { get; set; }

        public decimal? TotalLess20KhasWaterGov31 { get; set; }
        public decimal? TotalMore20KhasWaterGov32 { get; set; }
        public decimal? TotalLeaseLess20KhasWaterGov33 { get; set; }
        public decimal? TotalLeaseMore20KhasWaterGov34 { get; set; }

        public decimal? TotalLess20KhasWaterOrg41 { get; set; }
        public decimal? TotalMore20KhasWaterOrg42 { get; set; }
        public decimal? TotalLeaseLess20KhasWaterOrg43 { get; set; }
        public decimal? TotalLeaseMore20KhasWaterOrg44 { get; set; }

        #endregion

        #region Constructor

        public RPT_OrganizationDataEntity()
            : base()
        {
        }

        public RPT_OrganizationDataEntity(IDataReader reader, string Type)
        {
            this.LoadFromReader(reader, Type);
        }

        private void LoadFromReader(IDataReader reader, string Type)
        {
            if (reader != null && !reader.IsClosed)
            {

                if (!reader.IsDBNull(reader.GetOrdinal("YearName"))) YearName = reader.GetString(reader.GetOrdinal("YearName"));
                if (!reader.IsDBNull(reader.GetOrdinal("CollCollectionYear"))) CollCollectionYear = reader.GetInt64(reader.GetOrdinal("CollCollectionYear"));

                if (Type != null && Type.Equals("FisherFolkFamilyCoparativesInitiatives"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyFishingOrg45"))) NoOfFamilyFishingOrg45 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyFishingOrg45"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfRegFisherFolkCoOrg46"))) NoOfRegFisherFolkCoOrg46 = reader.GetDecimal(reader.GetOrdinal("NoOfRegFisherFolkCoOrg46"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfFisherFolkCoOrg47"))) NoOfFisherFolkCoOrg47 = reader.GetDecimal(reader.GetOrdinal("NoOfFisherFolkCoOrg47"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfLitigationKhasWaterOrg48"))) NoOfLitigationKhasWaterOrg48 = reader.GetDecimal(reader.GetOrdinal("NoOfLitigationKhasWaterOrg48"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfMovKhasWaterOrg49"))) NoOfMovKhasWaterOrg49 = reader.GetDecimal(reader.GetOrdinal("NoOfMovKhasWaterOrg49"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfCaseEvictionKhasWaterOrg410"))) NoOfCaseEvictionKhasWaterOrg410 = reader.GetDecimal(reader.GetOrdinal("NoOfCaseEvictionKhasWaterOrg410"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeGathOrg411"))) NoOfInitiativeGathOrg411 = reader.GetDecimal(reader.GetOrdinal("NoOfInitiativeGathOrg411"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeRallyOrg411"))) NoOfInitiativeRallyOrg411 = reader.GetDecimal(reader.GetOrdinal("NoOfInitiativeRallyOrg411"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeMemoOrg411"))) NoOfInitiativeMemoOrg411 = reader.GetDecimal(reader.GetOrdinal("NoOfInitiativeMemoOrg411"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeLegalOrg411"))) NoOfInitiativeLegalOrg411 = reader.GetDecimal(reader.GetOrdinal("NoOfInitiativeLegalOrg411"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeMeetOrg411"))) NoOfInitiativeMeetOrg411 = reader.GetDecimal(reader.GetOrdinal("NoOfInitiativeMeetOrg411"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeOthOrg411"))) NoOfInitiativeOthOrg411 = reader.GetDecimal(reader.GetOrdinal("NoOfInitiativeOthOrg411"));
                    NoOfInitiativeOrg411 = NoOfInitiativeGathOrg411 + NoOfInitiativeRallyOrg411 + NoOfInitiativeMemoOrg411 + NoOfInitiativeLegalOrg411 + NoOfInitiativeMeetOrg411 + NoOfInitiativeOthOrg411;

                }

                if (Type != null && Type.Equals("KhasLand"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandGov11"))) TotalKhasLandGov11 = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandGov11"));
                    if (!reader.IsDBNull(reader.GetOrdinal("DistributedKhasLandGov12"))) DistributedKhasLandGov12 = reader.GetDecimal(reader.GetOrdinal("DistributedKhasLandGov12"));
                    if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandGov13"))) DistributableKhasLandGov13 = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandGov13"));
                    if (!reader.IsDBNull(reader.GetOrdinal("IllegalOccupiedKhasLandGov16"))) IllegalOccupiedKhasLandGov16 = reader.GetDecimal(reader.GetOrdinal("IllegalOccupiedKhasLandGov16"));
                }

                if (Type != null && Type.Equals("KhasLandAsPerResearchStudyAssumption"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandOrg21"))) TotalKhasLandOrg21 = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandOrg21"));
                    if (!reader.IsDBNull(reader.GetOrdinal("DistributedKhasLandOrg22"))) DistributedKhasLandOrg22 = reader.GetDecimal(reader.GetOrdinal("DistributedKhasLandOrg22"));
                    if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandOrg23"))) DistributableKhasLandOrg23 = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandOrg23"));
                }

                if (Type != null && Type.Equals("LandlessFamily"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLandlessFamilyGov14"))) TotalLandlessFamilyGov14 = reader.GetDecimal(reader.GetOrdinal("TotalLandlessFamilyGov14"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyGotKhasLandGov15"))) NoOfFamilyGotKhasLandGov15 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyGotKhasLandGov15"));               
                }

                if (Type != null && Type.Equals("LandlessFamilyInitiativesAsPerResearchStudyAssumption"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLandlessFamilyOrg24"))) TotalLandlessFamilyOrg24 = reader.GetDecimal(reader.GetOrdinal("TotalLandlessFamilyOrg24"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyGotKhasLandOrg25"))) NoOfFamilyGotKhasLandOrg25 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyGotKhasLandOrg25"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyEvictedKhasLandOrg26"))) NoOfFamilyEvictedKhasLandOrg26 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyEvictedKhasLandOrg26"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfViolenceKhasLandOrg27"))) NoOfViolenceKhasLandOrg27 = reader.GetDecimal(reader.GetOrdinal("NoOfViolenceKhasLandOrg27"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfLitigationKhasLandOrg28"))) NoOfLitigationKhasLandOrg28 = reader.GetDecimal(reader.GetOrdinal("NoOfLitigationKhasLandOrg28"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeGathOrg29"))) NoOfInitiativeGathOrg29 = reader.GetInt64(reader.GetOrdinal("NoOfInitiativeGathOrg29"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeRallyOrg29"))) NoOfInitiativeRallyOrg29 = reader.GetInt64(reader.GetOrdinal("NoOfInitiativeRallyOrg29"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeMemoOrg29"))) NoOfInitiativeMemoOrg29 = reader.GetInt64(reader.GetOrdinal("NoOfInitiativeMemoOrg29"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeLegalOrg29"))) NoOfInitiativeLegalOrg29 = reader.GetInt64(reader.GetOrdinal("NoOfInitiativeLegalOrg29"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeMeetOrg29"))) NoOfInitiativeMeetOrg29 = reader.GetInt64(reader.GetOrdinal("NoOfInitiativeMeetOrg29"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfInitiativeOthOrg29"))) NoOfInitiativeOthOrg29 = reader.GetInt64(reader.GetOrdinal("NoOfInitiativeOthOrg29"));
                    NoOfInitiativeOrg29 = NoOfInitiativeGathOrg29 + NoOfInitiativeRallyOrg29 + NoOfInitiativeMemoOrg29 + NoOfInitiativeLegalOrg29 + NoOfInitiativeMeetOrg29 + NoOfInitiativeOthOrg29;

                }

                if (Type != null && Type.Equals("StatusOfAffectedForConvertAgriLandToCommercialLand"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyAgriComm59"))) NoOfFamilyAgriComm59 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyAgriComm59"));
                }

                if (Type != null && Type.Equals("StatusOfLandUse"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLand51"))) TotalLand51 = reader.GetDecimal(reader.GetOrdinal("TotalLand51"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalPrivateProp52"))) TotalPrivateProp52 = reader.GetDecimal(reader.GetOrdinal("TotalPrivateProp52"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalAgriLand53"))) TotalAgriLand53 = reader.GetDecimal(reader.GetOrdinal("TotalAgriLand53"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalNonAgriLand54"))) TotalNonAgriLand54 = reader.GetDecimal(reader.GetOrdinal("TotalNonAgriLand54"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalForestLand55"))) TotalForestLand55 = reader.GetDecimal(reader.GetOrdinal("TotalForestLand55"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalCommLan56"))) TotalCommLan56 = reader.GetDecimal(reader.GetOrdinal("TotalCommLan56"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalAgriCommLastYear57"))) TotalAgriCommLastYear57 = reader.GetDecimal(reader.GetOrdinal("TotalAgriCommLastYear57"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalAgriComm58"))) TotalAgriComm58 = reader.GetDecimal(reader.GetOrdinal("TotalAgriComm58"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalCharLand510"))) TotalCharLand510 = reader.GetDecimal(reader.GetOrdinal("TotalCharLand510"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommTobacco511"))) NatAgriCommTobacco511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommTobacco511"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommRubber511"))) NatAgriCommRubber511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommRubber511"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommBricks511"))) NatAgriCommBricks511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommBricks511"));
                    if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommIndustry511"))) NatAgriCommIndustry511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommIndustry511"));
                    NatAgriComm511 = NatAgriCommTobacco511 + NatAgriCommRubber511 + NatAgriCommBricks511 + NatAgriCommIndustry511;

                }

                if (Type != null && Type.Equals("WaterBody"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLess20KhasWaterGov31"))) TotalLess20KhasWaterGov31 = reader.GetDecimal(reader.GetOrdinal("TotalLess20KhasWaterGov31"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalMore20KhasWaterGov32"))) TotalMore20KhasWaterGov32 = reader.GetDecimal(reader.GetOrdinal("TotalMore20KhasWaterGov32"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseLess20KhasWaterGov33"))) TotalLeaseLess20KhasWaterGov33 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseLess20KhasWaterGov33"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseMore20KhasWaterGov34"))) TotalLeaseMore20KhasWaterGov34 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseMore20KhasWaterGov34"));
                }

                if (Type != null && Type.Equals("WaterBodyAsPerResearchStudyAssumption"))
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLess20KhasWaterOrg41"))) TotalLess20KhasWaterOrg41 = reader.GetDecimal(reader.GetOrdinal("TotalLess20KhasWaterOrg41"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalMore20KhasWaterOrg42"))) TotalMore20KhasWaterOrg42 = reader.GetDecimal(reader.GetOrdinal("TotalMore20KhasWaterOrg42"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseLess20KhasWaterOrg43"))) TotalLeaseLess20KhasWaterOrg43 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseLess20KhasWaterOrg43"));
                    if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseMore20KhasWaterOrg44"))) TotalLeaseMore20KhasWaterOrg44 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseMore20KhasWaterOrg44"));
                }

            }
        }

        #endregion
    }

    
}
