<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseLandlessFamily.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseLandlessFamily" %>
<%@ Register src="~/Reporting/Controls/UnionWiseLandlessFamily.ascx" tagname="UCUnionWiseLandlessFamily" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseLandlessFamily ID="UCUnionWiseLandlessFamily1" runat="server"/>
</asp:Content>
