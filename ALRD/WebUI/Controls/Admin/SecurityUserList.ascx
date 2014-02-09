<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecurityUserList.ascx.cs" Inherits="WebUI.Controls.Admin.SecurityUserList" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		    function pageLoad() {
		        initActiveMenu('SECURITY');
		        initInputFields();
		    }
        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>User List</strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlSearchHotel" runat="server" ClientIDMode="Static" CssClass="hotel-search">
                <div class="title-contain"> Search User </div>
                <div class="w100">
                    <table class="w100 iTable">
                        <tr>
                            <td class="w40">
                                <asp:Label ID="lblHotelName" runat="server" Text="Username" />
                            </td>
                            <td class="w60">
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="w95"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="w40">
                                <asp:Label ID="Label2" runat="server" Text="Role Type" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlRoleType" runat="server" CssClass="w100" />
                            </td>
                        </tr>
                        <tr>
                            <td class="w40">
                                <asp:Label ID="Label1" runat="server" Text="Status" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="w100" >
                                    <asp:ListItem Text="--Please Select--" Value=""/>
                                    <asp:ListItem Text="Active" Value="true"/>
                                    <asp:ListItem Text="Inactive" Value="false"/>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="w100">
                    <asp:Button ID="btnFilter" runat="server" CssClass="button" Text="Serach" onclick="btnFilter_Click"/>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="hotel-list">
                <div class="title-contain"> User List </div>
                <br />
                <div class="w100">
                    <asp:HyperLink ID="lnkAddNew" runat="server" Text="Add New User" CssClass="abutton fr " NavigateUrl="~/Pages/Admin/SecurityUserInfo.aspx" />                
                </div>
                 <br />
                 <br />
                 <br />
                <asp:Panel ID="pnlTable" runat="server" ClientIDMode="Static" CssClass="w100" >       
			        <asp:ListView ID="lsvUserList" runat="server"  EnabledViewState="true" OnItemDataBound="lsvUserList_ItemDataBound" OnItemCommand="lsvUserList_ItemCommand"
                     DataKeyNames="COMPID" OnItemCanceling="lsvUserList_ItemCanceling" OnItemDeleting="lsvUserList_ItemDeleting" OnItemEditing="lsvUserList_ItemEditing" OnItemInserting="lsvUserList_ItemInserting" OnItemUpdating="lsvUserList_ItemUpdating" OnItemCreated="lsvUserList_ItemCreated"
                    >
                        <LayoutTemplate>
				            <table style="width:100%" id="table" class="vTable" >
                                <thead>
                                    <tr>	
                                        <th>
                                            <asp:Label ID="Label2" runat="server" Text=" SL" />
                                        </th>
                                        <th>
                                            <asp:Label ID="Label3" runat="server" Text="Full Name" />
                                        </th>						
                                        <th>
                                            <asp:Label ID="thHotelName" runat="server" Text="Username" />
                                        </th>
                                        <th>
                                            <asp:Label ID="Label4" runat="server" Text="Role Type" />
                                        </th>
                                        <th>
                                            <asp:Label ID="Label6" runat="server" Text="Status" />
                                        </th>
                                        <th>
                                            <asp:Label ID="Label7" runat="server" Text="Action" />
                                        </th>
                                    </tr>
                                </thead>
						        <tbody ID="itemPlaceholder" runat="server"></tbody>
                                <tfoot>
                                    <tr class="pager" >
                                      <tr>
                                      </tr>
                                    </tr>
                                </tfoot>
                            </table>
                        </LayoutTemplate>
				        <EmptyDataTemplate>
					        <table ID="table" runat="server">
					            <tr ID="itemPlaceholder" runat="server" />
						        <tr>
						            <td height="35">
							            No data Exists.
							        </td>
						        </tr>
					        </table>
                        </EmptyDataTemplate>
				        <ItemTemplate>
                            <tr ID="row" runat="server" class='<%# (Container.DataItemIndex % 2 == 0 ? "row" : "altrow") + " dataRow" %>'>
                                <td>
                                    <%# Container.DataItemIndex + 1%>
                                </td>
                                <td>
                                    <%# Eval("FullName") %>
                                </td>
				                <td>
                                    <%# Eval("UserName") %>
                                </td>
                                <td>
                                    <%# Eval("RoleName") %>
                                </td>
                                <td>
                                    <%# Eval("StatusName") %>
                                </td>                              
						        <td>
                                     
                                    <asp:Button id="aEdit" runat="server" class="aEdit" Height="17px" Width="17px" ToolTip="Edit User Info"
							            CommandArgument='<%# DataBinder.Eval(Container, "DataItem.COMPID") %>' 
                                        CommandName="edit" />                       
                                    <asp:Button id="aDelete" runat="server" class="aDelete" Height="17px" Width="17px" OnClientClick="javascript:return confirm('Do you want to delete this information?');" ToolTip="Delete User Info"
							            CommandArgument='<%# DataBinder.Eval(Container, "DataItem.COMPID") %>' 
                                        CommandName="delete" />
                                                                 
						        </td>						                  
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>      
                </asp:Panel>
       
        
            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lsvUserList" />
    </Triggers>
</asp:UpdatePanel>
