<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="SecurityUserList.aspx.cs" Inherits="WebUI.Pages.Admin.SecurityUserList" %>
<%@ Register src="~/Controls/Admin/SecurityUserList.ascx" tagname="UCSecurityUserList" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCSecurityUserList ID="UCSecurityUserList1" runat="server"/>
</asp:Content>
