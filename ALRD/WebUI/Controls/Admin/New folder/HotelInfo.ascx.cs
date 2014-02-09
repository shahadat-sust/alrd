using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebUI.HelperClass;
using HBM.Entity;
using HBM.Service;
using HBM.Dao;

namespace WebUI.Controls.Admin
{
    public partial class HotelInfo : BaseControl
    {
        #region Initialization
        private long FormID = 20;
        protected override void OnInit(EventArgs e)
        {
            try
            {
                base.OnInit(e);
                this.InitializeComponent();
                IniButtonOnClickEvent(false, "");
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private void IniButtonOnClickEvent(bool Intial, string ValueToReplace)
        {
            if (Intial)
            {
            }else
            {
            }
        }
        private void InitializeComponent()
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected override void Render(HtmlTextWriter output)
        {
            try
            {
                base.Render(output);
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    this.CheckFormPermission(this.FormID);
                    LoadCombo();

                    SearchEntity = new Hotel_InfoEntity();
                    if(GlobalClass.HotelID > 0)
                    {
                        SearchEntity.Hotel_ID = GlobalClass.HotelID;                       
                    }
                    else
                    {
                        SearchEntity.Hotel_ID = -99;
                    }
                    LoadEntity(SearchEntity);
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        #endregion

        #region Data Loading


        private Hotel_InfoEntity SearchEntity
        {
            get
            {
                return Session["Hotel_InfoEntity"] as Hotel_InfoEntity;
            }
            set
            {
                if (Session["Hotel_InfoEntity"] == null)
                    Session.Add("Hotel_InfoEntity", value);
                else
                    Session["Hotel_InfoEntity"] = value;
            }
        }
        private void LoadCombo()
        {
            try
            {
                LoadComboRef<Setup_Hotel_TypeEntity>(ref ddlHotelType, Setup_Hotel_TypeService.GetService().GetAll(new Setup_Hotel_TypeEntity()).ToList(), "Hotel_Type_Name", "Hotel_Type_ID");
                LoadComboRef<Setup_Conference_RoomEntity>(ref ddlConferenceRoom, Setup_Conference_RoomService.GetService().GetAll(new Setup_Conference_RoomEntity()).ToList(), "Conference_Room_Type", "Conference_Room_ID");
                LoadComboRef<Setup_CityEntity>(ref ddlCity, Setup_CityService.GetService().GetAll(new Setup_CityEntity()).ToList(), "City_Name", "City_ID");
                LoadComboRef<Setup_CountryEntity>(ref ddlCountry, Setup_CountryService.GetService().GetAll(new Setup_CountryEntity()).ToList(), "Country_Name", "Country_ID");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void LoadEntity(Hotel_InfoEntity entity)
        {
            try
            {
                Hotel_InfoEntity objEntity = Hotel_InfoService.GetService().GetAll(entity).FirstOrDefault();

                ClearControlStates(pnlForm);

                if (objEntity != null && objEntity.Hotel_ID != null && objEntity.Hotel_ID > 0)
                {
                    GlobalClass.HotelID = (long)objEntity.Hotel_ID;
                    txtHotelName.Text = objEntity.Hotel_Name;
                    hdnHotelID.Value = objEntity.Hotel_ID.ToString();
                    if (objEntity.Hotel_Type_ID.HasValue)
                        ddlHotelType.Text = objEntity.Hotel_Type_ID.ToString();
                    if (objEntity.Number_Of_Floor.HasValue)
                        txtNumberOfFloor.Text = objEntity.Number_Of_Floor.ToString();
                    txtFace.Text = objEntity.Face;
                    txtSpecification.Text = objEntity.Specification;
                    if (objEntity.Is_Swimming_Pool.HasValue)
                        chkIsSwimming.Checked = (bool)objEntity.Is_Swimming_Pool;
                    if (objEntity.Is_Bar_Lounge.HasValue)
                        chkIsBarLounge.Checked = (bool)objEntity.Is_Bar_Lounge;
                    if (objEntity.Is_Gym_Spa.HasValue)
                        chkIsGymSpa.Checked = (bool)objEntity.Is_Gym_Spa;
                    if (objEntity.Is_Internat_Access.HasValue)
                        chkIsInternat.Checked = (bool)objEntity.Is_Internat_Access;
                    if (objEntity.Is_Resturant.HasValue)
                        chkIsRestaurant.Checked = (bool)objEntity.Is_Resturant;
                    if (objEntity.Is_Travel_Assistance.HasValue)
                        chkIsTravel.Checked = (bool)objEntity.Is_Travel_Assistance;
                    if (objEntity.Is_Car_Parking.HasValue)
                        chkIsCarParking.Checked = (bool)objEntity.Is_Car_Parking;
                    if (objEntity.Is_Medical_Services.HasValue)
                        chkIsMedicalServices.Checked = (bool)objEntity.Is_Medical_Services;
                    if (objEntity.Is_Currencey_Exchange.HasValue)
                        chkIsCurrencyExchange.Checked = (bool)objEntity.Is_Currencey_Exchange;
                    if (objEntity.Is_Express_Checkin_Checkout.HasValue)
                        chkIsExpressCheckinCheckout.Checked = (bool)objEntity.Is_Express_Checkin_Checkout;
                    if (objEntity.Confreence_Room_ID.HasValue)
                        ddlConferenceRoom.SelectedValue = objEntity.Confreence_Room_ID.ToString();
                    if (objEntity.Current_Discount.HasValue)
                        txtCurrentDiscount.Text = objEntity.Current_Discount.ToString();
                    if (objEntity.Service_Charge.HasValue)
                        txtServiceCharge.Text = objEntity.Service_Charge.ToString();
                    txtIndoor.Text = objEntity.Indoor_Facility;
                    txtOutdoor.Text = objEntity.Outdoor_Facility;
                    txtAddress.Text = objEntity.Address;
                    if (objEntity.City_ID.HasValue)
                        ddlCity.SelectedValue = objEntity.City_ID.ToString();
                    if (objEntity.Country_ID.HasValue)
                        ddlCountry.SelectedValue = objEntity.Country_ID.ToString();
                    if (objEntity.Star_Rating.HasValue)
                        rblStarRating.SelectedValue = objEntity.Star_Rating.ToString();
                 
                    txtCheckInTime.Text = objEntity.Check_In_Time.HasValue ? ((DateTime)objEntity.Check_In_Time).ToString("HH:mm") : "";
                    txtCheckOutTime.Text = objEntity.Check_Out_Time.HasValue ? ((DateTime)objEntity.Check_Out_Time).ToString("HH:mm") : "";

                    if (!string.IsNullOrEmpty(objEntity.Full_Picture_Small_1))
                    {
                        txtFull_Picture_Small_1.Text = objEntity.Full_Picture_Small_1;
                        imgFull_Picture_Small_1.ImageUrl = "../../" + objEntity.Full_Picture_Small_1;
                    }
                    else
                    {
                        imgFull_Picture_Small_1.ImageUrl = "~/Images/default.jpg";
                    }

                    if (!string.IsNullOrEmpty(objEntity.Full_Picture_Small_2))
                    {
                        txtFull_Picture_Small_2.Text = objEntity.Full_Picture_Small_2;
                        imgFull_Picture_Small_2.ImageUrl = "../../" + objEntity.Full_Picture_Small_2;
                    }
                    else
                    {
                        imgFull_Picture_Small_2.ImageUrl = "~/Images/default.jpg";
                    }

                    if (!string.IsNullOrEmpty(objEntity.Full_Picture_Small_3))
                    {
                        txtFull_Picture_Small_3.Text = objEntity.Full_Picture_Small_3;
                        imgFull_Picture_Small_3.ImageUrl = "../../" + objEntity.Full_Picture_Small_3;
                    }
                    else
                    {
                        imgFull_Picture_Small_3.ImageUrl = "~/Images/default.jpg";
                    }

                    if (!string.IsNullOrEmpty(objEntity.Full_Picture_Small_4))
                    {
                        txtFull_Picture_Small_4.Text = objEntity.Full_Picture_Small_4;
                        imgFull_Picture_Small_4.ImageUrl = "../../" + objEntity.Full_Picture_Small_4;
                    }
                    else
                    {
                        imgFull_Picture_Small_4.ImageUrl = "~/Images/default.jpg";
                    }

                    txtLatitude.Text = objEntity.Latitude;
                    txtLongitude.Text = objEntity.Longitude;

                    btnSave.Text = "Update";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to update this information?');";
                    this.CheckButtonPermission(null, btnSave, null);
                }
                else
                {
                    imgFull_Picture_Small_1.ImageUrl = "~/Images/default.jpg";
                    imgFull_Picture_Small_2.ImageUrl = "~/Images/default.jpg";
                    imgFull_Picture_Small_3.ImageUrl = "~/Images/default.jpg";
                    imgFull_Picture_Small_4.ImageUrl = "~/Images/default.jpg";
                    rblStarRating.SelectedValue = "0";
                    GlobalClass.HotelID =-99;

                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to save this information?');";
                    this.CheckButtonPermission(btnSave, null, null);
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private Hotel_InfoEntity BuiltEntity(Hotel_InfoEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new Hotel_InfoEntity();
                entity.Hotel_ID = hdnHotelID.Value.Trim() != string.Empty ? long.Parse(hdnHotelID.Value.Trim()) : (long?)null;
                entity.Hotel_Name = txtHotelName.Text.Trim() != string.Empty ? txtHotelName.Text.Trim() : string.Empty;
                entity.Hotel_Type_ID = ddlHotelType.SelectedIndex > 0 ? long.Parse(ddlHotelType.SelectedValue) : (long?)null;
                entity.City_ID = ddlCity.SelectedIndex > 0 ? long.Parse(ddlCity.SelectedValue) : (long?)null;
                entity.Country_ID = ddlCountry.SelectedIndex > 0 ? long.Parse(ddlCountry.SelectedValue) : (long?)null;
                entity.Confreence_Room_ID = ddlConferenceRoom.SelectedIndex > 0 ? long.Parse(ddlConferenceRoom.SelectedValue) : (long?)null;
                entity.Star_Rating = rblStarRating.SelectedValue != string.Empty ? long.Parse(rblStarRating.SelectedValue) : (long?)null;
                entity.Is_Bar_Lounge = chkIsBarLounge.Checked;
                entity.Is_Car_Parking = chkIsCarParking.Checked;
                entity.Is_Currencey_Exchange = chkIsCurrencyExchange.Checked;
                entity.Is_Express_Checkin_Checkout = chkIsExpressCheckinCheckout.Checked;
                entity.Is_Gym_Spa = chkIsGymSpa.Checked;
                entity.Is_Internat_Access = chkIsInternat.Checked;
                entity.Is_Medical_Services = chkIsMedicalServices.Checked;
                entity.Is_Resturant = chkIsRestaurant.Checked;
                entity.Is_Swimming_Pool = chkIsSwimming.Checked;
                entity.Is_Travel_Assistance = chkIsTravel.Checked;
                entity.Specification = txtSpecification.Text.Trim() != string.Empty ? txtSpecification.Text.Trim() : string.Empty;
                entity.Number_Of_Floor = txtNumberOfFloor.Text.Trim() != string.Empty ? long.Parse(txtNumberOfFloor.Text.Trim()) : (long?)null;
                entity.Face = txtFace.Text.Trim() != string.Empty ? txtFace.Text.Trim() : string.Empty;
                entity.Indoor_Facility = txtIndoor.Text.Trim() != string.Empty ? txtIndoor.Text.Trim() : string.Empty;
                entity.Outdoor_Facility = txtOutdoor.Text.Trim() != string.Empty ? txtOutdoor.Text.Trim() : string.Empty;
                entity.Address = txtAddress.Text.Trim() != string.Empty ? txtAddress.Text.Trim() : string.Empty;
                entity.Check_In_Time = GetDateFromString(txtCheckInTime.Text.Trim());
                entity.Check_Out_Time = GetDateFromString(txtCheckOutTime.Text.Trim());
                entity.Full_Picture_Small_1 = txtFull_Picture_Small_1.Text.Trim() != string.Empty ? txtFull_Picture_Small_1.Text.Trim() : string.Empty;
                entity.Full_Picture_Small_2 = txtFull_Picture_Small_2.Text.Trim() != string.Empty ? txtFull_Picture_Small_2.Text.Trim() : string.Empty;
                entity.Full_Picture_Small_3 = txtFull_Picture_Small_3.Text.Trim() != string.Empty ? txtFull_Picture_Small_3.Text.Trim() : string.Empty;
                entity.Full_Picture_Small_4 = txtFull_Picture_Small_4.Text.Trim() != string.Empty ? txtFull_Picture_Small_4.Text.Trim() : string.Empty;
                entity.Latitude = txtLatitude.Text.Trim() != string.Empty ? txtLatitude.Text.Trim() : string.Empty;
                entity.Longitude = txtLongitude.Text.Trim() != string.Empty ? txtLongitude.Text.Trim() : string.Empty;
                entity.Current_Discount = txtCurrentDiscount.Text.Trim() != string.Empty ? decimal.Parse(txtCurrentDiscount.Text.Trim()) : (decimal?)null;
                entity.Service_Charge = txtServiceCharge.Text.Trim() != string.Empty ? decimal.Parse(txtServiceCharge.Text.Trim()) : (decimal?)null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return entity;
        }

        #endregion Data Loading

        #region events

        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                if (btnSave.Text == "Save")
                {
                    Hotel_InfoEntity entity = BuiltEntity();
                    long i = Hotel_InfoService.GetService().Add(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Saved Successfully";
                        LoadEntity(new Hotel_InfoEntity { Hotel_ID = i});
                    }
                }
                else
                {
                    Hotel_InfoEntity entity = BuiltEntity();
                    long i = Hotel_InfoService.GetService().Update(entity);
                    if (i > 0)
                    {
                        SuccessMessage = "Information Updated Successfully";
                        LoadEntity(new Hotel_InfoEntity { Hotel_ID = entity.Hotel_ID });
                    }
                }
                
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                if (hdnHotelID.Value.Trim() != string.Empty && long.Parse(hdnHotelID.Value.Trim()) > 0)
                    LoadEntity(new Hotel_InfoEntity { Hotel_ID = long.Parse(hdnHotelID.Value.Trim()) });
                else
                {
                    ClearControlStates(pnlForm);
                    imgFull_Picture_Small_1.ImageUrl = "~/Images/default.jpg";
                    imgFull_Picture_Small_2.ImageUrl = "~/Images/default.jpg";
                    imgFull_Picture_Small_3.ImageUrl = "~/Images/default.jpg";
                    imgFull_Picture_Small_4.ImageUrl = "~/Images/default.jpg";
                    GlobalClass.HotelID = -99;
                    btnSave.Text = "Save";
                    btnSave.OnClientClick = "javascript:return validateSubmit('Do you want to save this information?');";
                    this.CheckButtonPermission(btnSave, null, null);
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
            
        }
        #endregion events

        #region Helpers

        public override string Error
        {
            set
            {
                pnlError.Visible = true;
                lblException.Text = value;
                lblResult.Text = string.Empty;
            }
        }
        public string SuccessMessage
        {
            set
            {
                pnlError.Visible = true;
                this.lblResult.Text = value;
                lblException.Text = string.Empty;
            }
        }

        #endregion

    }
}