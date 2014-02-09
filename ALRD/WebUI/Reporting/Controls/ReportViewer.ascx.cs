using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace WebUI.Reporting.Controls
{
    public partial class Report_RDLC_Controls_ReportViewer : System.Web.UI.UserControl
    {
        public ReportViewer ReportViewer
        {
            get
            {
                return this.ReportViewer1;
            }
        }

        private List<ReportParameter> ListParam = new List<ReportParameter>();

        public void AddReportParameter(ReportParameter rp)
        {
            ListParam.Add(rp);
        }

        private List<object> dsReportSource = new List<object>();

        public void AddDsReportSource(object list)
        {
            dsReportSource.Add(list);
        }
        public void ClearData()
        {
            ListParam.Clear();
            dsReportSource.Clear();
        }

        public void ShowReport(string ReportSource, string[] sDataSourceName)
        {
            //ReportViewer1.LocalReport.ReportPath = ReportSource;
            this.ReportViewer1.LocalReport.ReportPath = Server.MapPath(ReportSource);
            //ReportViewer.LocalReport.ReportEmbeddedResource = "/WPF_UI;component/Report/RDLC/rptTest.rdlc";

            for (int i = 0; i <= sDataSourceName.Length - 1; i++)
            {
                this.ReportViewer1.LocalReport.DataSources.Add(GetMyList(dsReportSource[i], sDataSourceName[i].ToString()));
            }

            if (ListParam.Count > 0)
            {
                this.ReportViewer1.LocalReport.SetParameters(ListParam);
            }
        }

        private Microsoft.Reporting.WebForms.ReportDataSource GetMyList<T>(T ds, string sDataSourceName)
        {
            return new Microsoft.Reporting.WebForms.ReportDataSource(sDataSourceName, ds);
        }

        public void ShowReport(string ReportSource, DataSet dsReportSource, ReportParameter[] ReportParam, string[] sDataSourceName)
        {
            this.ReportViewer1.LocalReport.ReportPath = Server.MapPath(ReportSource);
            for (int i = 0; i <= sDataSourceName.Length - 1; i++)
            {
                this.ReportViewer1.LocalReport.DataSources.Add(GetMyDataTable(dsReportSource, i, sDataSourceName[i].ToString()));
            }

            if (ReportParam != null && ReportParam.Length > 0)
            {
                this.ReportViewer1.LocalReport.SetParameters(ReportParam);
            }
        }

        private Microsoft.Reporting.WebForms.ReportDataSource GetMyDataTable(DataSet ds, int i, string sDataSourceName)
        {
            return new Microsoft.Reporting.WebForms.ReportDataSource(sDataSourceName, ds.Tables[i]);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}