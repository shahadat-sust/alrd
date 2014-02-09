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
    public partial class UpazilaWiseDistributedKashLand : BaseControl
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
                    ddlFromMonth.SelectedValue = DateTime.Now.Month.ToString();
                    ddlToYear.SelectedValue = DateTime.Now.Year.ToString();
                    ddlToMonth.SelectedValue = DateTime.Now.Month.ToString();

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


        private RPT_DistributedKashLandEntity SearchEntity
        {
            get
            {
                return Session["RPT_DistributedKashLandEntity"] as RPT_DistributedKashLandEntity;
            }
            set
            {
                if (Session["RPT_DistributedKashLandEntity"] == null)
                    Session.Add("RPT_DistributedKashLandEntity", value);
                else
                    Session["RPT_DistributedKashLandEntity"] = value;
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

        private RPT_DistributedKashLandEntity BuiltEntity(RPT_DistributedKashLandEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new RPT_DistributedKashLandEntity();
                
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
                RPT_DistributedKashLandEntity entity = BuiltEntity();
                entity.FromYear = ddlFromYear.SelectedIndex > 0 ? int.Parse(ddlFromYear.SelectedValue) : -99;
                entity.ToYear = ddlToYear.SelectedIndex > 0 ? int.Parse(ddlToYear.SelectedValue) : -99;
                entity.FromMonth = ddlFromMonth.SelectedIndex > 0 ? int.Parse(ddlFromMonth.SelectedValue) : -99;
                entity.ToMonth = ddlToMonth.SelectedIndex > 0 ? int.Parse(ddlToMonth.SelectedValue) : -99;
                entity.DivisionID = ddlDivision.SelectedIndex > 0 ? long.Parse(ddlDivision.SelectedValue) : -99;
                entity.DistrictID = ddlDistrict.SelectedIndex > 0 ? long.Parse(ddlDistrict.SelectedValue) : -99; 

                DateTime FromDate = new DateTime((int)entity.FromYear, (int)entity.FromMonth, 1);
                DateTime ToDate = new DateTime((int)entity.ToYear, (int)entity.ToMonth, DateTime.DaysInMonth((int)entity.ToYear, (int)entity.ToMonth));

                entity.FromDate = FromDate;
                entity.ToDate = ToDate;
                entity.ReportType = "Upazila";

                List<RPT_DistributedKashLandEntity> list = new List<RPT_DistributedKashLandEntity>();
                list = Extension_ReportService.GetService().GetDistributedKashLand(entity).ToList();

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
                ddlFromYear.SelectedValue = DateTime.Now.Year.ToString();
                ddlFromMonth.SelectedValue = DateTime.Now.Month.ToString();
                ddlToYear.SelectedValue = DateTime.Now.Year.ToString();
                ddlToMonth.SelectedValue = DateTime.Now.Month.ToString();
                ClearReportView();
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            
        }
        #endregion events

        #region Helpers

        private void LoadReport(List<RPT_DistributedKashLandEntity> list, RPT_DistributedKashLandEntity entity)
        {
            string ReportSource = "../RDLC/RPT_UpazilaWiseDistributedKashLand.rdlc";

            try
            {
                ReportViewer1.ClearData();
                this.ReportViewer1.ReportViewer.Width = 850;
                this.ReportViewer1.Visible = true;
                this.ReportViewer1.ReportViewer.Reset();
                string[] TableName = { "RPT_DivisionWiseDistributedKashLand" };

                ReportViewer1.AddReportParameter(new ReportParameter("Month", ddlToMonth.SelectedIndex > 0 ? ddlToMonth.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("Year", ddlToYear.SelectedIndex > 0 ? ddlToYear.SelectedItem.Text : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("FromDate", entity.FromDate.HasValue ? entity.FromDate.Value.ToString("dd.MM.yyyy") : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("ToDate", entity.ToDate.HasValue ? entity.ToDate.Value.ToString("dd.MM.yyyy") : ""));
                ReportViewer1.AddReportParameter(new ReportParameter("District", ddlDistrict.SelectedIndex > 0 ? "District/Zilla: " + ddlDistrict.SelectedItem.Text : ""));
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
            if (ddlDivision.SelectedIndex > 0)
            {
                List<ALRD_DistrictInfoEntity> district = ALRD_DistrictInfoService.GetService().GetAll(new ALRD_DistrictInfoEntity { DivisionID = long.Parse(ddlDivision.SelectedValue) }).ToList();
                LoadComboRef(ref ddlDistrict, district, CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.COMPID));
            }

        }

        #endregion

    }
}