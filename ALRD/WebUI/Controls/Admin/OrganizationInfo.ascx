<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrganizationInfo.ascx.cs" Inherits="WebUI.Controls.Admin.OrganizationInfo" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		    function pageLoad() {
		        initActiveMenu('SETUP');
		        initInputFields();
		    }
        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Organization</strong> </h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10">
                <div class="title-contain"> Organization Setup </div>
                <div class="w100">
                    <asp:Button ID="btnAdd" runat="server" CssClass="button fr" Text="Add New Organization" onclick="btnAdd_Click"/> 
                </div>
                <asp:ListView ID="lsv_SetupPage" Enabled="true" runat="server" DataKeyNames="COMPID" OnItemCommand="lsv_SetupPage_ItemCommand" OnItemDataBound="lsv_SetupPage_ItemDataBound" InsertItemPosition="None" OnItemCanceling="lsv_SetupPage_ItemCanceling" OnItemDeleting="lsv_SetupPage_ItemDeleting" OnItemEditing="lsv_SetupPage_ItemEditing" OnItemInserting="lsv_SetupPage_ItemInserting" OnItemUpdating="lsv_SetupPage_ItemUpdating" OnItemCreated="lsv_SetupPage_ItemCreated">
                    <LayoutTemplate>
                        <table id="tbl_RoomInfo" class="vTable">
                            <thead>
                                <tr>
                                    <th class="w5">
                                        <asp:Label ID="Label2" runat="server" Text=" SL" /></th> 
                                    <th class="w25">
                                        <asp:Label ID="Label6" runat="server" Text="Organization Name" /></th>
                                    <th class="w25">
                                        <asp:Label ID="Label7" runat="server" Text=" Name of CEO" /></th>
                                    <th class="w20">
                                        <asp:Label ID="Label5" runat="server" Text=" Telephone No" /></th>                                          
                                    <th class="w20">
                                        <asp:Label ID="Label4" runat="server" Text=" Status" /></th>                       
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
                                <asp:Label Visible="false" ID="lblCOMPID" runat="server" Text='<%# Eval("COMPID")%>' />
                                <%# Eval("DESCRIPT")%>
                            </td>
                            <td>
                                <%# Eval("NameOfCEO")%>
                            </td>
                            <td>
                                <%# Eval("TelephoneNo")%>
                            </td>
                            <td>
                                <%# Eval("StatusName")%>
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
                                               <asp:Label ID="Label2" runat="server" Text=" Organization Name " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtDESCRIPT" runat="server" CssClass="w250px required"/>
                                                <asp:Label ID="Label33" runat="server" CssClass="asteric" Text="*" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label8" runat="server" Text=" Name of CEO " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtNameOfCEO" runat="server" CssClass="w250px "/>
                                     
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label12" runat="server" Text=" Telephone No " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtTelephoneNo" runat="server" CssClass="w250px "/>
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label14" runat="server" Text=" Mobile No " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtMobileNo" runat="server" CssClass="w250px "/>
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label16" runat="server" Text=" Email " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="w250px emailnr"/>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label18" runat="server" Text=" Web Site " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtWebSite" runat="server" CssClass="w250px "/>
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label10" runat="server" Text=" Fax " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtFax" runat="server" CssClass="w250px "/>
                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label20" runat="server" Text=" Status " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:CheckBox ID="chkStatus" runat="server"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to save this information?');" CommandName="Insert" ToolTip="Save"  CssClass="button fr" Text="Save"/>    
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false" ToolTip="Cancel"  CssClass="button fr" Text="Cancel"/>     
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label Visible="false" ID="lblCOMPID" runat="server" Text='<%# Eval("COMPID")%>' />
                            </td>         
                        </tr>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td colspan="6">
                                    <table class="iTable form-container">
                                         <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label2" runat="server" Text=" Organization Name " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtDESCRIPT" runat="server" Text='<% #Bind("DESCRIPT")%>' CssClass="w250px required"/>
                                                <asp:Label ID="Label21" runat="server" CssClass="asteric" Text="*" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label8" runat="server" Text=" Name Of CEO " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtNameOfCEO" runat="server" Text='<% #Bind("NameOfCEO")%>' CssClass="w250px "/>
                                              
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label12" runat="server" Text=" Telephone No " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtTelephoneNo" runat="server" Text='<% #Bind("TelephoneNo")%>' CssClass="w250px "/>
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label14" runat="server" Text=" Mobile No " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtMobileNo" runat="server" Text='<% #Bind("MobileNo")%>' CssClass="w250px "/>
                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label16" runat="server" Text=" Email " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtEmail" runat="server" Text='<% #Bind("Email")%>' CssClass="w250px emailnr"/>
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label18" runat="server" Text=" Web Site " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtWebSite" runat="server" Text='<% #Bind("WebSite")%>' CssClass="w250px "/>
                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label10" runat="server" Text=" Fax " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:TextBox ID="txtFax" runat="server" Text='<% #Bind("Fax")%>' CssClass="w250px "/>
                                          
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w30">
                                               <asp:Label ID="Label20" runat="server" Text=" Status " />
                                            </td>                                                 
                                            <td class="w70">
                                                <asp:CheckBox ID="chkStatus" Checked='<% #Bind("Status")%>' runat="server"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to update this information?');" CommandName="Update" ToolTip="Save"  CssClass="button fr" Text="Save"/>    
                                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false" ToolTip="Cancel"  CssClass="button fr" Text="Cancel"/>   
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label Visible="false" ID="lblCOMPID" runat="server" Text='<%# Eval("COMPID")%>' />
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
