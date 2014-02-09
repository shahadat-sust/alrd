using System.Data;
using System.Threading;
using System.Web;
using System;
using System.Globalization;
using System.Collections.Generic;
using SH.Entity;

namespace WebUI.HelperClass
{
    public class GlobalClass
    {

        /// <summary>
        /// AUTHENTICATION
        /// </summary>


        static public string _IsLogin = "IsLogin";
        static public string _UserID = "UserID";
        static public string _PublicUserID = "PublicUserID";
        static public string _UserRoleID = "UserRoleID";
        static public string _UserName = "UserName";
        static public string _Email = "Email";
        static public string _BlockIPAccess = "BlockIPAccess";
        static public string _BlockMacAccess = "BlockMacAccess";
        static public string _UserFullName = "UserFullName";
        static public string _UserShortName = "UserShortName";
        static public string _UserRolePermission = "UserRolePermission";

        public static bool IsLogin
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._IsLogin] == null)
                { return false; }
                else
                { return bool.Parse(HttpContext.Current.Session[GlobalClass._IsLogin].ToString()); }
            }
            set
            {
                HttpContext.Current.Session[GlobalClass._IsLogin] = value.ToString();
            }
        }
        public static long UserID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._UserID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._UserID] = value.ToString(); }
        }
        public static long PublicUserID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._PublicUserID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._PublicUserID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._PublicUserID] = value.ToString(); }
        }
        public static long UserRoleID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserRoleID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._UserRoleID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._UserRoleID] = value.ToString(); }
        }
        public static string UserName
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserName] == null)
                { return null; }
                else
                { return HttpContext.Current.Session[GlobalClass._UserName].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._UserName] = value.ToString(); }
        }
        public static string Email
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._Email] == null)
                { return null; }
                else
                { return HttpContext.Current.Session[GlobalClass._Email].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._Email] = value.ToString(); }
        }
        public static string BlockIPAccess
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._BlockIPAccess] == null)
                { return null; }
                else
                { return HttpContext.Current.Session[GlobalClass._BlockIPAccess].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._BlockIPAccess] = value.ToString(); }
        }
        public static string BlockMacAccess
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._BlockMacAccess] == null)
                { return null; }
                else
                { return HttpContext.Current.Session[GlobalClass._BlockMacAccess].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._BlockMacAccess] = value.ToString(); }
        }
        public static string UserFullName
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserFullName] == null)
                { return ""; }
                else
                { return HttpContext.Current.Session[GlobalClass._UserFullName].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._UserFullName] = value.ToString(); }
        }
        public static string UserShortName
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserShortName] == null)
                { return ""; }
                else
                { return HttpContext.Current.Session[GlobalClass._UserShortName].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._UserShortName] = value.ToString(); }
        }
        public static List<ALRD_SecurityRoleDetailEntity> UserRolePermission
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserRolePermission] == null)
                { return new List<ALRD_SecurityRoleDetailEntity>(); }
                else
                { return HttpContext.Current.Session[GlobalClass._UserRolePermission] as List<ALRD_SecurityRoleDetailEntity>; }
            }
            set
            {
                HttpContext.Current.Session[GlobalClass._UserRolePermission] = value;
            }
        }

        /// <summary>
        /// Form Session
        /// </summary>


        static public string _ID = "ID";
        static public string _GovtInfoID = "GovtInfoID";
        static public string _EncPin = "EncPin";
        static public string _AccountType = "AccountType";
        static public string _img = "";
        static public string _OrgDataID = "OrgDataID";
        static public string _UserRolePermissionEntity = "SecurityRolePermissionEntity";
        static public string _FormUserID = "FormUserID";

        public static long FormUserID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._FormUserID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._FormUserID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._FormUserID] = value.ToString(); }
        }

        public static long OrgDataID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._OrgDataID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._OrgDataID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._OrgDataID] = value.ToString(); }
        }
        

        
        public static string EncPin
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._EncPin] == null)
                { return ""; }
                else
                { return HttpContext.Current.Session[GlobalClass._EncPin].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._EncPin] = value.ToString(); }
        }
        public static string AccountType
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._AccountType] == null)
                { return ""; }
                else
                { return HttpContext.Current.Session[GlobalClass._AccountType].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._AccountType] = value.ToString(); }
        }
        public static string img
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._img] == null)
                { return null; }
                else
                { return HttpContext.Current.Session[GlobalClass._img].ToString(); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._img] = value.ToString(); }
        }
        public static long ID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._ID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._ID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._ID] = value.ToString(); }
        }

        public static long GovtInfoID
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._GovtInfoID] == null)
                { return -99; }
                else
                { return long.Parse(HttpContext.Current.Session[GlobalClass._GovtInfoID].ToString()); }
            }
            set
            { HttpContext.Current.Session[GlobalClass._GovtInfoID] = value.ToString(); }
        }
        public static ALRD_SecurityRoleDetailEntity UserRolePermissionEntity
        {
            get
            {
                if (HttpContext.Current.Session[GlobalClass._UserRolePermissionEntity] == null)
                { return new ALRD_SecurityRoleDetailEntity(); }
                else
                { return HttpContext.Current.Session[GlobalClass._UserRolePermissionEntity] as ALRD_SecurityRoleDetailEntity; }
            }
            set
            {
                HttpContext.Current.Session[GlobalClass._UserRolePermissionEntity] = value;
            }
        }


        private static Thread _executor;

        public static Thread Executor
        {
            get { return GlobalClass._executor; }
            set { GlobalClass._executor = value; }
        }

        
    }
}