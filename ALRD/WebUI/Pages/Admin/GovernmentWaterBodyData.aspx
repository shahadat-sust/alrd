<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="GovernmentWaterBodyData.aspx.cs" Inherits="WebUI.Pages.Admin.GovernmentWaterBodyData" %>
<%@ Register src="~/Controls/Admin/GovernmentWaterBodyData.ascx" tagname="UCGovernmentWaterBodyData" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCGovernmentWaterBodyData ID="UCGovernmentWaterBodyData1" runat="server"/>
</asp:Content>
