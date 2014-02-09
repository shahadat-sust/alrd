<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseStatusOfLandUseByRange.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseStatusOfLandUseByRange" %>
<%@ Register src="~/Reporting/Controls/UnionWiseStatusOfLandUseByRange.ascx" tagname="UCUnionWiseStatusOfLandUseByRange" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseStatusOfLandUseByRange ID="UCUnionWiseStatusOfLandUseByRange1" runat="server"/>
</asp:Content>
