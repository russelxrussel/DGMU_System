using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class StockBranchReturn : System.Web.UI.Page
    {

        Utility_C oUtility = new Utility_C();
        Item_C oItem = new Item_C();
        Transaction_C oTransaction = new Transaction_C();
        System_C oSystem = new System_C();

        Branch_C oBranch = new Branch_C();
        Supplier_C oSupplier = new Supplier_C();
        Inventory_C oInventory = new Inventory_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                displayBranchList();
                displayItemList();

            }

        }




        protected void U_Save_S_Click(object sender, EventArgs e)
        {

            foreach (GridViewRow row in gvItemList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string itemCode = row.Cells[0].Text;

                    TextBox txtQuantity = (TextBox)row.Cells[2].FindControl("txtQuantity");
                    double quantity = Convert.ToDouble(txtQuantity.Text);

                    string srNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("SR");

                    if (quantity != 0)
                    {
                        oTransaction.INSERT_STOCK_BRANCH_RETURN(srNum, ddBranchList.SelectedValue.ToString(), itemCode, quantity, chkCreditToPartner.Checked, Convert.ToDateTime(txtReturnDate.Text), txtRemarks.Text);
                    }
                }
            }
        }

        

  

    

      
        private void displayBranchList()
        {
            DataTable dt = oBranch.GET_BRANCHES_DATA();

            ddBranchList.DataSource = dt;
            ddBranchList.DataTextField = dt.Columns["BranchName"].ToString();
            ddBranchList.DataValueField = dt.Columns["BranchCode"].ToString();
            ddBranchList.DataBind();

            ddBranchList.Items.Insert(0, new ListItem("-- Select Branch --"));
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