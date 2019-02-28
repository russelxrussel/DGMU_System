using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class BranchSalesEntry : System.Web.UI.Page
    {

       
       
        System_C oSystem = new System_C();

        Branch_C oBranch = new Branch_C();
        Item_C oItem = new Item_C();

        Transaction_C oTrans = new Transaction_C();
       
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
               
                DisplayBranchList();

                txtDate.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();
            }

        }




        protected void U_Save_S_Click(object sender, EventArgs e)
        {
            
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


        }
      

        private void displayItemList()
        {
            DataTable dt = oItem.GET_BRANCH_ITEM_DATA();

            gvItemList.DataSource = dt;
            gvItemList.DataBind();

        }

        private void DisplayBranchList()
        {
            DataTable dt = oBranch.GET_BRANCHES_DATA();
            gvBranchList.DataSource = dt;
            gvBranchList.DataBind();
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
           // Session["S_PTNNUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repPickUp.aspx");

        }

     

        protected void gvBranchList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow);

            if (e.CommandName == "Select")
            {
               
                    ViewState["BRANCHCODE"] = row.Cells[0].Text;

                    lblBranchSelected.Text = "<b> Sales Entry for :" + row.Cells[1].Text + "</b>";

                    txtSearch.Text = "";

                    panelEntry.Enabled = true;


                displayItemList();

            }

        }

        protected void lnkProcessSales_Click(object sender, EventArgs e)
        {
            int totQuantityInput = totalQuantity();

            //Condition
            if (totQuantityInput > 0)
            {
                //PROCEED IN SAVING
                string salesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("BS");
                foreach (GridViewRow row in gvItemList.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        string itemCode = row.Cells[0].Text;

                        TextBox txtQuantity = (TextBox)row.Cells[2].FindControl("txtQuantity");
                        double quantity;
                        if (string.IsNullOrEmpty(txtQuantity.Text))
                        { quantity = 0; }
                        else
                        {
                            quantity = Convert.ToDouble(txtQuantity.Text);
                        }

                        if (quantity != 0)
                        {
                            
                            oTrans.INSERT_BRANCH_SALES(salesNum, Convert.ToDateTime(txtDate.Text), ViewState["BRANCHCODE"].ToString(), itemCode, quantity);
                        }
                    }
                }

                lblMessageSuccess.Text = "Sales Entry Processed.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);
                ViewState["BRANCHCODE"] = 0;
                gvItemList.DataSource = null;
                gvItemList.DataBind();
                panelEntry.Enabled = false;
                
            }
            else
            {
                lblErrorMessage.Text = "Zero Item quantity detected, cannot be process.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            }
        }

        protected void gvItemList_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string itemCode = dr["Branch_ItemCode"].ToString();

                Label lblAvailableStock = (e.Row.FindControl("lblBranchItemAvailable") as Label);

                lblAvailableStock.Text = oTrans.GET_BRANCH_AVAILABLE_STOCK(Convert.ToDateTime(txtDate.Text), ViewState["BRANCHCODE"].ToString(),itemCode).ToString();
                
            }
        }
    }
}