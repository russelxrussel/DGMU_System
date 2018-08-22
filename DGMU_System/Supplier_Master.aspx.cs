using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Supplier_Master : System.Web.UI.Page
    {

        Supplier_C oSupplier = new Supplier_C();
        Utility_C oUtility = new Utility_C();

        

        private static bool IS_ACTION_CREATE = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             DisplaySuppliers();
             loadItemSubCat();
             loadPriceList();
             
            }
        }
        protected void U_Save_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txtSupplierCode.Text) && !string.IsNullOrEmpty(txtSupplierName.Text))
            {

                if (IS_ACTION_CREATE == true)
                {
                    if (!ItemExist(txtSupplierCode.Text))
                    {
                        foreach (GridViewRow row in gvItemSubCat.Rows)
                        {
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                int iItemsubcatID = Convert.ToInt32(row.Cells[0].Text);
                                DropDownList ddPriceList = (DropDownList)row.Cells[2].FindControl("ddPriceList");

                                if (ddPriceList.SelectedIndex != 0) {
                                
                               
                                oSupplier.INSERT_SUPPLIER_DATA(txtSupplierCode.Text, txtSupplierName.Text, txtAddress.Text, txtContactNumbers.Text, txtContactPerson.Text, iItemsubcatID, ddPriceList.SelectedValue.ToString());
                                }
                              }
                        }
                        lblSuccessMessage.Text = "New Supplier successfully created.";
                    }
                    else
                    {
                        ErrorOccured("Supplier Code was already in used.");
                        return;
                    }


                }
                else
                {
                    foreach (GridViewRow row in gvItemSubCat.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            int iItemsubcatID = Convert.ToInt32(row.Cells[0].Text);
                            DropDownList ddPriceList = (DropDownList)row.Cells[2].FindControl("ddPriceList");

                            if (ddPriceList.SelectedIndex != 0)
                            { 
                            oSupplier.UPDATE_SUPPLIER_DATA(txtSupplierCode.Text, txtSupplierName.Text, txtAddress.Text, txtContactNumbers.Text, txtContactPerson.Text,iItemsubcatID, ddPriceList.SelectedValue.ToString());
                            }
                        }
                    }
                    lblSuccessMessage.Text = "Supplier successfully updated.";
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                DisplaySuppliers();
                ClearInputs();
                panelInputs.Enabled = false;
            }
            else
            {
                ErrorOccured("No action was selected.");
            }
            
        }

        protected void gvSupplierList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
               
                GridViewRow row = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow);
                IS_ACTION_CREATE = false;
                panelInputs.Enabled = true;
                txtSupplierCode.Enabled = false;
                txtSupplierName.Focus();
                lblActionStatus.Text = "Updating Existing Data";
               
                Display_Selected_Item(Convert.ToInt32(row.Cells[0].Text));

                
                foreach (GridViewRow row2 in gvItemSubCat.Rows)
                {
                    int itemsubID = Convert.ToInt32(row2.Cells[0].Text);
                    DropDownList ddPrice = (DropDownList)row2.Cells[2].FindControl("ddPriceList");
                  
                    try
                    { ddPrice.SelectedValue = getPricePerLine(txtSupplierCode.Text, itemsubID); }
                    catch {
                        ddPrice.SelectedIndex = 0;
                    }
                   

                }
            }

          
        }


        
        private void DisplaySuppliers()
        {
            gvSupplierList.DataSource = oSupplier.GET_SUPPLIERS_DATA();
            gvSupplierList.DataBind();
        }



        private void loadItemSubCat()
        {
            DataTable dt = oUtility.GET_ITEM_SUBCAT_LIST();

            gvItemSubCat.DataSource = dt;
            gvItemSubCat.DataBind();
        }

        private void loadPriceList()
        {
            DataTable dt = oUtility.GET_PRICE_LIST();



            foreach (GridViewRow row in gvItemSubCat.Rows)
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

        private string getPricePerLine(string _supplierCode, int _itemSubCatId)
        {
        
            string result = "";
            DataTable dt = oUtility.GET_SUPPLIER_PRICE_LIST();

            DataRow[] dr = dt.Select("SupplierCode='" + _supplierCode + "' and ItemSubCatId= '" + _itemSubCatId + "'");
           
            if (dr.Length > 0)
           {

               foreach (DataRow drow in dr)
               {
                   result = drow["PriceCode"].ToString();
               }
           }
                  
     
            return result;
        }

        private bool ItemExist(string _itemCode)
        {
            bool x = false;

            DataTable dt = oSupplier.GET_SUPPLIERS_DATA();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "SupplierCode = '" + _itemCode + "'";
  
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
            DataTable dt = oSupplier.GET_SUPPLIERS_DATA();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "SupplierName like '%" + _searchInput + "%'";

            if (dv.Count > 0)
            {
              
                gvSupplierList.DataSource = dv;
                gvSupplierList.DataBind();
            }
            else
            {
                gvSupplierList.DataSource = dt;
                gvSupplierList.DataBind();
            }

        }
        private void ClearInputs()
        {

            txtSupplierCode.Text = "";
            txtAddress.Text = "";
            txtSupplierName.Text = "";
            txtContactNumbers.Text = "";
            txtContactPerson.Text = "";
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
            
            txtSupplierCode.Enabled = true;
            txtSupplierCode.Focus();

            panelInputs.Enabled = true;

            lblActionStatus.Text = "Creating New Data";
        }


        private void Display_Selected_Item(int _itemID)
        {
            DataTable dt = new DataTable();
            dt = oSupplier.GET_SUPPLIERS_DATA();

            DataView dv = dt.DefaultView;
            dv.RowFilter = "SupplierID ='" + _itemID + "'";

            if (dv.Count > 0)
            {
                DataRowView dvr = dv[0];


                txtSupplierCode.Text = dvr.Row["SupplierCode"].ToString();
                txtSupplierName.Text = dvr.Row["SupplierName"].ToString();
                txtAddress.Text = dvr.Row["S_Address"].ToString();
                txtContactNumbers.Text = dvr.Row["S_ContactNumber"].ToString();
                txtContactPerson.Text = dvr.Row["S_ContactPerson"].ToString();

            }

           

        }


        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }
        
    }
}