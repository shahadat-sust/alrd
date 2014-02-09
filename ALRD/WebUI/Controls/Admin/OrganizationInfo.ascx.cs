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
    public partial class OrganizationInfo : BaseControl
    {
        #region Initialization
        private long FormID = 9;
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

        public List<ALRD_OrganizationInfoEntity> LocalDataStore
        {
            get
            {
                List<ALRD_OrganizationInfoEntity> tempList = new List<ALRD_OrganizationInfoEntity>();
                if (Session["ALRD_OrganizationInfoEntityList"] != null)
                {
                    tempList = Session["ALRD_OrganizationInfoEntityList"] as List<ALRD_OrganizationInfoEntity>;
                }
                else
                {
                    Session["ALRD_OrganizationInfoEntityList"] = tempList;
                }
                return tempList;
            }
            set
            {
                Session["ALRD_OrganizationInfoEntityList"] = value;
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
            IList<ALRD_OrganizationInfoEntity> itemList = new List<ALRD_OrganizationInfoEntity>();
            try
            {
                LocalDataStore = ALRD_OrganizationInfoService.GetService().GetAll(new ALRD_OrganizationInfoEntity { SortExpression = "DESCRIPT ASC" }).ToList();
                if (LocalDataStore != null && LocalDataStore.Count > 0)
                {
                    this.lsv_SetupPage.DataSource = LocalDataStore;
                }
                else
                {
                    this.lsv_SetupPage.EditIndex = -1;
                    this.lsv_SetupPage.InsertItemPosition = InsertItemPosition.FirstItem;
                    this.lsv_SetupPage.DataSource = new List<ALRD_OrganizationInfoEntity>();
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
            ALRD_OrganizationInfoEntity item = new ALRD_OrganizationInfoEntity();

            item.DESCRIPT = ((TextBox)insertItem.FindControl("txtDESCRIPT")).Text.Trim();
            item.NameOfCEO = ((TextBox)insertItem.FindControl("txtNameOfCEO")).Text.Trim();
            item.TelephoneNo = ((TextBox)insertItem.FindControl("txtTelephoneNo")).Text.Trim();
            item.MobileNo = ((TextBox)insertItem.FindControl("txtMobileNo")).Text.Trim();
            item.Email = ((TextBox)insertItem.FindControl("txtEmail")).Text.Trim();
            item.WebSite = ((TextBox)insertItem.FindControl("txtWebSite")).Text.Trim();
            item.Fax = ((TextBox)insertItem.FindControl("txtFax")).Text.Trim();
            item.Status = ((CheckBox)insertItem.FindControl("chkStatus")).Checked;
            item.WebSite = ((TextBox)insertItem.FindControl("txtWebSite")).Text.Trim();
            item.CreatedBy = GlobalClass.UserID;
            item.CreatedOn = DateTime.Now;

            long i = SH.Service.ALRD_OrganizationInfoService.GetService().Add(item);
            SuccessMessage = "Information Saved Successfully.";

            this.CloseInsert();
            this.LoadData();
        }
        private void UpdateItem(ListViewItem insertItem, int dataItemIndex)
        {
            ALRD_OrganizationInfoEntity item = LocalDataStore[dataItemIndex];

            item.DESCRIPT = ((TextBox)insertItem.FindControl("txtDESCRIPT")).Text.Trim();
            item.NameOfCEO = ((TextBox)insertItem.FindControl("txtNameOfCEO")).Text.Trim();
            item.TelephoneNo = ((TextBox)insertItem.FindControl("txtTelephoneNo")).Text.Trim();
            item.MobileNo = ((TextBox)insertItem.FindControl("txtMobileNo")).Text.Trim();
            item.Email = ((TextBox)insertItem.FindControl("txtEmail")).Text.Trim();
            item.WebSite = ((TextBox)insertItem.FindControl("txtWebSite")).Text.Trim();
            item.Fax = ((TextBox)insertItem.FindControl("txtFax")).Text.Trim();
            item.Status = ((CheckBox)insertItem.FindControl("chkStatus")).Checked;
            item.WebSite = ((TextBox)insertItem.FindControl("txtWebSite")).Text.Trim();
            item.CreatedBy = ((TextBox)insertItem.FindControl("txtCreatedBy")).Text.Trim() != string.Empty ? long.Parse(((TextBox)insertItem.FindControl("txtCreatedBy")).Text.Trim()) : (long?)null ;
            item.CreatedOn = GetDateFromString(((TextBox)insertItem.FindControl("txtCreatedOn")).Text.Trim());
            item.UpdatedBy = GlobalClass.UserID;
            item.UpdatedOn = DateTime.Now;

            long i = SH.Service.ALRD_OrganizationInfoService.GetService().Update(item);
            SuccessMessage = "Information Updated Successfully.";


            this.lsv_SetupPage.EditIndex = -1;
            this.LoadData();
        }
        private void DeleteItem(int dataItemIndex)
        {
            ALRD_OrganizationInfoEntity item = LocalDataStore[dataItemIndex];
            long i = SH.Service.ALRD_OrganizationInfoService.GetService().Delete(item);
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

        #endregion

    }
}