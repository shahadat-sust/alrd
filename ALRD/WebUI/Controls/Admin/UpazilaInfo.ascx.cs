using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebUI.HelperClass;
using SH.Entity;
using SH.Service;
using SH.Dao;

namespace WebUI.Controls.Admin
{
    public partial class UpazilaInfo : BaseControl
    {
        #region Initialization
        private long FormID = 7;
        public bool Enable
        {
            get { return lsv_SetupPage.Enabled; }
            set { lsv_SetupPage.Enabled = value; }
        }
        bool isReadOnly=false;

        public bool IsReadOnly
        {
            get { return isReadOnly; }
            set
            {
                isReadOnly = value;
                Enable = !value;
                if (btnAdd != null)
                    btnAdd.Visible = !value;

            }
        }

        public List<ALRD_UpazilaInfoEntity> LocalDataStore
        {
            get
            {
                List<ALRD_UpazilaInfoEntity> tempList = new List<ALRD_UpazilaInfoEntity>();
                if (Session["ALRD_UpazilaInfoEntityList"] != null)
                {
                    tempList = Session["ALRD_UpazilaInfoEntityList"] as List<ALRD_UpazilaInfoEntity>;
                }
                else
                {
                    Session["ALRD_UpazilaInfoEntityList"] = tempList;
                }
                return tempList;
            }
            set
            {
                Session["ALRD_UpazilaInfoEntityList"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    this.CheckFormPermission(this.FormID);
                    this.CheckButtonPermission(btnAdd, null, null);
                    this.LoadData();
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        #endregion
     
        private void CloseInsert()
        {
            this.lsv_SetupPage.InsertItemPosition = InsertItemPosition.None;
        }

        public void ClearControl()
        {
            LocalDataStore = null;
            LoadData();
        }

        private void LoadData()
        {
            IList<ALRD_UpazilaInfoEntity> itemList = new List<ALRD_UpazilaInfoEntity>();
            try
            {
                LocalDataStore = ALRD_UpazilaInfoService.GetService().GetAll(new ALRD_UpazilaInfoEntity()).ToList();
                if (LocalDataStore != null && LocalDataStore.Count > 0)
                {
                    this.lsv_SetupPage.DataSource = LocalDataStore;
                }
                else
                {
                    this.lsv_SetupPage.EditIndex = -1;
                    this.lsv_SetupPage.InsertItemPosition = InsertItemPosition.FirstItem;
                    this.lsv_SetupPage.DataSource = new List<ALRD_UpazilaInfoEntity>();
                }
                this.lsv_SetupPage.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void InsertItem(ListViewItem insertItem)
        {
            ALRD_UpazilaInfoEntity item = new ALRD_UpazilaInfoEntity();

            item.DESCRIPT = ((TextBox)insertItem.FindControl("txtDESCRIPT")).Text.Trim();
            item.DistrictID = ((DropDownList)insertItem.FindControl("ddlDistrictName")).SelectedIndex > 0 ? long.Parse(((DropDownList)insertItem.FindControl("ddlDistrictName")).SelectedItem.Value) : (long?)null;

            item.CreatedBy = GlobalClass.UserID;
            item.CreatedOn = DateTime.Now;

            long i = SH.Service.ALRD_UpazilaInfoService.GetService().Add(item);
            SuccessMessage = "Information Saved Successfully.";

            this.CloseInsert();
            this.LoadData();
        }
        private void UpdateItem(ListViewItem insertItem, int dataItemIndex)
        {
            ALRD_UpazilaInfoEntity item = LocalDataStore[dataItemIndex];

            item.DESCRIPT = ((TextBox)insertItem.FindControl("txtDESCRIPT")).Text.Trim();
            item.DistrictID = ((DropDownList)insertItem.FindControl("ddlDistrictName")).SelectedIndex > 0 ? long.Parse(((DropDownList)insertItem.FindControl("ddlDistrictName")).SelectedItem.Value) : (long?)null;

            item.UpdatedBy = GlobalClass.UserID;
            item.UpdatedOn = DateTime.Now;

            long i = SH.Service.ALRD_UpazilaInfoService.GetService().Update(item);
            SuccessMessage = "Information Updated Successfully.";


            this.lsv_SetupPage.EditIndex = -1;
            this.LoadData();
        }
        private void DeleteItem(int dataItemIndex)
        {
            ALRD_UpazilaInfoEntity item = LocalDataStore[dataItemIndex];
            long i = SH.Service.ALRD_UpazilaInfoService.GetService().Delete(item);
            SuccessMessage = "Information Deleted Successfully.";
            this.LoadData();
        }

   
        #region Events

        protected void btn_gen_ratrationscaledetl_add_Click(object sender, EventArgs e)
        {
            try
            {
                this.lsv_SetupPage.EditIndex = -1;
                this.lsv_SetupPage.InsertItemPosition = InsertItemPosition.FirstItem;
                this.LoadData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void lsv_SetupPage_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {

                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    this.CheckButtonPermission(btnAdd, ((Button)e.Item.FindControl("btnEdit")), ((Button)e.Item.FindControl("btnDelete")));

                    DropDownList ddlDivisionName = e.Item.FindControl("ddlDivisionName") as DropDownList;
                    DropDownList ddlDistrictName = e.Item.FindControl("ddlDistrictName") as DropDownList;

                    HiddenField IsEditMode = e.Item.FindControl("IsEditMode") as HiddenField;
                    HiddenField hdnDivisionName = e.Item.FindControl("hdnDivisionName") as HiddenField;
                    HiddenField hdnDistrictName = e.Item.FindControl("hdnDistrictName") as HiddenField;

                    if (hdnDivisionName != null)
                        ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(hdnDivisionName);



                    if (IsEditMode != null && Boolean.Parse(IsEditMode.Value))
                    {
                        if (ddlDivisionName.Items.FindByValue(hdnDivisionName.Value.Trim()) != null)
                        {
                            ddlDivisionName.SelectedValue = hdnDivisionName.Value;
                        }

                        OnDivisionChange(e);

                        if (ddlDistrictName.Items.FindByValue(hdnDistrictName.Value.Trim()) != null)
                        {
                            ddlDistrictName.SelectedValue = hdnDistrictName.Value;
                        }

                    }
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void lsv_SetupPage_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            try
            {

                DropDownList ddlDivisionName = e.Item.FindControl("ddlDivisionName") as DropDownList;

                if (ddlDivisionName != null)
                    ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(ddlDivisionName);

                if (ddlDivisionName != null)
                {
                    LoadComboRefGrid(ref ddlDivisionName, ALRD_DivisionInfoService.GetService().GetAll(new ALRD_DivisionInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.COMPID));
                }
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsv_SetupPage_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Insert":
                        {
                            InsertItem(e.Item);
                            break;
                        }
                    case "Update":
                        {
                            UpdateItem(e.Item, e.Item.DataItemIndex);
                            break;
                        }
                    case "Delete":
                        {
                            DeleteItem(e.Item.DataItemIndex);
                            break;
                        }
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        protected void lsv_SetupPage_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsv_SetupPage_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            try
            {
                this.CloseInsert();
                this.lsv_SetupPage.EditIndex = e.NewEditIndex;
                this.LoadData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsv_SetupPage_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsv_SetupPage_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            try
            {
                if (e.CancelMode == ListViewCancelMode.CancelingInsert)
                {
                    this.CloseInsert();
                }
                else
                {
                    this.lsv_SetupPage.EditIndex = -1;
                }
                this.LoadData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsv_SetupPage_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                this.lsv_SetupPage.EditIndex = -1;
                this.lsv_SetupPage.InsertItemPosition = InsertItemPosition.FirstItem;
                this.LoadData();
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            
        }



        protected void ddlDivisionName_SelectedIndexChanged(object o, EventArgs e)
        {
            try
            {
                OnDivisionChange();

            }
            catch (Exception ex)
            {
            }
        }

        #endregion events

        #region Helpers

        public override string Error
        {
            set
            {
                pnlError.Visible = true;
                lblException.Text = value;
                lblResult.Text = string.Empty;
            }
        }
        public string SuccessMessage
        {
            set
            {
                pnlError.Visible = true;
                this.lblResult.Text = value;
                lblException.Text = string.Empty;
            }
        }

        private void OnDivisionChange(ListViewItemEventArgs eArgs = null)
        {
            DropDownList ddlDivisionName = null;
            DropDownList ddlDistrictName = null;

            if (eArgs != null)
            {
                ddlDivisionName = eArgs.Item.FindControl("ddlDivisionName") as DropDownList;
                ddlDistrictName = eArgs.Item.FindControl("ddlDistrictName") as DropDownList;
            }
            else if (lsv_SetupPage.InsertItem != null)
            {
                ddlDivisionName = this.lsv_SetupPage.InsertItem.FindControl("ddlDivisionName") as DropDownList;
                ddlDistrictName = this.lsv_SetupPage.InsertItem.FindControl("ddlDistrictName") as DropDownList;
            }
            else if (lsv_SetupPage.EditItem != null)
            {
                ddlDivisionName = this.lsv_SetupPage.EditItem.FindControl("ddlDivisionName") as DropDownList;
                ddlDistrictName = this.lsv_SetupPage.EditItem.FindControl("ddlDistrictName") as DropDownList;
            }


            ddlDistrictName.Items.Clear();

            if (ddlDivisionName.SelectedIndex > 0)
            {
                LoadComboRefGrid(ref ddlDistrictName, ALRD_DistrictInfoService.GetService().GetAll(new ALRD_DistrictInfoEntity { DivisionID = long.Parse(ddlDivisionName.SelectedValue) }).ToList(), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.COMPID));
            }
        }

        #endregion

    }
}