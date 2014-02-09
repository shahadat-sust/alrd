<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="GovernmentKhasLandData.aspx.cs" Inherits="WebUI.Pages.Admin.GovernmentKhasLandData" %>
<%@ Register src="~/Controls/Admin/GovernmentKhasLandData.ascx" tagname="UCGovernmentKhasLandData" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCGovernmentKhasLandData ID="UCGovernmentKhasLandData1" runat="server"/>
</asp:Content>
