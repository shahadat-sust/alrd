<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityRole.ascx.cs" Inherits="WebUI.Controls.Admin.SecurityRole" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		    function pageLoad() {
		        initActiveMenu('SECURITY');
		        initInputFields();
		    }
        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Role Type</strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10">
                <div class="title-contain"> Role Type Setup </div>
                <div class="w100">
                    <asp:Button ID="btnAdd" runat="server" CssClass="button fr" Text="Add New Role" onclick="btnAdd_Click"/> 
                </div>
                <asp:ListView ID="lsv_SetupPage" Enabled="true" runat="server" DataKeyNames="COMPID" OnItemCommand="lsv_SetupPage_ItemCommand" OnItemDataBound="lsv_SetupPage_ItemDataBound" InsertItemPosition="None" OnItemCanceling="lsv_SetupPage_ItemCanceling" OnItemDeleting="lsv_SetupPage_ItemDeleting" OnItemEditing="lsv_SetupPage_ItemEditing" OnItemInserting="lsv_SetupPage_ItemInserting" OnItemUpdating="lsv_SetupPage_ItemUpdating" OnItemCreated="lsv_SetupPage_ItemCreated">
                    <LayoutTemplate>
                        <table id="tbl_RoomInfo" class="vTable">
                            <thead>
                                <tr>
                                    <th class="w5">
                                        <asp:Label ID="Label2" runat="server" Text=" SL" /></th>
                                    <th class="w30">
                                        <asp:Label ID="lblgrd_rationscalekey" runat="server" Text=" Role Type" /></th>     
                                    <th class="w30">
                                        <asp:Label ID="Label8" runat="server" Text=" Short Name" /></th>   
                                    <th class="w30">
                                        <asp:Label ID="Label1" runat="server" Text=" Description" /></th>                             
                                    <th class="w5">
                                        <asp:Label ID="Label3" runat="server" Text=" Actions " /></th>
                                </tr>
                            </thead>
                            <tbody id="itemPlaceholder" runat="server" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr id="row" runat="server">
                            <td>
                                <%# Container.DataItemIndex + 1%>
                            </td>
                            <td>
                                <asp:Label Visible="false" ID="lblRole_ID" runat="server" Text='<%# Eval("COMPID")%>' />
                                <%# Eval("RoleName")%>
                            </td>
                            <td>
                                <%# Eval("ShortName")%>
                            </td>
                            <td>
                                <%# Eval("LongDescription")%>
                            </td>
                            <td>
                                <asp:Button ID="btnEdit" Height="17px" Width="17px" CommandName="Edit" runat="server" CssClass="aEdit" ToolTip="Edit" />
                                <asp:Button ID="btnDelete" Height="17px" Width="17px" CommandName="Delete" CssClass="aDelete" CommandArgument='<%# Eval("COMPID")%>' runat="server" ToolTip="Delete" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <tr>
                            <td colspan="6">
                                    <table class="iTable form-container">
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label2" runat="server" Text="Role Type" />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtRoleName" runat="server" CssClass="w250px required"/>
                                                <asp:Label ID="Label33" runat="server" CssClass="asteric" Text="*" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label4" runat="server" Text="Short Name" />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtShortName" runat="server" CssClass="w250px required"/>
                                                <asp:Label ID="Label5" runat="server" CssClass="asteric" Text="*" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label6" runat="server" Text="Description" />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtLongDescription" runat="server" CssClass="w250px" TextMode="MultiLine"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to save this information?');" CommandName="Insert" ToolTip="Save"  CssClass="button fr" Text="Save"/>    
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false" ToolTip="Cancel"  CssClass="button fr" Text="Cancel"/>     
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label Visible="false" ID="lblRole_ID" runat="server" Text='<%# Eval("COMPID")%>' />
                            </td>         
                        </tr>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td colspan="6">
                                    <table class="iTable form-container">
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label2" runat="server" Text="Role Type" />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtRoleName" runat="server" CssClass="w250px required" Text='<%# Eval("RoleName")%>'/>
                                                <asp:Label ID="Label33" runat="server" CssClass="asteric" Text="*" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label4" runat="server" Text="Short Name" />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtShortName" runat="server" CssClass="w250px required" Text='<%# Eval("ShortName")%>'/>
                                                <asp:Label ID="Label5" runat="server" CssClass="asteric" Text="*" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label6" runat="server" Text="Description" />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtLongDescription" runat="server" CssClass="w250px" TextMode="MultiLine" Text='<%# Eval("LongDescription")%>'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to update this information?');" CommandName="Update" ToolTip="Save"  CssClass="button fr" Text="Save"/>    
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false" ToolTip="Cancel"  CssClass="button fr" Text="Cancel"/>   
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label Visible="false" ID="lblRole_ID" runat="server" Text='<%# Eval("COMPID")%>' />
                                    <asp:TextBox ID="txtCreatedOn" runat="server"  Text='<%#  Eval("CreatedOn") != null && DateTime.Parse(Eval("CreatedOn").ToString()).Year > 1900 ? Eval("CreatedOn", "{0:dd-MM-yyyy}") : ""%>' CssClass=" hide" />
                                    <asp:TextBox ID="txtCreatedBy" runat="server"  Text='<% #Bind("CreatedBy")%>' CssClass=" hide" />
                            </td>                             
                        </tr>
                    </EditItemTemplate>
                </asp:ListView>

            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lsv_SetupPage" />
    </Triggers>
</asp:UpdatePanel>
