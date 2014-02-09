<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityUserInfo.ascx.cs" Inherits="WebUI.Controls.Admin.SecurityUserInfo" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		        function pageLoad() {
		            initActiveMenu('SECURITY');
		            initInputFields();
		        }

		        function checkValidation(msg) {

		            var result = validateSubmit(msg);
		            var txtPassword = $.trim($('.txtPassword').val());
		            var txtRePassword = $.trim($('.txtRePassword').val());

		            if (result && txtPassword.length < 6) {
		                $("span[id$=lblException]").html("");
		                $("span[id$=lblException]").html("Password length must be greater than or equal 6!").css("color", "red");
		                $("span[id$=lblResult]").html("");
		                $(document).scrollTop(0);
		                return false;
		            } else if (result && txtPassword != txtRePassword) {
		                $("span[id$=lblException]").html("");
		                $("span[id$=lblException]").html("Password & Re-Password must be same!").css("color", "red");
		                $("span[id$=lblResult]").html("");
		                $(document).scrollTop(0);
		                return false;
		            } else if (result) {
		                return true;
		            }

		            return false;

		        }


        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>User Information</strong></h1>
            <a class="backto-prev fr" runat="server" href="~/Pages/Admin/SecurityUserList.aspx">Back to Previous</a>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10 form-container">
                <div class="title-contain"> User Info </div>
                <br />
                <asp:HiddenField ID="hdnUserID" runat="server"/>
                <asp:HiddenField ID="hdnCreatedBy" runat="server"/>
                <asp:HiddenField ID="hdnCreatedOn" runat="server"/>
                <asp:HiddenField ID="hdnActivationKey" runat="server"/>
                <asp:CheckBox ID="chkIsActivated" runat="server" Visible="false"/>
                <table class="w100 iTable">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Full Name"/>
                        </td>
                        <td>
                            <%--<asp:DropDownList ID="ddlPublicUser" runat="server" CssClass="w257px required" />--%>
                            <asp:TextBox ID="txtFullName" runat="server" MaxLength="150" class="w250px required"/>
                            <asp:Label ID="Label18" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="lblHotelName" runat="server" Text="Username"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtUserName" runat="server" MaxLength="150" class="w250px email"/>
                            <asp:Label ID="Label16" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrePassword" runat="server" Text="Prevoius Password"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPrePassword" TextMode="Password" runat="server" MaxLength="150" CssClass="w250px required txtPrePassword"/>
                            <asp:Label ID="atcPrePassword" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Password"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" MaxLength="150" class="w250px required txtPassword"/>
                            <asp:Label ID="Label17" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Re-Password"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server" MaxLength="150" class="w250px required txtRePassword"/>
                            <asp:Label ID="Label7" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>                   
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Role Type"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoleType" runat="server" CssClass="w257px required" />
                            <asp:Label ID="Label5" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="IP Address"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIPAddress" runat="server" MaxLength="150" class="w250px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="MAC Address"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMACAddress" runat="server" MaxLength="250" class="w250px"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="chkStatus" runat="server" Text="Is Active"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label12" runat="server" Text="Alternate Email"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtAlternateEmail" runat="server" MaxLength="150" class="w250px emailnr"/>
                        </td>
                    </tr>
                </table>
                <br />
                <div class="w100 ">
                    <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return checkValidation('Do you want to save this information?');" CssClass="button fr" Text="Save" onclick="btnSave_Click"/>    
                    <asp:Button ID="btnReset" runat="server" OnClientClick="javascript:return clearEntryFields();" CssClass="button fr" Text="Clear" onclick="btnClear_Click"/>            
                </div>
            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
</asp:UpdatePanel>

