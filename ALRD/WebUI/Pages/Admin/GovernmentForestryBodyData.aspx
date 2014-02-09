<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="GovernmentForestryBodyData.aspx.cs" Inherits="WebUI.Pages.Admin.GovernmentForestryBodyData" %>
<%@ Register src="~/Controls/Admin/GovernmentForestryBodyData.ascx" tagname="UCGovernmentForestryBodyData" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCGovernmentForestryBodyData ID="UCGovernmentForestryBodyData1" runat="server"/>
</asp:Content>
