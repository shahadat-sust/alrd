<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HotelInfo.ascx.cs" Inherits="WebUI.Controls.Admin.HotelInfo" %>
 <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false" />
 <script type="text/javascript" src="../../Scripts/GoogleMap.js" ></script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>

		<script type="text/javascript">
		        function pageLoad() {
		            initActiveMenu('HOTEL');
		            initInputFields();
		            GoogleMap.init();
		        }
        </script>

        <asp:Panel id="pTitle" ClientIDMode="Static" runat="server" CssClass="page-title">
            <h1><strong>Hotel</strong> Information</h1>
            <a class="backto-prev fr" runat="server" href="~/Pages/Admin/HotelList.aspx">Back to Previous</a>
        </asp:Panel>
        <asp:Panel ID="pnlError" CssClass="pnlError" runat="server">   
            <asp:Label ID="lblException" runat="server" CssClass="labelException"></asp:Label>
            <asp:Label ID="lblResult" runat="server" CssClass="labelResult" ></asp:Label>
        </asp:Panel>

		<asp:Panel ID="bContent" runat="server" ClientIDMode="Static" CssClass="content">
            <asp:Panel ID="pnlSearchHotel" runat="server" ClientIDMode="Static" CssClass="hotel-search">
                <div class="title-contain"> Navigation </div>
                <div class="w100 mr-t-10" >                    
                      <nav class="side-nav">
                        <asp:HyperLink  NavigateUrl="~/Pages/Admin/HotelInfo.aspx"  ID="lnkBasicInfo"  runat="server" Text="Basic Information"  CssClass="side-nav-button active"/>
                        <asp:HyperLink  NavigateUrl="~/Pages/Admin/RoomCategory.aspx"  ID="lnkRoomCategory"  runat="server" Text="Room Category"  CssClass="side-nav-button"/>
                        <asp:HyperLink  NavigateUrl="~/Pages/Admin/HotelWiseRoom.aspx"  ID="lnkRoomInfo"  runat="server" Text="Room Information"  CssClass="side-nav-button"/>         
                     </nav>
                </div>

            </asp:Panel>
            <asp:Panel ID="pnlForm" runat="server" ClientIDMode="Static" CssClass="hotel-list form-container">
                <div class="title-contain"> Basic Info </div>
                <br />
                <asp:HiddenField ID="hdnHotelID" runat="server"/>
                <table class="w100 iTable">
                    <tr>
                        <td class="w30">
                            <asp:Label ID="lblHotelName" runat="server" Text="Hotel Name"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtHotelName" runat="server" MaxLength="150" class="w250px required"/>
                            <asp:Label ID="Label16" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label10" runat="server" Text="Hotel Type"/>
                        </td>
                        <td class="w70">
                            <asp:DropDownList ID="ddlHotelType" runat="server" CssClass="w257px required" />
                            <asp:Label ID="Label17" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label1" runat="server" Text="Number Of Floor"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtNumberOfFloor" runat="server" MaxLength="2" class="w40px integer"/>
                            <asp:Label ID="Label18" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label2" runat="server" Text="Face"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtFace" runat="server" MaxLength="150" class="w250px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label3" runat="server" Text="Specification"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtSpecification" TextMode="MultiLine" runat="server" MaxLength="250" class="w250px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label12" runat="server" Text="Check In Time"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtCheckInTime" runat="server" MaxLength="5" class="w40px time"/>
                            <asp:Label ID="Label19" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label13" runat="server" Text="Check Out Time"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtCheckOutTime" runat="server" MaxLength="5" class="w40px time"/>
                            <asp:Label ID="Label20" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label11" runat="server" Text="Star Rating"/>
                        </td>
                        <td class="w70">
                            <asp:RadioButtonList ID="rblStarRating" runat="server">
                                <asp:ListItem Value="0" Selected="True"><img src="../../Images/0star.png" alt="0"/></asp:ListItem>
                                <asp:ListItem Value="1"><img src="../../Images/1star.png" alt="1"/></asp:ListItem>
                                <asp:ListItem Value="2"><img src="../../Images/2star.png" alt="2"/></asp:ListItem>
                                <asp:ListItem Value="3"><img src="../../Images/3star.png" alt="3"/></asp:ListItem>
                                <asp:ListItem Value="4"><img src="../../Images/4star.png" alt="4"/></asp:ListItem>
                                <asp:ListItem Value="5"><img src="../../Images/5star.png" alt="5"/></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label27" runat="server" Text="Service Charge"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtServiceCharge" runat="server" MaxLength="2" class="w40px integernr"/> (%)
                        </td>
                    </tr>
                </table>    
                <br />
                <div class="title-contain"> Facitilies </div>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td class="w50">
                            <asp:CheckBox ID="chkIsSwimming" runat="server" Text="Swimming Pool"/>
                        </td>
                        <td class="w50">
                           <asp:CheckBox ID="chkIsBarLounge" runat="server" Text="Bar Lounge"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w50">
                            <asp:CheckBox ID="chkIsGymSpa" runat="server" Text="Gym & Spa"/>
                        </td>
                        <td class="w50">
                           <asp:CheckBox ID="chkIsInternat" runat="server" Text="Internat Access"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w50">
                            <asp:CheckBox ID="chkIsRestaurant" runat="server" Text="Restaurant"/>
                        </td>
                        <td class="w50">
                           <asp:CheckBox ID="chkIsTravel" runat="server" Text="Travel Assistance"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w50">
                            <asp:CheckBox ID="chkIsCarParking" runat="server" Text="Car Parking"/>
                        </td>
                        <td class="w50">
                           <asp:CheckBox ID="chkIsMedicalServices" runat="server" Text="Medical Services"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w50">
                            <asp:CheckBox ID="chkIsCurrencyExchange" runat="server" Text="Currency Exchange"/>
                        </td>
                        <td class="w50">
                           <asp:CheckBox ID="chkIsExpressCheckinCheckout" runat="server" Text="Express Checkin Checkout"/>
                        </td>
                    </tr>
                </table>  
                <br />
                <div class="title-contain"> Other Facilities </div>
                <br />
                <table class="w100 iTable">
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label26" runat="server" Text="Current Discount"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtCurrentDiscount" runat="server" MaxLength="2" class="w40px integernr"/> (%)
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label4" runat="server" Text="Conference Room"/>
                        </td>
                        <td class="w70">
                            <asp:DropDownList ID="ddlConferenceRoom" runat="server" CssClass="w257px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label6" runat="server" Text="Indoor"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtIndoor" runat="server" TextMode="MultiLine" MaxLength="150" class="w250px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label5" runat="server" Text="Outdoor"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtOutdoor" runat="server" TextMode="MultiLine" MaxLength="150" class="w250px"/>
                        </td>
                    </tr>
                </table>
                <br />
                <div class="title-contain"> Address & Location </div>
                <br /> 
                <table class="w100 iTable">
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label8" runat="server" Text="Address"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="150" class="w250px address-field txtAddress required"/>
                            <asp:Label ID="Label21" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label7" runat="server" Text="City"/>
                        </td>
                        <td class="w70">
                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="w257px address-field ddlCity required" />
                            <asp:Label ID="Label22" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>    
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label9" runat="server" Text="Country"/>
                        </td>
                        <td class="w70">
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="w257px address-field ddlCountry required" />
                            <asp:Label ID="Label23" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label14" runat="server" Text="Latitude"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtLatitude" runat="server" MaxLength="100" class="w250px txtLatitude lat-lng-field decimal"/>
                            <asp:Label ID="Label24" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w30">
                            <asp:Label ID="Label15" runat="server" Text="Longitude"/>
                        </td>
                        <td class="w70">
                            <asp:TextBox ID="txtLongitude" runat="server" MaxLength="100" class="w250px txtLongitude lat-lng-field decimal"/>
                            <asp:Label ID="Label25" runat="server" CssClass="asteric" Text="*" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="map_canvas_container">
                                <div id="map_canvas" class="map_canvas w100 h100"></div>
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
                <div class="title-contain"> Picture Upload </div>
                <br /> 
                <table class="w100 iTable">
                    <tr>
                        <td colspan="2">
                            <table>
                                <tr>
                                    <td style="text-align:center;width:185px">
                                        <div>
                                             <asp:Image ID="imgFull_Picture_Small_1" runat="server" CssClass="divImageUpload1" 
                                             ImageAlign="Top" Style="border: 2px solid black ;width: 180px; height: 150px; text-align: center;" ImageUrl="~/Images/default.jpg" />
                                             <asp:TextBox ID="txtFull_Picture_Small_1" runat="server" CssClass="txtImage1 hide" />
                                        </div>
                                        <div>
                                            <input type="button" id="btnUploadImage1" value="Upload"  index="1" imgtype="hotel" onclick="javaScript:return openImageUploader(this);" />
                                        </div>
                                    </td>
                                    <td style="width:20px">
                                    </td>
                                    <td style="text-align:center;width:185px">
                                        <div>
                                             <asp:Image ID="imgFull_Picture_Small_2" runat="server" CssClass="divImageUpload2" 
                                             ImageAlign="Top" Style="border: 2px solid black ;width: 180px; height: 150px; text-align: center;" ImageUrl="~/Images/default.jpg" />
                                             <asp:TextBox ID="txtFull_Picture_Small_2" runat="server" CssClass="txtImage2 hide" />
                                        </div>
                                        <div>
                                            <input type="button" id="btnUploadImage2" value="Upload"  index="2" imgtype="hotel" onclick="javaScript:return openImageUploader(this);" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;width:185px">
                                        <div>
                                             <asp:Image ID="imgFull_Picture_Small_3" runat="server" CssClass="divImageUpload3" 
                                             ImageAlign="Top" Style="border: 2px solid black ;width: 180px; height: 150px; text-align: center;" ImageUrl="~/Images/default.jpg" />
                                             <asp:TextBox ID="txtFull_Picture_Small_3" runat="server" CssClass="txtImage3 hide" />
                                        </div>
                                        <div>
                                            <input type="button" id="btnUploadImage3" value="Upload"  index="3" imgtype="hotel" onclick="javaScript:return openImageUploader(this);" />
                                        </div>
                                    </td>
                                    <td style="width:20px">
                                    </td>
                                    <td style="text-align:center;width:185px">
                                        <div>
                                             <asp:Image ID="imgFull_Picture_Small_4" runat="server" CssClass="divImageUpload4" 
                                             ImageAlign="Top" Style="border: 2px solid black ;width: 180px; height: 150px; text-align: center;" ImageUrl="~/Images/default.jpg" />
                                             <asp:TextBox ID="txtFull_Picture_Small_4" runat="server" CssClass="txtImage4 hide" />
                                        </div>
                                        <div>
                                            <input type="button" id="btnUploadImage4" value="Upload"  index="4" imgtype="hotel" onclick="javaScript:return openImageUploader(this);" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="w50">
                            
                        </td>
                        <td class="w50">
                            
                        </td>
                    </tr>
                    
                </table>
                <br />
                <div class="w100 ">
                    <asp:Button ID="btnSave" runat="server" OnClientClick="javascript:return validateSubmit('Do you want to save this information?');" CssClass="button fr" Text="Save" onclick="btnSave_Click"/>    
                    <asp:Button ID="btnReset" runat="server" OnClientClick="javascript:return clearEntryFields();" CssClass="button fr" Text="Clear" onclick="btnClear_Click"/>            
                </div>
            </asp:Panel>
            <div class="clear"></div>
		</asp:Panel>
    </contenttemplate>
</asp:UpdatePanel>
<div id="divDialogImageUpload1" class="divDialogImageUpload1">
</div>
<div id="divDialogImageUpload2" class="divDialogImageUpload2">
</div>
<div id="divDialogImageUpload3" class="divDialogImageUpload3">
</div>
<div id="divDialogImageUpload4" class="divDialogImageUpload4">
</div>

