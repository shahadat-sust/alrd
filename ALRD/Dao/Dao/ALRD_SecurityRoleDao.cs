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
    public partial class ALRD_SecurityRoleDao : BaseDao, IALRD_SecurityRoleDao
    {

        #region Constructors

        private string ClassName = "ALRD_SecurityRoleDao";

        public ALRD_SecurityRoleDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_SecurityRoleEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
        {
            if (entity.COMPID.HasValue)
                Database.AddInParameter(cmd, "@COMPID", DbType.Int64, entity.COMPID);
            if (forDelete) return;
            if (!(string.IsNullOrEmpty(entity.RoleName)))
                Database.AddInParameter(cmd, "@RoleName", DbType.String, entity.RoleName);
            if (!(string.IsNullOrEmpty(entity.ShortName)))
                Database.AddInParameter(cmd, "@ShortName", DbType.String, entity.ShortName);
            if (!(string.IsNullOrEmpty(entity.LongDescription)))
                Database.AddInParameter(cmd, "@LongDescription", DbType.String, entity.LongDescription);
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

        long IALRD_SecurityRoleDao.Delete(ALRD_SecurityRoleEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_securityrole_Delete";

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

        long IALRD_SecurityRoleDao.Update(ALRD_SecurityRoleEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_securityrole_Update";
            else
                SP = "alrd_securityrole_PertialUpdate";

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

        long IALRD_SecurityRoleDao.Add(ALRD_SecurityRoleEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_securityrole_Insert";

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

        long IALRD_SecurityRoleDao.SaveList(IList<ALRD_SecurityRoleEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_securityrole_Insert";
            const string SPUpdate = "alrd_securityrole_Update";
            const string SPDelete = "alrd_securityrole_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_SecurityRoleEntity> listAdded = new List<ALRD_SecurityRoleEntity>();
                IList<ALRD_SecurityRoleEntity> listUpdated = new List<ALRD_SecurityRoleEntity>();
                IList<ALRD_SecurityRoleEntity> listDeleted = new List<ALRD_SecurityRoleEntity>();

                foreach (ALRD_SecurityRoleEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_SecurityRoleEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_SecurityRoleEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_SecurityRoleEntity entity in listDeleted)
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
                    foreach (ALRD_SecurityRoleEntity entity in listUpdated)
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
                    foreach (ALRD_SecurityRoleEntity entity in listAdded)
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

        IList<ALRD_SecurityRoleEntity> IALRD_SecurityRoleDao.GetAll(ALRD_SecurityRoleEntity entity)
        {
            try
            {
                const string SP = "alrd_securityrole_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_SecurityRoleEntity> itemList = new List<ALRD_SecurityRoleEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_SecurityRoleEntity(reader));
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
