using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Item_Master : System.Web.UI.Page
    {


        Item_C oItem = new Item_C();
        Utility_C oUtility = new Utility_C();

        private static bool IS_ACTION_CREATE = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayItems();
                DisplayUOM();
               
            }
        }
        protected void U_Save_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtItemCode.Text) && !string.IsNullOrEmpty(txtItemName.Text) && ddUOM.SelectedIndex != 0)
            {

                if (IS_ACTION_CREATE == true)
                {
                    if (!ItemExist(txtItemCode.Text))
                    {
                        oItem.INSERT_ITEM_DATA(txtItemCode.Text, txtItemName.Text, ddUOM.SelectedValue.ToString(), Convert.ToDouble(txtConversionQty.Text));
                        lblSuccessMessage.Text = "New Item successfully created.";
                    }
                    else
                    {
                        ErrorOccured("Item Code was already in used.");
                        return;
                    }


                }
                else
                {
                    oItem.UPDATE_ITEM_DATA(txtItemCode.Text, txtItemName.Text,  Convert.ToDouble(txtConversionQty.Text));
                    lblSuccessMessage.Text = "Item successfully updated.";
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                DisplayItems();
                ClearInputs();
                panelInputs.Enabled = false;
            }
            else
            {
                ErrorOccured("All input fields are required.");
            }
            
        }

        protected void gvItemList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
               
                GridViewRow row = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow);
                IS_ACTION_CREATE = false;
                panelInputs.Enabled = true;
                txtItemCode.Enabled = false;
                txtItemName.Focus();
                lblActionStatus.Text = "Updating Existing Data";
               
                Display_Selected_Item(Convert.ToInt32(row.Cells[0].Text));
            }

          
        }


        
        private void DisplayItems()
        {
            gvItemList.DataSource = oItem.GET_ITEM_DATA();
            gvItemList.DataBind();
        }

        private void DisplayUOM()
        {
            DataTable dt = oUtility.GET_UOM_LIST();


            ddUOM.DataSource = dt;
            ddUOM.DataTextField = dt.Columns["UomName"].ToString();
            ddUOM.DataValueField = dt.Columns["UomCode"].ToString();
            ddUOM.DataBind();

            ddUOM.Items.Insert(0, new ListItem("--Select Inventory UOM--"));

           

        }

       
       

        private bool ItemExist(string _itemCode)
        {
            bool x = false;

            DataTable dt = oItem.GET_ITEM_DATA();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _itemCode + "'";

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
            DataTable dt = oItem.GET_ITEM_DATA();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemName like '%" + _searchInput + "%'";

            if (dv.Count > 0)
            {

                gvItemList.DataSource = dv;
                gvItemList.DataBind();
            }
            else
            {
                gvItemList.DataSource = dt;
                gvItemList.DataBind();
            }

        }
        private void ClearInputs()
        {

            txtItemCode.Text = "";
            txtItemName.Text = "";
            ddUOM.SelectedIndex = 0;
          

            ddUOM.Enabled = true;
            
            lblActionStatus.Text = "";
          
        }


        protected void U_Search_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                DisplayItems();
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
            
            txtItemCode.Enabled = true;
            txtItemCode.Focus();

         

            panelInputs.Enabled = true;

            lblActionStatus.Text = "Creating New Data";
        }


        private void Display_Selected_Item(int _itemID)
        {
            DataTable dt = new DataTable();
            dt = oItem.GET_ITEM_DATA();

            DataView dv = dt.DefaultView;
            dv.RowFilter = "ItemID ='" + _itemID + "'";

            if (dv.Count > 0)
            {
                DataRowView dvr = dv[0];


                txtItemCode.Text = dvr.Row["ItemCode"].ToString();
                txtItemName.Text = dvr.Row["ItemName"].ToString();

                ddUOM.SelectedValue = dvr.Row["UomCode"].ToString();
                ddUOM.Enabled = false;

              
                txtConversionQty.Text = dvr.Row["ConversionQty"].ToString();
            }

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

       
    }
}