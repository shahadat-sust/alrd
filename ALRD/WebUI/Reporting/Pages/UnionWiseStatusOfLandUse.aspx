<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseStatusOfLandUse.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseStatusOfLandUse" %>
<%@ Register src="~/Reporting/Controls/UnionWiseStatusOfLandUse.ascx" tagname="UCUnionWiseStatusOfLandUse" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseStatusOfLandUse ID="UCUnionWiseStatusOfLandUse1" runat="server"/>
</asp:Content>
