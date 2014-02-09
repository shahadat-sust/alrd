<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="WebUI.Pages.Consumer.ErrorPage" %>
<%@ Register src="~/Controls/Consumer/ErrorPage.ascx" tagname="UCErrorPage" tagprefix="uc1" %>    

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UCErrorPage ID="UCErrorPage1" runat="server"/>
</asp:Content>
