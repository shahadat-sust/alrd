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
    public partial class ALRD_SecurityRoleDetailDao : BaseDao, IALRD_SecurityRoleDetailDao
    {

        #region Constructors

        private string ClassName = "ALRD_SecurityRoleDetailDao";

        public ALRD_SecurityRoleDetailDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_SecurityRoleDetailEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
        {
            if (entity.COMPID.HasValue)
                Database.AddInParameter(cmd, "@COMPID", DbType.Int64, entity.COMPID);
            if (forDelete) return;
            if (entity.RoleID.HasValue)
                Database.AddInParameter(cmd, "@RoleID", DbType.Int64, entity.RoleID);
            if (entity.FormID.HasValue)
                Database.AddInParameter(cmd, "@FormID", DbType.Int64, entity.FormID);
            if (entity.CanInsert.HasValue)
                Database.AddInParameter(cmd, "@CanInsert", DbType.Boolean, entity.CanInsert);
            if (entity.CanUpdate.HasValue)
                Database.AddInParameter(cmd, "@CanUpdate", DbType.Boolean, entity.CanUpdate);
            if (entity.CanDelete.HasValue)
                Database.AddInParameter(cmd, "@CanDelete", DbType.Boolean, entity.CanDelete);
            if (entity.IsVisible.HasValue)
                Database.AddInParameter(cmd, "@IsVisible", DbType.Boolean, entity.IsVisible);
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

        long IALRD_SecurityRoleDetailDao.Delete(ALRD_SecurityRoleDetailEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_securityroledetail_Delete";

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

        long IALRD_SecurityRoleDetailDao.Update(ALRD_SecurityRoleDetailEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_securityroledetail_Update";
            else
                SP = "alrd_securityroledetail_PertialUpdate";

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

        long IALRD_SecurityRoleDetailDao.Add(ALRD_SecurityRoleDetailEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_securityroledetail_Insert";

            using (DbCommand cmd = Database.GetStoredProcCommand(SP))
            {
                FillParameters(entity, cmd, Database);
                //FillSequrityParameters(securityCapsule, cmd, OparationType.Save, Database);
                AddOutputParameter(cmd);
                try
                {
                    returnCode = Database.ExecuteNonQuery(cmd); // GetReturnCodeFromParameter(cmd);
                }
                catch (Exception ex)
                {
                    throw GetDataAccessException(ex, SourceOfException("Add"));
                }
            }
            return returnCode;
        }

        long IALRD_SecurityRoleDetailDao.SaveList(IList<ALRD_SecurityRoleDetailEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_securityroledetail_Insert";
            const string SPUpdate = "alrd_securityroledetail_Update";
            const string SPDelete = "alrd_securityroledetail_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_SecurityRoleDetailEntity> listAdded = new List<ALRD_SecurityRoleDetailEntity>();
                IList<ALRD_SecurityRoleDetailEntity> listUpdated = new List<ALRD_SecurityRoleDetailEntity>();
                IList<ALRD_SecurityRoleDetailEntity> listDeleted = new List<ALRD_SecurityRoleDetailEntity>();

                foreach (ALRD_SecurityRoleDetailEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_SecurityRoleDetailEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_SecurityRoleDetailEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_SecurityRoleDetailEntity entity in listDeleted)
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
                    foreach (ALRD_SecurityRoleDetailEntity entity in listUpdated)
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
                    foreach (ALRD_SecurityRoleDetailEntity entity in listAdded)
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

        IList<ALRD_SecurityRoleDetailEntity> IALRD_SecurityRoleDetailDao.GetAll(ALRD_SecurityRoleDetailEntity entity)
        {
            try
            {
                const string SP = "alrd_securityroledetail_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_SecurityRoleDetailEntity> itemList = new List<ALRD_SecurityRoleDetailEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_SecurityRoleDetailEntity(reader));
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

        IList<ALRD_SecurityRoleDetailEntity> IALRD_SecurityRoleDetailDao.GetAllByRoleID(ALRD_SecurityRoleDetailEntity entity)
        {
            try
            {
                const string SP = "alrd_securityroledetail_GetAllByRoleID";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    if (entity.RoleID.HasValue)
                        Database.AddInParameter(cmd, "@RoleID", DbType.Int64, entity.RoleID);

                    IList<ALRD_SecurityRoleDetailEntity> itemList = new List<ALRD_SecurityRoleDetailEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_SecurityRoleDetailEntity(reader));
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
