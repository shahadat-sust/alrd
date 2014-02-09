<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="SecurityUserInfo.aspx.cs" Inherits="WebUI.Pages.Admin.SecurityUserInfo" %>
<%@ Register src="~/Controls/Admin/SecurityUserInfo.ascx" tagname="UCSecurityUserInfo" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCSecurityUserInfo ID="UCSecurityUserInfo1" runat="server"/>
</asp:Content>
