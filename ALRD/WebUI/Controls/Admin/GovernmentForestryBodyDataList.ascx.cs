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
    public partial class GovernmentForestryBodyDataList : BaseControl
    {
        #region Initialization
        private long FormID = 19;
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
                    GlobalClass.GovtInfoID = -99;
                    this.CheckFormPermission(this.FormID);
                    this.CheckButtonPermission(null, null, null, lnkAddNew);
                    LoadCombo();
                    
                    SearchEntity = new ALRD_GovernmentForestryBodyDataEntity();
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



        private List<ALRD_GovernmentForestryBodyDataEntity> LocalEntityList
        {
            get
            {
                return Session["ALRD_GovernmentForestryBodyDataEntityList"] as List<ALRD_GovernmentForestryBodyDataEntity>;
            }
            set
            {
                if (Session["ALRD_GovernmentForestryBodyDataEntityList"] == null)
                    Session.Add("ALRD_GovernmentForestryBodyDataEntityList", value);
                else
                    Session["ALRD_GovernmentForestryBodyDataEntityList"] = value;
            }
        }
        private ALRD_GovernmentForestryBodyDataEntity SearchEntity
        {
            get
            {
                return Session["ALRD_GovernmentForestryBodyDataEntity"] as ALRD_GovernmentForestryBodyDataEntity;
            }
            set
            {
                if (Session["ALRD_GovernmentForestryBodyDataEntity"] == null)
                    Session.Add("ALRD_GovernmentForestryBodyDataEntity", value);
                else
                    Session["ALRD_GovernmentForestryBodyDataEntity"] = value;
            }
        }
        private void LoadCombo()
        {
            try
            {
                LoadComboRef(ref ddlDivision, ALRD_DivisionInfoService.GetService().GetAll(new ALRD_DivisionInfoEntity()).ToList(), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DivisionInfoEntity x) => x.COMPID));
                
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void LoadEntityList(ALRD_GovernmentForestryBodyDataEntity entity)
        {
            try
            {

                if (entity.PageSize < 0)
                {
                    entity.PageSize = 10;
                }
                if (entity.SortExpression == string.Empty)
                    entity.SortExpression = "OrgName ASC";

                LocalEntityList = ALRD_GovernmentForestryBodyDataService.GetService().GetAll(entity).ToList();
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
        private ALRD_GovernmentForestryBodyDataEntity BuiltEntity(ALRD_GovernmentForestryBodyDataEntity entity = null)
        {
            try
            {
                if (entity == null)
                    entity = new ALRD_GovernmentForestryBodyDataEntity();
                entity.DivisionID = ddlDivision.SelectedIndex > 0 ? long.Parse(ddlDivision.SelectedValue) : (long?)null;
                entity.DistrictID = ddlDistrict.SelectedIndex > 0 ? long.Parse(ddlDistrict.SelectedValue) : (long?)null;
                entity.UpazilaID = ddlUpazilla.SelectedIndex > 0 ? long.Parse(ddlUpazilla.SelectedValue) : (long?)null;
                entity.CollCollectionYear = ddlYear.SelectedIndex > 0 ? long.Parse(ddlYear.SelectedValue) : (long?)null;
                entity.CollectionMonth = ddlMonth.SelectedIndex > 0 ? long.Parse(ddlMonth.SelectedValue) : (long?)null;
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
                        GlobalClass.GovtInfoID = Value;
                        Response.Redirect("~/Pages/Admin/GovernmentForestryBodyData.aspx", true);
                    }
                    else if (CommandName == "delete")
                    {
                        ALRD_GovernmentForestryBodyDataEntity entity = new ALRD_GovernmentForestryBodyDataEntity { COMPID = Value };
                        long i = ALRD_GovernmentForestryBodyDataService.GetService().Delete(entity);
                        LoadEntityList(new ALRD_GovernmentForestryBodyDataEntity());

                        SuccessMessage = "Information Deleted Successfully";
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
            if (ddlDivision.SelectedIndex > 0)
            {
                List<ALRD_DistrictInfoEntity> district = ALRD_DistrictInfoService.GetService().GetAll(new ALRD_DistrictInfoEntity { DivisionID = long.Parse(ddlDivision.SelectedValue) }).ToList();
                LoadComboRef(ref ddlDistrict, district, CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_DistrictInfoEntity x) => x.COMPID));
            }
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlUpazilla.Items.Clear();
            if (ddlDistrict.SelectedIndex > 0)
            {
                List<ALRD_UpazilaInfoEntity> upazila = ALRD_UpazilaInfoService.GetService().GetAll(new ALRD_UpazilaInfoEntity { DistrictID = long.Parse(ddlDistrict.SelectedValue) }).ToList();
                LoadComboRef(ref ddlUpazilla, upazila, CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.DESCRIPT), CommonFunctions.GetPropertyName((ALRD_UpazilaInfoEntity x) => x.COMPID));
            }
        }


    }
}