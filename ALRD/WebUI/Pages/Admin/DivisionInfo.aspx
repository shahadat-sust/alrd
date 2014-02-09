<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="DivisionInfo.aspx.cs" Inherits="WebUI.Pages.Admin.DivisionInfo" %>
<%@ Register src="~/Controls/Admin/DivisionInfo.ascx" tagname="UCDivisionInfo" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCDivisionInfo ID="UCDivisionInfo1" runat="server"/>
</asp:Content>
