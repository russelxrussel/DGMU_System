using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class DepositEntry : System.Web.UI.Page
    {

        Utility_C oUtility = new Utility_C();
        Item_C oItem = new Item_C();
        Partner_C oPartner = new Partner_C();

        Transaction_C oTransaction = new Transaction_C();
        System_C oSystem = new System_C();

        Inventory_C oInventory = new Inventory_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayPartner();
          
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
           //         lblAvailableStock.Text = row["CurrentStock"].ToString();
                }
            }

        }

        private void Display_Partner_Deposit_History(string _partnerCode)
        {
            DataTable dt = oTransaction.GET_PARTNER_DEPOSIT();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode='" + _partnerCode + "'";

            if (dv.Count > 0)
            {
               
                gvPaymentHistory.DataSource = dv;
                gvPaymentHistory.DataBind();

                lblTotalPayment.Text = string.Format("{0:N}", computeRunningTotalDeposit()); 
            
            }
            else
            {
                gvPaymentHistory.DataSource = null;
                gvPaymentHistory.DataBind();

                lblTotalPayment.Text = "";
            }
        }

        private void Display_Partner_Payable_History(string _partnerCode)
        {
            DataTable dt = oTransaction.GET_PARTNER_PAYABLE();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode='" + _partnerCode + "'";

            if (dv.Count > 0)
            {
                gvPartnerPayable.DataSource = dv;
                gvPartnerPayable.DataBind();


                lblTotalPayable.Text = string.Format("{0:N}", computeRunningTotalPayable()); 
            
                double dBalance = computeRunningTotalDeposit() - computeRunningTotalPayable();
                lblTotalBalance.Text = string.Format("{0:N}", dBalance); 
            }
            else
            {
                gvPartnerPayable.DataSource = null;
                gvPartnerPayable.DataBind();

                lblTotalPayable.Text = "";
                lblTotalBalance.Text = "";
            }
        }
  
        protected void U_Save_S_Click(object sender, EventArgs e)
        {

            if (ddPartner.SelectedIndex != 0 &&!string.IsNullOrEmpty(txtPaymentDate.Text) && !string.IsNullOrEmpty(txtPaymentAmount.Text))
            {
                string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("PD");
                Session["G_PDNUM"] = SeriesNum;

                //INSERT PAYMENT TRANSACTION
                oTransaction.INSERT_PARTNER_DEPOSIT(SeriesNum, ddPartner.SelectedValue.ToString(), Convert.ToDouble(txtPaymentAmount.Text), Convert.ToDateTime(txtPaymentDate.Text), txtChequeNumber.Text, txtBank.Text, txtRemarks.Text, "USER");

                //Update Series Number
               // oSystem.UPDATE_SERIES_NUMBER("PD");

                resetFields();

                Display_Partner_Deposit_History(ddPartner.SelectedValue.ToString());
                Display_Partner_Payable_History(ddPartner.SelectedValue.ToString());

                lblMessageSuccess.Text = "Partner Deposit Payment successfully recorded.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);


                PRINT_NOW("repPartnerDepositTransaction.aspx");

            }
            else
            {
                lblErrorMessage.Text = "Required field.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                return;
            }
          //Check First Parameter
            //if (string.IsNullOrEmpty(txtTransferDate.Text) || string.IsNullOrEmpty(txtQuantity.Text) || ddStorageFrom.SelectedIndex == 0 || ddStorageTo.SelectedIndex == 0 || ddItem.SelectedIndex == 0 || Convert.ToInt32(txtQuantity.Text) == 0)
            //{
                
            //    lblErrorMessage.Text = "Input required.";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            //    return;
            //}
            //else if(ddStorageFrom.SelectedValue.ToString() == ddStorageTo.SelectedValue.ToString())
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

            //else
            //{
            //    string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("ST");

            //    Session["G_STNUM"] = SeriesNum;

            //    bool bExist = oTransaction.CHECK_STORAGE_EXIST(ddStorageTo.SelectedValue.ToString(), ddItem.SelectedValue.ToString());
            //    oTransaction.INSERT_STOCK_TRANSFER_TRANS(SeriesNum, Convert.ToDateTime(txtTransferDate.Text), ddStorageFrom.SelectedValue.ToString(), ddStorageTo.SelectedValue.ToString(), ddItem.SelectedValue.ToString(), Convert.ToDouble(txtQuantity.Text), txtRemarks.Text, "----", bExist);


            //    oSystem.UPDATE_SERIES_NUMBER("ST");


            //    lblMessageSuccess.Text = "Stock Transfer successfully recorded.";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);


            //    PRINT_NOW("repStockTransfer.aspx");

            //    resetFields();
            //}
        }



        private double computeRunningTotalDeposit()
        {
            double dRunningTotal = 0;

            foreach (GridViewRow gvr in gvPaymentHistory.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    dRunningTotal = dRunningTotal + Convert.ToDouble(gvr.Cells[2].Text);

                }
            }

            return dRunningTotal;
        }

        private double computeRunningTotalPayable()
        {
            double dRunningTotal = 0;

            foreach (GridViewRow gvr in gvPartnerPayable.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    dRunningTotal = dRunningTotal + Convert.ToDouble(gvr.Cells[1].Text);

                }
            }

            return dRunningTotal;
        }
  

    

     

       

        private void displayPartner()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartner.DataSource = dt;
            ddPartner.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartner.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartner.DataBind();

            ddPartner.Items.Insert(0, new ListItem("-- SELECT PARTNER --"));
        }


       

     
     

        //Check if item exist on gridview

    

        //Remove Button Action
     

        //RESET ALL Fields
        private void resetFields()
        {

            txtPaymentAmount.Text = "";
            txtPaymentDate.Text = "";
            txtBank.Text = "";
            txtChequeNumber.Text = "";
            txtRemarks.Text = "";

           
        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            Session["G_PDNUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repPartnerDepositTransaction.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

       

        protected void ddItem_SelectedIndexChanged(object sender, EventArgs e)
        {
    //        StockAvailable(ddStorageFrom.SelectedValue.ToString(), ddItem.SelectedValue.ToString());
        }

        protected void ddPartner_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddPartner.SelectedIndex != 0)
            {
                Display_Partner_Deposit_History(ddPartner.SelectedValue.ToString());

                Display_Partner_Payable_History(ddPartner.SelectedValue.ToString());
            }
            else
            {
                resetFields();
            }
        }
    }
}