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
    public partial class ALRD_OrganizationDataDao : BaseDao, IALRD_OrganizationDataDao
    {

        #region Constructors

        private string ClassName = "ALRD_OrganizationDataDao";

        public ALRD_OrganizationDataDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_OrganizationDataEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
        {
            if (entity.COMPID.HasValue)
                Database.AddInParameter(cmd, "@COMPID", DbType.Int64, entity.COMPID);
            if (forDelete) return;
            if (!(string.IsNullOrEmpty(entity.Remarks512)))
                Database.AddInParameter(cmd, "@Remarks512", DbType.String, entity.Remarks512);
            if (entity.CollectionMonth.HasValue)
                Database.AddInParameter(cmd, "@CollectionMonth", DbType.Int64, entity.CollectionMonth);
            if (entity.CollCollectionYear.HasValue)
                Database.AddInParameter(cmd, "@CollCollectionYear", DbType.Int64, entity.CollCollectionYear);
            if (entity.CollOrganizationID.HasValue)
                Database.AddInParameter(cmd, "@CollOrganizationID", DbType.Int64, entity.CollOrganizationID);
            if (entity.DivisionID.HasValue)
                Database.AddInParameter(cmd, "@DivisionID", DbType.Int64, entity.DivisionID);
            if (entity.DistrictID.HasValue)
                Database.AddInParameter(cmd, "@DistrictID", DbType.Int64, entity.DistrictID);
            if (entity.UpazilaID.HasValue)
                Database.AddInParameter(cmd, "@UpazilaID", DbType.Int64, entity.UpazilaID);
            if (entity.UnionID.HasValue)
                Database.AddInParameter(cmd, "@UnionID", DbType.Int64, entity.UnionID);
            if (entity.ActKhaLand.HasValue)
                Database.AddInParameter(cmd, "@ActKhaLand", DbType.Boolean, entity.ActKhaLand);
            if (entity.ActKhaWater.HasValue)
                Database.AddInParameter(cmd, "@ActKhaWater", DbType.Boolean, entity.ActKhaWater);
            if (entity.ActAdibasi.HasValue)
                Database.AddInParameter(cmd, "@ActAdibasi", DbType.Boolean, entity.ActAdibasi);
            if (entity.ActLanServey.HasValue)
                Database.AddInParameter(cmd, "@ActLanServey", DbType.Boolean, entity.ActLanServey);
            if (entity.ActAwareness.HasValue)
                Database.AddInParameter(cmd, "@ActAwareness", DbType.Boolean, entity.ActAwareness);
            if (entity.ActVestedProp.HasValue)
                Database.AddInParameter(cmd, "@ActVestedProp", DbType.Boolean, entity.ActVestedProp);

            if (entity.TotalKhasLandGov11.HasValue)
                Database.AddInParameter(cmd, "@TotalKhasLandGov11", DbType.Decimal, entity.TotalKhasLandGov11);
            if (entity.DistributedKhasLandGov12.HasValue)
                Database.AddInParameter(cmd, "@DistributedKhasLandGov12", DbType.Decimal, entity.DistributedKhasLandGov12);
            if (entity.DistributableKhasLandGov13.HasValue)
                Database.AddInParameter(cmd, "@DistributableKhasLandGov13", DbType.Decimal, entity.DistributableKhasLandGov13);
            if (entity.TotalLandlessFamilyGov14.HasValue)
                Database.AddInParameter(cmd, "@TotalLandlessFamilyGov14", DbType.Decimal, entity.TotalLandlessFamilyGov14);
            if (entity.NoOfFamilyGotKhasLandGov15.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyGotKhasLandGov15", DbType.Decimal, entity.NoOfFamilyGotKhasLandGov15);
            if (entity.IllegalOccupiedKhasLandGov16.HasValue)
                Database.AddInParameter(cmd, "@IllegalOccupiedKhasLandGov16", DbType.Decimal, entity.IllegalOccupiedKhasLandGov16);
            if (entity.TotalKhasLandOrg21.HasValue)
                Database.AddInParameter(cmd, "@TotalKhasLandOrg21", DbType.Decimal, entity.TotalKhasLandOrg21);
            if (entity.DistributedKhasLandOrg22.HasValue)
                Database.AddInParameter(cmd, "@DistributedKhasLandOrg22", DbType.Decimal, entity.DistributedKhasLandOrg22);
            if (entity.DistributableKhasLandOrg23.HasValue)
                Database.AddInParameter(cmd, "@DistributableKhasLandOrg23", DbType.Decimal, entity.DistributableKhasLandOrg23);
            if (entity.TotalLandlessFamilyOrg24.HasValue)
                Database.AddInParameter(cmd, "@TotalLandlessFamilyOrg24", DbType.Decimal, entity.TotalLandlessFamilyOrg24);
            if (entity.NoOfFamilyGotKhasLandOrg25.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyGotKhasLandOrg25", DbType.Decimal, entity.NoOfFamilyGotKhasLandOrg25);
            if (entity.NoOfFamilyEvictedKhasLandOrg26.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyEvictedKhasLandOrg26", DbType.Decimal, entity.NoOfFamilyEvictedKhasLandOrg26);
            if (entity.NoOfViolenceKhasLandOrg27.HasValue)
                Database.AddInParameter(cmd, "@NoOfViolenceKhasLandOrg27", DbType.Decimal, entity.NoOfViolenceKhasLandOrg27);
            if (entity.NoOfLitigationKhasLandOrg28.HasValue)
                Database.AddInParameter(cmd, "@NoOfLitigationKhasLandOrg28", DbType.Decimal, entity.NoOfLitigationKhasLandOrg28);
            if (entity.NoOfInitiativeGathOrg29.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeGathOrg29", DbType.Int64, entity.NoOfInitiativeGathOrg29);
            if (entity.NoOfInitiativeRallyOrg29.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeRallyOrg29", DbType.Int64, entity.NoOfInitiativeRallyOrg29);
            if (entity.NoOfInitiativeMemoOrg29.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeMemoOrg29", DbType.Int64, entity.NoOfInitiativeMemoOrg29);
            if (entity.NoOfInitiativeLegalOrg29.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeLegalOrg29", DbType.Int64, entity.NoOfInitiativeLegalOrg29);
            if (entity.NoOfInitiativeMeetOrg29.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeMeetOrg29", DbType.Int64, entity.NoOfInitiativeMeetOrg29);
            if (entity.NoOfInitiativeOthOrg29.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeOthOrg29", DbType.Int64, entity.NoOfInitiativeOthOrg29);
            if (entity.TotalLess20KhasWaterGov31.HasValue)
                Database.AddInParameter(cmd, "@TotalLess20KhasWaterGov31", DbType.Decimal, entity.TotalLess20KhasWaterGov31);
            if (entity.TotalMore20KhasWaterGov32.HasValue)
                Database.AddInParameter(cmd, "@TotalMore20KhasWaterGov32", DbType.Decimal, entity.TotalMore20KhasWaterGov32);
            if (entity.TotalLeaseLess20KhasWaterGov33.HasValue)
                Database.AddInParameter(cmd, "@TotalLeaseLess20KhasWaterGov33", DbType.Decimal, entity.TotalLeaseLess20KhasWaterGov33);
            if (entity.TotalLeaseMore20KhasWaterGov34.HasValue)
                Database.AddInParameter(cmd, "@TotalLeaseMore20KhasWaterGov34", DbType.Decimal, entity.TotalLeaseMore20KhasWaterGov34);
            if (entity.TotalLess20KhasWaterOrg41.HasValue)
                Database.AddInParameter(cmd, "@TotalLess20KhasWaterOrg41", DbType.Decimal, entity.TotalLess20KhasWaterOrg41);
            if (entity.TotalMore20KhasWaterOrg42.HasValue)
                Database.AddInParameter(cmd, "@TotalMore20KhasWaterOrg42", DbType.Decimal, entity.TotalMore20KhasWaterOrg42);
            if (entity.TotalLeaseLess20KhasWaterOrg43.HasValue)
                Database.AddInParameter(cmd, "@TotalLeaseLess20KhasWaterOrg43", DbType.Decimal, entity.TotalLeaseLess20KhasWaterOrg43);
            if (entity.TotalLeaseMore20KhasWaterOrg44.HasValue)
                Database.AddInParameter(cmd, "@TotalLeaseMore20KhasWaterOrg44", DbType.Decimal, entity.TotalLeaseMore20KhasWaterOrg44);
            if (entity.NoOfFamilyFishingOrg45.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyFishingOrg45", DbType.Decimal, entity.NoOfFamilyFishingOrg45);
            if (entity.NoOfRegFisherFolkCoOrg46.HasValue)
                Database.AddInParameter(cmd, "@NoOfRegFisherFolkCoOrg46", DbType.Decimal, entity.NoOfRegFisherFolkCoOrg46);
            if (entity.NoOfFisherFolkCoOrg47.HasValue)
                Database.AddInParameter(cmd, "@NoOfFisherFolkCoOrg47", DbType.Decimal, entity.NoOfFisherFolkCoOrg47);
            if (entity.NoOfLitigationKhasWaterOrg48.HasValue)
                Database.AddInParameter(cmd, "@NoOfLitigationKhasWaterOrg48", DbType.Decimal, entity.NoOfLitigationKhasWaterOrg48);
            if (entity.NoOfMovKhasWaterOrg49.HasValue)
                Database.AddInParameter(cmd, "@NoOfMovKhasWaterOrg49", DbType.Decimal, entity.NoOfMovKhasWaterOrg49);
            if (entity.NoOfCaseEvictionKhasWaterOrg410.HasValue)
                Database.AddInParameter(cmd, "@NoOfCaseEvictionKhasWaterOrg410", DbType.Decimal, entity.NoOfCaseEvictionKhasWaterOrg410);
            if (entity.NoOfInitiativeGathOrg411.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeGathOrg411", DbType.Decimal, entity.NoOfInitiativeGathOrg411);
            if (entity.NoOfInitiativeRallyOrg411.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeRallyOrg411", DbType.Decimal, entity.NoOfInitiativeRallyOrg411);
            if (entity.NoOfInitiativeMemoOrg411.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeMemoOrg411", DbType.Decimal, entity.NoOfInitiativeMemoOrg411);
            if (entity.NoOfInitiativeLegalOrg411.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeLegalOrg411", DbType.Decimal, entity.NoOfInitiativeLegalOrg411);
            if (entity.NoOfInitiativeMeetOrg411.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeMeetOrg411", DbType.Decimal, entity.NoOfInitiativeMeetOrg411);
            if (entity.NoOfInitiativeOthOrg411.HasValue)
                Database.AddInParameter(cmd, "@NoOfInitiativeOthOrg411", DbType.Decimal, entity.NoOfInitiativeOthOrg411);
            if (entity.TotalLand51.HasValue)
                Database.AddInParameter(cmd, "@TotalLand51", DbType.Decimal, entity.TotalLand51);
            if (entity.TotalPrivateProp52.HasValue)
                Database.AddInParameter(cmd, "@TotalPrivateProp52", DbType.Decimal, entity.TotalPrivateProp52);
            if (entity.TotalAgriLand53.HasValue)
                Database.AddInParameter(cmd, "@TotalAgriLand53", DbType.Decimal, entity.TotalAgriLand53);
            if (entity.TotalNonAgriLand54.HasValue)
                Database.AddInParameter(cmd, "@TotalNonAgriLand54", DbType.Decimal, entity.TotalNonAgriLand54);
            if (entity.TotalForestLand55.HasValue)
                Database.AddInParameter(cmd, "@TotalForestLand55", DbType.Decimal, entity.TotalForestLand55);
            if (entity.TotalCommLan56.HasValue)
                Database.AddInParameter(cmd, "@TotalCommLan56", DbType.Decimal, entity.TotalCommLan56);
            if (entity.TotalAgriCommLastYear57.HasValue)
                Database.AddInParameter(cmd, "@TotalAgriCommLastYear57", DbType.Decimal, entity.TotalAgriCommLastYear57);
            if (entity.TotalAgriComm58.HasValue)
                Database.AddInParameter(cmd, "@TotalAgriComm58", DbType.Decimal, entity.TotalAgriComm58);
            if (entity.NoOfFamilyAgriComm59.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyAgriComm59", DbType.Decimal, entity.NoOfFamilyAgriComm59);
            if (entity.TotalCharLand510.HasValue)
                Database.AddInParameter(cmd, "@TotalCharLand510", DbType.Decimal, entity.TotalCharLand510);
            if (entity.NatAgriCommTobacco511.HasValue)
                Database.AddInParameter(cmd, "@NatAgriCommTobacco511", DbType.Decimal, entity.NatAgriCommTobacco511);
            if (entity.NatAgriCommRubber511.HasValue)
                Database.AddInParameter(cmd, "@NatAgriCommRubber511", DbType.Decimal, entity.NatAgriCommRubber511);
            if (entity.NatAgriCommBricks511.HasValue)
                Database.AddInParameter(cmd, "@NatAgriCommBricks511", DbType.Decimal, entity.NatAgriCommBricks511);
            if (entity.NatAgriCommIndustry511.HasValue)
                Database.AddInParameter(cmd, "@NatAgriCommIndustry511", DbType.Decimal, entity.NatAgriCommIndustry511);
            if (entity.CreatedBy.HasValue)
                Database.AddInParameter(cmd, "@CreatedBy", DbType.Int64, entity.CreatedBy);
            if (entity.CreatedOn.HasValue)
                Database.AddInParameter(cmd, "@CreatedOn", DbType.DateTime, entity.CreatedOn);
            if (entity.UpdatedBy.HasValue)
                Database.AddInParameter(cmd, "@UpdatedBy", DbType.Int64, entity.UpdatedBy);
            if (entity.UpdatedOn.HasValue)
                Database.AddInParameter(cmd, "@UpdatedOn", DbType.DateTime, entity.UpdatedOn); 

        }
        #endregion

        #region Save Update Delete List Single Entity

        long IALRD_OrganizationDataDao.Delete(ALRD_OrganizationDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_organizationdata_Delete";

            using (DbCommand cmd = Database.GetStoredProcCommand(SP))
            {
                FillParameters(entity, cmd, Database, true);
                //FillSequrityParameters(securityCapsule, cmd, OparationType.Update, Database);
                AddOutputParameter(cmd);
                try
                {
                    returnCode = Database.ExecuteNonQuery(cmd);//Convert.ToInt64(cmd.Parameters["@RETURN_KEY"].Value);
                }
                catch (Exception ex)
                {
                    throw GetDataAccessException(ex, SourceOfException("Delete"));
                }
            }
            return returnCode;
        }

        long IALRD_OrganizationDataDao.Update(ALRD_OrganizationDataEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_organizationdata_Update";
            else
                SP = "alrd_organizationdata_PertialUpdate";

            using (DbCommand cmd = Database.GetStoredProcCommand(SP))
            {
                FillParameters(entity, cmd, Database);
                //FillSequrityParameters(securityCapsule, cmd, OparationType.Update, Database);
                AddOutputParameter(cmd);
                try
                {
                    returnCode = Database.ExecuteNonQuery(cmd);
                }
                catch (Exception ex)
                {
                    throw GetDataAccessException(ex, SourceOfException("Update"));
                }
            }
            return returnCode;
        }

        long IALRD_OrganizationDataDao.Add(ALRD_OrganizationDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_organizationdata_Insert";

            using (DbCommand cmd = Database.GetStoredProcCommand(SP))
            {
                FillParameters(entity, cmd, Database);
                //FillSequrityParameters(securityCapsule, cmd, OparationType.Save, Database);
                AddOutputParameter(cmd);
                try
                {
                    returnCode = Database.ExecuteNonQuery(cmd); // GetReturnCodeFromParameter(cmd);
                    if (returnCode == 1)
                        returnCode = Convert.ToInt64(cmd.Parameters["@RETURN_KEY"].Value);
                    else
                        returnCode = -99;
                }
                catch (Exception ex)
                {
                    throw GetDataAccessException(ex, SourceOfException("Add"));
                }
            }
            return returnCode;
        }

        long IALRD_OrganizationDataDao.SaveList(IList<ALRD_OrganizationDataEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_organizationdata_Insert";
            const string SPUpdate = "alrd_organizationdata_Update";
            const string SPDelete = "alrd_organizationdata_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_OrganizationDataEntity> listAdded = new List<ALRD_OrganizationDataEntity>();
                IList<ALRD_OrganizationDataEntity> listUpdated = new List<ALRD_OrganizationDataEntity>();
                IList<ALRD_OrganizationDataEntity> listDeleted = new List<ALRD_OrganizationDataEntity>();

                foreach (ALRD_OrganizationDataEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_OrganizationDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_OrganizationDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_OrganizationDataEntity entity in listDeleted)
                    {
                        using (DbCommand cmd = db.GetStoredProcCommand(SPDelete))
                        {
                            FillParameters(entity, cmd, db, true);
                            AddOutputParameter(cmd, db);
                            returnCode = db.ExecuteNonQuery(cmd, transaction);
                            if (returnCode < 0)
                            {
                                throw new ArgumentException("Error in transaction.");
                            }
                        }
                    }
                }
                if (listUpdated.Count > 0)
                {
                    foreach (ALRD_OrganizationDataEntity entity in listUpdated)
                    {
                        using (DbCommand cmd = db.GetStoredProcCommand(SPUpdate))
                        {
                            FillParameters(entity, cmd, db);
                            AddOutputParameter(cmd, db);
                            returnCode = db.ExecuteNonQuery(cmd, transaction);
                            if (returnCode < 0)
                            {
                                throw new ArgumentException("Error in transaction.");
                            }
                        }
                    }
                }
                if (listAdded.Count > 0)
                {
                    foreach (ALRD_OrganizationDataEntity entity in listAdded)
                    {
                        using (DbCommand cmd = db.GetStoredProcCommand(SPInsert))
                        {
                            FillParameters(entity, cmd, db);
                            AddOutputParameter(cmd, db);
                            returnCode = db.ExecuteNonQuery(cmd, transaction);
                            if (returnCode < 0)
                            {
                                throw new ArgumentException("Error in transaction.");
                            }
                        }
                    }
                }

                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw GetDataAccessException(ex, SourceOfException("SaveList"));
            }
            finally
            {
                transaction.Dispose();
                connection.Close();
                connection = null;
            }
            return returnCode;
        }

        #endregion Save Update Delete List

        #region GetAll

        IList<ALRD_OrganizationDataEntity> IALRD_OrganizationDataDao.GetAll(ALRD_OrganizationDataEntity entity)
        {
            try
            {
                const string SP = "alrd_organizationdata_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_OrganizationDataEntity> itemList = new List<ALRD_OrganizationDataEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_OrganizationDataEntity(reader));
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
