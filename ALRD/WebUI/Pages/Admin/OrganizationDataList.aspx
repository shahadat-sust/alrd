<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="OrganizationDataList.aspx.cs" Inherits="WebUI.Pages.Admin.OrganizationDataList" %>
<%@ Register src="~/Controls/Admin/OrganizationDataList.ascx" tagname="UCOrganizationDataList" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCOrganizationDataList ID="UCOrganizationDataList1" runat="server"/>
</asp:Content>
