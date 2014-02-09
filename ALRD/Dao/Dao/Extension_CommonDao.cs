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
    public partial class Extension_CommonDao : BaseDao, IExtension_CommonDao
    {

        #region Constructors

        private string ClassName = "Extension_CommonDao";

        public Extension_CommonDao()
            : base()
        {

        }

        private string SourceOfException(string methodName)
        {
            return "Class name: " + ClassName + " and Method name: " + methodName;
        }

        #endregion

        #region GetAll

        //IList<Setup_Room_TypeEntity> IExtension_CommonDao.GetAll(Setup_Room_TypeEntity entity)
        //{
        //    try
        //    {
        //        const string SP = "setup_room_type_GetAll";
        //        using (DbCommand cmd = Database.GetStoredProcCommand(SP))
        //        {

        //            if (entity.Room_Type_ID.HasValue)
        //                Database.AddInParameter(cmd, "@Room_Type_ID", DbType.Int64, entity.Room_Type_ID);
        //            if (!(string.IsNullOrEmpty(entity.Room_Type_Name)))
        //                Database.AddInParameter(cmd, "@Room_Type_Name", DbType.String, entity.Room_Type_Name);

        //            IList<Setup_Room_TypeEntity> itemList = new List<Setup_Room_TypeEntity>();
        //            using (IDataReader reader = Database.ExecuteReader(cmd))
        //            {
        //                while (reader.Read())
        //                {
        //                    itemList.Add(new Setup_Room_TypeEntity(reader));
        //                }
        //            }
        //            return itemList;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw GetDataAccessException(ex, SourceOfException("GetAll"));
        //    }
        //}

        #endregion GetAll


    }
}
