<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseWaterBody.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseWaterBody" %>
<%@ Register src="~/Reporting/Controls/UnionWiseWaterBody.ascx" tagname="UCUnionWiseWaterBody" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseWaterBody ID="UCUnionWiseWaterBody1" runat="server"/>
</asp:Content>
