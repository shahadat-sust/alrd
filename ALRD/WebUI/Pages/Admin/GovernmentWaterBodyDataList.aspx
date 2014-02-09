<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="GovernmentWaterBodyDataList.aspx.cs" Inherits="WebUI.Pages.Admin.GovernmentWaterBodyDataList" %>
<%@ Register src="~/Controls/Admin/GovernmentWaterBodyDataList.ascx" tagname="UCGovernmentWaterBodyDataList" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCGovernmentWaterBodyDataList ID="UCGovernmentWaterBodyDataList1" runat="server"/>
</asp:Content>
