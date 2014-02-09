<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="SecurityRoleDetail.aspx.cs" Inherits="WebUI.Pages.Admin.SecurityRoleDetail" %>
<%@ Register src="~/Controls/Admin/SecurityRoleDetail.ascx" tagname="UCSecurityRoleDetail" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCSecurityRoleDetail ID="UCSecurityRoleDetail1" runat="server"/>
</asp:Content>
