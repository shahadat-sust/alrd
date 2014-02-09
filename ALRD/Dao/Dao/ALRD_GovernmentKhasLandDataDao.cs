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
    public partial class ALRD_GovernmentKhasLandDataDao : BaseDao, IALRD_GovernmentKhasLandDataDao
    {

        #region Constructors

        private string ClassName = "ALRD_GovernmentKhasLandDataDao";

        public ALRD_GovernmentKhasLandDataDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_GovernmentKhasLandDataEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
        {
            if (entity.COMPID.HasValue)
                Database.AddInParameter(cmd, "@COMPID", DbType.Int64, entity.COMPID);
            if (forDelete) return;
            if (!(string.IsNullOrEmpty(entity.Remarks)))
                Database.AddInParameter(cmd, "@Remarks", DbType.String, entity.Remarks);
            if (entity.CollectionMonth.HasValue)
                Database.AddInParameter(cmd, "@CollectionMonth", DbType.Int64, entity.CollectionMonth);
            if (entity.CollCollectionYear.HasValue)
                Database.AddInParameter(cmd, "@CollCollectionYear", DbType.Int64, entity.CollCollectionYear);
            if (entity.DivisionID.HasValue)
                Database.AddInParameter(cmd, "@DivisionID", DbType.Int64, entity.DivisionID);
            if (entity.DistrictID.HasValue)
                Database.AddInParameter(cmd, "@DistrictID", DbType.Int64, entity.DistrictID);
            if (entity.UpazilaID.HasValue)
                Database.AddInParameter(cmd, "@UpazilaID", DbType.Int64, entity.UpazilaID);


            if (entity.TotalKhasLandAgri.HasValue)
                Database.AddInParameter(cmd, "@TotalKhasLandAgri", DbType.Decimal, entity.TotalKhasLandAgri);
            if (entity.TotalKhasLandNonAgri.HasValue)
                Database.AddInParameter(cmd, "@TotalKhasLandNonAgri", DbType.Decimal, entity.TotalKhasLandNonAgri);
            if (entity.DistributedKhasLandAgri.HasValue)
                Database.AddInParameter(cmd, "@DistributedKhasLandAgri", DbType.Decimal, entity.DistributedKhasLandAgri);
            if (entity.DistributedKhasLandNonAgri.HasValue)
                Database.AddInParameter(cmd, "@DistributedKhasLandNonAgri", DbType.Decimal, entity.DistributedKhasLandNonAgri);
            if (entity.DistributableKhasLandAgri.HasValue)
                Database.AddInParameter(cmd, "@DistributableKhasLandAgri", DbType.Decimal, entity.DistributableKhasLandAgri);
            if (entity.DistributableKhasLandNonAgri.HasValue)
                Database.AddInParameter(cmd, "@DistributableKhasLandNonAgri", DbType.Decimal, entity.DistributableKhasLandNonAgri);
            if (entity.NoOfFamilyGotKhasLandAgri.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyGotKhasLandAgri", DbType.Decimal, entity.NoOfFamilyGotKhasLandAgri);
            if (entity.NoOfFamilyGotKhasLandNonAgri.HasValue)
                Database.AddInParameter(cmd, "@NoOfFamilyGotKhasLandNonAgri", DbType.Decimal, entity.NoOfFamilyGotKhasLandNonAgri);
            if (entity.IllegalOccupiedKhasLandAgri.HasValue)
                Database.AddInParameter(cmd, "@IllegalOccupiedKhasLandAgri", DbType.Decimal, entity.IllegalOccupiedKhasLandAgri);
            if (entity.IllegalOccupiedKhasLandNonAgri.HasValue)
                Database.AddInParameter(cmd, "@IllegalOccupiedKhasLandNonAgri", DbType.Decimal, entity.IllegalOccupiedKhasLandNonAgri);
            if (entity.KhasLandWithSuitCaseAgri.HasValue)
                Database.AddInParameter(cmd, "@KhasLandWithSuitCaseAgri", DbType.Decimal, entity.KhasLandWithSuitCaseAgri);
            if (entity.KhasLandWithSuitCaseNonAgri.HasValue)
                Database.AddInParameter(cmd, "@KhasLandWithSuitCaseNonAgri", DbType.Decimal, entity.KhasLandWithSuitCaseNonAgri);
            
            
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

        long IALRD_GovernmentKhasLandDataDao.Delete(ALRD_GovernmentKhasLandDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_governmentkhaslanddata_Delete";

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

        long IALRD_GovernmentKhasLandDataDao.Update(ALRD_GovernmentKhasLandDataEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_governmentkhaslanddata_Update";
            else
                SP = "alrd_governmentkhaslanddata_PertialUpdate";

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

        long IALRD_GovernmentKhasLandDataDao.Add(ALRD_GovernmentKhasLandDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_governmentkhaslanddata_Insert";

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

        long IALRD_GovernmentKhasLandDataDao.SaveList(IList<ALRD_GovernmentKhasLandDataEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_governmentkhaslanddata_Insert";
            const string SPUpdate = "alrd_governmentkhaslanddata_Update";
            const string SPDelete = "alrd_governmentkhaslanddata_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_GovernmentKhasLandDataEntity> listAdded = new List<ALRD_GovernmentKhasLandDataEntity>();
                IList<ALRD_GovernmentKhasLandDataEntity> listUpdated = new List<ALRD_GovernmentKhasLandDataEntity>();
                IList<ALRD_GovernmentKhasLandDataEntity> listDeleted = new List<ALRD_GovernmentKhasLandDataEntity>();

                foreach (ALRD_GovernmentKhasLandDataEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_GovernmentKhasLandDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_GovernmentKhasLandDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_GovernmentKhasLandDataEntity entity in listDeleted)
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
                    foreach (ALRD_GovernmentKhasLandDataEntity entity in listUpdated)
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
                    foreach (ALRD_GovernmentKhasLandDataEntity entity in listAdded)
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

        IList<ALRD_GovernmentKhasLandDataEntity> IALRD_GovernmentKhasLandDataDao.GetAll(ALRD_GovernmentKhasLandDataEntity entity)
        {
            try
            {
                const string SP = "alrd_governmentkhaslanddata_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_GovernmentKhasLandDataEntity> itemList = new List<ALRD_GovernmentKhasLandDataEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_GovernmentKhasLandDataEntity(reader));
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
