using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Partner_Master : System.Web.UI.Page
    {
       
        Partner_C oPartner = new Partner_C();
        Utility_C oUtility = new Utility_C();
        Item_C oItem = new Item_C();

        private static bool IS_ACTION_CREATE = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             DisplayPartners();
             DisplayItemList();
             LoadPriceList();
            }
        }

        protected void U_Save_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtPartnerCode.Text) && !string.IsNullOrEmpty(txtPartnerName.Text))
            {

                   
                    foreach (GridViewRow row in gvItemListPrice.Rows)
                        {
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                string itemCode = row.Cells[0].Text;
                                DropDownList ddPriceList = (DropDownList)row.Cells[2].FindControl("ddPriceList");

                                if (ddPriceList.SelectedIndex != 0)
                                {

                                        oPartner.INSERT_PARTNER_DATA(txtPartnerCode.Text, txtPartnerName.Text, txtAddress.Text, txtContactNumbers.Text, txtContactPerson.Text, itemCode, ddPriceList.SelectedValue.ToString());
                                }
                            }
                        }

                        lblSuccessMessage.Text = "Partner successfully updated.";


                    //}
                    //else
                    //{

                    //    ErrorOccured("Partner Code: <b>" + txtPartnerCode.Text.ToUpper() + "</b> was already in used.");
                    //    return;
                    //}

               
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                DisplayPartners();
                ClearInputs();
                panelInputs.Enabled = false;
            }
            else
            {
                ErrorOccured("Please check Inputs.");
            }
            
        }

        protected void gvPartnerList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
               
                GridViewRow row = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow);
                IS_ACTION_CREATE = false;
                panelInputs.Enabled = true;
                txtPartnerCode.Enabled = false;
                txtPartnerName.Focus();
                lblActionStatus.Text = "Updating Existing Data";
               
                Display_Selected_Item(row.Cells[1].Text);


                foreach (GridViewRow row2 in gvItemListPrice.Rows)
                {
                    string itemCode = row2.Cells[0].Text;
                    DropDownList ddPrice = (DropDownList)row2.Cells[2].FindControl("ddPriceList");

                    try
                    { ddPrice.SelectedValue = getPricePerLine(txtPartnerCode.Text,  itemCode); 
                    }
                    catch
                    {
                        ddPrice.SelectedIndex = 0;
                    }


                }
            }

          
        }


        
        private void DisplayPartners()
        {
            gvPartnerList.DataSource = oPartner.GET_PARTNERS_DATA();
            gvPartnerList.DataBind();
        }

      
        private void DisplayItemList()
        {
            DataTable dt = oItem.GET_ITEM_DATA();

            gvItemListPrice.DataSource = dt;
            gvItemListPrice.DataBind();

        }

        private void LoadPriceList()
        {
            DataTable dt = oUtility.GET_PRICE_LIST();

           

            foreach (GridViewRow row in gvItemListPrice.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {


                    DropDownList ddPriceList = (DropDownList)row.Cells[2].FindControl("ddPriceList");

                    ddPriceList.DataSource = dt;
                    ddPriceList.DataTextField = dt.Columns["PriceAmount"].ToString();
                    ddPriceList.DataValueField = dt.Columns["PriceCode"].ToString();
                    ddPriceList.DataBind();

                    ddPriceList.Items.Insert(0, new ListItem("Select Price"));



                }
            }
        }
        private void DisplayPartners_PARAM(string _searchInput)
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerName like '%" + _searchInput + "%'";

            if (dv.Count > 0)
            {

                gvPartnerList.DataSource = dv;
                gvPartnerList.DataBind();
            }
            else
            {
                gvPartnerList.DataSource = dt;
                gvPartnerList.DataBind();
            }

        }
        private void ClearInputs()
        {
            txtPartnerCode.Text = "";
            txtAddress.Text = "";
            txtPartnerName.Text = "";
            txtContactNumbers.Text = "";
            txtContactPerson.Text = "";
            lblActionStatus.Text = "";

        }

        private bool ItemExist(string _itemCode)
        {
            bool x = false;

            DataTable dt = oPartner.GET_PARTNERS_DATA();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode = '" + _itemCode + "'";

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

        protected void U_Search_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                DisplayPartners();
            }
            else
            {
              
                DisplayPartners_PARAM(txtSearch.Text);
            }
        }

        protected void lnkNew_Click(object sender, EventArgs e)
        {

            IS_ACTION_CREATE = true;

            ClearInputs();
            
            txtPartnerCode.Enabled = true;
            txtPartnerCode.Focus();

            panelInputs.Enabled = true;

            lblActionStatus.Text = "Creating New Data";
        }


        private void Display_Selected_Item(string _partnerCode)
        {
            DataTable dt = new DataTable();
            dt = oPartner.GET_PARTNERS_DATA();

            DataView dv = dt.DefaultView;
            dv.RowFilter = "PartnerCode ='" + _partnerCode + "'";

            if (dv.Count > 0)
            {
                DataRowView dvr = dv[0];

              
                txtPartnerCode.Text = dvr.Row["PartnerCode"].ToString();
                txtPartnerName.Text = dvr.Row["PartnerName"].ToString();
                txtAddress.Text = dvr.Row["P_Address"].ToString();
                txtContactNumbers.Text = dvr.Row["P_ContactNumber"].ToString();
                txtContactPerson.Text = dvr.Row["P_ContactPerson"].ToString();

            }
        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
             
        }

        //GET PRICE PER ITEM
        private string getPricePerLine(string _partnerCode, string _itemCode)
        {

            string result = "";
            DataTable dt = oUtility.GET_PARTNERS_PRICE();

            DataRow[] dr = dt.Select("PartnerCode='" + _partnerCode + "' and ItemCode= '" + _itemCode + "'");

            if (dr.Length > 0)
            {

                foreach (DataRow drow in dr)
                {
                    result = drow["PriceCode"].ToString();
                }
            }


            return result;
        }

        
    }
}