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
    public partial class ALRD_GovernmentForestryBodyDataDao : BaseDao, IALRD_GovernmentForestryBodyDataDao
    {

        #region Constructors

        private string ClassName = "ALRD_GovernmentForestryBodyDataDao";

        public ALRD_GovernmentForestryBodyDataDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_GovernmentForestryBodyDataEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
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


           
            if (entity.TotalCurtailedAreaWoodlot.HasValue)
                Database.AddInParameter(cmd, "@TotalCurtailedAreaWoodlot", DbType.Decimal, entity.TotalCurtailedAreaWoodlot);
            if (entity.TotalCurtailedAreaAgri.HasValue)
                Database.AddInParameter(cmd, "@TotalCurtailedAreaAgri", DbType.Decimal, entity.TotalCurtailedAreaAgri);
            if (entity.TotalCurtailedAreaStrip.HasValue)
                Database.AddInParameter(cmd, "@TotalCurtailedAreaStrip", DbType.Decimal, entity.TotalCurtailedAreaStrip);
            if (entity.NoOfBeneficiary.HasValue)
                Database.AddInParameter(cmd, "@NoOfBeneficiary", DbType.Decimal, entity.NoOfBeneficiary);
            if (entity.MoneyDistributed.HasValue)
                Database.AddInParameter(cmd, "@MoneyDistributed", DbType.Decimal, entity.MoneyDistributed);
            
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

        long IALRD_GovernmentForestryBodyDataDao.Delete(ALRD_GovernmentForestryBodyDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_governmentforestrybodydata_Delete";

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

        long IALRD_GovernmentForestryBodyDataDao.Update(ALRD_GovernmentForestryBodyDataEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_governmentforestrybodydata_Update";
            else
                SP = "alrd_governmentforestrybodydata_PertialUpdate";

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

        long IALRD_GovernmentForestryBodyDataDao.Add(ALRD_GovernmentForestryBodyDataEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_governmentforestrybodydata_Insert";

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

        long IALRD_GovernmentForestryBodyDataDao.SaveList(IList<ALRD_GovernmentForestryBodyDataEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_governmentforestrybodydata_Insert";
            const string SPUpdate = "alrd_governmentforestrybodydata_Update";
            const string SPDelete = "alrd_governmentforestrybodydata_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_GovernmentForestryBodyDataEntity> listAdded = new List<ALRD_GovernmentForestryBodyDataEntity>();
                IList<ALRD_GovernmentForestryBodyDataEntity> listUpdated = new List<ALRD_GovernmentForestryBodyDataEntity>();
                IList<ALRD_GovernmentForestryBodyDataEntity> listDeleted = new List<ALRD_GovernmentForestryBodyDataEntity>();

                foreach (ALRD_GovernmentForestryBodyDataEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_GovernmentForestryBodyDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_GovernmentForestryBodyDataEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_GovernmentForestryBodyDataEntity entity in listDeleted)
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
                    foreach (ALRD_GovernmentForestryBodyDataEntity entity in listUpdated)
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
                    foreach (ALRD_GovernmentForestryBodyDataEntity entity in listAdded)
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

        IList<ALRD_GovernmentForestryBodyDataEntity> IALRD_GovernmentForestryBodyDataDao.GetAll(ALRD_GovernmentForestryBodyDataEntity entity)
        {
            try
            {
                const string SP = "alrd_governmentforestrybodydata_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_GovernmentForestryBodyDataEntity> itemList = new List<ALRD_GovernmentForestryBodyDataEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_GovernmentForestryBodyDataEntity(reader));
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
