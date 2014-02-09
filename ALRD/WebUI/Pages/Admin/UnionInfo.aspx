<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UnionInfo.aspx.cs" Inherits="WebUI.Pages.Admin.UnionInfo" %>
<%@ Register src="~/Controls/Admin/UnionInfo.ascx" tagname="UCUnionInfo" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUnionInfo ID="UCUnionInfo1" runat="server"/>
</asp:Content>
