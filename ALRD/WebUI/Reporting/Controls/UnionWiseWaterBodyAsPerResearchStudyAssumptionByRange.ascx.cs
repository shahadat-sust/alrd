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
using Microsoft.Reporting.WebForms;

namespace WebUI.Reporting.Controls
{
    public partial class UnionWiseWaterBodyAsPerResearchStudyAssumptionByRange : BaseControl
    {
        #region Initialization
        private long FormID = 14;
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
                    ddlFromYear.SelectedValue = DateTime.Now.Year.ToString();
                    ddlToYear.SelectedValue = DateTime.Now.Year.ToString();

                    this.ReportViewer1.ReportViewer.Reset();
                    this.ReportViewer1.Visible = false;
                    LoadCombo();
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        #endregion

        #region Data Loading


        private RPT_OrganizationDataEntity SearchEntity
        {
            get
            {
                return Session["RPT_OrganizationDataEntity"] as RPT_OrganizationDataEntity;
            }
            set
            {
                if (Session["RPT_OrganizationDataEntity"] == null)
                    Session.Add("RPT_OrganizationDataEntity", value);
                else
                    Session["RPT_OrganizationDataEntity"] = value;
            }
        }

        private void LoadCombo()
        {
            try
            {
                LoadComboRef(ref ddlDivision, ALRD_DivisionInfoService.GetService().GetAll(new ALRD_DivisionInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.COMPID));

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private RPT_OrganizationDataEntity BuiltEntity(RPT_OrganizationDataEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new RPT_OrganizationDataEntity();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return entity;
        }

        #endregion Data Loading

        #region events

        

        protected void btnShow_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                RPT_OrganizationDataEntity entity = BuiltEntity();
                entity.FromYear = ddlFromYear.SelectedIndex > 0 ? long.Parse(ddlFromYear.SelectedValue) : -99;
                entity.ToYear = ddlToYear.SelectedIndex > 0 ? long.Parse(ddlToYear.SelectedValue) : -99;
                entity.DivisionID = ddlDivision.SelectedIndex > 0 ? long.Parse(ddlDivision.SelectedValue) : (long?)null;
                entity.DistrictID = ddlDistrict.SelectedIndex > 0 ? long.Parse(ddlDistrict.SelectedValue) : (long?)null;
                entity.UpazilaID = ddlUpazilla.SelectedIndex > 0 ? long.Parse(ddlUpazilla.SelectedValue) : (long?)null;
                entity.UnionID = ddlUnion.SelectedIndex > 0 ? long.Parse(ddlUnion.SelectedValue) : (long?)null;
                entity.ReportType = "WaterBodyAsPerResearchStudyAssumption";

                List<RPT_OrganizationDataEntity> list = new List<RPT_OrganizationDataEntity>();
                list = Extension_ReportService.GetService().GetOrganizationData(entity).ToList();

                if (list.Count > 0 && list.Count > 0)
                {
                    LoadReport(list, entity);
                }
                else
                {
                    Error = "No record is found !";
                    ClearReportView();
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
                ClearReportView();
                ClearControlStates(pnlForm);
                ddlFromYear.SelectedValue = DateTime.Now.Year.ToString();
                ddlToYear.SelectedValue = DateTime.Now.Year.ToString();
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            
        }
        #endregion events

        #region Helpers

        private void LoadReport(List<RPT_OrganizationDataEntity> list, RPT_OrganizationDataEntity entity)
        {
            string ReportSource = "../RDLC/RPT_UnionWiseWaterBodyAsPerResearchStudyAssumptionByRange.rdlc";

            try
            {
                ReportViewer1.ClearData();
                this.ReportViewer1.ReportViewer.Width = 850;
                this.ReportViewer1.Visible = true;
                this.ReportViewer1.ReportViewer.Reset();
                string[] TableName = { "RPT_OrganizationData" };

                ReportViewer1.AddReportParameter(new ReportParameter("FromYear", ddlFromYear.SelectedIndex > 0 ? ddlFromYear.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("ToYear", ddlToYear.SelectedIndex > 0 ? ddlToYear.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("Division", ddlDivision.SelectedIndex > 0 ? "Division: " + ddlDivision.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("District", ddlDistrict.SelectedIndex > 0 ? "District/Zilla: " + ddlDistrict.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("Upazila", ddlUpazilla.SelectedIndex > 0 ? "Upazila/Thana: " + ddlUpazilla.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("Union", ddlUnion.SelectedIndex > 0 ? "Union: " + ddlUnion.SelectedItem.Text : ""));
                ReportViewer1.AddDsReportSource(list);

                this.ReportViewer1.ShowReport(ReportSource, TableName);
                this.ReportViewer1.ReportViewer.LocalReport.Refresh();
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        private void ClearReportView()
        {
            this.ReportViewer1.ReportViewer.Reset();
            this.ReportViewer1.Visible = false;
        }



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

        #endregion

    }
}