<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="WebUI.Controls.Consumer.Home" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>
       
		<script type="text/javascript">
		    $(document).ready(function () {
		        initActiveMenu('HOME');
		        initInputFields();
            });

        </script>
        <style type="text/css">
            .ui-dialog {min-height:600px;}
        </style>
        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Home</strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server" Visible="false">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
           
       
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
</asp:UpdatePanel>

