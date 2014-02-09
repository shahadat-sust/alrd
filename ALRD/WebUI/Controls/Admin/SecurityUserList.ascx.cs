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
    public partial class SecurityUserList : BaseControl
    {
        #region Initialization
        private long FormID = 3;
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
                    GlobalClass.FormUserID = -99;

                    this.CheckFormPermission(this.FormID);
                    this.CheckButtonPermission(null, null, null, lnkAddNew);
                    LoadCombo();

                    SearchEntity = new ALRD_SecurityUserEntity();
                    SearchEntity.CurrentPage = 1;
                    SearchEntity.PageSize = 10;
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



        private List<ALRD_SecurityUserEntity> LocalEntityList
        {
            get
            {
                return Session["ALRD_SecurityUserEntityList"] as List<ALRD_SecurityUserEntity>;
            }
            set
            {
                if (Session["ALRD_SecurityUserEntityList"] == null)
                    Session.Add("ALRD_SecurityUserEntityList", value);
                else
                    Session["ALRD_SecurityUserEntityList"] = value;
            }
        }
        private ALRD_SecurityUserEntity SearchEntity
        {
            get
            {
                return Session["ALRD_SecurityUserEntity"] as ALRD_SecurityUserEntity;
            }
            set
            {
                if (Session["ALRD_SecurityUserEntity"] == null)
                    Session.Add("ALRD_SecurityUserEntity", value);
                else
                    Session["ALRD_SecurityUserEntity"] = value;
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
        private void LoadEntityList(ALRD_SecurityUserEntity entity)
        {
            try
            {

                if (entity.PageSize < 0)
                {
                    entity.PageSize = 10;
                }
                if (entity.SortExpression == string.Empty)
                    entity.SortExpression = "UserName ASC";


                LocalEntityList = ALRD_SecurityUserService.GetService().GetAll(entity).ToList();
                //lsvUserList.Items.Clear();
                if (LocalEntityList != null && LocalEntityList.Count > 0)
                {
                    lsvUserList.DataSource = LocalEntityList;
                    lsvUserList.DataBind();
                }
                else
                {
                    lsvUserList.DataSource = null;
                    lsvUserList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private ALRD_SecurityUserEntity BuiltEntity(ALRD_SecurityUserEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new ALRD_SecurityUserEntity();
                entity.UserNameLike = txtUserName.Text.Trim() != string.Empty ? txtUserName.Text.Trim() : string.Empty;
                entity.Status = ddlStatus.SelectedIndex > 0 ? bool.Parse(ddlStatus.SelectedValue) : (bool?)null;
                entity.RoleID = ddlRoleType.SelectedIndex > 0 ? long.Parse(ddlRoleType.SelectedValue) : (long?)null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return entity;
        }

        #endregion Data Loading

        #region events

        protected void lsvUserList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                string CommandName = e.CommandName.ToString();
                string CommandArgument = e.CommandArgument.ToString();

                if(CommandArgument.ToString() != "")
                {
                    long Value = long.Parse(CommandArgument.ToString());

                    if (CommandName == "edit")
                    {
                        GlobalClass.FormUserID = Value;
                        Response.Redirect("SecurityUserInfo.aspx", true);
                    }
                    else if (CommandName == "delete")
                    {
                        ALRD_SecurityUserEntity entity = new ALRD_SecurityUserEntity { COMPID = Value };
                        //LoadEntityList(entity);                 
                        long i = ALRD_SecurityUserService.GetService().Delete(entity);
                        LoadEntityList(new ALRD_SecurityUserEntity());

                        Error = "Information Deleted Successfully";
                    }
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        protected void lsvUserList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {
                this.CheckButtonPermission(null, ((Button)e.Item.FindControl("aEdit")), ((Button)e.Item.FindControl("aDelete")), lnkAddNew);
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        protected void lsvUserList_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void lsvUserList_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            try
            {
;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                SearchEntity = BuiltEntity();
                LoadEntityList(SearchEntity);
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