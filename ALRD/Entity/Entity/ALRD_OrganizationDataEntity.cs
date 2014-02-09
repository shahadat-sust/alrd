using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "ALRD_OrganizationDataEntity", Namespace = "http://www.GW2.com/types")]
    public partial class ALRD_OrganizationDataEntity : BaseEntity
    {
        #region Properties

        public long? COMPID { get; set; }
        public long? CollectionMonth { get; set; }
        public long? CollCollectionYear { get; set; }
        public long? CollOrganizationID { get; set; }
        public long? DivisionID { get; set; }
        public long? DistrictID { get; set; }
        public long? UpazilaID { get; set; }
        public long? UnionID { get; set; }
        public bool? ActKhaLand { get; set; }
        public bool? ActKhaWater { get; set; }
        public bool? ActAdibasi { get; set; }
        public bool? ActLanServey { get; set; }
        public bool? ActAwareness { get; set; }
        public bool? ActVestedProp { get; set; }
        public string Remarks512 { get; set; }
        public string MonthName { get; set; }
        public string OrgName { get; set; }
        public string DivisionName { get; set; }
        public string DistrictName { get; set; }
        public string UpazilaName { get; set; }
        public string UnionName { get; set; }

        public decimal? TotalKhasLandGov11 { get; set; }
        public decimal? DistributedKhasLandGov12 { get; set; }
        public decimal? DistributableKhasLandGov13 { get; set; }
        public decimal? TotalLandlessFamilyGov14 { get; set; }
        public decimal? NoOfFamilyGotKhasLandGov15 { get; set; }
        public decimal? IllegalOccupiedKhasLandGov16 { get; set; }
        public decimal? TotalKhasLandOrg21 { get; set; }
        public decimal? DistributedKhasLandOrg22 { get; set; }
        public decimal? DistributableKhasLandOrg23 { get; set; }
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
        public decimal? TotalLess20KhasWaterGov31 { get; set; }
        public decimal? TotalMore20KhasWaterGov32 { get; set; }
        public decimal? TotalLeaseLess20KhasWaterGov33 { get; set; }
        public decimal? TotalLeaseMore20KhasWaterGov34 { get; set; }
        public decimal? TotalLess20KhasWaterOrg41 { get; set; }
        public decimal? TotalMore20KhasWaterOrg42 { get; set; }
        public decimal? TotalLeaseLess20KhasWaterOrg43 { get; set; }
        public decimal? TotalLeaseMore20KhasWaterOrg44 { get; set; }
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
        public decimal? TotalLand51 { get; set; }
        public decimal? TotalPrivateProp52 { get; set; }
        public decimal? TotalAgriLand53 { get; set; }
        public decimal? TotalNonAgriLand54 { get; set; }
        public decimal? TotalForestLand55 { get; set; }
        public decimal? TotalCommLan56 { get; set; }
        public decimal? TotalAgriCommLastYear57 { get; set; }
        public decimal? TotalAgriComm58 { get; set; }
        public decimal? NoOfFamilyAgriComm59 { get; set; }
        public decimal? TotalCharLand510 { get; set; }
        public decimal? NatAgriCommTobacco511 { get; set; }
        public decimal? NatAgriCommRubber511 { get; set; }
        public decimal? NatAgriCommBricks511 { get; set; }
        public decimal? NatAgriCommIndustry511 { get; set; }

        #endregion

        #region Constructor

        public ALRD_OrganizationDataEntity()
            : base()
        {
        }

        public ALRD_OrganizationDataEntity(IDataReader reader)
        {
            this.LoadFromReader(reader);
        }

        private void LoadFromReader(IDataReader reader)
        {
            if (reader != null && !reader.IsClosed)
            {
                if (!reader.IsDBNull(reader.GetOrdinal("COMPID"))) COMPID = reader.GetInt64(reader.GetOrdinal("COMPID"));
                if (!reader.IsDBNull(reader.GetOrdinal("Remarks512"))) Remarks512 = reader.GetString(reader.GetOrdinal("Remarks512"));
                if (!reader.IsDBNull(reader.GetOrdinal("MonthName"))) MonthName = reader.GetString(reader.GetOrdinal("MonthName"));
                if (!reader.IsDBNull(reader.GetOrdinal("OrgName"))) OrgName = reader.GetString(reader.GetOrdinal("OrgName"));
                if (!reader.IsDBNull(reader.GetOrdinal("DivisionName"))) DivisionName = reader.GetString(reader.GetOrdinal("DivisionName"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistrictName"))) DistrictName = reader.GetString(reader.GetOrdinal("DistrictName"));
                if (!reader.IsDBNull(reader.GetOrdinal("UpazilaName"))) UpazilaName = reader.GetString(reader.GetOrdinal("UpazilaName"));
                if (!reader.IsDBNull(reader.GetOrdinal("UnionName"))) UnionName = reader.GetString(reader.GetOrdinal("UnionName"));

                if (!reader.IsDBNull(reader.GetOrdinal("CollectionMonth"))) CollectionMonth = reader.GetInt64(reader.GetOrdinal("CollectionMonth"));
                if (!reader.IsDBNull(reader.GetOrdinal("CollCollectionYear"))) CollCollectionYear = reader.GetInt64(reader.GetOrdinal("CollCollectionYear"));
                if (!reader.IsDBNull(reader.GetOrdinal("CollOrganizationID"))) CollOrganizationID = reader.GetInt64(reader.GetOrdinal("CollOrganizationID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DivisionID"))) DivisionID = reader.GetInt64(reader.GetOrdinal("DivisionID"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistrictID"))) DistrictID = reader.GetInt64(reader.GetOrdinal("DistrictID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UpazilaID"))) UpazilaID = reader.GetInt64(reader.GetOrdinal("UpazilaID"));
                if (!reader.IsDBNull(reader.GetOrdinal("UnionID"))) UnionID = reader.GetInt64(reader.GetOrdinal("UnionID"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActKhaLand"))) ActKhaLand = reader.GetBoolean(reader.GetOrdinal("ActKhaLand"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActKhaWater"))) ActKhaWater = reader.GetBoolean(reader.GetOrdinal("ActKhaWater"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActAdibasi"))) ActAdibasi = reader.GetBoolean(reader.GetOrdinal("ActAdibasi"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActLanServey"))) ActLanServey = reader.GetBoolean(reader.GetOrdinal("ActLanServey"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActAwareness"))) ActAwareness = reader.GetBoolean(reader.GetOrdinal("ActAwareness"));
                if (!reader.IsDBNull(reader.GetOrdinal("ActVestedProp"))) ActVestedProp = reader.GetBoolean(reader.GetOrdinal("ActVestedProp"));

                if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandGov11"))) TotalKhasLandGov11 = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandGov11"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributedKhasLandGov12"))) DistributedKhasLandGov12 = reader.GetDecimal(reader.GetOrdinal("DistributedKhasLandGov12"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandGov13"))) DistributableKhasLandGov13 = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandGov13"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLandlessFamilyGov14"))) TotalLandlessFamilyGov14 = reader.GetDecimal(reader.GetOrdinal("TotalLandlessFamilyGov14"));
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyGotKhasLandGov15"))) NoOfFamilyGotKhasLandGov15 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyGotKhasLandGov15"));
                if (!reader.IsDBNull(reader.GetOrdinal("IllegalOccupiedKhasLandGov16"))) IllegalOccupiedKhasLandGov16 = reader.GetDecimal(reader.GetOrdinal("IllegalOccupiedKhasLandGov16"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalKhasLandOrg21"))) TotalKhasLandOrg21 = reader.GetDecimal(reader.GetOrdinal("TotalKhasLandOrg21"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributedKhasLandOrg22"))) DistributedKhasLandOrg22 = reader.GetDecimal(reader.GetOrdinal("DistributedKhasLandOrg22"));
                if (!reader.IsDBNull(reader.GetOrdinal("DistributableKhasLandOrg23"))) DistributableKhasLandOrg23 = reader.GetDecimal(reader.GetOrdinal("DistributableKhasLandOrg23"));
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
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLess20KhasWaterGov31"))) TotalLess20KhasWaterGov31 = reader.GetDecimal(reader.GetOrdinal("TotalLess20KhasWaterGov31"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalMore20KhasWaterGov32"))) TotalMore20KhasWaterGov32 = reader.GetDecimal(reader.GetOrdinal("TotalMore20KhasWaterGov32"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseLess20KhasWaterGov33"))) TotalLeaseLess20KhasWaterGov33 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseLess20KhasWaterGov33"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseMore20KhasWaterGov34"))) TotalLeaseMore20KhasWaterGov34 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseMore20KhasWaterGov34"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLess20KhasWaterOrg41"))) TotalLess20KhasWaterOrg41 = reader.GetDecimal(reader.GetOrdinal("TotalLess20KhasWaterOrg41"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalMore20KhasWaterOrg42"))) TotalMore20KhasWaterOrg42 = reader.GetDecimal(reader.GetOrdinal("TotalMore20KhasWaterOrg42"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseLess20KhasWaterOrg43"))) TotalLeaseLess20KhasWaterOrg43 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseLess20KhasWaterOrg43"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLeaseMore20KhasWaterOrg44"))) TotalLeaseMore20KhasWaterOrg44 = reader.GetDecimal(reader.GetOrdinal("TotalLeaseMore20KhasWaterOrg44"));
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
                if (!reader.IsDBNull(reader.GetOrdinal("TotalLand51"))) TotalLand51 = reader.GetDecimal(reader.GetOrdinal("TotalLand51"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalPrivateProp52"))) TotalPrivateProp52 = reader.GetDecimal(reader.GetOrdinal("TotalPrivateProp52"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalAgriLand53"))) TotalAgriLand53 = reader.GetDecimal(reader.GetOrdinal("TotalAgriLand53"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalNonAgriLand54"))) TotalNonAgriLand54 = reader.GetDecimal(reader.GetOrdinal("TotalNonAgriLand54"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalForestLand55"))) TotalForestLand55 = reader.GetDecimal(reader.GetOrdinal("TotalForestLand55"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalCommLan56"))) TotalCommLan56 = reader.GetDecimal(reader.GetOrdinal("TotalCommLan56"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalAgriCommLastYear57"))) TotalAgriCommLastYear57 = reader.GetDecimal(reader.GetOrdinal("TotalAgriCommLastYear57"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalAgriComm58"))) TotalAgriComm58 = reader.GetDecimal(reader.GetOrdinal("TotalAgriComm58"));
                if (!reader.IsDBNull(reader.GetOrdinal("NoOfFamilyAgriComm59"))) NoOfFamilyAgriComm59 = reader.GetDecimal(reader.GetOrdinal("NoOfFamilyAgriComm59"));
                if (!reader.IsDBNull(reader.GetOrdinal("TotalCharLand510"))) TotalCharLand510 = reader.GetDecimal(reader.GetOrdinal("TotalCharLand510"));
                if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommTobacco511"))) NatAgriCommTobacco511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommTobacco511"));
                if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommRubber511"))) NatAgriCommRubber511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommRubber511"));
                if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommBricks511"))) NatAgriCommBricks511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommBricks511"));
                if (!reader.IsDBNull(reader.GetOrdinal("NatAgriCommIndustry511"))) NatAgriCommIndustry511 = reader.GetDecimal(reader.GetOrdinal("NatAgriCommIndustry511"));
                BaseLoadFromReader(reader);
            }
        }

        #endregion
    }

    
}
