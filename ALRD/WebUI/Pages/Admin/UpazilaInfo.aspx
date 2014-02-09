<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="UpazilaInfo.aspx.cs" Inherits="WebUI.Pages.Admin.UpazilaInfo" %>
<%@ Register src="~/Controls/Admin/UpazilaInfo.ascx" tagname="UCUpazilaInfo" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCUpazilaInfo ID="UCUpazilaInfo1" runat="server"/>
</asp:Content>
