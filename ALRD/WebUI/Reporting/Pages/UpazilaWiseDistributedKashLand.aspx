<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UpazilaWiseDistributedKashLand.aspx.cs" Inherits="WebUI.Reporting.Pages.UpazilaWiseDistributedKashLand" %>
<%@ Register src="~/Reporting/Controls/UpazilaWiseDistributedKashLand.ascx" tagname="UCUpazilaWiseDistributedKashLand" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUpazilaWiseDistributedKashLand ID="UCUpazilaWiseDistributedKashLand1" runat="server"/>
</asp:Content>
