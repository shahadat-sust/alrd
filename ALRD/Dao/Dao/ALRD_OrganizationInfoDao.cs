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
    public partial class ALRD_OrganizationInfoDao : BaseDao, IALRD_OrganizationInfoDao
    {

        #region Constructors

        private string ClassName = "ALRD_OrganizationInfoDao";

        public ALRD_OrganizationInfoDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion


        #region FillParameters
        public static void FillParameters(ALRD_OrganizationInfoEntity entity, DbCommand cmd, Database Database, bool forDelete = false)
        {
            if (entity.COMPID.HasValue)
                Database.AddInParameter(cmd, "@COMPID", DbType.Int64, entity.COMPID);
            if (forDelete) return;
            if (!(string.IsNullOrEmpty(entity.DESCRIPT)))
                Database.AddInParameter(cmd, "@DESCRIPT", DbType.String, entity.DESCRIPT);
            if (entity.Status.HasValue)
                Database.AddInParameter(cmd, "@Status", DbType.Boolean, entity.Status);
            if (!(string.IsNullOrEmpty(entity.NameOfCEO)))
                Database.AddInParameter(cmd, "@NameOfCEO", DbType.String, entity.NameOfCEO);
            if (!(string.IsNullOrEmpty(entity.TelephoneNo)))
                Database.AddInParameter(cmd, "@TelephoneNo", DbType.String, entity.TelephoneNo);
            if (!(string.IsNullOrEmpty(entity.MobileNo)))
                Database.AddInParameter(cmd, "@MobileNo", DbType.String, entity.MobileNo);
            if (!(string.IsNullOrEmpty(entity.Email)))
                Database.AddInParameter(cmd, "@Email", DbType.String, entity.Email);
            if (!(string.IsNullOrEmpty(entity.WebSite)))
                Database.AddInParameter(cmd, "@WebSite", DbType.String, entity.WebSite);
            if (!(string.IsNullOrEmpty(entity.Fax)))
                Database.AddInParameter(cmd, "@Fax", DbType.String, entity.Fax);
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

        long IALRD_OrganizationInfoDao.Delete(ALRD_OrganizationInfoEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_organizationinfo_Delete";

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

        long IALRD_OrganizationInfoDao.Update(ALRD_OrganizationInfoEntity entity, bool isPertial = false)
        {
            long returnCode = -99;

            string SP;
            if (!isPertial)
                SP = "alrd_organizationinfo_Update";
            else
                SP = "alrd_organizationinfo_PertialUpdate";

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

        long IALRD_OrganizationInfoDao.Add(ALRD_OrganizationInfoEntity entity)
        {
            long returnCode = -99;
            const string SP = "alrd_organizationinfo_Insert";

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

        long IALRD_OrganizationInfoDao.SaveList(IList<ALRD_OrganizationInfoEntity> list)
        {
            long returnCode = -99;

            const string SPInsert = "alrd_organizationinfo_Insert";
            const string SPUpdate = "alrd_organizationinfo_Update";
            const string SPDelete = "alrd_organizationinfo_Delete";

            Database db = DatabaseFactory.CreateDatabase();
            DbConnection connection = db.CreateConnection();
            connection.Open();
            DbTransaction transaction = connection.BeginTransaction();

            try
            {
                IList<ALRD_OrganizationInfoEntity> listAdded = new List<ALRD_OrganizationInfoEntity>();
                IList<ALRD_OrganizationInfoEntity> listUpdated = new List<ALRD_OrganizationInfoEntity>();
                IList<ALRD_OrganizationInfoEntity> listDeleted = new List<ALRD_OrganizationInfoEntity>();

                foreach (ALRD_OrganizationInfoEntity item in list){if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Added) { listAdded.Add(item); }}
                foreach (ALRD_OrganizationInfoEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Changed) { listUpdated.Add(item); } }
                foreach (ALRD_OrganizationInfoEntity item in list) { if (item.CurrentState == SH.Entity.BaseEntity.EntityState.Deleted) { listDeleted.Add(item); } }

                if (listDeleted.Count > 0)
                {
                    foreach (ALRD_OrganizationInfoEntity entity in listDeleted)
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
                    foreach (ALRD_OrganizationInfoEntity entity in listUpdated)
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
                    foreach (ALRD_OrganizationInfoEntity entity in listAdded)
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

        IList<ALRD_OrganizationInfoEntity> IALRD_OrganizationInfoDao.GetAll(ALRD_OrganizationInfoEntity entity)
        {
            try
            {
                const string SP = "alrd_organizationinfo_GetAll";
                using (DbCommand cmd = Database.GetStoredProcCommand(SP))
                {
                    AddSortExpressionParameter(cmd, entity.SortExpression);
                    FillParameters(entity, cmd, Database);

                    IList<ALRD_OrganizationInfoEntity> itemList = new List<ALRD_OrganizationInfoEntity>();
                    using (IDataReader reader = Database.ExecuteReader(cmd))
                    {
                        while (reader.Read())
                        {
                            itemList.Add(new ALRD_OrganizationInfoEntity(reader));
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
