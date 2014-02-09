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
    public partial class ALRD_SecurityUserDao : BaseDao, IALRD_SecurityUserDao
    {

        #region Constructors

        private string ClassName = "ALRD_SecurityUserDao";

        public ALRD_SecurityUserDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_SecurityUserEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
        {
            if (entity.COMPID.HasValue)
                Database.AddInParameter(cmd, "@COMPID", DbType.Int64, entity.COMPID);
            if (forDelete) return;
            if (entity.RoleID.HasValue)
                Database.AddInParameter(cmd, "@RoleID", DbType.Int64, entity.RoleID);
            if (entity.ProfileID.HasValue)
                Database.AddInParameter(cmd, "@ProfileID", DbType.Int64, entity.ProfileID);
            if (!(string.IsNullOrEmpty(entity.FullName)))
                Database.AddInParameter(cmd, "@FullName", DbType.String, entity.FullName);
            if (!(string.IsNullOrEmpty(entity.UserName)))
                Database.AddInParameter(cmd, "@UserName", DbType.String, entity.UserName);
            if (!(string.IsNullOrEmpty(entity.Password)))
                Database.AddInParameter(cmd, "@Password", DbType.String, entity.Password);
            if (!(string.IsNullOrEmpty(entity.BlockIPAccess)))
                Database.AddInParameter(cmd, "@BlockIPAccess", DbType.String, entity.BlockIPAccess);
            if (!(string.IsNullOrEmpty(entity.BlockMacAccess)))
                Database.AddInParameter(cmd, "@BlockMacAccess", DbType.String, entity.BlockMacAccess);
            if (!(string.IsNullOrEmpty(entity.AlternateEmail)))
                Database.AddInParameter(cmd, "@AlternateEmail", DbType.String, entity.AlternateEmail);
            if (entity.Status.HasValue)
                Database.AddInParameter(cmd, "@Status", DbType.Boolean, entity.Status);
            if (!(string.IsNullOrEmpty(entity.UserNameLike)))
                Database.AddInParameter(cmd, "@UserNameLike", DbType.String, entity.UserNameLike);
            if (entity.IsActivated.HasValue)
                Database.AddInParameter(cmd, "@IsActivated", DbType.Boolean, entity.IsActivated);
            if (!(string.IsNullOrEmpty(entity.ActivationKey)))
                Database.AddInParameter(cmd, "@ActivationKey", DbType.String, entity.ActivationKey);
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

        long IALRD_SecurityUserDao.Delete(ALRD_SecurityUserEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_securityuser_Delete";

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

        long IALRD_SecurityUserDao.Update(ALRD_SecurityUserEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_securityuser_Update";
            else
                SP = "alrd_securityuser_PertialUpdate";

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

        long IALRD_SecurityUserDao.Add(ALRD_SecurityUserEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_securityuser_Insert";

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

        long IALRD_SecurityUserDao.SaveList(IList<ALRD_SecurityUserEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_securityuser_Insert";
            const string SPUpdate = "alrd_securityuser_Update";
            const string SPDelete = "alrd_securityuser_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_SecurityUserEntity> listAdded = new List<ALRD_SecurityUserEntity>();
                IList<ALRD_SecurityUserEntity> listUpdated = new List<ALRD_SecurityUserEntity>();
                IList<ALRD_SecurityUserEntity> listDeleted = new List<ALRD_SecurityUserEntity>();

                foreach (ALRD_SecurityUserEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_SecurityUserEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_SecurityUserEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_SecurityUserEntity entity in listDeleted)
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
                    foreach (ALRD_SecurityUserEntity entity in listUpdated)
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
                    foreach (ALRD_SecurityUserEntity entity in listAdded)
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

        IList<ALRD_SecurityUserEntity> IALRD_SecurityUserDao.GetAll(ALRD_SecurityUserEntity entity)
        {
            try
            {
                const string SP = "alrd_securityuser_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_SecurityUserEntity> itemList = new List<ALRD_SecurityUserEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_SecurityUserEntity(reader));
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
