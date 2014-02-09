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
    public partial class SecurityUserInfo : BaseControl
    {
        #region Initialization
        private long FormID = 4;
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
                    LoadCombo();

                    SearchEntity = new ALRD_SecurityUserEntity();

                    //if (Request.QueryString["hid"] != null && !string.IsNullOrEmpty(Request.QueryString["hid"].ToString()))
                    if(GlobalClass.FormUserID > 0)
                    {
                        SearchEntity.COMPID = GlobalClass.FormUserID;                       
                    }
                    else
                    {
                        SearchEntity.COMPID = -99;
                    }

                    LoadEntity(SearchEntity);
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        #endregion

        #region Data Loading


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
                //LoadComboRef(ref ddlPublicUser, Public_User_Basic_InfoService.GetService().GetAll(new Public_User_Basic_InfoEntity()).ToList(), CommonFunctions.GetPropertyName((Public_User_Basic_InfoEntity x) => x.Full_Name), CommonFunctions.GetPropertyName((Public_User_Basic_InfoEntity x) => x.Public_User_ID));
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void LoadEntity(ALRD_SecurityUserEntity entity)
        {
            try
            {
                ALRD_SecurityUserEntity objEntity = ALRD_SecurityUserService.GetService().GetAll(entity).FirstOrDefault();

                ClearControlStates(pnlForm);

                if (objEntity != null && objEntity.COMPID != null && objEntity.COMPID > 0)
                {
                    lblPrePassword.Visible = true;
                    txtPrePassword.Visible = true;
                    txtPrePassword.CssClass = "w250px required txtPrePassword";
                    atcPrePassword.Visible = true;

                    GlobalClass.FormUserID = (long)objEntity.COMPID;
                    txtUserName.Text = objEntity.UserName;
                    txtFullName.Text = objEntity.FullName;
                    hdnUserID.Value = objEntity.COMPID.ToString();
                    if (objEntity.RoleID.HasValue)
                        ddlRoleType.Text = objEntity.RoleID.ToString();
                    //if (objEntity.Public_User_ID.HasValue)
                    //    ddlPublicUser.SelectedValue = objEntity.Public_User_ID.ToString();
                    //txtPassword.Text = objEntity.Password;
                    //txtRePassword.Text = objEntity.Password;
                    txtIPAddress.Text = objEntity.BlockIPAccess;
                    txtMACAddress.Text = objEntity.BlockMacAccess;
                    txtAlternateEmail.Text = objEntity.AlternateEmail;
                    hdnActivationKey.Value = objEntity.ActivationKey;
                    if (objEntity.IsActivated.HasValue)
                        chkIsActivated.Checked = (bool)objEntity.IsActivated;
                    if (objEntity.Status.HasValue)
                        chkStatus.Checked = (bool)objEntity.Status;
                    if (objEntity.CreatedBy.HasValue)
                        hdnCreatedBy.Value = objEntity.CreatedBy.ToString();
                    hdnCreatedOn.Value = GetStringFromDate(objEntity.CreatedOn);

                    btnSave.Text = "Update";
                    btnSave.OnClientClick = "javascript:return checkValidation('Do you want to update this information?');";
                    this.CheckButtonPermission(null, btnSave, null);
                }
                else
                {
                    GlobalClass.FormUserID =-99;
                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return checkValidation('Do you want to save this information?');";
                    this.CheckButtonPermission(btnSave, null, null);
                    lblPrePassword.Visible = false;
                    txtPrePassword.Visible = false;
                    txtPrePassword.CssClass = "w250px txtPrePassword";
                    atcPrePassword.Visible = false;
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
                entity.COMPID = hdnUserID.Value.Trim() != string.Empty ? long.Parse(hdnUserID.Value.Trim()) : (long?)null;
                entity.UserName = txtUserName.Text.Trim() != string.Empty ? txtUserName.Text.Trim() : string.Empty;
                entity.FullName = txtFullName.Text.Trim() != string.Empty ? txtFullName.Text.Trim() : string.Empty;
                entity.Password = txtPassword.Text.Trim() != string.Empty ? txtPassword.Text.Trim() : string.Empty;
                entity.AlternateEmail = txtAlternateEmail.Text.Trim() != string.Empty ? txtAlternateEmail.Text.Trim() : string.Empty;
                entity.BlockIPAccess = txtIPAddress.Text.Trim() != string.Empty ? txtIPAddress.Text.Trim() : string.Empty;
                entity.BlockMacAccess = txtMACAddress.Text.Trim() != string.Empty ? txtMACAddress.Text.Trim() : string.Empty;
                //entity.Public_User_ID = ddlPublicUser.SelectedIndex > 0 ? long.Parse(ddlPublicUser.SelectedValue) : (long?)null;
                entity.RoleID = ddlRoleType.SelectedIndex > 0 ? long.Parse(ddlRoleType.SelectedValue) : (long?)null;
                entity.Status = chkStatus.Checked;
                entity.ActivationKey = hdnActivationKey.Value.Trim() != string.Empty ? hdnActivationKey.Value.Trim() : string.Empty;
                entity.IsActivated = chkIsActivated.Checked;

                clsStringEnc cls = new clsStringEnc();
                entity.Password = entity.Password != string.Empty ? cls.encryptSimple(entity.Password) : string.Empty;

                if (entity.COMPID.HasValue)
                {
                    entity.UpdatedBy = GlobalClass.UserID;
                    entity.UpdatedOn = DateTime.Now;
                    entity.CreatedBy = hdnCreatedBy.Value.Trim() != string.Empty ? long.Parse(hdnCreatedBy.Value.Trim()) : (long?)null;
                    entity.CreatedOn = GetDateFromString(hdnCreatedOn.Value.Trim());
                }
                else
                {
                    entity.CreatedBy = GlobalClass.UserID;
                    entity.CreatedOn = DateTime.Now;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return entity;
        }

        #endregion Data Loading

        #region events

        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                if (btnSave.Text == "Save")
                {
                    ALRD_SecurityUserEntity entity = BuiltEntity();
                    long i = ALRD_SecurityUserService.GetService().Add(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Saved Successfully";
                        LoadEntity(new ALRD_SecurityUserEntity { COMPID = i});
                    }
                }
                else
                {
                    ALRD_SecurityUserEntity entity = BuiltEntity();
                    clsStringEnc cls = new clsStringEnc();
                    ALRD_SecurityUserEntity objEnt = ALRD_SecurityUserService.GetService().GetAll(new ALRD_SecurityUserEntity { COMPID = GlobalClass.UserID }).FirstOrDefault();
                    if (objEnt != null && cls.decryptSimple(objEnt.Password) == entity.PasswordPrevious)
                    {
                        long i = ALRD_SecurityUserService.GetService().Update(entity);
                        if (i > 0)
                        {
                            SuccessMessage = "Information Updated Successfully";
                            LoadEntity(new ALRD_SecurityUserEntity { COMPID = entity.COMPID });
                        }
                    }
                    else
                    {
                        SuccessMessage = "Previous password does not match.";
                    }
                }
                
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
                if (hdnUserID.Value.Trim() != string.Empty && long.Parse(hdnUserID.Value.Trim()) > 0)
                    LoadEntity(new ALRD_SecurityUserEntity { COMPID = long.Parse(hdnUserID.Value.Trim()) });
                else
                {
                    ClearControlStates(pnlForm);
                    GlobalClass.FormUserID = -99;
                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to save this information?');";
                    this.CheckButtonPermission(btnSave, null, null);
                }
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