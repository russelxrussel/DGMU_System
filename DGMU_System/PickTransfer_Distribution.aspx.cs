using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class PickTransfer_Distribution : System.Web.UI.Page
    {

        Utility_C oUtility = new Utility_C();
        Item_C oItem = new Item_C();
        Transaction_C oTransaction = new Transaction_C();
        System_C oSystem = new System_C();

        Branch_C oBranch = new Branch_C();
        Partner_C oPartner = new Partner_C();

        Supplier_C oSupplier = new Supplier_C();
        Inventory_C oInventory = new Inventory_C();


       // string _BRANCHCODE = "", _PTBNUM = "";
        int _RECEIVEDITEM = 0;
        DateTime _DATERECEIVED = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayBranchItemToDistribute();
            }

        }




        protected void U_Save_S_Click(object sender, EventArgs e)
        {
            //[1] VALIDATION
            if (ddBranchItemToDistribute.SelectedIndex != 0 && gvBranchList.Rows.Count > 0)
            {
                //[2] LEVEL TO VALIDATION
                if (Convert.ToInt32(lblQuantity.Text) >= sumQuantity())
                {
                    foreach (GridViewRow row in gvBranchList.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            int quantity = 0;
                            string branchCode = row.Cells[0].Text;

                            TextBox txtQuantity = (TextBox)row.Cells[1].FindControl("txtDistrubutedQty");
                            TextBox txtDateTrans = (TextBox)row.Cells[2].FindControl("txtDate");

                            if (!string.IsNullOrEmpty(txtQuantity.Text))
                            {
                                quantity = Convert.ToInt32(txtQuantity.Text);
                            }


                            if (quantity != 0 && (!string.IsNullOrEmpty(txtDateTrans.Text) || txtDateTrans.Text != ""))
                            {
                                string dptNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("DPT");
                                oTransaction.INSERT_DISTRIBUTED_BRANCH_ITEM(lblPTBNum.Text, dptNum, branchCode, lblBranchItemCode.Text, Convert.ToInt32(txtQuantity.Text), Convert.ToDateTime(txtDateTrans.Text), txtRemarks.Text, Session["USER_CODE"].ToString());
                            }


                        }

                    }

                    SuccessMessage("Distrubution successfully processed.");
                    // Response.Redirect(Request.RawUrl); 
                }
                else
                {
                    //Message Validation failed
                    //   txtRemarks.Text = "OOPPPS Over " + sumQuantity().ToString();
                    ErrorOccured("Total Distributed Quantity is more than Quantity available.");

                }

                // txtRemarks.Text = sumQuantity().ToString();
                // oSystem.UPDATE_SERIES_NUMBER("PT");
            }
            else
            {
                ErrorOccured("Input required.");
            }
        }

        

  

    

      
     

        private void displayBranchItemToDistribute()
        {
            DataTable dt = oTransaction.GET_BRANCHITEM_DISTRIBUTION();

            ddBranchItemToDistribute.DataSource = dt;
            ddBranchItemToDistribute.DataTextField = dt.Columns["DisplayText"].ToString();
            ddBranchItemToDistribute.DataValueField = dt.Columns["ID"].ToString();
            ddBranchItemToDistribute.DataBind();

            ddBranchItemToDistribute.Items.Insert(0, new ListItem("-- Select Item to Distribute --"));
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

        private void DisplayData_SelectedItemToDistribute(int iID)
        {
            DataTable dt = oTransaction.GET_BRANCHITEM_DISTRIBUTION();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ID ='" + iID + "'";

            if (dv.Count > 0)
            {
               
               
            foreach(DataRowView dvr in dv)
                {
                    lblPartnerName.Text = dvr.Row["PartnerName"].ToString();
                    lblDateDelivered.Text = string.Format("{0:d}", dvr.Row["DateTrans"]);
                    lblBranchItem.Text = dvr.Row["Branch_ItemName"].ToString();
                    lblQuantity.Text = dvr.Row["TotalQty"].ToString();
                    lblDistributed.Text = dvr.Row["DistributedQty"].ToString();


                    int iRemaining = Convert.ToInt32(lblQuantity.Text) - Convert.ToInt32(lblDistributed.Text);

                    lblRemaining.Text = iRemaining.ToString();
                    lblPartnerCode.Text = dvr.Row["PartnerCode"].ToString();
                    lblPTBNum.Text = dvr.Row["PTBNum"].ToString();
                    lblBranchItemCode.Text = dvr.Row["BranchItemCode"].ToString();
                }

          
            }
        }

        private int sumQuantity()
        {
            int x = 0;

            foreach (GridViewRow gvr in gvBranchList.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    TextBox txtQuantity = (TextBox)gvr.Cells[1].FindControl("txtDistrubutedQty");

                    if (!string.IsNullOrEmpty(txtQuantity.Text))
                    {
                        x = x + Convert.ToInt32(txtQuantity.Text);
                    }

                }
            }


            return x;
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

        private void SuccessMessage(string _successMessage)
        {
            lblMessageSuccess.Text = _successMessage;
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show'); window.location.reload();</script>", false);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>alert('Distribution successfully processed.'); window.location=window.location;</script>", false);
        }

        protected void lnkSet_Click(object sender, EventArgs e)
        {
            DataTable dt = oBranch.GET_BRANCHES_DATA();

            string partnerCode = lblPartnerCode.Text;

            DataView dv = dt.DefaultView;
            dv.RowFilter = "PartnerCode ='" + partnerCode + "'";
            dv.Sort = "BranchName";

            gvBranchList.DataSource = dv;
            gvBranchList.DataBind();

            panBranchList.Enabled = true;
            panDistributeSource.Enabled = false;
        }

        protected void ddBranchItemToDistribute_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddBranchItemToDistribute.SelectedIndex != 0) { 
            DisplayData_SelectedItemToDistribute(Convert.ToInt32(ddBranchItemToDistribute.SelectedValue));
            }
        }

        protected void gvBranchList_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            DataTable dt = oTransaction.GET_DISTRIBUTED_BRANCH_ITEM();
            DataView dv = dt.DefaultView;

            foreach (GridViewRow row in gvBranchList.Rows)
            {
                    string branchCode = row.Cells[0].Text;

                    TextBox txtQuantity = (TextBox)row.Cells[1].FindControl("txtDistrubutedQty");
                    TextBox txtDateTrans = (TextBox)row.Cells[2].FindControl("txtDate");

                    //if (checkExistDistribution(lblPTBNum.Text, branchCode))

                    //{

                  dv.RowFilter = "BranchCode ='" + branchCode + "' and ptbNum ='" + lblPTBNum.Text + "' and branch_ItemCode ='" + lblBranchItemCode.Text + "'";

                  if (dv.Count > 0)
                  {

                      foreach (DataRowView dvr in dv)
                      {

                          //Retrieve Item Inputs

                          txtQuantity.Text = Convert.ToInt32(dvr.Row["QuantityReceived"]).ToString();
                          txtDateTrans.Text = Convert.ToDateTime(dvr.Row["DateReceived"]).ToShortDateString();

                          txtQuantity.Enabled = false;
                          txtDateTrans.Enabled = false;

                         // e.Row.BackColor = System.Drawing.Color.Red;

                      }

                      //txtQuantity.Text = _RECEIVEDITEM.ToString();
                      //txtDateTrans.Text = _DATERECEIVED.ToShortDateString();

                     

                  }

            }
        }

        private bool checkExistDistribution(string _ptbNum, string _branchCode)
        {
            bool x = false;

            DataTable dt = oTransaction.GET_DISTRIBUTED_BRANCH_ITEM();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "BranchCode ='" + _branchCode + "' and ptbNum ='" + _ptbNum + "'";

            if(dv.Count > 0)
            {
                x = true;

                foreach (DataRowView dvr in dv)
                {
                  
                    //Retrieve Item Inputs

                    _RECEIVEDITEM = Convert.ToInt32(dvr.Row["QuantityReceived"]);
                    _DATERECEIVED = Convert.ToDateTime(dvr.Row["DateReceived"]);
                   

                }
            }
            else
            { x = false; }

            return x;
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }


       

       
    }
}