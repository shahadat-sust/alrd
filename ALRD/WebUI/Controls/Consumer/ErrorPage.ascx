<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.ascx.cs" Inherits="WebUI.Controls.Consumer.ErrorPage" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		    function pageLoad() {
		        initActiveMenu('HOME');
		        initInputFields();
		    }
        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong><asp:Label ID="lblTitle" runat="server"/></strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10 h100">
                <div class="error-page">
                    You have no permission to access this page.
                </div>
                <div class="clear"></div>
            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>

    </contenttemplate>
</asp:UpdatePanel>

