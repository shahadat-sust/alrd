using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SH.Entity;
using System.Data;
using System.Diagnostics;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.SqlClient;

namespace SH.Dao
{
    public abstract class BaseDao : MarshalByRefObject, IDisposable
    {
        public enum OparationType
        {
            Save = 0,
            Update = 1
        }

        #region Instance Variables

        private Database _db;
        private bool _isDisposed;

        #endregion Instance Variables

        #region Properties



        protected virtual Database Database
        {
            [DebuggerStepThrough()]
            get
            {
                if (_db == null)
                {
                    _db = DatabaseFactory.CreateDatabase();
                }

                return _db;
            }
        }

        #endregion Properties

        #region Constructer & Destructer

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_isDisposed)
            {
                if (disposing)
                {
                }
            }

            _isDisposed = true;
        }

        ~BaseDao()
        {
            Dispose(false);
        }

        #endregion Constructer & Destructer


        #region Protected Methods

        //protected void FillSequrityParameters(SecurityCapsule securityCapsule, DbCommand cmd, OparationType ot, Database database, DateTime? dt = null)
        //{
        //    if (ot == OparationType.Save)
        //    {
        //        database.AddInParameter(cmd, "@EntryUserKey", DbType.Int64, securityCapsule.entryuserkey);
        //        database.AddInParameter(cmd, "@EntryDate", DbType.DateTime, dt.HasValue ? dt : DateTime.Now);
        //    }
        //    if (ot == OparationType.Update)
        //    {
        //        database.AddInParameter(cmd, "@LastUpdateUserKey", DbType.Int64, securityCapsule.entryuserkey);
        //        database.AddInParameter(cmd, "@LastUpdateDate", DbType.DateTime, dt.HasValue ? dt : DateTime.Now);
        //    }
        //    database.AddInParameter(cmd, "@FormID", DbType.Int64, securityCapsule.formid);
        //}

        //protected void AddSequrityParameters(BaseEntity entity, DbCommand cmd, Database database)
        //{
        //    if (entity.entryuserkey.HasValue) database.AddInParameter(cmd, "@EntryUserKey", DbType.Int64, entity.entryuserkey);
        //    if (entity.entryuserkey.HasValue) database.AddInParameter(cmd, "@EntryDate", DbType.DateTime, entity.entrydate);
        //    if (entity.entryuserkey.HasValue) database.AddInParameter(cmd, "@LastUpdateUserKey", DbType.Int64, entity.entryuserkey);
        //    if (entity.entryuserkey.HasValue) database.AddInParameter(cmd, "@LastUpdateDate", DbType.DateTime, entity.lastupdatedate);
        //    if (entity.entryuserkey.HasValue) database.AddInParameter(cmd, "@FormID", DbType.Int64, entity.formid);
        //}



        [DebuggerStepThrough()]
        protected void AddOutputParameter(DbCommand command)
        {
            Database.AddOutParameter(command, "@RETURN_KEY", DbType.Int64, 8);
        }

        [DebuggerStepThrough()]
        protected void AddOptionParameter(DbCommand command, int Option)
        {
            Database.AddInParameter(command, "@Option", DbType.Int32, Option);
        }

        [DebuggerStepThrough()]
        protected void AddCurrentPageParameter(DbCommand command, int CurrentPage)
        {
            Database.AddInParameter(command, "@CurrentPage", DbType.Int32, CurrentPage);
        }

        [DebuggerStepThrough()]
        protected void AddPageSizeParameter(DbCommand command, int PageSize)
        {
            Database.AddInParameter(command, "@PageSize", DbType.Int32, PageSize);
        }

        [DebuggerStepThrough()]
        protected void AddSortExpressionParameter(DbCommand command, string SortExpression)
        {
            Database.AddInParameter(command, "@SortExpression", DbType.String, SortExpression);
        }

        [DebuggerStepThrough()]
        protected void AddTotalRecordParameter(DbCommand command)
        {
            Database.AddOutParameter(command, "@TotalRecord", DbType.Int64, 8);
        }

        [DebuggerStepThrough()]
        protected void AddEntryDateParameter(DbCommand command)
        {
            //  DateTime defaultDate = new DateTime(1754, 1, 1);
            Database.AddInParameter(command, "@EntryDate", DbType.DateTime, DateTime.Now);
        }

        [DebuggerStepThrough()]
        protected void AddLastUpdateDateParameter(DbCommand command)
        {
            //  DateTime defaultDate = new DateTime(1754, 1, 1);
            Database.AddInParameter(command, "@LastUpdateDate", DbType.DateTime, DateTime.Now);
        }

        [DebuggerStepThrough()]
        protected void AddNullTsParameter(DbCommand command)
        {
            Database.AddInParameter(command, "@Ts", DbType.Int64, 0);
        }

        [DebuggerStepThrough()]
        protected void AddNullPrimaryKeyParameter(DbCommand command, string KeyName)
        {
            Database.AddInParameter(command, "@" + KeyName.ToString(), DbType.Int64, 0);
        }


        // FOR TRANSACTION OPEN DB

        [DebuggerStepThrough()]
        protected void AddOutputParameter(DbCommand command, Database db)
        {
            db.AddOutParameter(command, "@RETURN_KEY", DbType.Int64, 8);
        }

        [DebuggerStepThrough()]
        protected void AddOptionParameter(DbCommand command, int Option, Database db)
        {
            db.AddInParameter(command, "@Option", DbType.Int32, Option);
        }

        [DebuggerStepThrough()]
        protected void AddCurrentPageParameter(DbCommand command, int CurrentPage, Database db)
        {
            db.AddInParameter(command, "@CurrentPage", DbType.Int32, CurrentPage);
        }

        [DebuggerStepThrough()]
        protected void AddPageSizeParameter(DbCommand command, int PageSize, Database db)
        {
            db.AddInParameter(command, "@PageSize", DbType.Int32, PageSize);
        }

        [DebuggerStepThrough()]
        protected void AddSortExpressionParameter(DbCommand command, string SortExpression, Database db)
        {
            db.AddInParameter(command, "@SortExpression", DbType.String, SortExpression);
        }

        [DebuggerStepThrough()]
        protected void AddEntryDateParameter(DbCommand command, Database db)
        {
            DateTime defaultDate = new DateTime(1754, 1, 1);
            db.AddInParameter(command, "@EntryDate", DbType.String, defaultDate.ToString());
        }

        [DebuggerStepThrough()]
        protected void AddNullTsParameter(DbCommand command, Database db)
        {
            db.AddInParameter(command, "@Ts", DbType.Int64, 0);
        }

        protected void AddNullPrimaryKeyParameter(DbCommand command, string KeyName, Database db)
        {
            db.AddInParameter(command, "@" + KeyName.ToString(), DbType.Int64, -99);
        }

        protected void AddFromDateParameter(DbCommand command, string KeyName, DateTime FromDate, Database db)
        {
            DateTime defaultDate = new DateTime(1754, 1, 1);
            if (FromDate == DateTime.Parse("1/1/0001"))
                FromDate = defaultDate;

            db.AddInParameter(command, "@" + KeyName.ToString(), DbType.DateTime, FromDate);
        }

        protected void AddToDateParameter(DbCommand command, string KeyName, DateTime ToDate, Database db)
        {
            DateTime defaultDate = new DateTime(1754, 1, 1);
            if (ToDate == DateTime.Parse("1/1/0001"))
                ToDate = defaultDate;
            db.AddInParameter(command, "@" + KeyName.ToString(), DbType.DateTime, ToDate);
        }

        //EntryDate

        #endregion Protected Methods

        #region Data Access Layer Exception

        protected virtual DataException GetDataAccessException(Exception ex, string SourceOfException)
        {
            DataException CustomEx = new DataException();
            string ErrorMessage = string.Empty;
            if (ex is System.Data.SqlClient.SqlException)
            {
                SqlException excep = ex as SqlException;

                switch (excep.Number)
                {
                    // Duplicate Value
                    case 2601:
                        {
                            ErrorMessage = "Duplicate value can not be saved.";
                            break;
                        }

                    // Reference
                    case 547:
                        {
                            ErrorMessage = "This reference is already in use. Data can not be deleted.";
                            break;
                        }
                    case 515:
                        {
                            ErrorMessage = "Can not insert null value.";
                            break;
                        }
                    case 8114:
                        {
                            ErrorMessage = "Exceeded value range";
                            break;
                        }
                    default:
                        {
                            ErrorMessage = ex.Message;// "An error occurred. Please contract with system admin.";
                            break;
                        }
                }

                CustomEx = new DataException(ErrorMessage);
                CustomEx.Source = "Data Access Layer";
            }
            else
            {
                ErrorMessage = ex.Message; //"An error occurred. Please contract with system admin.";
                CustomEx = new DataException(ErrorMessage);
                CustomEx.Source = "Data Access Layer";
            }
            throw CustomEx;
        }

        #endregion Data Access Layer Exception
    }
}
