using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Branch_Master : System.Web.UI.Page
    {

        Branch_C oBranch = new Branch_C();
        Partner_C oPartner = new Partner_C();
        Utility_C oUtility = new Utility_C();

        private static bool IS_ACTION_CREATE = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             DisplaySuppliers();
             DisplayPartner();
             DisplayLocationArea();
            }
        }
        protected void U_Save_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBranchCode.Text) && !string.IsNullOrEmpty(txtBranchName.Text) && ddPartner.SelectedIndex != 0 && ddLocationArea.SelectedIndex != 0)
            {

                if (IS_ACTION_CREATE == true)
                {
                    if (!ItemExist(txtBranchCode.Text))
                    {
                        oBranch.INSERT_BRANCH_DATA(txtBranchCode.Text, ddPartner.SelectedValue.ToString(),ddLocationArea.SelectedValue.ToString(), txtBranchName.Text, txtAddress.Text, txtContactNumbers.Text, txtSupervisor.Text);

                        lblSuccessMessage.Text = "New Branch successfully created.";
                    }
                    else
                    {
                        lblErrorMessage.Text = "Branch Code was in used.";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                        return;
                    }


                }
                else
                {

                    oBranch.UPDATE_BRANCH_DATA(txtBranchCode.Text, ddPartner.SelectedValue.ToString(), ddLocationArea.SelectedValue.ToString() ,txtBranchName.Text, txtAddress.Text, txtContactNumbers.Text, txtSupervisor.Text);
                 
                    lblSuccessMessage.Text = "Branch successfully updated.";
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                DisplaySuppliers();
                ClearInputs();
                panelInputs.Enabled = false;
            }
            else
            {
                lblErrorMessage.Text = "Fill up mandatory input.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }
            
        }

        protected void gvPartnerList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
               
                GridViewRow row = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow);
                IS_ACTION_CREATE = false;
                panelInputs.Enabled = true;
                txtBranchCode.Enabled = false;
                txtBranchName.Focus();
                lblActionStatus.Text = "Updating Existing Data";
               
                Display_Selected_Item(Convert.ToInt32(row.Cells[0].Text));
            }

          
        }


        
        private void DisplaySuppliers()
        {
            gvBranchList.DataSource = oBranch.GET_BRANCHES_DATA();
            gvBranchList.DataBind();
        }

        private void DisplayPartner()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartner.DataSource = dt;
            ddPartner.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartner.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartner.DataBind();

            ddPartner.Items.Insert(0, new ListItem("--SELECT PARTNER--"));
        }

        private void DisplayLocationArea()
        {
            DataTable dt = oUtility.GET_LOCATION_AREA_LIST();

            ddLocationArea.DataSource = dt;
            ddLocationArea.DataTextField = dt.Columns["LAName"].ToString();
            ddLocationArea.DataValueField = dt.Columns["LACode"].ToString();
            ddLocationArea.DataBind();

            ddLocationArea.Items.Insert(0, new ListItem("--SELECT LOCATION AREA--"));
        }
        private bool ItemExist(string _itemCode)
        {
            bool x = false;

            DataTable dt = oBranch.GET_BRANCHES_DATA();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "BranchCode = '" + _itemCode + "'";
  
            if (dv.Count > 0)
            {
                x = true;
            }
            else
            {
                x = false;
            }

            return x;
        }

        private void DisplayBranches_PARAM(string _searchInput)
        {
            DataTable dt = oBranch.GET_BRANCHES_DATA();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "SearchText like '%" + _searchInput + "%'";

            if (dv.Count > 0)
            {

                gvBranchList.DataSource = dv;
                gvBranchList.DataBind();
            }
            else
            {
                gvBranchList.DataSource = dt;
                gvBranchList.DataBind();
            }

        }
        private void ClearInputs()
        {

            txtBranchCode.Text = "";
            txtAddress.Text = "";
            txtBranchName.Text = "";
            txtContactNumbers.Text = "";
            txtSupervisor.Text = "";
            ddPartner.SelectedIndex = 0;
            lblActionStatus.Text = "";
          
        }


        protected void U_Search_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                DisplaySuppliers();
            }
            else
            {
              
                DisplayBranches_PARAM(txtSearch.Text);
            }
        }

        protected void lnkNew_Click(object sender, EventArgs e)
        {

            IS_ACTION_CREATE = true;

            ClearInputs();
            
            txtBranchCode.Enabled = true;
            txtBranchCode.Focus();

            panelInputs.Enabled = true;

            lblActionStatus.Text = "Creating New Data";
        }


        private void Display_Selected_Item(int _itemID)
        {
            DataTable dt = new DataTable();
            dt = oBranch.GET_BRANCHES_DATA();

            DataView dv = dt.DefaultView;
            dv.RowFilter = "BranchID ='" + _itemID + "'";

            if (dv.Count > 0)
            {
                DataRowView dvr = dv[0];

              
                txtBranchCode.Text = dvr.Row["BranchCode"].ToString();
                txtBranchName.Text = dvr.Row["BranchName"].ToString();
                ddLocationArea.SelectedValue = dvr.Row["LACode"].ToString();
                txtAddress.Text = dvr.Row["B_Address"].ToString();
                txtContactNumbers.Text = dvr.Row["B_ContactNumbers"].ToString();
                txtSupervisor.Text = dvr.Row["Supervisor"].ToString();
                ddPartner.SelectedValue = dvr.Row["PartnerCode"].ToString();

            }
        }

        
    }
}