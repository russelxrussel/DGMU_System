using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class StockAdjustment : System.Web.UI.Page
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
                displayAdjustmentList();
                displayItemList();

            }

        }


        private void StockAvailable(string _storageCode, string _itemCode)
        {
          

            DataTable dt = oInventory.GET_STORAGE_DATA();

            DataRow[] dr = dt.Select("StorageCode='" + _storageCode + "' and ItemCode='" + _itemCode + "'");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dr)
                {
                  //  lblAvailableStock.Text = row["CurrentStock"].ToString();
                }
            }

        }
    
        protected void U_Save_S_Click(object sender, EventArgs e)
        {
         
          //Check First Parameter
            if (string.IsNullOrEmpty(txtAdjustmentDate.Text) || string.IsNullOrEmpty(txtQuantity.Text) || ddAdjustment.SelectedIndex == 0 || ddReference.SelectedIndex == 0 || ddItem.SelectedIndex == 0 || Convert.ToInt32(txtQuantity.Text) == 0)
            {
                
                lblErrorMessage.Text = "Input required.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                return;
            }
            //else if(ddAdjustment.SelectedValue.ToString() == ddReference.SelectedValue.ToString())
            //{
            //    lblErrorMessage.Text = "Please select other destination storage.";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            //    return;
            //}

            //else if (Convert.ToInt32(txtQuantity.Text) > Convert.ToInt32(lblAvailableStock.Text))
            //{
            //    lblErrorMessage.Text = "Insufficient Stock from Source Storage Area.";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            //    return;
            //}

            else
            {
                string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("SA");

                Session["G_SANUM"] = SeriesNum;

               // bool bExist = oTransaction.CHECK_STORAGE_EXIST(ddReference.SelectedValue.ToString(), ddItem.SelectedValue.ToString());
               // oTransaction.INSERT_STOCK_TRANSFER_TRANS(SeriesNum, Convert.ToDateTime(txtAdjustmentDate.Text), ddAdjustment.SelectedValue.ToString(), ddReference.SelectedValue.ToString(), ddItem.SelectedValue.ToString(), Convert.ToDouble(txtQuantity.Text), txtRemarks.Text, "----", bExist);

                oTransaction.INSERT_STOCK_ADJUSTMENT(SeriesNum, ddAdjustment.SelectedValue.ToString(), ddItem.SelectedValue.ToString(), int.Parse(txtQuantity.Text), Convert.ToDateTime(txtAdjustmentDate.Text), ddReference.SelectedValue.ToString(), txtRemarks.Text);
               // oSystem.UPDATE_SERIES_NUMBER("ST");


                lblMessageSuccess.Text = "Stock Adjustment successfully process.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);


                PRINT_NOW("repStockAdjustment.aspx");

                resetFields();
            }
        }



  

    

        private void displayAdjustmentList()
        {


            DataTable dt = oUtility.GET_ADJUSTMENT_LIST();
            
            ddAdjustment.DataSource = dt;
            ddAdjustment.DataTextField = dt.Columns["Description"].ToString();
            ddAdjustment.DataValueField = dt.Columns["AdjCode"].ToString();
            ddAdjustment.DataBind();

            ddAdjustment.Items.Insert(0, new ListItem("-- Select Adjustment --"));

           
        }

        private void displayItemList()
        {
            DataTable dt = oItem.GET_ITEM_DATA();

            ddItem.DataSource = dt;
            ddItem.DataTextField = dt.Columns["ItemName"].ToString();
            ddItem.DataValueField = dt.Columns["ItemCode"].ToString();
            ddItem.DataBind();

            ddItem.Items.Insert(0, new ListItem("-- SELECT ITEM --"));
        }




       

     
     

        //Check if item exist on gridview

    

        //Remove Button Action
     

        //RESET ALL Fields
        private void resetFields()
        {

            txtAdjustmentDate.Text = "";
            txtQuantity.Text = "";
            txtRemarks.Text = "";

            ddItem.SelectedIndex = 0;
            ddAdjustment.SelectedIndex = 0;
           // ddReference.SelectedIndex = 0;

          //  lblAvailableStock.Text = "";
      
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

       

        protected void ddItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            StockAvailable(ddAdjustment.SelectedValue.ToString(), ddItem.SelectedValue.ToString());
        }

        protected void ddAdjustment_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddReference.Items.Clear();

            if (ddAdjustment.SelectedValue.ToString() == "ARB")
            {
                DataTable dt = oBranch.GET_BRANCHES_DATA();
                
                ddReference.DataSource = dt;
                ddReference.DataTextField = dt.Columns["BranchName"].ToString();
                ddReference.DataValueField = dt.Columns["BranchCode"].ToString();
                ddReference.DataBind();
            }
            else if(ddAdjustment.SelectedValue.ToString() == "ARS")
            {
                DataTable dt = oSupplier.GET_SUPPLIERS_DATA();
                ddReference.DataSource = dt;
                ddReference.DataTextField = dt.Columns["SupplierName"].ToString();
                ddReference.DataValueField = dt.Columns["SupplierCode"].ToString();
                ddReference.DataBind();
            }
        }
    }
}