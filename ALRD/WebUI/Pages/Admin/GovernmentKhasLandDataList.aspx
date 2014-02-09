<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="GovernmentKhasLandDataList.aspx.cs" Inherits="WebUI.Pages.Admin.GovernmentKhasLandDataList" %>
<%@ Register src="~/Controls/Admin/GovernmentKhasLandDataList.ascx" tagname="UCGovernmentKhasLandDataList" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCGovernmentKhasLandDataList ID="UCGovernmentKhasLandDataList1" runat="server"/>
</asp:Content>
