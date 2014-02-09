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
    public partial class SecurityRole : BaseControl
    {
        #region Initialization
        private long FormID = 1;
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

        public List<ALRD_SecurityRoleEntity> LocalDataStore
        {
            get
            {
                List<ALRD_SecurityRoleEntity> tempList = new List<ALRD_SecurityRoleEntity>();
                if (Session["ALRD_SecurityRoleEntityList"] != null)
                {
                    tempList = Session["ALRD_SecurityRoleEntityList"] as List<ALRD_SecurityRoleEntity>;
                }
                else
                {
                    Session["ALRD_SecurityRoleEntityList"] = tempList;
                }
                return tempList;
            }
            set
            {
                Session["ALRD_SecurityRoleEntityList"] = value;
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
            IList<ALRD_SecurityRoleEntity> itemList = new List<ALRD_SecurityRoleEntity>();
            try
            {
                LocalDataStore = ALRD_SecurityRoleService.GetService().GetAll(new ALRD_SecurityRoleEntity()).ToList();
                if (LocalDataStore != null && LocalDataStore.Count > 0)
                {
                    this.lsv_SetupPage.DataSource = LocalDataStore;
                }
                else
                {
                    this.lsv_SetupPage.EditIndex = -1;
                    this.lsv_SetupPage.InsertItemPosition = InsertItemPosition.FirstItem;
                    this.lsv_SetupPage.DataSource = new List<ALRD_SecurityRoleEntity>();
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
            ALRD_SecurityRoleEntity item = new ALRD_SecurityRoleEntity();

            item.RoleName = ((TextBox)insertItem.FindControl("txtRoleName")).Text.Trim();
            item.ShortName = ((TextBox)insertItem.FindControl("txtShortName")).Text.Trim();
            item.LongDescription = ((TextBox)insertItem.FindControl("txtLongDescription")).Text.Trim();
            item.CreatedBy = GlobalClass.UserID;
            item.CreatedOn = DateTime.Now;

            long i = SH.Service.ALRD_SecurityRoleService.GetService().Add(item);
            SuccessMessage = "Information Saved Successfully.";

            this.CloseInsert();
            this.LoadData();
        }
        private void UpdateItem(ListViewItem insertItem, int dataItemIndex)
        {
            ALRD_SecurityRoleEntity item = LocalDataStore[dataItemIndex];

            item.RoleName = ((TextBox)insertItem.FindControl("txtRoleName")).Text.Trim();
            item.ShortName = ((TextBox)insertItem.FindControl("txtShortName")).Text.Trim();
            item.LongDescription = ((TextBox)insertItem.FindControl("txtLongDescription")).Text.Trim();
            item.UpdatedBy = GlobalClass.UserID;
            item.UpdatedOn = DateTime.Now;

            long i = SH.Service.ALRD_SecurityRoleService.GetService().Update(item);
            SuccessMessage = "Information Updated Successfully.";


            this.lsv_SetupPage.EditIndex = -1;
            this.LoadData();
        }
        private void DeleteItem(int dataItemIndex)
        {
            ALRD_SecurityRoleEntity item = LocalDataStore[dataItemIndex];
            long i = SH.Service.ALRD_SecurityRoleService.GetService().Delete(item);
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

                    long key = 999999999;
                    Label lbl = (Label)e.Item.FindControl("lblRole_ID");
                    if (lbl != null && lbl.Text.Trim() != string.Empty)
                        key = long.Parse(lbl.Text.Trim());

                    if ((Button)e.Item.FindControl("btnEdit") != null && key <= 3)
                        ((Button)e.Item.FindControl("btnEdit")).Visible = false;
                    if ((Button)e.Item.FindControl("btnDelete") != null && key <= 3)
                        ((Button)e.Item.FindControl("btnDelete")).Visible = false;
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