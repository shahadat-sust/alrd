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
    public partial class GovernmentForestryBodyData : BaseControl
    {
        #region Initialization
        private long FormID = 18;
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

                    SearchEntity = new ALRD_GovernmentForestryBodyDataEntity();

                    //if (Request.QueryString["hid"] != null && !string.IsNullOrEmpty(Request.QueryString["hid"].ToString()))
                    if(GlobalClass.GovtInfoID > 0)
                    {
                        SearchEntity.COMPID = GlobalClass.GovtInfoID;                       
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


        private ALRD_GovernmentForestryBodyDataEntity SearchEntity
        {
            get
            {
                return Session["ALRD_GovernmentForestryBodyDataEntity"] as ALRD_GovernmentForestryBodyDataEntity;
            }
            set
            {
                if (Session["ALRD_GovernmentForestryBodyDataEntity"] == null)
                    Session.Add("ALRD_GovernmentForestryBodyDataEntity", value);
                else
                    Session["ALRD_GovernmentForestryBodyDataEntity"] = value;
            }
        }
        private void LoadCombo()
        {
            try
            {
                LoadComboRef(ref ddlDivision, ALRD_DivisionInfoService.GetService().GetAll(new ALRD_DivisionInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.COMPID));

                DateTime currentDate = DateTime.Now;
                ddlYear.SelectedValue = currentDate.Year.ToString();
                ddlMonth.SelectedValue = currentDate.Month.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void LoadEntity(ALRD_GovernmentForestryBodyDataEntity entity)
        {
            try
            {
                ALRD_GovernmentForestryBodyDataEntity objEntity = ALRD_GovernmentForestryBodyDataService.GetService().GetAll(entity).FirstOrDefault();

                ClearControlStates(pnlForm);

                if (objEntity != null && objEntity.COMPID != null && objEntity.COMPID > 0)
                {

                    GlobalClass.FormUserID = (long)objEntity.COMPID;

                    hdnCOMPID.Value = objEntity.COMPID.ToString();
                    if (objEntity.CollCollectionYear.HasValue)
                        ddlYear.SelectedValue = objEntity.CollCollectionYear.ToString();
                    if (objEntity.CollectionMonth.HasValue)
                        ddlMonth.SelectedValue = objEntity.CollectionMonth.ToString();

                    if (objEntity.DivisionID.HasValue)
                        ddlDivision.SelectedValue = objEntity.DivisionID.ToString();

                    ddlDivision_SelectedIndexChanged(null, null);

                    if (objEntity.DistrictID.HasValue && ddlDistrict.Items.FindByValue(objEntity.DistrictID.ToString()) != null)
                        ddlDistrict.SelectedValue = objEntity.DistrictID.ToString();

                    ddlDistrict_SelectedIndexChanged(null, null);

                    if (objEntity.UpazilaID.HasValue && ddlUpazilla.Items.FindByValue(objEntity.UpazilaID.ToString()) != null)
                        ddlUpazilla.SelectedValue = objEntity.UpazilaID.ToString();

                    txtRemarks.Text = objEntity.Remarks;

                    
                    if (objEntity.TotalCurtailedAreaWoodlot.HasValue)
                        txtTotalCurtailedAreaWoodlot.Text = objEntity.TotalCurtailedAreaWoodlot.ToString();
                    if (objEntity.TotalCurtailedAreaAgri.HasValue)
                        txtTotalCurtailedAreaAgri.Text = objEntity.TotalCurtailedAreaAgri.ToString();
                    if (objEntity.TotalCurtailedAreaStrip.HasValue)
                        txtTotalCurtailedAreaStrip.Text = objEntity.TotalCurtailedAreaStrip.ToString();
                    if (objEntity.NoOfBeneficiary.HasValue)
                        txtNoOfBeneficiary.Text = objEntity.NoOfBeneficiary.ToString();
                    if (objEntity.MoneyDistributed.HasValue)
                        txtMoneyDistributed.Text = objEntity.MoneyDistributed.ToString();
                    
                    if (objEntity.CreatedBy.HasValue)
                        hdnCreatedBy.Value = objEntity.CreatedBy.ToString();
                    hdnCreatedOn.Value = GetStringFromDate(objEntity.CreatedOn);

                    btnSave.Text = "Update";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to update this information?');";
                    this.CheckButtonPermission(null, btnSave, null);
                }
                else
                {
                    GlobalClass.FormUserID =-99;
                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to save this information?');";
                    this.CheckButtonPermission(btnSave, null, null);

                    DateTime currentDate = DateTime.Now;
                    ddlYear.SelectedValue = currentDate.Year.ToString();
                    ddlMonth.SelectedValue = currentDate.Month.ToString();
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private ALRD_GovernmentForestryBodyDataEntity BuiltEntity(ALRD_GovernmentForestryBodyDataEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new ALRD_GovernmentForestryBodyDataEntity();
                entity.COMPID = hdnCOMPID.Value.Trim() != string.Empty ? long.Parse(hdnCOMPID.Value.Trim()) : (long?)null;
                entity.CollCollectionYear = ddlYear.SelectedIndex > 0 ? long.Parse(ddlYear.SelectedValue) : (long?)null;
                entity.CollectionMonth = ddlMonth.SelectedIndex > 0 ? long.Parse(ddlMonth.SelectedValue) : (long?)null;
                entity.DivisionID = ddlDivision.SelectedIndex > 0 ? long.Parse(ddlDivision.SelectedValue) : (long?)null;
                entity.DistrictID = ddlDistrict.SelectedIndex > 0 ? long.Parse(ddlDistrict.SelectedValue) : (long?)null;
                entity.UpazilaID = ddlUpazilla.SelectedIndex > 0 ? long.Parse(ddlUpazilla.SelectedValue) : (long?)null;

                entity.Remarks = txtRemarks.Text != string.Empty ? txtRemarks.Text.Trim() : string.Empty;

                entity.TotalCurtailedAreaWoodlot = txtTotalCurtailedAreaWoodlot.Text.Trim() != string.Empty ? decimal.Parse(txtTotalCurtailedAreaWoodlot.Text.Trim()) : (decimal?)null;
                entity.TotalCurtailedAreaAgri = txtTotalCurtailedAreaAgri.Text.Trim() != string.Empty ? decimal.Parse(txtTotalCurtailedAreaAgri.Text.Trim()) : (decimal?)null;
                entity.TotalCurtailedAreaStrip = txtTotalCurtailedAreaStrip.Text.Trim() != string.Empty ? decimal.Parse(txtTotalCurtailedAreaStrip.Text.Trim()) : (decimal?)null;
                entity.NoOfBeneficiary = txtNoOfBeneficiary.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfBeneficiary.Text.Trim()) : (decimal?)null;
                entity.MoneyDistributed = txtMoneyDistributed.Text.Trim() != string.Empty ? decimal.Parse(txtMoneyDistributed.Text.Trim()) : (decimal?)null;
                

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
                    ALRD_GovernmentForestryBodyDataEntity entity = BuiltEntity();
                    long i = ALRD_GovernmentForestryBodyDataService.GetService().Add(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Saved Successfully";
                        LoadEntity(new ALRD_GovernmentForestryBodyDataEntity { COMPID = i});
                    }
                }
                else
                {
                    ALRD_GovernmentForestryBodyDataEntity entity = BuiltEntity();

                    long i = ALRD_GovernmentForestryBodyDataService.GetService().Update(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Updated Successfully";
                        LoadEntity(new ALRD_GovernmentForestryBodyDataEntity { COMPID = entity.COMPID });
                    }
                }
                DateTime currentDate = DateTime.Now;
                ddlYear.SelectedValue = currentDate.Year.ToString();
                ddlMonth.SelectedValue = currentDate.Month.ToString();
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
                if (hdnCOMPID.Value.Trim() != string.Empty && long.Parse(hdnCOMPID.Value.Trim()) > 0)
                    LoadEntity(new ALRD_GovernmentForestryBodyDataEntity { COMPID = long.Parse(hdnCOMPID.Value.Trim()) });
                else
                {
                    
                    ClearControlStates(pnlForm);
                    GlobalClass.GovtInfoID = -99;
                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to save this information?');";

                    DateTime currentDate = DateTime.Now;
                    ddlYear.SelectedValue = currentDate.Year.ToString();
                    ddlMonth.SelectedValue = currentDate.Month.ToString();
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

        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDistrict.Items.Clear();
            ddlUpazilla.Items.Clear();
            if (ddlDivision.SelectedIndex > 0)
            {
                List<ALRD_DistrictInfoEntity> district = ALRD_DistrictInfoService.GetService().GetAll(new ALRD_DistrictInfoEntity { DivisionID = long.Parse(ddlDivision.SelectedValue) }).ToList();
                LoadComboRef(ref ddlDistrict, district, CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.COMPID));
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlUpazilla.Items.Clear();
            if (ddlDistrict.SelectedIndex > 0)
            {
                List<ALRD_UpazilaInfoEntity> upazila = ALRD_UpazilaInfoService.GetService().GetAll(new ALRD_UpazilaInfoEntity { DistrictID = long.Parse(ddlDistrict.SelectedValue) }).ToList();
                LoadComboRef(ref ddlUpazilla, upazila, CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.COMPID));
            }
        }

        

    }
}