using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using SH.Entity;
using System.Globalization;


namespace WebUI.HelperClass
{
    public abstract class BaseControl : System.Web.UI.UserControl
    {


        //static public string _ListOfPermissions = "ListOfPermissions";

        //public static List<Ex_ListOfPermissions> ListOfPermissions
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session[BaseControl._ListOfPermissions] == null)
        //        { return null; }
        //        else
        //        { return (List<Ex_ListOfPermissions>)HttpContext.Current.Session[BaseControl._ListOfPermissions]; }
        //    }
        //    set
        //    { HttpContext.Current.Session[BaseControl._ListOfPermissions] = value; }
        //}

        //static public string _PermissionList = "PermissionList";

        //public static List<FormPermissionByUserAndFormEntity> PermissionList
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session[BaseControl._PermissionList] == null)
        //        {
        //            return null;
        //        }
        //        else
        //        {
        //            return (List<FormPermissionByUserAndFormEntity>)HttpContext.Current.Session[BaseControl._PermissionList];
        //        }
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session[BaseControl._PermissionList] = value;
        //    }
        //}



        public void LoadComboRef(ref System.Web.UI.WebControls.DropDownList ddl, System.Data.DataTable dt, string DataCol, string ValueCol, string displayText = "<Please Select>")
        {
            if (dt == null)
            {
                ddl.Items.Clear();
                //ddl.DataSource = null;
                //ddl.DataBind();
                ddl.Items.Insert(0, new ListItem(displayText, "0"));
            }
            else
            {
                ddl.Items.Clear();
                ddl.DataSource = dt;
                ddl.DataTextField = DataCol;
                ddl.DataValueField = ValueCol;
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem(displayText, "0"));
            }
        }

        /// <summary>
        /// Bind property with a separator on DropDownList
        /// </summary>
        /// <typeparam name="T">Entity Type</typeparam>
        /// <param name="ddl">DropDownList Name</param>
        /// <param name="llist">List Of entity to bind</param>
        /// <param name="displayMember">Property of entity to display on the DropDownList</param>
        /// <param name="valueMember">Key Property of entity</param>
        /// <param name="isLower">Lower Case  Default true</param>
        /// <param name="displayText">Default unselected text</param>
        public void LoadComboRef<T>(ref System.Web.UI.WebControls.DropDownList ddl, List<T> llist, string displayMember, string valueMember, bool isLower = false, string displayText = "--Please Select--")
        {
            try
            {
                List<T> list = new List<T>(llist);
                if (list.Count == 0)
                {
                    ddl.DataSource = null;
                    ddl.DataBind();
                    return;
                }
                if (isLower)
                {
                    displayMember = displayMember.ToLower();
                    valueMember = valueMember.ToLower();
                }

                Type type = typeof(T);
                ddl.DataTextField = displayMember;
                ddl.DataValueField = valueMember;
                if (!string.IsNullOrEmpty(displayText))
                {
                    Object obj = Activator.CreateInstance(type);
                    PropertyInfo displayProperty = type.GetProperty(displayMember);
                    displayProperty.SetValue(obj, displayText, null);

                    PropertyInfo valueProperty = type.GetProperty(valueMember);
                    string typef = valueProperty.PropertyType.ToString();
                    switch (typef)
                    {
                        case "System.Nullable`1[System.Int32]":
                            valueProperty.SetValue(obj, 0, null);
                            break;

                        case "System.Nullable`1[System.Int64]":
                            valueProperty.SetValue(obj, long.Parse("0"), null);
                            break;

                        default:
                            valueProperty.SetValue(obj, 0, null);

                            break;
                    }

                    list.Insert(0, (T)obj);
                }

                //ddl.DataSource = null;
                //ddl.Items.Clear();
                ddl.DataSource = list;
                ddl.DataBind();
                if (!string.IsNullOrEmpty(displayText))
                    ddl.SelectedIndex = 0;
                else
                    ddl.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void LoadComboRefGrid<T>(ref System.Web.UI.WebControls.DropDownList ddl, List<T> list, string TextCol, string ValueCol, string firstItemText = "--Please Select--", bool isLower = false)
        {
            ddl.Items.Clear();
            ddl.Items.Add(new ListItem(firstItemText, "0"));

            if (isLower)
            {
                TextCol = TextCol.ToLower();
                ValueCol = ValueCol.ToLower();
            }
            if (list != null)
            {
                foreach (var item in list)
                {
                    ddl.Items.Add(new ListItem(item.GetType().GetProperty(TextCol).GetValue(item, null).ToString(), item.GetType().GetProperty(ValueCol).GetValue(item, null).ToString()));
                }
            }
        }


        public abstract string Error { set; }

        
        public virtual System.Web.UI.WebControls.Panel ClearControlStates(System.Web.UI.WebControls.Panel pnlCrtl)
        {
            //[DebuggerStepThrough]
            foreach (Control crtl in pnlCrtl.Controls)
            {
                switch (crtl.GetType().ToString())
                {
                    case "System.Web.UI.WebControls.CheckBox":
                        {
                            ((CheckBox)crtl).Checked = false;
                            break;
                        }
                    case "System.Web.UI.HtmlControls.HtmlTextArea":
                        {
                            ((HtmlTextArea)crtl).Value = "";
                            break;
                        }
                    case "System.Web.UI.WebControls.GridView":
                        {
                            ((GridView)crtl).DataSource = null;
                            ((GridView)crtl).DataBind();
                            break;
                        }
                    case "System.Web.UI.WebControls.TextBox":
                        {
                            if ((((TextBox)crtl).ReadOnly == false))
                            {
                                ((TextBox)crtl).Text = "";
                            }
                            break;
                        }
                    case "System.Web.UI.WebControls.DropDownList":
                        {
                            
                            if (((DropDownList)crtl).Enabled == true)
                                ((DropDownList)crtl).SelectedIndex = -1;
                            break;
                        }
                    case "System.Web.UI.WebControls.ListView":
                        {
                            ((ListView)crtl).DataSource = null;
                            ((ListView)crtl).DataBind();
                            break;
                        }
                    case "System.Web.UI.WebControls.ListBox":
                        {
                            ((ListBox)crtl).DataSource = null;
                            ((ListView)crtl).DataBind();
                            break;
                        }
                    case "System.Web.UI.WebControls.Label":
                        {
                            if ((((Label)crtl).CssClass.Contains("input")))
                            {
                                ((Label)crtl).Text = "";
                            }
                            break;
                        }
                    case "System.Web.UI.WebControls.HiddenField":
                        {
                            ((HiddenField)crtl).Value = "";
                            break;
                        }

                    //case "Framework.CKEditorControl":
                    //    {
                    //        ((Framework.CKEditorControl)crtl).Text = "";
                    //        break;
                    //    }
                    default:
                        {
                            break;
                        }
                }
            }

            return pnlCrtl;
        }

        public static DateTime? GetDateFromString(string date)
        {
            return date.Trim() != string.Empty ? DateTime.Parse(date.Trim(), new CultureInfo("fr-FR")) : (DateTime?)null;
        }
        public static string GetStringFromDate(DateTime? date)
        {
            if (date.HasValue)
                return date.Value.ToString("dd-MM-yyyy");
            else
                return "";

        }
        public void CheckFormPermission(long FormID = -99)
        {
            try
            {
                GlobalClass.UserRolePermissionEntity = GlobalClass.UserRolePermission != null ? GlobalClass.UserRolePermission.Where(P => P.FormID == FormID).FirstOrDefault() : null;
                if (!(GlobalClass.UserRolePermissionEntity != null && GlobalClass.UserRolePermissionEntity.IsVisible.HasValue && (bool)GlobalClass.UserRolePermissionEntity.IsVisible))
                    Response.Redirect("~/Pages/Consumer/ErrorPage.aspx", true);
            }
            catch (Exception ex)
            {
            }

        }

        public void CheckButtonPermission(Button btnSave = null, Button btnUpdate = null, Button btndelete = null, HyperLink lnkAddNew = null)
        {
            ALRD_SecurityRoleDetailEntity role = GlobalClass.UserRolePermissionEntity;
            if (btnSave != null && role != null)
            {
                if (role.CanInsert.HasValue && (bool)role.CanInsert)
                    btnSave.Visible = (bool)role.CanInsert;
                else
                    btnSave.Visible = false;
            }

            if (lnkAddNew != null && role != null)
            {
                if (role.CanInsert.HasValue && (bool)role.CanInsert)
                    lnkAddNew.Visible = (bool)role.CanInsert;
                else
                    lnkAddNew.Visible = false;
            }

            if (btnUpdate != null && role != null)
            {
                if (role.CanUpdate.HasValue && (bool)role.CanUpdate)
                    btnUpdate.Visible = (bool)role.CanUpdate;
                else
                    btnUpdate.Visible = false;
            }
            if (btndelete != null && role != null)
            {
                if (role.CanDelete.HasValue && (bool)role.CanDelete)
                    btndelete.Visible = (bool)role.CanDelete;
                else
                    btndelete.Visible = false;
            }
        }

    }
}