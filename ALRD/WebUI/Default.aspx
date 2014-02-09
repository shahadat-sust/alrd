<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SH.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebUI.Default" %>
<%@ Register src="~/Controls/Consumer/Home.ascx" tagname="UCHome" tagprefix="uc1" %> 
   


<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    
    <uc1:UCHome ID="UCHome1" runat="server"/>

</asp:Content>
