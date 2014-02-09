<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionWiseKhasLand.aspx.cs" Inherits="WebUI.Reporting.Pages.UnionWiseKhasLand" %>
<%@ Register src="~/Reporting/Controls/UnionWiseKhasLand.ascx" tagname="UCUnionWiseKhasLand" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionWiseKhasLand ID="UCUnionWiseKhasLand1" runat="server"/>
</asp:Content>
