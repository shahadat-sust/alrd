<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseKhasLandByRange.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseKhasLandByRange" %>
<%@ Register src="~/Reporting/Controls/UnionWiseKhasLandByRange.ascx" tagname="UCUnionWiseKhasLandByRange" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseKhasLandByRange ID="UCUnionWiseKhasLandByRange1" runat="server"/>
</asp:Content>
