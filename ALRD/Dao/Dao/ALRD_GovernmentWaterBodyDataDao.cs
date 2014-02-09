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
    public partial class ALRD_GovernmentWaterBodyDataDao : BaseDao, IALRD_GovernmentWaterBodyDataDao
    {

        #region Constructors

        private string ClassName = "ALRD_GovernmentWaterBodyDataDao";

        public ALRD_GovernmentWaterBodyDataDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_GovernmentWaterBodyDataEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
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


            
            if (entity.NoOfWaterBody20Under.HasValue)
                Database.AddInParameter(cmd, "@NoOfWaterBody20Under", DbType.Decimal, entity.NoOfWaterBody20Under);
            if (entity.NoOfWaterBody20Over.HasValue)
                Database.AddInParameter(cmd, "@NoOfWaterBody20Over", DbType.Decimal, entity.NoOfWaterBody20Over);
            if (entity.AreaOfWaterbody20Under.HasValue)
                Database.AddInParameter(cmd, "@AreaOfWaterbody20Under", DbType.Decimal, entity.AreaOfWaterbody20Under);
            if (entity.AreaOfWaterbody20Over.HasValue)
                Database.AddInParameter(cmd, "@AreaOfWaterbody20Over", DbType.Decimal, entity.AreaOfWaterbody20Over);
            
            
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

        long IALRD_GovernmentWaterBodyDataDao.Delete(ALRD_GovernmentWaterBodyDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_governmentwaterbodydata_Delete";

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

        long IALRD_GovernmentWaterBodyDataDao.Update(ALRD_GovernmentWaterBodyDataEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_governmentwaterbodydata_Update";
            else
                SP = "alrd_governmentwaterbodydata_PertialUpdate";

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

        long IALRD_GovernmentWaterBodyDataDao.Add(ALRD_GovernmentWaterBodyDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_governmentwaterbodydata_Insert";

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

        long IALRD_GovernmentWaterBodyDataDao.SaveList(IList<ALRD_GovernmentWaterBodyDataEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_governmentwaterbodydata_Insert";
            const string SPUpdate = "alrd_governmentwaterbodydata_Update";
            const string SPDelete = "alrd_governmentwaterbodydata_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_GovernmentWaterBodyDataEntity> listAdded = new List<ALRD_GovernmentWaterBodyDataEntity>();
                IList<ALRD_GovernmentWaterBodyDataEntity> listUpdated = new List<ALRD_GovernmentWaterBodyDataEntity>();
                IList<ALRD_GovernmentWaterBodyDataEntity> listDeleted = new List<ALRD_GovernmentWaterBodyDataEntity>();

                foreach (ALRD_GovernmentWaterBodyDataEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_GovernmentWaterBodyDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_GovernmentWaterBodyDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_GovernmentWaterBodyDataEntity entity in listDeleted)
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
                    foreach (ALRD_GovernmentWaterBodyDataEntity entity in listUpdated)
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
                    foreach (ALRD_GovernmentWaterBodyDataEntity entity in listAdded)
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

        IList<ALRD_GovernmentWaterBodyDataEntity> IALRD_GovernmentWaterBodyDataDao.GetAll(ALRD_GovernmentWaterBodyDataEntity entity)
        {
            try
            {
                const string SP = "alrd_governmentwaterbodydata_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_GovernmentWaterBodyDataEntity> itemList = new List<ALRD_GovernmentWaterBodyDataEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_GovernmentWaterBodyDataEntity(reader));
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
