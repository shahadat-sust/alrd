<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseWaterBodyByRange.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseWaterBodyByRange" %>
<%@ Register src="~/Reporting/Controls/UnionWiseWaterBodyByRange.ascx" tagname="UCUnionWiseWaterBodyByRange" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseWaterBodyByRange ID="UCUnionWiseWaterBodyByRange1" runat="server"/>
</asp:Content>
