<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrganizationData.ascx.cs" Inherits="WebUI.Controls.Admin.OrganizationData" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		        function pageLoad() {
		            initActiveMenu('ORGANIZATION');
		            initInputFields();
		        }

        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Information Form</strong></h1>
            <a class="backto-prev fr" runat="server" href="~/Pages/Admin/OrganizationDataList.aspx">Back to Previous</a>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10 form-container">
                <div class="title-contain" style="text-align:center"> 
                    <span style="font-size:22px;text-align:center">Information Sheet</span> 
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
                        <td colspan="2">
                            <asp:Label ID="Label11" runat="server" Text="Data Source (Select):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w17">
                            <asp:Label ID="Label9" runat="server" Text="Organization:" CssClass="bold"/>
                        </td>
                        <td class="w80">
                            <asp:DropDownList ID="ddlOrgName" runat="server" CssClass="w400px required" />
                            <asp:Label ID="Label2" runat="server" CssClass="asteric" Text="*" />
                        </td>        
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label3" runat="server" Text="Activities (Put Tick):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w15">
                            <asp:Label ID="Label4" runat="server" Text="Khas Land:" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:CheckBox ID="chkActKhaLand" runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkActKhaLand_CheckedChanged"/>
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label5" runat="server" Text="Khas Water Body:" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:CheckBox ID="chkActKhaWater" runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkActKhaWater_CheckedChanged"/>
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label6" runat="server" Text="Adibashi Land Rights:" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:CheckBox ID="chkActAdibasi" runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkActAdibasi_CheckedChanged"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Land Survey:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkActLanServey" runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkActLanServey_CheckedChanged"/>
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Awareness on Land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkActAwareness" runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkActAwareness_CheckedChanged"/>
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="Vested Property:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkActVestedProp" runat="server" AutoPostBack="True" 
                                oncheckedchanged="chkActVestedProp_CheckedChanged"/>
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
                            <asp:DropDownList ID="ddlDivision" runat="server" CssClass="w250px" 
                                AutoPostBack="True" onselectedindexchanged="ddlDivision_SelectedIndexChanged" />
                            <asp:Label ID="lblDivisionReq" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label15" runat="server" Text="District:" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="w250px " 
                                AutoPostBack="True" onselectedindexchanged="ddlDistrict_SelectedIndexChanged" />
                            <asp:Label ID="lblDistrictReq" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="Upazilla:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUpazilla" runat="server" CssClass="w250px " 
                                AutoPostBack="True" onselectedindexchanged="ddlUpazilla_SelectedIndexChanged" />
                            <asp:Label ID="lblUpazillaReq" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="Union:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUnion" runat="server" CssClass="w250px " />
                            <asp:Label ID="lblUnionReq" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label8" runat="server" Text="1. Union wise Khas Land (As per Government Information):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w5">
                            <asp:Label ID="Label21" runat="server" Text="1.1" CssClass="bold"/>
                        </td>
                        <td class="w20">
                            <asp:Label ID="Label27" runat="server" Text="Total Khas Land (in acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalKhasLandGov11" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                            <asp:Label ID="lblTotalKhasLandGov11Req" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                        <td class="w5">
                            <asp:Label ID="Label22" runat="server" Text="1.2" CssClass="bold"/>
                        </td>
                        <td class="w23">
                            <asp:Label ID="Label23" runat="server" Text="Area of Khas Land Distributed till do date (acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtDistributedKhasLandGov12" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                            <asp:Label ID="lblDistributedKhasLandGov12Req" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="1.3" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Distributable Khas Land (In Acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDistributableKhasLandGov13" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="1.4" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label28" runat="server" Text="Total No of Landless Family:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalLandlessFamilyGov14" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label29" runat="server" Text="1.5" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label30" runat="server" Text="No of Family got Khas Land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfFamilyGotKhasLandGov15" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label31" runat="server" Text="1.6" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label32" runat="server" Text="Litigated and Illegal occupied Khas Land (In Acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIllegalOccupiedKhasLandGov16" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label34" runat="server" Text="2. Union wise Khas Land (As per Research/Study/Assumption) : As per organization :" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w5">
                            <asp:Label ID="Label35" runat="server" Text="2.1" CssClass="bold"/>
                        </td>
                        <td class="w20">
                            <asp:Label ID="Label36" runat="server" Text="Total Khas Land (in acre):" CssClass="bold"/>
                            
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalKhasLandOrg21" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                            <asp:Label ID="lblTotalKhasLandOrg21Req" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                        <td class="w5">
                            <asp:Label ID="Label37" runat="server" Text="2.2" CssClass="bold"/>
                        </td>
                        <td class="w23">
                            <asp:Label ID="Label38" runat="server" Text="Amount of Khas Land Distributed till do date (in acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtDistributedKhasLandOrg22" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                            <asp:Label ID="lblDistributedKhasLandOrg22Req" runat="server" Visible="false" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label39" runat="server" Text="2.3" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Text="Distributable Khas Land (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDistributableKhasLandOrg23" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label41" runat="server" Text="2.4" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label42" runat="server" Text="Total No of Landless Family:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalLandlessFamilyOrg24" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label43" runat="server" Text="2.5" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label44" runat="server" Text="No of Family got Kash Land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfFamilyGotKhasLandOrg25" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label45" runat="server" Text="2.6" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label46" runat="server" Text="No of family evicted from Kash Land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfFamilyEvictedKhasLandOrg26" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label47" runat="server" Text="2.7" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label48" runat="server" Text="No of violence related to Kash land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfViolenceKhasLandOrg27" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label49" runat="server" Text="2.8" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label50" runat="server" Text="No of litigation related to Kash land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfLitigationKhasLandOrg28" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label51" runat="server" Text="2.9" CssClass="bold"/>
                        </td>
                        <td colspan="5">
                            <asp:Label ID="Label52" runat="server" Text="Initiative of the organization (NGO) related to eviction from Kash Land:" CssClass="bold"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <table width="100%">
                                <tr>
                                    <td class="w10">
                                        <asp:Label ID="Label53" runat="server" Text="Gathering:" CssClass="bold"/>
                                    </td>
                                    <td class="w20">
                                        <asp:TextBox ID="txtNoOfInitiativeGathOrg29" runat="server" CssClass="w100px integernr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label54" runat="server" Text="Rally:" CssClass="bold"/>
                                    </td>
                                    <td class="w20">
                                        <asp:TextBox ID="txtNoOfInitiativeRallyOrg29" runat="server" CssClass="w100px integernr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label55" runat="server" Text="Memorandum:" CssClass="bold"/>
                                    </td>
                                    <td class="w20">
                                        <asp:TextBox ID="txtNoOfInitiativeMemoOrg29" runat="server" CssClass="w100px integernr" style="text-align:right;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label56" runat="server" Text="Legal Support:" CssClass="bold"/>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfInitiativeLegalOrg29" runat="server" CssClass="w100px integernr" style="text-align:right;"/>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label57" runat="server" Text="Meeting:" CssClass="bold"/>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfInitiativeMeetOrg29" runat="server" CssClass="w100px integernr" style="text-align:right;"/>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label58" runat="server" Text="Others:" CssClass="bold"/>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfInitiativeOthOrg29" runat="server" CssClass="w100px integernr" style="text-align:right;"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label59" runat="server" Text="3. Union wise Water body (As per Government Information):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w5">
                            <asp:Label ID="Label60" runat="server" Text="3.1" CssClass="bold"/>
                        </td>
                        <td class="w20">
                            <asp:Label ID="Label61" runat="server" Text="Total Khas water body under 20 acre ( In acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalLess20KhasWaterGov31" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td class="w5">
                            <asp:Label ID="Label62" runat="server" Text="3.2" CssClass="bold"/>
                        </td>
                        <td class="w23">
                            <asp:Label ID="Label63" runat="server" Text="Total Khas water body over 20 acre ( In acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalMore20KhasWaterGov32" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label64" runat="server" Text="3.3" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label65" runat="server" Text="Total lease out Khas water body under 20 acre (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalLeaseLess20KhasWaterGov33" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label66" runat="server" Text="3.4" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label67" runat="server" Text="Total lease out Khas water body over 20 acre (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalLeaseMore20KhasWaterGov34" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label68" runat="server" Text="4. Union wise Water body (As per Research/Study/Asumption):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w5">
                            <asp:Label ID="Label69" runat="server" Text="4.1" CssClass="bold"/>
                        </td>
                        <td class="w20">
                            <asp:Label ID="Label70" runat="server" Text="Total Khas water body under 20 acre ( In acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalLess20KhasWaterOrg41" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td class="w5">
                            <asp:Label ID="Label71" runat="server" Text="4.2" CssClass="bold"/>
                        </td>
                        <td class="w23">
                            <asp:Label ID="Label72" runat="server" Text="Total Khas water body over 20 acre ( In acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalMore20KhasWaterOrg42" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label73" runat="server" Text="4.3" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label74" runat="server" Text="Total lease out Khas water body under 20 acre (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalLeaseLess20KhasWaterOrg43" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label75" runat="server" Text="4.4" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label76" runat="server" Text="Total lease out Khas water body over 20 acre (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalLeaseMore20KhasWaterOrg44" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label77" runat="server" Text="4.5" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label78" runat="server" Text="No of family depend on fishing:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfFamilyFishingOrg45" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label79" runat="server" Text="4.6" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label80" runat="server" Text="No of registered fisher folk co-oparative:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfRegFisherFolkCoOrg46" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label81" runat="server" Text="4.7" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label82" runat="server" Text="No of fisher folk cooperative:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfFisherFolkCoOrg47" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label83" runat="server" Text="4.8" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label84" runat="server" Text="No of litigation related to Khas water body:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfLitigationKhasWaterOrg48" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label93" runat="server" Text="4.9" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label94" runat="server" Text="No of movement organized related to Khas water body:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfMovKhasWaterOrg49" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label95" runat="server" Text="4.10" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label96" runat="server" Text="No of case against eviction from Khas water body:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfCaseEvictionKhasWaterOrg410" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label85" runat="server" Text="4.11" CssClass="bold"/>
                        </td>
                        <td colspan="5">
                            <asp:Label ID="Label86" runat="server" Text="Initiative of the organization (NGO) related to eviction from Khas water body:" CssClass="bold"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <table width="100%">
                                <tr>
                                    <td class="w10">
                                        <asp:Label ID="Label87" runat="server" Text="Gathering:" CssClass="bold"/>
                                    </td>
                                    <td class="w20">
                                        <asp:TextBox ID="txtNoOfInitiativeGathOrg411" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label88" runat="server" Text="Rally:" CssClass="bold"/>
                                    </td>
                                    <td class="w20">
                                        <asp:TextBox ID="txtNoOfInitiativeRallyOrg411" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label89" runat="server" Text="Memorandum:" CssClass="bold"/>
                                    </td>
                                    <td class="w20">
                                        <asp:TextBox ID="txtNoOfInitiativeMemoOrg411" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label90" runat="server" Text="Legal Support:" CssClass="bold"/>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfInitiativeLegalOrg411" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label91" runat="server" Text="Meeting:" CssClass="bold"/>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfInitiativeMeetOrg411" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label92" runat="server" Text="Others:" CssClass="bold"/>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNoOfInitiativeOthOrg411" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label97" runat="server" Text="5. Union wise status of Land use:" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w5">
                            <asp:Label ID="Label98" runat="server" Text="5.1" CssClass="bold"/>
                        </td>
                        <td class="w20">
                            <asp:Label ID="Label99" runat="server" Text="Total area of land (In acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalLand51" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td class="w5">
                            <asp:Label ID="Label100" runat="server" Text="5.2" CssClass="bold"/>
                        </td>
                        <td class="w23">
                            <asp:Label ID="Label101" runat="server" Text="Total private property (In acre):" CssClass="bold"/>
                        </td>
                        <td class="w15">
                            <asp:TextBox ID="txtTotalPrivateProp52" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label102" runat="server" Text="5.3" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label103" runat="server" Text="Total Agricultural land (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalAgriLand53" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label104" runat="server" Text="5.4" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label105" runat="server" Text="Total non-agricultural land (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalNonAgriLand54" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label106" runat="server" Text="5.5" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label107" runat="server" Text="Total forest land (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalForestLand55" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label108" runat="server" Text="5.6" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label109" runat="server" Text="Total land use in commercial purpose (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalCommLan56" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label110" runat="server" Text="5.7" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label111" runat="server" Text="Agri. land converted to commercial land in last year:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalAgriCommLastYear57" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label112" runat="server" Text="5.8" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label113" runat="server" Text="Agri. Land use in commercial purpose (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalAgriComm58" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label114" runat="server" Text="5.9" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label115" runat="server" Text="No of family affected for convert agri. Land to commercial land:" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoOfFamilyAgriComm59" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                        <td>
                            <asp:Label ID="Label116" runat="server" Text="5.10" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:Label ID="Label117" runat="server" Text="Total Char land (In acre):" CssClass="bold"/>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTotalCharLand510" runat="server" CssClass="w100px decimalnr" style="text-align:right;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label118" runat="server" Text="5.11" CssClass="bold"/>
                        </td>
                        <td colspan="5">
                            <asp:Label ID="Label119" runat="server" Text="Nature of using agri. Land for commercial purpose (In acre):" CssClass="bold"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <table width="100%">
                                <tr>
                                    <td class="w10">
                                        <asp:Label ID="Label120" runat="server" Text="Tobacco:" CssClass="bold"/>
                                    </td>
                                    <td class="w15">
                                        <asp:TextBox ID="txtNatAgriCommTobacco511" runat="server" CssClass="w80px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label121" runat="server" Text="Rubber Plantation:" CssClass="bold"/>
                                    </td>
                                    <td class="w15">
                                        <asp:TextBox ID="txtNatAgriCommRubber511" runat="server" CssClass="w80px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label122" runat="server" Text="Bricks Field:" CssClass="bold"/>
                                    </td>
                                    <td class="w15">
                                        <asp:TextBox ID="txtNatAgriCommBricks511" runat="server" CssClass="w80px decimalnr" style="text-align:right;"/>
                                    </td>
                                    <td class="w10">
                                        <asp:Label ID="Label123" runat="server" Text="Industrial Purpose:" CssClass="bold"/>
                                    </td>
                                    <td class="w15">
                                        <asp:TextBox ID="txtNatAgriCommIndustry511" runat="server" CssClass="w80px decimalnr" style="text-align:right;"/>
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
                            <asp:Label ID="Label124" runat="server" Text="6. Specific Reason for decreasing agricultural land(if any):" CssClass="bold" Font-Size="12"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                <asp:TextBox ID="txtRemarks512" runat="server" TextMode="MultiLine" Rows="6" Width="840px"/>     
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
        <asp:AsyncPostBackTrigger ControlID="ddlUpazilla" />
    </Triggers>
</asp:UpdatePanel>

