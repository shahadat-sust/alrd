<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="DistrictInfo.aspx.cs" Inherits="WebUI.Pages.Admin.DistrictInfo" %>
<%@ Register src="~/Controls/Admin/DistrictInfo.ascx" tagname="UCDistrictInfo" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCDistrictInfo ID="UCDistrictInfo1" runat="server"/>
</asp:Content>
