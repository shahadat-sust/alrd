<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GovernmentKhasLandDataList.ascx.cs" Inherits="WebUI.Controls.Admin.GovernmentKhasLandDataList" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>
       
		<script type="text/javascript">
		    $(document).ready(function () {
		        initActiveMenu('GOVERNMENT');
		        initInputFields();
            });

        </script>
        <style type="text/css">
            .ui-dialog {min-height:600px;}
        </style>
        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Govt. Collected Info (Khas Land)</strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server" Visible="false">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlSearchHotel" runat="server" ClientIDMode="Static" CssClass="hotel-search">
                <div class="title-contain"> Search </div>
                <div class="w100">
                    <table class="w100 iTable">
                        <tr>
                            <td class="w40">
                                <asp:Label ID="Label2" runat="server" Text="Month" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="w100" >
                                    <asp:ListItem Text="--Please Select--" Value=""/>
                                    <asp:ListItem Text="January" Value="1"/>
                                    <asp:ListItem Text="February" Value="2"/>
                                    <asp:ListItem Text="March" Value="3"/>
                                    <asp:ListItem Text="April" Value="4"/>
                                    <asp:ListItem Text="May" Value="5"/>
                                    <asp:ListItem Text="June" Value="6"/>
                                    <asp:ListItem Text="July" Value="7"/>
                                    <asp:ListItem Text="August" Value="8"/>
                                    <asp:ListItem Text="September" Value="9"/>
                                    <asp:ListItem Text="October" Value="10"/>
                                    <asp:ListItem Text="November" Value="11"/>
                                    <asp:ListItem Text="December" Value="12"/>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="w40">
                                <asp:Label ID="Label1" runat="server" Text="Year" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="w100" >
                                    <asp:ListItem Text="--Please Select--" Value=""/>
                                    <asp:ListItem Text="2000" Value="2000"/>
                                    <asp:ListItem Text="2001" Value="2001"/>
                                    <asp:ListItem Text="2002" Value="2002"/>
                                    <asp:ListItem Text="2003" Value="2003"/>
                                    <asp:ListItem Text="2004" Value="2004"/>
                                    <asp:ListItem Text="2005" Value="2005"/>
                                    <asp:ListItem Text="2006" Value="2006"/>
                                    <asp:ListItem Text="2007" Value="2007"/>
                                    <asp:ListItem Text="2008" Value="2008"/>
                                    <asp:ListItem Text="2009" Value="2009"/>
                                    <asp:ListItem Text="2010" Value="2010"/>
                                    <asp:ListItem Text="2011" Value="2011"/>
                                    <asp:ListItem Text="2012" Value="2012"/>
                                    <asp:ListItem Text="2013" Value="2013"/>
                                    <asp:ListItem Text="2014" Value="2014"/>
                                    <asp:ListItem Text="2015" Value="2015"/>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="w40">
                                <asp:Label ID="lblHotelName" runat="server" Text="Division" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlDivision" runat="server" CssClass="w100" 
                                    AutoPostBack="True" onselectedindexchanged="ddlDivision_SelectedIndexChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td class="w40">
                                <asp:Label ID="Label5" runat="server" Text="District" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="w100" 
                                    AutoPostBack="True" onselectedindexchanged="ddlDistrict_SelectedIndexChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td class="w40">
                                <asp:Label ID="Label6" runat="server" Text="Upazilla" />
                            </td>
                            <td class="w60">
                                <asp:DropDownList ID="ddlUpazilla" runat="server" CssClass="w100" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="w100">
                    <asp:Button ID="btnFilter" runat="server" CssClass="button" Text="Serach" onclick="btnFilter_Click"/>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="hotel-list">
                <div class="title-contain"> Information List </div>
                <br />
                <div class="w100">
                    <asp:HyperLink ID="lnkAddNew" runat="server" Text="Add New" CssClass="abutton fr " NavigateUrl="~/Pages/Admin/GovernmentKhasLandData.aspx" />                
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
                                        <th class="w5">
                                            <asp:Label ID="Label2" runat="server" Text=" SL" />
                                        </th>
                                        					
                                        <th class="w15">
                                            <asp:Label ID="thHotelName" runat="server" Text="Month" />
                                        </th>
                                        <th class="w15">
                                            <asp:Label ID="Label4" runat="server" Text="Year" />
                                        </th>
                                        <th class="w20">
                                            <asp:Label ID="Label3" runat="server" Text="Division" />
                                        </th>
                                        <th class="w20">
                                            <asp:Label ID="Label8" runat="server" Text="District" />
                                        </th>
                                        <th class="w20">
                                            <asp:Label ID="Label9" runat="server" Text="Upazilla" />
                                        </th>	
                                        <th class="w5">
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
                                    <%# Eval("CollCollectionYear")%>
                                </td>
				                <td>
                                    <%# Eval("MonthName") %>
                                </td>
                                <td>
                                    <%# Eval("DivisionName")%>
                                </td>      
                                <td>
                                    <%# Eval("DistrictName")%>
                                </td>   
                                <td>
                                    <%# Eval("UpazilaName")%>
                                </td>                   
						        <td>
                                     
                                    <asp:Button id="aEdit" runat="server" class="aEdit" Height="17px" Width="17px" ToolTip="Edit Info"
							            CommandArgument='<%# DataBinder.Eval(Container, "DataItem.COMPID") %>' 
                                        CommandName="edit" />                       
                                    <asp:Button id="aDelete" runat="server" class="aDelete" Height="17px" Width="17px" OnClientClick="javascript:return confirm('Do you want to delete this information?');" ToolTip="Delete Info"
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
        <asp:AsyncPostBackTrigger ControlID="ddlDivision" />
        <asp:AsyncPostBackTrigger ControlID="ddlDistrict" />
    </Triggers>
</asp:UpdatePanel>

