<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="DistrictWiseDistributedKashLand.aspx.cs" Inherits="WebUI.Reporting.Pages.DistrictWiseDistributedKashLand" %>
<%@ Register src="~/Reporting/Controls/DistrictWiseDistributedKashLand.ascx" tagname="UCDistrictWiseDistributedKashLand" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCDistrictWiseDistributedKashLand ID="UCDistrictWiseDistributedKashLand1" runat="server"/>
</asp:Content>
