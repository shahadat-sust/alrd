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
    public partial class SecurityRoleDetail : BaseControl
    {
        #region Initialization
        private long FormID = 2;
        string jsFunction = "$(document).scrollTop(0);";

        protected override void OnInit(EventArgs e)
        {
            try
            {
                base.OnInit(e);
                this.InitializeComponent();
                IniButtonOnClickEvent(false, "");
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private void IniButtonOnClickEvent(bool Intial, string ValueToReplace)
        {
            if (Intial)
            {
            }else
            {
            }
        }
        private void InitializeComponent()
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected override void Render(HtmlTextWriter output)
        {
            try
            {
                base.Render(output);
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    this.CheckFormPermission(this.FormID);
                    this.CheckButtonPermission(btnSave, null, null);
                    LoadCombo();

                    SearchEntity = new ALRD_SecurityRoleDetailEntity { RoleID = -99};
                    FormLocalDataStore = new List<ALRD_SecurityRoleDetailEntity>();
                    MenuLocalDataStore = ALRD_SecurityMenuService.GetService().GetAll(new ALRD_SecurityMenuEntity()).ToList();

                    LoadEntityList(SearchEntity);
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        #endregion

        #region Data Loading


        private ALRD_SecurityRoleDetailEntity SearchEntity
        {
            get
            {
                return Session["ALRD_SecurityRoleDetailEntity"] as ALRD_SecurityRoleDetailEntity;
            }
            set
            {
                if (Session["ALRD_SecurityRoleDetailEntity"] == null)
                    Session.Add("ALRD_SecurityRoleDetailEntity", value);
                else
                    Session["ALRD_SecurityRoleDetailEntity"] = value;
            }
        }


        public List<ALRD_SecurityMenuEntity> MenuLocalDataStore
        {
            get
            {
                List<ALRD_SecurityMenuEntity> tempList = new List<ALRD_SecurityMenuEntity>();
                if (Session["ALRD_SecurityMenuEntityList"] != null)
                {
                    tempList = Session["ALRD_SecurityMenuEntityList"] as List<ALRD_SecurityMenuEntity>;
                }
                else
                {
                    Session["ALRD_SecurityMenuEntityList"] = tempList;
                }
                return tempList;
            }
            set
            {
                Session["ALRD_SecurityMenuEntityList"] = value;
            }
        }

        public List<ALRD_SecurityRoleDetailEntity> FormLocalDataStore
        {
            get
            {
                List<ALRD_SecurityRoleDetailEntity> tempList = new List<ALRD_SecurityRoleDetailEntity>();
                if (Session["ALRD_SecurityRoleDetailEntityList"] != null)
                {
                    tempList = Session["ALRD_SecurityRoleDetailEntityList"] as List<ALRD_SecurityRoleDetailEntity>;
                }
                else
                {
                    Session["ALRD_SecurityRoleDetailEntityList"] = tempList;
                }
                return tempList;
            }
            set
            {
                Session["ALRD_SecurityRoleDetailEntityList"] = value;
            }
        }


        private void LoadCombo()
        {
            try
            {
                LoadComboRef(ref ddlRoleType, ALRD_SecurityRoleService.GetService().GetAll(new ALRD_SecurityRoleEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_SecurityRoleEntity x) => x.RoleName), CommonFunctions.GetPropertyName((ALRD_SecurityRoleEntity x) => x.COMPID));   
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void LoadEntityList(ALRD_SecurityRoleDetailEntity entity)
        {
            bool updateMode = false;
            try
            {
                FormLocalDataStore = ALRD_SecurityRoleDetailService.GetService().GetAllByRoleID(entity).ToList();

                if (FormLocalDataStore != null && FormLocalDataStore.Count > 0)
                {
                    foreach (ALRD_SecurityRoleDetailEntity ob in FormLocalDataStore)
                    {
                        if (ob.COMPID.HasValue)
                            updateMode = true;
                    }
                }

                if (updateMode)
                {
                    btnSave.Text = "Update";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to update this information?');";
                    this.CheckButtonPermission(null, btnSave, null);
                }
                else
                {
                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to save this information?');";
                    this.CheckButtonPermission(btnSave, null, null);
                }

                if (MenuLocalDataStore != null && MenuLocalDataStore.Count > 0)
                {
                    this.rptMenuInfo.DataSource = MenuLocalDataStore;
                }
                else
                {
                    this.rptMenuInfo.DataSource = new List<ALRD_SecurityMenuEntity>();
                }
                this.rptMenuInfo.DataBind();

            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private List<ALRD_SecurityRoleDetailEntity> BuiltEntityList()
        {
            List<ALRD_SecurityRoleDetailEntity> entityList = new List<ALRD_SecurityRoleDetailEntity>();

            try
            {
                foreach (RepeaterItem ob in rptMenuInfo.Items)
                {
                    ListView lsv = (ListView)ob.FindControl("lsvFormInfo");
                    if (lsv != null && lsv.Items.Count > 0)
                    {
                        foreach (ListViewDataItem item in lsv.Items)
                        {
                            ALRD_SecurityRoleDetailEntity entity = new ALRD_SecurityRoleDetailEntity();
                            entity.COMPID = ((TextBox)item.FindControl("txtRoleDetailID")).Text.Trim() != string.Empty ? long.Parse(((TextBox)item.FindControl("txtRoleDetailID")).Text.Trim()) : (long?)null;
                            entity.FormID = ((TextBox)item.FindControl("txtFormID")).Text.Trim() != string.Empty ? long.Parse(((TextBox)item.FindControl("txtFormID")).Text.Trim()) : (long?)null;
                            entity.RoleID = ddlRoleType.SelectedIndex > 0 ? long.Parse(ddlRoleType.SelectedValue) : (long?)null;
                            entity.IsVisible = ((CheckBox)item.FindControl("chkIsVisible")).Checked;
                            entity.CanInsert = ((CheckBox)item.FindControl("chkCanInsert")).Checked;
                            entity.CanUpdate = ((CheckBox)item.FindControl("chkCanUpdate")).Checked;
                            entity.CanDelete = ((CheckBox)item.FindControl("chkCanDelete")).Checked;
                            if (entity.COMPID.HasValue)
                            {
                                entity.CreatedBy = ((TextBox)item.FindControl("txtCreatedBy")).Text.Trim() != string.Empty ? long.Parse(((TextBox)item.FindControl("txtCreatedBy")).Text.Trim()) : (long?)null;
                                entity.CreatedOn = GetDateFromString(((TextBox)item.FindControl("txtCreatedOn")).Text.Trim());
                                entity.UpdatedBy = GlobalClass.UserID;
                                entity.UpdatedOn = DateTime.Now;
                                entity.CurrentState = BaseEntity.EntityState.Changed;
                            }
                            else
                            {
                                entity.CreatedBy = GlobalClass.UserID;
                                entity.CreatedOn = DateTime.Now;
                                entity.CurrentState = BaseEntity.EntityState.Added;
                            }
                            entityList.Add(entity);
                        }
                    }
                }

                

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return entityList;
        }

        #endregion Data Loading

        #region events

        protected void rptMenuInfo_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdn = ((HiddenField)e.Item.FindControl("hdnMenuID"));
                long menuID = hdn.Value.Trim() != string.Empty ? long.Parse(hdn.Value) : 0;

                List<ALRD_SecurityRoleDetailEntity> list = new List<ALRD_SecurityRoleDetailEntity>();
                list = FormLocalDataStore != null && FormLocalDataStore.Count > 0 ? FormLocalDataStore.Where(P => P.MenuID == menuID).ToList() : null;

                ListView lsvFormInfo = ((ListView)e.Item.FindControl("lsvFormInfo"));
                if (list != null && list.Count > 0)
                {
                    lsvFormInfo.DataSource = list;
                }
                else
                {
                    lsvFormInfo.DataSource = new List<ALRD_SecurityMenuEntity>();
                }
                lsvFormInfo.DataBind();

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                List<ALRD_SecurityRoleDetailEntity> entityList = BuiltEntityList();
                long i = ALRD_SecurityRoleDetailService.GetService().SaveList(entityList);
                SuccessMessage = "Information Saved Successfully.";
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                ddlRoleType_SelectedIndexChanged(null, null);
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
                //System.Web.UI.ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "js", jsFunction, true);
            }
        }
        public string SuccessMessage
        {
            set
            {
                pnlError.Visible = true;
                this.lblResult.Text = value;
                lblException.Text = string.Empty;
                //System.Web.UI.ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "js", jsFunction, true);
            }
        }

        #endregion

        protected void ddlRoleType_SelectedIndexChanged(object sender, EventArgs e)
        {
            long roleID = ddlRoleType.SelectedIndex > 0 ? long.Parse(ddlRoleType.SelectedValue) : -99;
            ALRD_SecurityRoleDetailEntity entity = new ALRD_SecurityRoleDetailEntity { RoleID = roleID };
            LoadEntityList(entity);
        }

    }
}