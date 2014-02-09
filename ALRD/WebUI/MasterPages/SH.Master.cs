using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SH.Entity;
using SH.Dao;
using SH.Service;
using WebUI.HelperClass;
using System.Web.Security;

namespace WebUI.MasterPages
{
    public partial class SH : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MenuPermission();
            }
            else
            {
                string eventTarget = this.Request["__EVENTTARGET"];

                if (eventTarget != String.Empty && eventTarget == "successfullylogin")
                {
                    MenuPermission();
                }
            }
        }


        protected void btnGoLogin_Click(object sender, EventArgs e)
        {
            ALRD_SecurityUserEntity entity = new ALRD_SecurityUserEntity();
            clsStringEnc cls = new clsStringEnc();

            entity.UserName = txtUseName.Text != null && txtUseName.Text.Trim() != string.Empty
                ? txtUseName.Text.Trim()
                : "-!@#$%^&*()9999";
            entity.Password = txtPassword.Text != null && txtPassword.Text.Trim() != string.Empty
                ? cls.encryptSimple(txtPassword.Text.Trim())
                : "-!@#$%^&*()9999";
            entity.Status = true;

            if (CheckUser(entity))
            {
                //MenuPermission();
                //Response.Redirect(Request.RawUrl);
                Response.Redirect("~/Default.aspx", false);
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, this.GetType(), "click", "alert('" + "Yor username or password is invalid." + "')", true);
            }
        }

        private bool CheckUser(ALRD_SecurityUserEntity entity)
        {
            try
            {
                ALRD_SecurityUserEntity objEntity = new ALRD_SecurityUserEntity();
                objEntity = ALRD_SecurityUserService.GetService().GetAll(entity).FirstOrDefault();
                if (objEntity != null && objEntity.COMPID.HasValue)
                {
                    GlobalClass.IsLogin = true;
                    GlobalClass.UserID = (long)objEntity.COMPID;
                    //GlobalClass.PublicUserID = objEntity.Public_User_ID.HasValue ? (long)objEntity.Public_User_ID : -99;
                    GlobalClass.UserRoleID = objEntity.RoleID.HasValue ? (long)objEntity.RoleID : -99;
                    GlobalClass.Email = objEntity.Email;
                    GlobalClass.UserName = objEntity.UserName;
                    GlobalClass.UserFullName = objEntity.FullName;
                    GlobalClass.BlockIPAccess = objEntity.BlockIPAccess != null ? objEntity.BlockIPAccess.Trim() : string.Empty;
                    GlobalClass.BlockMacAccess = objEntity.BlockMacAccess != null ? objEntity.BlockMacAccess.Trim() : string.Empty;
                    GlobalClass.UserRolePermission = ALRD_SecurityRoleDetailService.GetService().GetAll(new ALRD_SecurityRoleDetailEntity { RoleID = GlobalClass.UserRoleID, IsVisible = true }).ToList();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        private void MenuPermission()
        {
            try
            {


                if (GlobalClass.IsLogin)
                {
                    lblLoginName.Text = GlobalClass.UserFullName;
                }

                List<ALRD_SecurityRoleDetailEntity> GOVERNMENT = new List<ALRD_SecurityRoleDetailEntity>();
                List<ALRD_SecurityRoleDetailEntity> ORGANIZATION = new List<ALRD_SecurityRoleDetailEntity>();
                List<ALRD_SecurityRoleDetailEntity> SETUP = new List<ALRD_SecurityRoleDetailEntity>();
                List<ALRD_SecurityRoleDetailEntity> SECURITY = new List<ALRD_SecurityRoleDetailEntity>();
                List<ALRD_SecurityRoleDetailEntity> REPORT = new List<ALRD_SecurityRoleDetailEntity>();

                if (GlobalClass.UserRolePermission != null)
                {
                    GOVERNMENT = GlobalClass.UserRolePermission.Where(P => P.MenuCode == "GOVERNMENT").ToList();
                    ORGANIZATION = GlobalClass.UserRolePermission.Where(P => P.MenuCode == "ORGANIZATION").ToList();
                    SETUP = GlobalClass.UserRolePermission.Where(P => P.MenuCode == "SETUP").ToList();
                    SECURITY = GlobalClass.UserRolePermission.Where(P => P.MenuCode == "SECURITY").ToList();
                    REPORT = GlobalClass.UserRolePermission.Where(P => P.MenuCode == "REPORT").ToList();
                }

                if (GOVERNMENT != null && GOVERNMENT.Count > 0)
                {
                    mnuGOVERNMENT.Visible = true;
                    submnuGovtKhasLand.Visible = GOVERNMENT.Where(P => P.FormID == 12).FirstOrDefault() != null ? true : false;
                    submnuGovtWaterBody.Visible = GOVERNMENT.Where(P => P.FormID == 17).FirstOrDefault() != null ? true : false;
                    submnuGovtForestryBody.Visible = GOVERNMENT.Where(P => P.FormID == 19).FirstOrDefault() != null ? true : false;
                }
                else
                {
                    mnuGOVERNMENT.Visible = false;
                }

                if (ORGANIZATION != null && ORGANIZATION.Count > 0)
                {
                    mnuORGANIZATION.Visible = true;
                }
                else
                {
                    mnuORGANIZATION.Visible = false;
                }

                if (REPORT != null && REPORT.Count > 0)
                {
                    mnuReport.Visible = true;
                    submnuDivisionWiseDistributedKashLand.Visible = REPORT.Where(P => P.FormID == 14).FirstOrDefault() != null ? true : false;
                    submnuDistrictWiseDistributedKashLand.Visible = REPORT.Where(P => P.FormID == 22).FirstOrDefault() != null ? true : false;
                    submnuUpazilaWiseDistributedKashLand.Visible = REPORT.Where(P => P.FormID == 23).FirstOrDefault() != null ? true : false;

                    submnuUnionWiseKhasLand.Visible = REPORT.Where(P => P.FormID == 24).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseKhasLandByRange.Visible = REPORT.Where(P => P.FormID == 25).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseKhasLandAsPerResearchStudyAssumption.Visible = REPORT.Where(P => P.FormID == 26).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseKhasLandAsPerResearchStudyAssumptionByRange.Visible = REPORT.Where(P => P.FormID == 27).FirstOrDefault() != null ? true : false;

                    submnuUnionWiseLandlessFamily.Visible = REPORT.Where(P => P.FormID == 28).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseLandlessFamilyByRange.Visible = REPORT.Where(P => P.FormID == 29).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseLandlessFamilyInitiatives.Visible = REPORT.Where(P => P.FormID == 20).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseLandlessFamilyInitiativesByRange.Visible = REPORT.Where(P => P.FormID == 21).FirstOrDefault() != null ? true : false;

                    submnuUnionWiseWaterBody.Visible = REPORT.Where(P => P.FormID == 30).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseWaterBodyByRange.Visible = REPORT.Where(P => P.FormID == 31).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseWaterBodyAsPerResearchStudyAssumption.Visible = REPORT.Where(P => P.FormID == 32).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseWaterBodyAsPerResearchStudyAssumptionByRange.Visible = REPORT.Where(P => P.FormID == 33).FirstOrDefault() != null ? true : false;

                    submnuUnionWiseStatusOfLandUse.Visible = REPORT.Where(P => P.FormID == 34).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseStatusOfLandUseByRange.Visible = REPORT.Where(P => P.FormID == 35).FirstOrDefault() != null ? true : false;

                    submnuUnionWiseFisherFolkFamilyCoparativesInitiatives.Visible = REPORT.Where(P => P.FormID == 36).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseFisherFolkFamilyCoparativesInitiativesByRange.Visible = REPORT.Where(P => P.FormID == 37).FirstOrDefault() != null ? true : false;

                    submnuUnionWiseStatusOfAffectedForConvertAgriLandToCommercialLand.Visible = REPORT.Where(P => P.FormID == 38).FirstOrDefault() != null ? true : false;
                    submnuUnionWiseStatusOfAffectedForConvertAgriLandToCommercialLandByRange.Visible = REPORT.Where(P => P.FormID == 39).FirstOrDefault() != null ? true : false;
                }
                else
                {
                    mnuReport.Visible = false;
                }

                if (SETUP != null && SETUP.Count > 0)
                {
                    mnuSETUP.Visible = true;
                    submnuOrganization.Visible = SETUP.Where(P => P.FormID == 9).FirstOrDefault() != null ? true : false;
                    submnuUpazilla.Visible = SETUP.Where(P => P.FormID == 7).FirstOrDefault() != null ? true : false;
                    submnuUnion.Visible = SETUP.Where(P => P.FormID == 8).FirstOrDefault() != null ? true : false;
                    submnuDivision.Visible = SETUP.Where(P => P.FormID == 5).FirstOrDefault() != null ? true : false;
                    submnuDistrict.Visible = SETUP.Where(P => P.FormID == 6).FirstOrDefault() != null ? true : false;

                }
                else
                {
                    mnuSETUP.Visible = false;
                }

                if (SECURITY != null && SECURITY.Count > 0)
                {
                    mnuSECURITY.Visible = true;
                    submnuSecurityRoleType.Visible = SECURITY.Where(P => P.FormID == 1).FirstOrDefault() != null ? true : false;
                    submnuSecurityUserList.Visible = SECURITY.Where(P => P.FormID == 3).FirstOrDefault() != null ? true : false;
                    submnuSecurityRoleDetail.Visible = SECURITY.Where(P => P.FormID == 2).FirstOrDefault() != null ? true : false;
                }
                else
                {
                    mnuSECURITY.Visible = false;
                }


            }
            catch (Exception ex)
            {
            }
        }

        
    }
}