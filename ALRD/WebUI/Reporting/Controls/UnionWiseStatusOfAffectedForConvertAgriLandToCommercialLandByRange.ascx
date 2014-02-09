<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UnionWiseStatusOfAffectedForConvertAgriLandToCommercialLandByRange.ascx.cs" Inherits="WebUI.Reporting.Controls.UnionWiseStatusOfAffectedForConvertAgriLandToCommercialLandByRange" %>

<%@ Register Src="ReportViewer.ascx" TagName="ReportViewer" TagPrefix="uc1" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		        function pageLoad() {
		            initActiveMenu('REPORT');
		            initInputFields();
		        }

        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Convert Agri. Land To Commercial Land By Range</strong></h1>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="w97 pd-10 form-container">
                <table class="w100 iTable">
                    <tr>
                        <td class="w15">
                            <asp:Label ID="Label19" runat="server" Text="From Year" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlFromYear" runat="server" CssClass="w250px required" >
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
                        <td class="w5">
                        
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label2" runat="server" Text="To Year" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlToYear" runat="server" CssClass="w250px required" >
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
                             <asp:Label ID="Label3" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w15">
                            <asp:Label ID="Label14" runat="server" Text="Division" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlDivision" runat="server" CssClass="w250px" 
                                AutoPostBack="True" onselectedindexchanged="ddlDivision_SelectedIndexChanged" />
                        </td>
                        <td class="w5">
                        
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label17" runat="server" Text="Upazilla" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlUpazilla" runat="server" CssClass="w250px " 
                                AutoPostBack="True" onselectedindexchanged="ddlUpazilla_SelectedIndexChanged" />
                            
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="w15">
                            <asp:Label ID="Label15" runat="server" Text="District" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="w250px " 
                                AutoPostBack="True" onselectedindexchanged="ddlDistrict_SelectedIndexChanged" />
                        </td>
                        <td class="w5">
                        
                        </td>
                        <td class="w15">
                            <asp:Label ID="Label6" runat="server" Text="Union" CssClass="bold"/>
                        </td>
                        <td class="w30">
                            <asp:DropDownList ID="ddlUnion" runat="server" CssClass="w250px " />
                        </td>
                        
                    </tr>
                    
                </table>
                <br />
                
                <div class="w95 ">
                    <asp:Button ID="btnShow" runat="server" OnClientClick="javascript:return validateSubmit();" CssClass="button fr" Text="Show" onclick="btnShow_Click"/>    
                    <asp:Button ID="btnReset" runat="server" OnClientClick="javascript:return clearEntryFields();" CssClass="button fr" Text="Clear" onclick="btnClear_Click"/>            
                </div>
            </asp:Panel>
            <div class="clear"></div>
            <asp:Panel ID="pnlReport" runat="server" ClientIDMode="Static" CssClass="report">
                 <table style="margin-top: 10px; width: 100%; padding-left: 25px;">
                    <tr>
                        <td>
                            <uc1:ReportViewer ID="ReportViewer1" runat="server" />
                        </td>
                    </tr>
                </table>
                <asp:Literal runat="server" ID="divReport"></asp:Literal>
            </asp:Panel>
		</asp:Panel>
        
    </contenttemplate>
    <Triggers> 
        <asp:PostBackTrigger ControlID="ReportViewer1" />
        <asp:PostBackTrigger ControlID="btnShow" />
        <asp:AsyncPostBackTrigger ControlID="ddlDivision" />
        <asp:AsyncPostBackTrigger ControlID="ddlDistrict" />
        <asp:AsyncPostBackTrigger ControlID="ddlUpazilla" />
    </Triggers>
</asp:UpdatePanel>

