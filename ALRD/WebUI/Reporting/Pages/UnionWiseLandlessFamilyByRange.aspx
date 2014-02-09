<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseLandlessFamilyByRange.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseLandlessFamilyByRange" %>
<%@ Register src="~/Reporting/Controls/UnionWiseLandlessFamilyByRange.ascx" tagname="UCUnionWiseLandlessFamilyByRange" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseLandlessFamilyByRange ID="UCUnionWiseLandlessFamilyByRange1" runat="server"/>
</asp:Content>
