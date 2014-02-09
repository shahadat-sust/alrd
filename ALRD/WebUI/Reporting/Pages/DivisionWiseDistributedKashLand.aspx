<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="DivisionWiseDistributedKashLand.aspx.cs" Inherits="WebUI.Reporting.Pages.DivisionWiseDistributedKashLand" %>
<%@ Register src="~/Reporting/Controls/DivisionWiseDistributedKashLand.ascx" tagname="UCDivisionWiseDistributedKashLand" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCDivisionWiseDistributedKashLand ID="UCDivisionWiseDistributedKashLand1" runat="server"/>
</asp:Content>
