<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="GovernmentForestryBodyDataList.aspx.cs" Inherits="WebUI.Pages.Admin.GovernmentForestryBodyDataList" %>
<%@ Register src="~/Controls/Admin/GovernmentForestryBodyDataList.ascx" tagname="UCGovernmentForestryBodyDataList" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCGovernmentForestryBodyDataList ID="UCGovernmentForestryBodyDataList1" runat="server"/>
</asp:Content>
