using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Text;
using SH.Entity;
using SH.Dao;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Diagnostics;
using System.Data.Common;
using System.Data;

namespace SH.Dao
{
    public partial class Extension_ReportDao : BaseDao, IExtension_ReportDao
    {

        #region Constructors

        private string ClassName = "Extension_ReportDao";

        public Extension_ReportDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion

        #region GetAll

        IList<RPT_DistributedKashLandEntity> IExtension_ReportDao.GetDistributedKashLand(RPT_DistributedKashLandEntity entity)
        {
            try
            {
                string SP = "";
                if (entity.ReportType.Equals("Division"))
                {
                    SP = "RPT_DivisionWiseDistributedKashLand";
                }
                if (entity.ReportType.Equals("District"))
                {
                    SP = "RPT_DistrictWiseDistributedKashLand";
                }
                if (entity.ReportType.Equals("Upazila"))
                {
                    SP = "RPT_UpazilaWiseDistributedKashLand";
                }

                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {

                    if (entity.FromDate.HasValue)
                        Database.AddInParameter(cmd, "@FromDate", DbType.DateTime, entity.FromDate);
                    if (entity.ToDate.HasValue)
                        Database.AddInParameter(cmd, "@ToDate", DbType.DateTime, entity.ToDate);
                    if (entity.DivisionID.HasValue)
                        Database.AddInParameter(cmd, "@DivisionID", DbType.Int64, entity.DivisionID);
                    if (entity.DistrictID.HasValue)
                        Database.AddInParameter(cmd, "@DistrictID", DbType.Int64, entity.DistrictID);
                    if (entity.UpazilaID.HasValue)
                        Database.AddInParameter(cmd, "@UpazilaID", DbType.Int64, entity.UpazilaID);

                    IList<RPT_DistributedKashLandEntity> itemList = new List<RPT_DistributedKashLandEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new RPT_DistributedKashLandEntity(reader, entity.ReportType));
                        }
                    }
                    return itemList;
                }
            }
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("GetAll"));
            }
        }

        IList<RPT_OrganizationDataEntity> IExtension_ReportDao.GetOrganizationData(RPT_OrganizationDataEntity entity)
        {
            try
            {
                string SP = "";
                if (entity.ReportType.Equals("FisherFolkFamilyCoparativesInitiatives"))
                {
                    SP = "RPT_UnionWiseFisherFolkFamilyCoparativesInitiatives";
                }
                if (entity.ReportType.Equals("KhasLand"))
                {
                    SP = "RPT_UnionWiseKhasLand";
                }
                if (entity.ReportType.Equals("KhasLandAsPerResearchStudyAssumption"))
                {
                    SP = "RPT_UnionWiseKhasLandAsPerResearchStudyAssumption";
                }
                if (entity.ReportType.Equals("LandlessFamily"))
                {
                    SP = "RPT_UnionWiseLandlessFamily";
                }
                if (entity.ReportType.Equals("LandlessFamilyInitiativesAsPerResearchStudyAssumption"))
                {
                    SP = "RPT_UnionWiseLandlessFamilyInitiativesAsPerResearchStudyAssumption";
                }
                if (entity.ReportType.Equals("StatusOfAffectedForConvertAgriLandToCommercialLand"))
                {
                    SP = "RPT_UnionWiseStatusOfAffectedForConvertAgriLandToCommercialLand";
                } 
                if (entity.ReportType.Equals("StatusOfLandUse"))
                {
                    SP = "RPT_UnionWiseStatusOfLandUse";
                }
                if (entity.ReportType.Equals("WaterBody"))
                {
                    SP = "RPT_UnionWiseWaterBody";
                }
                if (entity.ReportType.Equals("WaterBodyAsPerResearchStudyAssumption"))
                {
                    SP = "RPT_UnionWiseWaterBodyAsPerResearchStudyAssumption";
                }

                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {

                    if (entity.FromYear.HasValue)
                        Database.AddInParameter(cmd, "@FromYear", DbType.Int64, entity.FromYear);
                    if (entity.ToYear.HasValue)
                        Database.AddInParameter(cmd, "@ToYear", DbType.Int64, entity.ToYear);
                    if (entity.DivisionID.HasValue)
                        Database.AddInParameter(cmd, "@DivisionID", DbType.Int64, entity.DivisionID);
                    if (entity.DistrictID.HasValue)
                        Database.AddInParameter(cmd, "@DistrictID", DbType.Int64, entity.DistrictID);
                    if (entity.UpazilaID.HasValue)
                        Database.AddInParameter(cmd, "@UpazilaID", DbType.Int64, entity.UpazilaID);
                    if (entity.UnionID.HasValue)
                        Database.AddInParameter(cmd, "@UnionID", DbType.Int64, entity.UnionID);

                    IList<RPT_OrganizationDataEntity> itemList = new List<RPT_OrganizationDataEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new RPT_OrganizationDataEntity(reader, entity.ReportType));
                        }
                    }
                    return itemList;
                }
            }
            catch (Exception ex)
            {
                throw GetDataAccessException(ex, SourceOfException("GetAll"));
            }
        }

        #endregion GetAll


    }
}
