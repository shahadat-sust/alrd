<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportViewer.ascx.cs"
    Inherits="WebUI.Reporting.Controls.Report_RDLC_Controls_ReportViewer" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<table width="100%" class="reportBody">
    <tr>
        <td valign="top" style="width: 100%">
            <%--<rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="625" Width="100%" >
            </rsweb:ReportViewer>--%>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="625" Width="100%" >
            </rsweb:ReportViewer>
        </td>
    </tr>
</table>
