<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="OrganizationInfo.aspx.cs" Inherits="WebUI.Pages.Admin.OrganizationInfo" %>
<%@ Register src="~/Controls/Admin/OrganizationInfo.ascx" tagname="UCOrganizationInfo" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCOrganizationInfo ID="UCOrganizationInfo1" runat="server"/>
</asp:Content>
