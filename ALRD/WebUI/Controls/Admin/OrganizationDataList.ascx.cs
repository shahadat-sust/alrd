using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebUI.HelperClass;
using SH.Entity;
using SH.Service;
using SH.Dao;
using System.Data;

namespace WebUI.Controls.Admin
{
    public partial class OrganizationDataList : BaseControl
    {
        #region Initialization
        private long FormID = 13;
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
            }
            else
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
                    GlobalClass.OrgDataID = -99;
                    this.CheckFormPermission(this.FormID);
                    this.CheckButtonPermission(null, null, null, lnkAddNew);

                    LoadCombo();
                    SearchEntity = new ALRD_OrganizationDataEntity();
                    SearchEntity.CurrentPage = 1;
                    SearchEntity.PageSize = 10;
                    LoadEntityList(SearchEntity);
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        #endregion

        #region Data Loading



        private List<ALRD_OrganizationDataEntity> LocalEntityList
        {
            get
            {
                return Session["ALRD_OrganizationDataEntityList"] as List<ALRD_OrganizationDataEntity>;
            }
            set
            {
                if (Session["ALRD_OrganizationDataEntityList"] == null)
                    Session.Add("ALRD_OrganizationDataEntityList", value);
                else
                    Session["ALRD_OrganizationDataEntityList"] = value;
            }
        }
        private ALRD_OrganizationDataEntity SearchEntity
        {
            get
            {
                return Session["ALRD_OrganizationDataEntity"] as ALRD_OrganizationDataEntity;
            }
            set
            {
                if (Session["ALRD_OrganizationDataEntity"] == null)
                    Session.Add("ALRD_OrganizationDataEntity", value);
                else
                    Session["ALRD_OrganizationDataEntity"] = value;
            }
        }
        private void LoadCombo()
        {
            try
            {
                LoadComboRef(ref ddlOrgName, ALRD_OrganizationInfoService.GetService().GetAll(new ALRD_OrganizationInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_OrganizationInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_OrganizationInfoEntity x) => x.COMPID));
                LoadComboRef(ref ddlDivision, ALRD_DivisionInfoService.GetService().GetAll(new ALRD_DivisionInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.COMPID));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void LoadEntityList(ALRD_OrganizationDataEntity entity)
        {
            try
            {

                if (entity.PageSize < 0)
                {
                    entity.PageSize = 10;
                }
                if (entity.SortExpression == string.Empty)
                    entity.SortExpression = "OrgName ASC";

                LocalEntityList = ALRD_OrganizationDataService.GetService().GetAll(entity).ToList();
                if (LocalEntityList != null && LocalEntityList.Count > 0)
                {
                    lsvUserList.DataSource = LocalEntityList;
                    lsvUserList.DataBind();
                }
                else
                {
                    lsvUserList.DataSource = null;
                    lsvUserList.DataBind();
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }
        private ALRD_OrganizationDataEntity BuiltEntity(ALRD_OrganizationDataEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new ALRD_OrganizationDataEntity();
                entity.CollOrganizationID = ddlOrgName.SelectedIndex > 0 ? long.Parse(ddlOrgName.SelectedValue) : (long?)null;
                entity.CollCollectionYear = ddlYear.SelectedIndex > 0 ? long.Parse(ddlYear.SelectedValue) : (long?)null;
                entity.CollectionMonth = ddlMonth.SelectedIndex > 0 ? long.Parse(ddlMonth.SelectedValue) : (long?)null;
                entity.DivisionID = ddlDivision.SelectedIndex > 0 ? long.Parse(ddlDivision.SelectedValue) : (long?)null;
                entity.DistrictID = ddlDistrict.SelectedIndex > 0 ? long.Parse(ddlDistrict.SelectedValue) : (long?)null;
                entity.UpazilaID = ddlUpazilla.SelectedIndex > 0 ? long.Parse(ddlUpazilla.SelectedValue) : (long?)null;
                entity.UnionID = ddlUnion.SelectedIndex > 0 ? long.Parse(ddlUnion.SelectedValue) : (long?)null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return entity;
        }

        #endregion Data Loading

        #region events

        protected void lsvUserList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                string CommandName = e.CommandName.ToString();
                string CommandArgument = e.CommandArgument.ToString();

                if (CommandArgument.ToString() != "")
                {
                    long Value = long.Parse(CommandArgument.ToString());

                    if (CommandName == "edit")
                    {
                        GlobalClass.OrgDataID = Value;
                        Response.Redirect("~/Pages/Admin/OrganizationData.aspx", true);
                    }
                    else if (CommandName == "delete")
                    {
                        ALRD_OrganizationDataEntity entity = new ALRD_OrganizationDataEntity { COMPID = Value };               
                        long i = ALRD_OrganizationDataService.GetService().Delete(entity);
                        LoadEntityList(new ALRD_OrganizationDataEntity());

                        Error = "Information Deleted Successfully";
                    }
                }
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        protected void lsvUserList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {
                this.CheckButtonPermission(null, ((Button)e.Item.FindControl("aEdit")), ((Button)e.Item.FindControl("aDelete")), lnkAddNew);
            }
            catch (Exception ex)
            {
                Error = ex.Message;
            }
        }

        protected void lsvUserList_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void lsvUserList_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            try
            {
                ;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void lsvUserList_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            this.lblException.Text = "";
            this.lblResult.Text = "";
            try
            {
                SearchEntity = BuiltEntity();
                LoadEntityList(SearchEntity);
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

        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlDistrict.Items.Clear();
            ddlUpazilla.Items.Clear();
            ddlUnion.Items.Clear();
            if (ddlDivision.SelectedIndex > 0)
            {
                List<ALRD_DistrictInfoEntity> district = ALRD_DistrictInfoService.GetService().GetAll(new ALRD_DistrictInfoEntity { DivisionID = long.Parse(ddlDivision.SelectedValue) }).ToList();
                LoadComboRef(ref ddlDistrict, district, CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.COMPID));
            }

        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlUpazilla.Items.Clear();
            ddlUnion.Items.Clear();
            if (ddlDistrict.SelectedIndex > 0)
            {
                List<ALRD_UpazilaInfoEntity> upazila = ALRD_UpazilaInfoService.GetService().GetAll(new ALRD_UpazilaInfoEntity { DistrictID = long.Parse(ddlDistrict.SelectedValue) }).ToList();
                LoadComboRef(ref ddlUpazilla, upazila, CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.COMPID));
            }

        }

        protected void ddlUpazilla_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlUnion.Items.Clear();
            if (ddlUpazilla.SelectedIndex > 0)
            {
                List<ALRD_UnionInfoEntity> union = ALRD_UnionInfoService.GetService().GetAll(new ALRD_UnionInfoEntity { UpazilaID = long.Parse(ddlUpazilla.SelectedValue) }).ToList();
                LoadComboRef(ref ddlUnion, union, CommonFunctions.GetPropertyName((ALRD_UnionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_UnionInfoEntity x) => x.COMPID));
            }
        }


    }
}