<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GovernmentKhasLandData.ascx.cs" Inherits="WebUI.Controls.Admin.GovernmentKhasLandData" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		        function pageLoad() {
		            initActiveMenu('GOVERNMENT');
		            initInputFields();
		        }

        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Information Form</strong></h1>
            <a class="backto-prev fr" runat="server" href="~/Pages/Admin/GovernmentKhasLandDataList.aspx">Back to Previous</a>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10 form-container">
                <div class="title-contain" style="text-align:center"> 
                    <span style="font-size:22px;text-align:center">Information Collected from Government (Khas Land)</span> 
                    <br />
                    <span style="font-size:16px;text-align:center">Association for Land Reform and Development (ALRD)</span>  
                </div>
                <br />
                <asp:HiddenField ID="hdnCOMPID" runat="server"/>
                <asp:HiddenField ID="hdnCreatedBy" runat="server"/>
                <asp:HiddenField ID="hdnCreatedOn" runat="server"/>
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label16" runat="server" Text="Data Collection Month/ Year (Select):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w15">
                            <asp:Label ID="Label19" runat="server" Text="Year:" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="w250px required" >
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
                             <asp:Label ID="Label1" runat="server" CssClass="asteric" Text="*" />
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label20" runat="server" Text="Month:" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlMonth" runat="server" CssClass="w250px required" >
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
                            <asp:Label ID="Label33" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label13" runat="server" Text="Working Area (Select):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w15">
                            <asp:Label ID="Label14" runat="server" Text="Division:" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlDivision" runat="server" CssClass="w250px required" 
                                AutoPostBack="True" onselectedindexchanged="ddlDivision_SelectedIndexChanged" />
                            <asp:Label ID="lblDivisionReq" runat="server"  CssClass="asteric" Text="*" />
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label15" runat="server" Text="District:" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="w250px required" 
                                AutoPostBack="True" onselectedindexchanged="ddlDistrict_SelectedIndexChanged" />
                            <asp:Label ID="lblDistrictReq" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="Upazilla:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUpazilla" runat="server" CssClass="w250px " />
                        </td>
                        <td>
               
                        </td>
                        <td>

                        </td>
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="1. District /Upazila wise Khas Land (As per Government Information):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="w100 iTable">
                                    <tr>
                                        <td colspan="2"></td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Agricultural" CssClass="bold"/>   
                                        </td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Non-Agrcultural" CssClass="bold"/>   
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w5">
                                            <asp:Label ID="Label3" runat="server" Text="1.1" CssClass="bold"/>                                          
                                        </td> 
                                        <td class="w30">
                                            <asp:Label ID="Label2" runat="server" Text="Total Khas Land (In Acre)" CssClass="bold"/> 
                                        </td>
                                        <td class="w25">
                                            <asp:TextBox ID="txtTotalKhasLandAgri" runat="server" CssClass="w200px decimal" style="text-align:right;"/>
                                            <asp:Label ID="lblTotalKhasLandGov11Req" runat="server" CssClass="asteric" Text="*" />
                                        </td>
                                        <td class="w25">
                                            <asp:TextBox ID="txtTotalKhasLandNonAgri" runat="server" CssClass="w200px decimal" style="text-align:right;"/>
                                            <asp:Label ID="Label4" runat="server" CssClass="asteric" Text="*" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="1.2" CssClass="bold"/>                                          
                                        </td> 
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Distributed Khas Land (In Acre)" CssClass="bold"/> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDistributedKhasLandAgri" runat="server" CssClass="w200px decimal" style="text-align:right;"/>
                                            <asp:Label ID="Label10" runat="server" CssClass="asteric" Text="*" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDistributedKhasLandNonAgri" runat="server" CssClass="w200px decimal" style="text-align:right;"/>
                                            <asp:Label ID="Label11" runat="server" CssClass="asteric" Text="*" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="1.3" CssClass="bold"/>                                          
                                        </td> 
                                        <td>
                                            <asp:Label ID="Label18" runat="server" Text="Distributable Khas Land (In Acre)" CssClass="bold"/> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDistributableKhasLandAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDistributableKhasLandNonAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label21" runat="server" Text="1.4" CssClass="bold"/>                                          
                                        </td> 
                                        <td>
                                            <asp:Label ID="Label22" runat="server" Text="No of Family got Khas Land" CssClass="bold"/> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNoOfFamilyGotKhasLandAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNoOfFamilyGotKhasLandNonAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label23" runat="server" Text="1.5" CssClass="bold"/>                                          
                                        </td> 
                                        <td>
                                            <asp:Label ID="Label24" runat="server" Text="Illegally occupied Khas Land (In Acre)" CssClass="bold"/> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtIllegalOccupiedKhasLandAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtIllegalOccupiedKhasLandNonAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label25" runat="server" Text="1.6" CssClass="bold"/>                                          
                                        </td> 
                                        <td>
                                            <asp:Label ID="Label26" runat="server" Text="Khas Land With Suit/Case (In Acre)" CssClass="bold"/> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtKhasLandWithSuitCaseAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtKhasLandWithSuitCaseNonAgri" runat="server" CssClass="w200px decimalnr" style="text-align:right;"/>
                                        </td>
                                    </tr>
                            </table>
                        </td>  
                    </tr>
                </table>
                <br /> 
                <table class="w100 iTable">
                    <tr>
                        <td>
                            <asp:Label ID="Label124" runat="server" Text="2. Remarks (if any):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="6" Width="840px"/>     
                        </td>
                    </tr>
                </table>
                <div class="w100 ">
                    <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to save this information?');" CssClass="button fr" Text="Save" onclick="btnSave_Click"/>    
                    <asp:Button ID="btnReset" runat="server" OnClientClick="javascript:return clearEntryFields();" CssClass="button fr" Text="Clear" onclick="btnClear_Click"/>            
                </div>
            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlDivision" />
        <asp:AsyncPostBackTrigger ControlID="ddlDistrict" />
    </Triggers>
</asp:UpdatePanel>

