using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class PickTransfer : System.Web.UI.Page
    {

        Utility_C oUtility = new Utility_C();
        Item_C oItem = new Item_C();
        Transaction_C oTransaction = new Transaction_C();
        System_C oSystem = new System_C();

        Branch_C oBranch = new Branch_C();
        Partner_C oPartner = new Partner_C();

        Supplier_C oSupplier = new Supplier_C();
        Inventory_C oInventory = new Inventory_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                displayPartnerList();
                displayItemList();

            }

        }




        protected void U_Save_S_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtDate.Text) && ddPartnerList.SelectedIndex != 0)
            {
                //[2] LEVEL 2 VALIDATION
                if (totalQuantity() > 0)
                {
                    foreach (GridViewRow row in gvItemList.Rows)
                    {
                        string ptbNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("PTB");
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            string itemCode = row.Cells[0].Text;

                            TextBox txtQuantity = (TextBox)row.Cells[2].FindControl("txtQuantity");
                            int quantity = Convert.ToInt32(txtQuantity.Text);

                            if (quantity != 0)
                            {
                                //    oTransaction.INSERT_STOCK_BRANCH_RETURN(srNum, ddPartnerList.SelectedValue.ToString(), itemCode, quantity, chkCreditToPartner.Checked, Convert.ToDateTime(txtDate.Text), txtRemarks.Text);
                                string ptNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("PTI");
                                oTransaction.INSERT_PICKUP_TRANSFER(ptNum, ptbNum, ddPartnerList.SelectedValue, itemCode, quantity, txtRemarks.Text, Convert.ToDateTime(txtDate.Text));
                            }
                        }
                    }
                }
                else {
                    ErrorOccured("Please input quantity.");
                }

                //oSystem.UPDATE_SERIES_NUMBER("PTB");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>alert('Pickup/Transfer successfully processed.'); window.location=window.location;</script>", false);
               // Response.Redirect(Request.RawUrl);
                clear();
              
                
            }

            else
            {
                ErrorOccured("Please select required input");
            }
        }



        private int totalQuantity()
        {
            int x = 0;

            foreach (GridViewRow gvr in gvItemList.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    TextBox txtQuantity = (TextBox)gvr.Cells[2].FindControl("txtQuantity"); 

                    if (!string.IsNullOrEmpty(txtQuantity.Text))
                    {
                        x = x + Convert.ToInt32(txtQuantity.Text);
                    }

                }
            }


            return x;
        }


        private void clear()
        {
            foreach (GridViewRow gvr in gvItemList.Rows)
            {
                TextBox txtQuantity = (TextBox)gvr.Cells[2].FindControl("txtQuantity");

                txtQuantity.Text = "";
            }


            ddPartnerList.SelectedIndex = 0;
            txtDate.Text = "";
            txtRemarks.Text = "";

        }
      
        private void displayPartnerList()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartnerList.DataSource = dt;
            ddPartnerList.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartnerList.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartnerList.DataBind();

            ddPartnerList.Items.Insert(0, new ListItem("-- Select Partner --"));
        }

        private void displayItemList()
        {
            DataTable dt = oItem.GET_ITEM_DATA();

            gvItemList.DataSource = dt;
            gvItemList.DataBind();

        }




       

     
     

        //Check if item exist on gridview

    

        //Remove Button Action
     

        //RESET ALL Fields
        private void resetFields()
        {

          //  txtAdjustmentDate.Text = "";
          //  txtQuantity.Text = "";
          //  txtRemarks.Text = "";

          //  ddItem.SelectedIndex = 0;
          //  ddAdjustment.SelectedIndex = 0;
          // // ddReference.SelectedIndex = 0;

          ////  lblAvailableStock.Text = "";
      
        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            Session["G_SANUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repStockAdjustment.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

       

       
    }
}