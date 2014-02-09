<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="SecurityRole.aspx.cs" Inherits="WebUI.Pages.Admin.SecurityRole" %>
<%@ Register src="~/Controls/Admin/SecurityRole.ascx" tagname="UCSecurityRole" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCSecurityRole ID="UCSecurityRole1" runat="server"/>
</asp:Content>
