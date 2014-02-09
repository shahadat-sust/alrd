<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityRoleDetail.ascx.cs" Inherits="WebUI.Controls.Admin.SecurityRoleDetail" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		        function pageLoad() {
		            initActiveMenu('SECURITY');
		            initInputFields();
		        }
        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Form & Role Mapping</strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10 form-container">
                <div class="title-contain"> Form & Role Mapping </div>
                <br />
                <asp:HiddenField ID="hdnUserID" runat="server"/>
                
                <table class="w100 iTable">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Rool Type"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoleType" runat="server" CssClass="w257px required" 
                                AutoPostBack="True" onselectedindexchanged="ddlRoleType_SelectedIndexChanged" />
                            <asp:Label ID="Label18" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                </table>
                <div class="w100 hr-dot mr-tb-25"></div>
                <div class="w100">
                     <asp:Repeater id="rptMenuInfo" runat="server" OnItemDataBound="rptMenuInfo_ItemDataBound">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                             <asp:HiddenField ID="hdnMenuID" runat="server" Value='<%#  Eval("COMPID") %>'/> 
                             <div class="collapse-title">
                                <asp:Label ID="lblMenuName" runat="server" Text='<%#  Eval("MenuName") %>'/>
                             </div>
                             <div class="collapse-body">
                                <asp:ListView id="lsvFormInfo" runat="server">
                                    <LayoutTemplate>
                                        <table class="w100 table">
                                        <thead>
                                            <tr>
                                                <th class="w40">
                                                    <asp:Label ID="lblFormName" runat="server" Text='Form Name'/>
                                                </th>
                                                <th class="w15 center">
                                                    <asp:Label ID="Label2" runat="server" Text='Is Visible'/>
                                                </th>
                                                <th class="w15 center">
                                                    <asp:Label ID="Label3" runat="server" Text='Can Insert'/>
                                                </th>
                                                <th class="w15 center">
                                                    <asp:Label ID="Label4" runat="server" Text='Can Update'/>
                                                </th>
                                                <th class="w15 center">
                                                    <asp:Label ID="Label5" runat="server" Text='Can Delete'/>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody ID="itemPlaceholder" runat="server">
                                        </tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr class='<%# Container.DataItemIndex % 2 == 0 ? "" : "even" %>'>
                                            <td>
                                                <asp:Label ID="lblFormName" runat="server" Text='<%#  Eval("FormName") %>'/>
                                                <asp:TextBox ID="txtRoleDetailID" runat="server" Text='<%#  Eval("COMPID") %>' Visible="false"/>
                                                <asp:TextBox ID="txtFormID" runat="server" Text='<%#  Eval("FormID") %>' Visible="false"/>
                                                <asp:TextBox ID="txtCreatedOn" runat="server"  Text='<%#  Eval("CreatedOn") != null && DateTime.Parse(Eval("CreatedOn").ToString()).Year > 1900 ? Eval("CreatedOn", "{0:dd-MM-yyyy}") : ""%>' Visible="false" />
                                                <asp:TextBox ID="txtCreatedBy" runat="server"  Text='<% #Bind("CreatedBy")%>'  Visible="false" />
                                            </td>
                                            <td class="center">
                                                <asp:CheckBox ID="chkIsVisible" runat="server" Checked='<%#  Eval("IsVisible") != null ? (bool?)Eval("IsVisible") : false %>'/>
                                            </td>
                                            <td class="center">
                                                <asp:CheckBox ID="chkCanInsert" runat="server" Checked='<%#  Eval("CanInsert") != null ? (bool?)Eval("CanInsert") : false %>'/>
                                            </td>
                                            <td class="center">
                                                <asp:CheckBox ID="chkCanUpdate" runat="server" Checked='<%#  Eval("CanUpdate") != null ? (bool?)Eval("CanUpdate") : false %>'/>
                                            </td>
                                            <td class="center">
                                                <asp:CheckBox ID="chkCanDelete" runat="server" Checked='<%#  Eval("CanDelete") != null ? (bool?)Eval("CanDelete") : false %>'/>
                                            </td>
                                        </tr>
                                        
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="clear"></div>
                </div>
                <div class="w100 hr-dot mr-tb-25"></div>
                <div class="w100">
                    <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to save this information?');" CssClass="button fr" Text="Save" onclick="btnSave_Click"/>    
                    <asp:Button ID="btnReset" runat="server" OnClientClick="javascript:return confirm('Do you want to discard this change?');" CssClass="button fr" Text="Clear" onclick="btnClear_Click"/>            
                </div>
            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
</asp:UpdatePanel>

