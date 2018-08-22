using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class StockTransfer : System.Web.UI.Page
    {

        Utility_C oUtility = new Utility_C();
        Item_C oItem = new Item_C();
        Transaction_C oTransaction = new Transaction_C();
        System_C oSystem = new System_C();

        Inventory_C oInventory = new Inventory_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayStorageList();
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
                    lblAvailableStock.Text = row["CurrentStock"].ToString();
                }
            }

        }
    
        protected void U_Save_S_Click(object sender, EventArgs e)
        {
         
          //Check First Parameter
            if (string.IsNullOrEmpty(txtTransferDate.Text) || string.IsNullOrEmpty(txtQuantity.Text) || ddStorageFrom.SelectedIndex == 0 || ddStorageTo.SelectedIndex == 0 || ddItem.SelectedIndex == 0 || Convert.ToInt32(txtQuantity.Text) == 0)
            {
                
                lblErrorMessage.Text = "Input required.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                return;
            }
            else if(ddStorageFrom.SelectedValue.ToString() == ddStorageTo.SelectedValue.ToString())
            {
                lblErrorMessage.Text = "Please select other destination storage.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                return;
            }

            else if (Convert.ToInt32(txtQuantity.Text) > Convert.ToInt32(lblAvailableStock.Text))
            {
                lblErrorMessage.Text = "Insufficient Stock from Source Storage Area.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                return;
            }

            else
            {
                string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("ST");

                Session["G_STNUM"] = SeriesNum;

                bool bExist = oTransaction.CHECK_STORAGE_EXIST(ddStorageTo.SelectedValue.ToString(), ddItem.SelectedValue.ToString());
                oTransaction.INSERT_STOCK_TRANSFER_TRANS(SeriesNum, Convert.ToDateTime(txtTransferDate.Text), ddStorageFrom.SelectedValue.ToString(), ddStorageTo.SelectedValue.ToString(), ddItem.SelectedValue.ToString(), Convert.ToDouble(txtQuantity.Text), txtRemarks.Text, "----", bExist);


                //oSystem.UPDATE_SERIES_NUMBER("ST");


                lblMessageSuccess.Text = "Stock Transfer successfully recorded.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);


                PRINT_NOW("repStockTransfer.aspx");

                resetFields();
            }
        }



  

    

        private void displayStorageList()
        {


            DataTable dt = oUtility.GET_STORAGE_AREA_LIST();
            
            ddStorageFrom.DataSource = dt;
            ddStorageFrom.DataTextField = dt.Columns["StorageName"].ToString();
            ddStorageFrom.DataValueField = dt.Columns["StorageCode"].ToString();
            ddStorageFrom.DataBind();

            ddStorageFrom.Items.Insert(0, new ListItem("-- STORAGE FROM --"));

            DataTable dt2 = oUtility.GET_STORAGE_AREA_LIST();

            ddStorageTo.DataSource = dt2;
            ddStorageTo.DataTextField = dt2.Columns["StorageName"].ToString();
            ddStorageTo.DataValueField = dt2.Columns["StorageCode"].ToString();
            ddStorageTo.DataBind();

            ddStorageTo.Items.Insert(0, new ListItem("-- STORAGE TO --"));
            
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

            txtTransferDate.Text = "";
            txtQuantity.Text = "";
            txtRemarks.Text = "";

            ddItem.SelectedIndex = 0;
            ddStorageFrom.SelectedIndex = 0;
            ddStorageTo.SelectedIndex = 0;

            lblAvailableStock.Text = "";
      
        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            Session["G_STNUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repStockTransfer.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

       

        protected void ddItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            StockAvailable(ddStorageFrom.SelectedValue.ToString(), ddItem.SelectedValue.ToString());
        }
    }
}