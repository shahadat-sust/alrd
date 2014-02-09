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
    public partial class OrganizationData : BaseControl
    {
        #region Initialization
        private long FormID = 11;
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

                    SearchEntity = new ALRD_OrganizationDataEntity();

                    //if (Request.QueryString["hid"] != null && !string.IsNullOrEmpty(Request.QueryString["hid"].ToString()))
                    if(GlobalClass.OrgDataID > 0)
                    {
                        SearchEntity.COMPID = GlobalClass.OrgDataID;                       
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


        private ALRD_OrganizationDataEntity SearchEntity
        {
            get
            {
                return Session["ALRD_OrganizationDataEntity"] as ALRD_OrganizationDataEntity;
            }
            set
            {
                if (Session["ALRD_OrganizationDataEntity"] == null)
                    Session.Add("ALRD_OrganizationDataEntity", value);
                else
                    Session["ALRD_OrganizationDataEntity"] = value;
            }
        }
        private void LoadCombo()
        {
            try
            {
                LoadComboRef(ref ddlOrgName, ALRD_OrganizationInfoService.GetService().GetAll(new ALRD_OrganizationInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_OrganizationInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_OrganizationInfoEntity x) => x.COMPID));
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
        private void LoadEntity(ALRD_OrganizationDataEntity entity)
        {
            try
            {
                ALRD_OrganizationDataEntity objEntity = ALRD_OrganizationDataService.GetService().GetAll(entity).FirstOrDefault();

                ClearControlStates(pnlForm);

                if (objEntity != null && objEntity.COMPID != null && objEntity.COMPID > 0)
                {

                    GlobalClass.OrgDataID = (long)objEntity.COMPID;

                    hdnCOMPID.Value = objEntity.COMPID.ToString();
                    if (objEntity.CollOrganizationID.HasValue)
                        ddlOrgName.SelectedValue = objEntity.CollOrganizationID.ToString();
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

                    ddlUpazilla_SelectedIndexChanged(null, null);

                    if (objEntity.UnionID.HasValue && ddlUnion.Items.FindByValue(objEntity.UnionID.ToString()) != null)
                        ddlUnion.SelectedValue = objEntity.UnionID.ToString();

                    if (objEntity.ActKhaLand.HasValue)
                        chkActKhaLand.Checked = (bool)objEntity.ActKhaLand;
                    else
                        chkActKhaLand.Checked = false;
                    if (objEntity.ActKhaWater.HasValue)
                        chkActKhaWater.Checked = (bool)objEntity.ActKhaWater;
                    else
                        chkActKhaWater.Checked = false;
                    if (objEntity.ActAdibasi.HasValue)
                        chkActAdibasi.Checked = (bool)objEntity.ActAdibasi;
                    else
                        chkActAdibasi.Checked = false;
                    if (objEntity.ActLanServey.HasValue)
                        chkActLanServey.Checked = (bool)objEntity.ActLanServey;
                    else
                        chkActLanServey.Checked = false;
                    if (objEntity.ActAwareness.HasValue)
                        chkActAwareness.Checked = (bool)objEntity.ActAwareness;
                    else
                        chkActAwareness.Checked = false;
                    if (objEntity.ActVestedProp.HasValue)
                        chkActVestedProp.Checked = (bool)objEntity.ActVestedProp;
                    else
                        chkActVestedProp.Checked = false;
                    txtRemarks512.Text = objEntity.Remarks512;

                    if (objEntity.TotalKhasLandGov11.HasValue)
                        txtTotalKhasLandGov11.Text = objEntity.TotalKhasLandGov11.ToString();
                    if (objEntity.DistributedKhasLandGov12.HasValue)
                        txtDistributedKhasLandGov12.Text = objEntity.DistributedKhasLandGov12.ToString();
                    if (objEntity.DistributableKhasLandGov13.HasValue)
                        txtDistributableKhasLandGov13.Text = objEntity.DistributableKhasLandGov13.ToString();
                    if (objEntity.TotalLandlessFamilyGov14.HasValue)
                        txtTotalLandlessFamilyGov14.Text = objEntity.TotalLandlessFamilyGov14.ToString();
                    if (objEntity.NoOfFamilyGotKhasLandGov15.HasValue)
                        txtNoOfFamilyGotKhasLandGov15.Text = objEntity.NoOfFamilyGotKhasLandGov15.ToString();
                    if (objEntity.IllegalOccupiedKhasLandGov16.HasValue)
                        txtIllegalOccupiedKhasLandGov16.Text = objEntity.IllegalOccupiedKhasLandGov16.ToString();
                    if (objEntity.TotalKhasLandOrg21.HasValue)
                        txtTotalKhasLandOrg21.Text = objEntity.TotalKhasLandOrg21.ToString();
                    if (objEntity.DistributedKhasLandOrg22.HasValue)
                        txtDistributedKhasLandOrg22.Text = objEntity.DistributedKhasLandOrg22.ToString();
                    if (objEntity.DistributableKhasLandOrg23.HasValue)
                        txtDistributableKhasLandOrg23.Text = objEntity.DistributableKhasLandOrg23.ToString();
                    if (objEntity.TotalLandlessFamilyOrg24.HasValue)
                        txtTotalLandlessFamilyOrg24.Text = objEntity.TotalLandlessFamilyOrg24.ToString();
                    if (objEntity.NoOfFamilyGotKhasLandOrg25.HasValue)
                        txtNoOfFamilyGotKhasLandOrg25.Text = objEntity.NoOfFamilyGotKhasLandOrg25.ToString();


                    if (objEntity.NoOfFamilyGotKhasLandOrg25.HasValue)
                        txtNoOfFamilyGotKhasLandOrg25.Text = objEntity.NoOfFamilyGotKhasLandOrg25.ToString();
                    if (objEntity.NoOfFamilyEvictedKhasLandOrg26.HasValue)
                        txtNoOfFamilyEvictedKhasLandOrg26.Text = objEntity.NoOfFamilyEvictedKhasLandOrg26.ToString();
                    if (objEntity.NoOfViolenceKhasLandOrg27.HasValue)
                        txtNoOfViolenceKhasLandOrg27.Text = objEntity.NoOfViolenceKhasLandOrg27.ToString();
                    if (objEntity.NoOfLitigationKhasLandOrg28.HasValue)
                        txtNoOfLitigationKhasLandOrg28.Text = objEntity.NoOfLitigationKhasLandOrg28.ToString();
                    if (objEntity.NoOfInitiativeGathOrg29.HasValue)
                        txtNoOfInitiativeGathOrg29.Text = objEntity.NoOfInitiativeGathOrg29.ToString();
                    if (objEntity.NoOfInitiativeRallyOrg29.HasValue)
                        txtNoOfInitiativeRallyOrg29.Text = objEntity.NoOfInitiativeRallyOrg29.ToString();
                    if (objEntity.NoOfInitiativeMemoOrg29.HasValue)
                        txtNoOfInitiativeMemoOrg29.Text = objEntity.NoOfInitiativeMemoOrg29.ToString();
                    if (objEntity.NoOfInitiativeLegalOrg29.HasValue)
                        txtNoOfInitiativeLegalOrg29.Text = objEntity.NoOfInitiativeLegalOrg29.ToString();
                    if (objEntity.NoOfInitiativeMeetOrg29.HasValue)
                        txtNoOfInitiativeMeetOrg29.Text = objEntity.NoOfInitiativeMeetOrg29.ToString();
                    if (objEntity.NoOfInitiativeOthOrg29.HasValue)
                        txtNoOfInitiativeOthOrg29.Text = objEntity.NoOfInitiativeOthOrg29.ToString();
                    if (objEntity.TotalLess20KhasWaterGov31.HasValue)
                        txtTotalLess20KhasWaterGov31.Text = objEntity.TotalLess20KhasWaterGov31.ToString();
                    if (objEntity.TotalMore20KhasWaterGov32.HasValue)
                        txtTotalMore20KhasWaterGov32.Text = objEntity.TotalMore20KhasWaterGov32.ToString();


                    if (objEntity.TotalLeaseLess20KhasWaterGov33.HasValue)
                        txtTotalLeaseLess20KhasWaterGov33.Text = objEntity.TotalLeaseLess20KhasWaterGov33.ToString();
                    if (objEntity.TotalLeaseMore20KhasWaterGov34.HasValue)
                        txtTotalLeaseMore20KhasWaterGov34.Text = objEntity.TotalLeaseMore20KhasWaterGov34.ToString();
                    if (objEntity.TotalLess20KhasWaterOrg41.HasValue)
                        txtTotalLess20KhasWaterOrg41.Text = objEntity.TotalLess20KhasWaterOrg41.ToString();
                    if (objEntity.TotalMore20KhasWaterOrg42.HasValue)
                        txtTotalMore20KhasWaterOrg42.Text = objEntity.TotalMore20KhasWaterOrg42.ToString();
                    if (objEntity.TotalLeaseLess20KhasWaterOrg43.HasValue)
                        txtTotalLeaseLess20KhasWaterOrg43.Text = objEntity.TotalLeaseLess20KhasWaterOrg43.ToString();
                    if (objEntity.TotalLeaseMore20KhasWaterOrg44.HasValue)
                        txtTotalLeaseMore20KhasWaterOrg44.Text = objEntity.TotalLeaseMore20KhasWaterOrg44.ToString();
                    if (objEntity.NoOfFamilyFishingOrg45.HasValue)
                        txtNoOfFamilyFishingOrg45.Text = objEntity.NoOfFamilyFishingOrg45.ToString();

                    if (objEntity.NoOfRegFisherFolkCoOrg46.HasValue)
                        txtNoOfRegFisherFolkCoOrg46.Text = objEntity.NoOfRegFisherFolkCoOrg46.ToString();
                    if (objEntity.NoOfFisherFolkCoOrg47.HasValue)
                        txtNoOfFisherFolkCoOrg47.Text = objEntity.NoOfFisherFolkCoOrg47.ToString();
                    if (objEntity.NoOfLitigationKhasWaterOrg48.HasValue)
                        txtNoOfLitigationKhasWaterOrg48.Text = objEntity.NoOfLitigationKhasWaterOrg48.ToString();
                    if (objEntity.NoOfMovKhasWaterOrg49.HasValue)
                        txtNoOfMovKhasWaterOrg49.Text = objEntity.NoOfMovKhasWaterOrg49.ToString();
                    if (objEntity.NoOfCaseEvictionKhasWaterOrg410.HasValue)
                        txtNoOfCaseEvictionKhasWaterOrg410.Text = objEntity.NoOfCaseEvictionKhasWaterOrg410.ToString();
                    if (objEntity.NoOfInitiativeGathOrg411.HasValue)
                        txtNoOfInitiativeGathOrg411.Text = objEntity.NoOfInitiativeGathOrg411.ToString();
                    if (objEntity.NoOfInitiativeRallyOrg411.HasValue)
                        txtNoOfInitiativeRallyOrg411.Text = objEntity.NoOfInitiativeRallyOrg411.ToString();
                    if (objEntity.NoOfInitiativeMemoOrg411.HasValue)
                        txtNoOfInitiativeMemoOrg411.Text = objEntity.NoOfInitiativeMemoOrg411.ToString();
                    if (objEntity.NoOfInitiativeLegalOrg411.HasValue)
                        txtNoOfInitiativeLegalOrg411.Text = objEntity.NoOfInitiativeLegalOrg411.ToString();

                    if (objEntity.NoOfInitiativeMeetOrg411.HasValue)
                        txtNoOfInitiativeMeetOrg411.Text = objEntity.NoOfInitiativeMeetOrg411.ToString();
                    if (objEntity.NoOfInitiativeOthOrg411.HasValue)
                        txtNoOfInitiativeOthOrg411.Text = objEntity.NoOfInitiativeOthOrg411.ToString();
                    if (objEntity.TotalLand51.HasValue)
                        txtTotalLand51.Text = objEntity.TotalLand51.ToString();
                    if (objEntity.TotalPrivateProp52.HasValue)
                        txtTotalPrivateProp52.Text = objEntity.TotalPrivateProp52.ToString();
                    if (objEntity.TotalAgriLand53.HasValue)
                        txtTotalAgriLand53.Text = objEntity.TotalAgriLand53.ToString();
                    if (objEntity.TotalNonAgriLand54.HasValue)
                        txtTotalNonAgriLand54.Text = objEntity.TotalNonAgriLand54.ToString();
                    if (objEntity.TotalForestLand55.HasValue)
                        txtTotalForestLand55.Text = objEntity.TotalForestLand55.ToString();
                    if (objEntity.TotalCommLan56.HasValue)
                        txtTotalCommLan56.Text = objEntity.TotalCommLan56.ToString();

                    if (objEntity.TotalAgriCommLastYear57.HasValue)
                        txtTotalAgriCommLastYear57.Text = objEntity.TotalAgriCommLastYear57.ToString();
                    if (objEntity.TotalAgriComm58.HasValue)
                        txtTotalAgriComm58.Text = objEntity.TotalAgriComm58.ToString();
                    if (objEntity.NoOfFamilyAgriComm59.HasValue)
                        txtNoOfFamilyAgriComm59.Text = objEntity.NoOfFamilyAgriComm59.ToString();
                    if (objEntity.TotalCharLand510.HasValue)
                        txtTotalCharLand510.Text = objEntity.TotalCharLand510.ToString();
                    if (objEntity.NatAgriCommTobacco511.HasValue)
                        txtNatAgriCommTobacco511.Text = objEntity.NatAgriCommTobacco511.ToString();
                    if (objEntity.NatAgriCommRubber511.HasValue)
                        txtNatAgriCommRubber511.Text = objEntity.NatAgriCommRubber511.ToString();
                    if (objEntity.NatAgriCommBricks511.HasValue)
                        txtNatAgriCommBricks511.Text = objEntity.NatAgriCommBricks511.ToString();
                    if (objEntity.NatAgriCommIndustry511.HasValue)
                        txtNatAgriCommIndustry511.Text = objEntity.NatAgriCommIndustry511.ToString();
   
                    if (objEntity.CreatedBy.HasValue)
                        hdnCreatedBy.Value = objEntity.CreatedBy.ToString();
                    hdnCreatedOn.Value = GetStringFromDate(objEntity.CreatedOn);

                    SetRequiredField();
                    btnSave.Text = "Update";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to update this information?');";
                    this.CheckButtonPermission(null, btnSave, null);
                }
                else
                {
                    SetRequiredField();
                    GlobalClass.OrgDataID = -99;
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
        private ALRD_OrganizationDataEntity BuiltEntity(ALRD_OrganizationDataEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new ALRD_OrganizationDataEntity();
                entity.COMPID = hdnCOMPID.Value.Trim() != string.Empty ? long.Parse(hdnCOMPID.Value.Trim()) : (long?)null;
                entity.CollOrganizationID = ddlOrgName.SelectedIndex > 0 ? long.Parse(ddlOrgName.SelectedValue) : (long?)null;
                entity.CollCollectionYear = ddlYear.SelectedIndex > 0 ? long.Parse(ddlYear.SelectedValue) : (long?)null;
                entity.CollectionMonth = ddlMonth.SelectedIndex > 0 ? long.Parse(ddlMonth.SelectedValue) : (long?)null;
                entity.DivisionID = ddlDivision.SelectedIndex > 0 ? long.Parse(ddlDivision.SelectedValue) : (long?)null;
                entity.DistrictID = ddlDistrict.SelectedIndex > 0 ? long.Parse(ddlDistrict.SelectedValue) : (long?)null;
                entity.UpazilaID = ddlUpazilla.SelectedIndex > 0 ? long.Parse(ddlUpazilla.SelectedValue) : (long?)null;
                entity.UnionID = ddlUnion.SelectedIndex > 0 ? long.Parse(ddlUnion.SelectedValue) : (long?)null;
                entity.ActKhaLand = chkActKhaLand.Checked;
                entity.ActKhaWater = chkActKhaWater.Checked;
                entity.ActAdibasi = chkActAdibasi.Checked;
                entity.ActLanServey = chkActLanServey.Checked;
                entity.ActAwareness = chkActAwareness.Checked;
                entity.ActVestedProp = chkActVestedProp.Checked;
                entity.Remarks512 = txtRemarks512.Text != string.Empty ? txtRemarks512.Text.Trim() : string.Empty;

                entity.TotalKhasLandGov11 = txtTotalKhasLandGov11.Text.Trim() != string.Empty ? decimal.Parse(txtTotalKhasLandGov11.Text.Trim()) : (decimal?)null;
                entity.DistributedKhasLandGov12 = txtDistributedKhasLandGov12.Text.Trim() != string.Empty ? decimal.Parse(txtDistributedKhasLandGov12.Text.Trim()) : (decimal?)null;
                entity.DistributableKhasLandGov13 = txtDistributableKhasLandGov13.Text.Trim() != string.Empty ? decimal.Parse(txtDistributableKhasLandGov13.Text.Trim()) : (decimal?)null;
                entity.TotalLandlessFamilyGov14 = txtTotalLandlessFamilyGov14.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLandlessFamilyGov14.Text.Trim()) : (decimal?)null;
                entity.NoOfFamilyGotKhasLandGov15 = txtNoOfFamilyGotKhasLandGov15.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfFamilyGotKhasLandGov15.Text.Trim()) : (decimal?)null;
                entity.IllegalOccupiedKhasLandGov16 = txtIllegalOccupiedKhasLandGov16.Text.Trim() != string.Empty ? decimal.Parse(txtIllegalOccupiedKhasLandGov16.Text.Trim()) : (decimal?)null;
                entity.TotalKhasLandOrg21 = txtTotalKhasLandOrg21.Text.Trim() != string.Empty ? decimal.Parse(txtTotalKhasLandOrg21.Text.Trim()) : (decimal?)null;
                entity.DistributedKhasLandOrg22 = txtDistributedKhasLandOrg22.Text.Trim() != string.Empty ? decimal.Parse(txtDistributedKhasLandOrg22.Text.Trim()) : (decimal?)null;
                entity.DistributableKhasLandOrg23 = txtDistributableKhasLandOrg23.Text.Trim() != string.Empty ? decimal.Parse(txtDistributableKhasLandOrg23.Text.Trim()) : (decimal?)null;
                entity.TotalLandlessFamilyOrg24 = txtTotalLandlessFamilyOrg24.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLandlessFamilyOrg24.Text.Trim()) : (decimal?)null;
                entity.NoOfFamilyGotKhasLandOrg25 = txtNoOfFamilyGotKhasLandOrg25.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfFamilyGotKhasLandOrg25.Text.Trim()) : (decimal?)null;
                entity.NoOfFamilyEvictedKhasLandOrg26 = txtNoOfFamilyEvictedKhasLandOrg26.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfFamilyEvictedKhasLandOrg26.Text.Trim()) : (decimal?)null;
                entity.NoOfViolenceKhasLandOrg27 = txtNoOfViolenceKhasLandOrg27.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfViolenceKhasLandOrg27.Text.Trim()) : (decimal?)null;
                entity.NoOfLitigationKhasLandOrg28 = txtNoOfLitigationKhasLandOrg28.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfLitigationKhasLandOrg28.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeGathOrg29 = txtNoOfInitiativeGathOrg29.Text.Trim() != string.Empty ? long.Parse(txtNoOfInitiativeGathOrg29.Text.Trim()) : (long?)null;
                entity.NoOfInitiativeRallyOrg29 = txtNoOfInitiativeRallyOrg29.Text.Trim() != string.Empty ? long.Parse(txtNoOfInitiativeRallyOrg29.Text.Trim()) : (long?)null;
                entity.NoOfInitiativeMemoOrg29 = txtNoOfInitiativeMemoOrg29.Text.Trim() != string.Empty ? long.Parse(txtNoOfInitiativeMemoOrg29.Text.Trim()) : (long?)null;
                entity.NoOfInitiativeLegalOrg29 = txtNoOfInitiativeLegalOrg29.Text.Trim() != string.Empty ? long.Parse(txtNoOfInitiativeLegalOrg29.Text.Trim()) : (long?)null;
                entity.NoOfInitiativeMeetOrg29 = txtNoOfInitiativeMeetOrg29.Text.Trim() != string.Empty ? long.Parse(txtNoOfInitiativeMeetOrg29.Text.Trim()) : (long?)null;
                entity.NoOfInitiativeOthOrg29 = txtNoOfInitiativeOthOrg29.Text.Trim() != string.Empty ? long.Parse(txtNoOfInitiativeOthOrg29.Text.Trim()) : (long?)null;
                entity.TotalLess20KhasWaterGov31 = txtTotalLess20KhasWaterGov31.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLess20KhasWaterGov31.Text.Trim()) : (decimal?)null;
                entity.TotalMore20KhasWaterGov32 = txtTotalMore20KhasWaterGov32.Text.Trim() != string.Empty ? decimal.Parse(txtTotalMore20KhasWaterGov32.Text.Trim()) : (decimal?)null;
                entity.TotalLeaseLess20KhasWaterGov33 = txtTotalLeaseLess20KhasWaterGov33.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLeaseLess20KhasWaterGov33.Text.Trim()) : (decimal?)null;
                entity.TotalLeaseMore20KhasWaterGov34 = txtTotalLeaseMore20KhasWaterGov34.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLeaseMore20KhasWaterGov34.Text.Trim()) : (decimal?)null;
                entity.TotalLess20KhasWaterOrg41 = txtTotalLess20KhasWaterOrg41.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLess20KhasWaterOrg41.Text.Trim()) : (decimal?)null;
                entity.TotalMore20KhasWaterOrg42 = txtTotalMore20KhasWaterOrg42.Text.Trim() != string.Empty ? decimal.Parse(txtTotalMore20KhasWaterOrg42.Text.Trim()) : (decimal?)null;
                entity.TotalLeaseLess20KhasWaterOrg43 = txtTotalLeaseLess20KhasWaterOrg43.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLeaseLess20KhasWaterOrg43.Text.Trim()) : (decimal?)null;
                entity.TotalLeaseMore20KhasWaterOrg44 = txtTotalLeaseMore20KhasWaterOrg44.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLeaseMore20KhasWaterOrg44.Text.Trim()) : (decimal?)null;
                entity.NoOfFamilyFishingOrg45 = txtNoOfFamilyFishingOrg45.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfFamilyFishingOrg45.Text.Trim()) : (decimal?)null;
                entity.NoOfRegFisherFolkCoOrg46 = txtNoOfRegFisherFolkCoOrg46.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfRegFisherFolkCoOrg46.Text.Trim()) : (decimal?)null;
                entity.NoOfFisherFolkCoOrg47 = txtNoOfFisherFolkCoOrg47.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfFisherFolkCoOrg47.Text.Trim()) : (decimal?)null;
                entity.NoOfLitigationKhasWaterOrg48 = txtNoOfLitigationKhasWaterOrg48.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfLitigationKhasWaterOrg48.Text.Trim()) : (decimal?)null;
                entity.NoOfMovKhasWaterOrg49 = txtNoOfMovKhasWaterOrg49.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfMovKhasWaterOrg49.Text.Trim()) : (decimal?)null;
                entity.NoOfCaseEvictionKhasWaterOrg410 = txtNoOfCaseEvictionKhasWaterOrg410.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfCaseEvictionKhasWaterOrg410.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeGathOrg411 = txtNoOfInitiativeGathOrg411.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfInitiativeGathOrg411.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeRallyOrg411 = txtNoOfInitiativeRallyOrg411.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfInitiativeRallyOrg411.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeMemoOrg411 = txtNoOfInitiativeMemoOrg411.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfInitiativeMemoOrg411.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeLegalOrg411 = txtNoOfInitiativeLegalOrg411.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfInitiativeLegalOrg411.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeMeetOrg411 = txtNoOfInitiativeMeetOrg411.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfInitiativeMeetOrg411.Text.Trim()) : (decimal?)null;
                entity.NoOfInitiativeOthOrg411 = txtNoOfInitiativeOthOrg411.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfInitiativeOthOrg411.Text.Trim()) : (decimal?)null;
                entity.TotalLand51 = txtTotalLand51.Text.Trim() != string.Empty ? decimal.Parse(txtTotalLand51.Text.Trim()) : (decimal?)null;
                entity.TotalPrivateProp52 = txtTotalPrivateProp52.Text.Trim() != string.Empty ? decimal.Parse(txtTotalPrivateProp52.Text.Trim()) : (decimal?)null;
                entity.TotalAgriLand53 = txtTotalAgriLand53.Text.Trim() != string.Empty ? decimal.Parse(txtTotalAgriLand53.Text.Trim()) : (decimal?)null;
                entity.TotalNonAgriLand54 = txtTotalNonAgriLand54.Text.Trim() != string.Empty ? decimal.Parse(txtTotalNonAgriLand54.Text.Trim()) : (decimal?)null;
                entity.TotalForestLand55 = txtTotalForestLand55.Text.Trim() != string.Empty ? decimal.Parse(txtTotalForestLand55.Text.Trim()) : (decimal?)null;
                entity.TotalCommLan56 = txtTotalCommLan56.Text.Trim() != string.Empty ? decimal.Parse(txtTotalCommLan56.Text.Trim()) : (decimal?)null;
                entity.TotalAgriCommLastYear57 = txtTotalAgriCommLastYear57.Text.Trim() != string.Empty ? decimal.Parse(txtTotalAgriCommLastYear57.Text.Trim()) : (decimal?)null;
                entity.TotalAgriComm58 = txtTotalAgriComm58.Text.Trim() != string.Empty ? decimal.Parse(txtTotalAgriComm58.Text.Trim()) : (decimal?)null;
                entity.NoOfFamilyAgriComm59 = txtNoOfFamilyAgriComm59.Text.Trim() != string.Empty ? decimal.Parse(txtNoOfFamilyAgriComm59.Text.Trim()) : (decimal?)null;
                entity.TotalCharLand510 = txtTotalCharLand510.Text.Trim() != string.Empty ? decimal.Parse(txtTotalCharLand510.Text.Trim()) : (decimal?)null;
                entity.NatAgriCommTobacco511 = txtNatAgriCommTobacco511.Text.Trim() != string.Empty ? decimal.Parse(txtNatAgriCommTobacco511.Text.Trim()) : (decimal?)null;
                entity.NatAgriCommRubber511 = txtNatAgriCommRubber511.Text.Trim() != string.Empty ? decimal.Parse(txtNatAgriCommRubber511.Text.Trim()) : (decimal?)null;
                entity.NatAgriCommBricks511 = txtNatAgriCommBricks511.Text.Trim() != string.Empty ? decimal.Parse(txtNatAgriCommBricks511.Text.Trim()) : (decimal?)null;
                entity.NatAgriCommIndustry511 = txtNatAgriCommIndustry511.Text.Trim() != string.Empty ? decimal.Parse(txtNatAgriCommIndustry511.Text.Trim()) : (decimal?)null;
                


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
                    ALRD_OrganizationDataEntity entity = BuiltEntity();
                    long i = ALRD_OrganizationDataService.GetService().Add(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Saved Successfully";
                        LoadEntity(new ALRD_OrganizationDataEntity { COMPID = i});
                    }
                }
                else
                {
                    ALRD_OrganizationDataEntity entity = BuiltEntity();

                    long i = ALRD_OrganizationDataService.GetService().Update(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Updated Successfully";
                        LoadEntity(new ALRD_OrganizationDataEntity { COMPID = entity.COMPID });
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
                    LoadEntity(new ALRD_OrganizationDataEntity { COMPID = long.Parse(hdnCOMPID.Value.Trim()) });
                else
                {
                    
                    ClearControlStates(pnlForm);
                    SetRequiredField();
                    GlobalClass.OrgDataID = -99;
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

        protected void chkActKhaLand_CheckedChanged(object sender, EventArgs e)
        {
            SetRequiredField();
        }



        protected void chkActKhaWater_CheckedChanged(object sender, EventArgs e)
        {
            SetRequiredField();
        }

        protected void chkActAdibasi_CheckedChanged(object sender, EventArgs e)
        {
            SetRequiredField();
        }

        protected void chkActLanServey_CheckedChanged(object sender, EventArgs e)
        {
            SetRequiredField();
        }

        protected void chkActAwareness_CheckedChanged(object sender, EventArgs e)
        {
            SetRequiredField();
        }

        protected void chkActVestedProp_CheckedChanged(object sender, EventArgs e)
        {
            SetRequiredField();
        }

        private void SetRequiredField()
        {
            if (chkActKhaLand.Checked || chkActKhaLand.Checked || chkActKhaLand.Checked || chkActKhaLand.Checked || chkActKhaLand.Checked || chkActKhaLand.Checked)
            {
                lblDistributedKhasLandGov12Req.Visible = true;
                lblDistributedKhasLandOrg22Req.Visible = true;
                lblTotalKhasLandGov11Req.Visible = true;
                lblTotalKhasLandOrg21Req.Visible = true;

                lblDistrictReq.Visible = true;
                lblDivisionReq.Visible = true;                
                lblUnionReq.Visible = true;
                lblUpazillaReq.Visible = true;

                txtDistributedKhasLandGov12.CssClass = "w100px decimal";
                txtDistributedKhasLandOrg22.CssClass = "w100px decimal";
                txtTotalKhasLandGov11.CssClass = "w100px decimal";
                txtTotalKhasLandOrg21.CssClass = "w100px decimal";

                ddlDistrict.CssClass = "w250px required";
                ddlDivision.CssClass = "w250px required";
                ddlUnion.CssClass = "w250px required";
                ddlUpazilla.CssClass = "w250px required";
            }
            else
            {
                lblDistributedKhasLandGov12Req.Visible = false;
                lblDistributedKhasLandOrg22Req.Visible = false;
                lblTotalKhasLandGov11Req.Visible = false;
                lblTotalKhasLandOrg21Req.Visible = false;

                lblDistrictReq.Visible = false;
                lblDivisionReq.Visible = false;
                lblUnionReq.Visible = false;
                lblUpazillaReq.Visible = false;

                txtDistributedKhasLandGov12.CssClass = "w100px decimalnr";
                txtDistributedKhasLandOrg22.CssClass = "w100px decimalnr";
                txtTotalKhasLandGov11.CssClass = "w100px decimalnr";
                txtTotalKhasLandOrg21.CssClass = "w100px decimalnr";

                ddlDistrict.CssClass = "w250px";
                ddlDivision.CssClass = "w250px";
                ddlUnion.CssClass = "w250px";
                ddlUpazilla.CssClass = "w250px";
            }
        }

        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlDistrict.Items.Clear();
            ddlUpazilla.Items.Clear();
            ddlUnion.Items.Clear();
            if (ddlDivision.SelectedIndex > 0)
            {
                List<ALRD_DistrictInfoEntity> district = ALRD_DistrictInfoService.GetService().GetAll(new ALRD_DistrictInfoEntity { DivisionID = long.Parse(ddlDivision.SelectedValue) }).ToList();
                LoadComboRef(ref ddlDistrict, district, CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.COMPID));
            }

        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlUpazilla.Items.Clear();
            ddlUnion.Items.Clear();
            if (ddlDistrict.SelectedIndex > 0)
            {
                List<ALRD_UpazilaInfoEntity> upazila = ALRD_UpazilaInfoService.GetService().GetAll(new ALRD_UpazilaInfoEntity { DistrictID = long.Parse(ddlDistrict.SelectedValue) }).ToList();
                LoadComboRef(ref ddlUpazilla, upazila, CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.COMPID));
            }

        }

        protected void ddlUpazilla_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlUnion.Items.Clear();
            if (ddlUpazilla.SelectedIndex > 0)
            {
                List<ALRD_UnionInfoEntity> union = ALRD_UnionInfoService.GetService().GetAll(new ALRD_UnionInfoEntity { UpazilaID = long.Parse(ddlUpazilla.SelectedValue) }).ToList();
                LoadComboRef(ref ddlUnion, union, CommonFunctions.GetPropertyName((ALRD_UnionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_UnionInfoEntity x) => x.COMPID));
            }
        }

    }
}