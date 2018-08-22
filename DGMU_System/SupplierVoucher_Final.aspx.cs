using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class SupplierVoucher_Final : System.Web.UI.Page
    {
        Supplier_C oSupplier = new Supplier_C();
        Item_C oItem = new Item_C();
        Utility_C oUtility = new Utility_C();
        
        System_C oSystem = new System_C();
        Transaction_C oTransaction = new Transaction_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displaySupplierList();

            
             
     
                txtReceiveDate.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();

                //txtRemarks.Text = oSystem.GENERATE_SERIES_NUMBER_TRANS("VN");

            }

        }



     
        protected void U_Save_S_Click(object sender, EventArgs e)
        {



            if (gvSupplierItems.Rows.Count > 0)
            {

                //Saving Rows Transaction of Supplier
                foreach (GridViewRow row in gvSupplierItems.Rows)
                {
                    string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("VN");
                    Session["G_VOUCHERNUM"] = SeriesNum;


                    TextBox txtInvQty = (TextBox)row.Cells[3].FindControl("txtItemPerPiece");
                    TextBox txtSupplyQty = (TextBox)row.Cells[5].FindControl("txtItemPeKilo");
                    TextBox txtItemPrice = (TextBox)row.Cells[7].FindControl("txtItemPrice");
                    TextBox txtItemCost = (TextBox)row.Cells[8].FindControl("txtItemCost");
                    
                    double dInvQty = 0.0;
                    double dSupplierQty = 0.0;
                    double dSupplierPrice = 0.0;
                    double dItemCost = 0.0;
                    //if(double.TryParse(txtItemCost.Text, out dItemCost))

                    if (!string.IsNullOrEmpty(txtInvQty.Text))
                    {
                        dInvQty = double.Parse(txtInvQty.Text);
                    }
                    else
                    { dInvQty = 0; }

                    if (!string.IsNullOrEmpty(txtSupplyQty.Text))
                    {
                        dSupplierQty = double.Parse(txtSupplyQty.Text);
                    }else{dSupplierQty = 0;}

                    if (!string.IsNullOrEmpty(txtItemPrice.Text))
                    {
                        dSupplierPrice = double.Parse(txtItemPrice.Text);
                    }
                    else { dSupplierPrice = 0; }

                    if (!string.IsNullOrEmpty(txtItemCost.Text) || string.IsNullOrWhiteSpace(txtItemCost.Text))
                    {
                        dItemCost = double.Parse(txtItemCost.Text);
                    }
                    else { dItemCost = 0; }

                    int iItemSubID = int.Parse(row.Cells[0].Text);
                    string sItemCode = row.Cells[1].Text;
                    
                    string sInvUOM = row.Cells[4].Text; 
                    string sSupplierUOM = row.Cells[6].Text;
              

                    //double dInvPrice = double.Parse(row.Cells[8].Text);

                    //Saving Data on Supplier Transaction HDR

                    //oTransaction.INSERT_SUPPLIER_VOUCHER_HDR(SeriesNum, ddSupplierList.SelectedValue.ToString(), txtBank.Text.ToUpper(), txtChequeNumber.Text, Convert.ToDateTime(txtReceiveDate.Text), txtRemarks.Text, "-----");

                    // oSupplier.INSERT_SUPPLIER_ORDER_TRANS_ROWS(ddSupplierList.SelectedValue.ToString(), SeriesNum, sItemCode, dInvQty, dInvPrice, sInvUOM, dSupplierQty, dSupplierPrice, sSupplierUOM, Convert.ToDateTime(txtDeliveryDate.Text), Session["G_USERCODE"].ToString());
                    //oTransaction.INSERT_SUPPLIER_VOUCHER_ROWS(SeriesNum, sItemCode,iItemSubID, dInvQty,sInvUOM, dSupplierQty, sSupplierUOM, dSupplierPrice, "----");

                    //Condition
                    if (dInvQty != 0 || dSupplierQty != 0)
                    {
                        oTransaction.INSERT_SUPPLIER_VOUCHER(SeriesNum, ddSupplierList.SelectedValue.ToString(), txtBank.Text.ToUpper(), txtChequeNumber.Text, Convert.ToDateTime(txtReceiveDate.Text), txtRemarks.Text, sItemCode, iItemSubID, dInvQty, sInvUOM, dSupplierQty, sSupplierUOM, dSupplierPrice, "----");
                    }
                
                }



                //Update Series Number
                oSystem.UPDATE_SERIES_NUMBER("VN");


                //Direct to the print

                PRINT_NOW("repCheckVoucher.aspx");

                //Prompt a message.
                lblMessageSuccess.Text = "Transaction successfully recorded.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                //Clear Fields
                resetFields();

             


            }
            else
            { 
            //Error Message
               
                lblErrorMessage.Text = "No Item found.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }
            }
         



     
    

        private void displaySupplierList()
        {

            DataTable dt = oSupplier.GET_SUPPLIERS_DATA();

            ddSupplierList.DataSource = dt;
            ddSupplierList.DataTextField = dt.Columns["SupplierName"].ToString();
            ddSupplierList.DataValueField = dt.Columns["SupplierCode"].ToString();
            ddSupplierList.DataBind();

            ddSupplierList.Items.Insert(0, new ListItem("-- SELECT SUPPLIER --"));
        }

        //Display Item in Gridview base on supplier selection
        private void displaySupplierItemList(string _supplierCode)
        {
            DataTable dt = oUtility.GET_SUPPLIER_ITEM_PRICE();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "SupplierCode = '" + _supplierCode + "'";
            dv.Sort = "ItemSubCatID";
            if (dv.Count > 0)
            {

                gvSupplierItems.DataSource = dv;
                gvSupplierItems.DataBind();
            }
            else {
                gvSupplierItems.DataSource = null;
                gvSupplierItems.DataBind();
            }
        }


    

     


     

        private double computeRunningTotal()
        {
            double dRunningTotal = 0;

            foreach (GridViewRow gvr in gvSupplierItems.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    dRunningTotal = dRunningTotal + Convert.ToDouble(gvr.Cells[8].Text);

                }
            }

            return dRunningTotal;
        }

   
        protected void ddSupplierList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtSupplierList = oSupplier.GET_SUPPLIERS_DATA();

            DataRow[] dr;
            dr = dtSupplierList.Select("SupplierCode = '" + ddSupplierList.SelectedValue.ToString() + "'");

            if (dr.Length > 0)
            {
                //Will display the selected supplier info
                foreach (DataRow row in dr)
                {
                    lblSupplierContact.Text = row["S_ContactPerson"].ToString();
                    lblSupplierNumbers.Text = row["S_ContactNumber"].ToString();
                    lblSupplierAddress.Text = row["S_Address"].ToString();

                   

                }
                displaySupplierItemList(ddSupplierList.SelectedValue.ToString());
            }

        }


        //RESET ALL Fields
        private void resetFields()
        {

            //txtRequestDate.Text = "";
            txtRemarks.Text = "";
            //txtQuantity.Text = "";

            ddSupplierList.SelectedIndex = 0;
            //ddItemList.SelectedIndex = 0;



            //lblPrice.Text = "";
            //lblUOM.Text = "";
            //lblRunningTotal.Text = "";
            lblSupplierAddress.Text = "";
            lblSupplierContact.Text = "";
            lblSupplierNumbers.Text = "";
            ////Clearing Gridview
            gvSupplierItems.DataSource = null;
            gvSupplierItems.DataBind();

            ////Will Clear local data table
            //DataTable dt = (DataTable)Session["tempSupplierOrder"];
            //dt.Clear();
        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            Session["G_VOUCHERNUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repCheckVoucher.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

    }
}