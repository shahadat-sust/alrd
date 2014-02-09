<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="OrganizationData.aspx.cs" Inherits="WebUI.Pages.Admin.OrganizationData" %>
<%@ Register src="~/Controls/Admin/OrganizationData.ascx" tagname="UCOrganizationData" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCOrganizationData ID="UCOrganizationData1" runat="server"/>
</asp:Content>
