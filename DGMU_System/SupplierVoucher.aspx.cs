using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class SupplierVoucher : System.Web.UI.Page
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

                displayItemList();



                //Create Temporary Table for Ordered item from Supplier
                createTempItemTable();

                txtReceiveDate.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();

                //txtRemarks.Text = oSystem.GENERATE_SERIES_NUMBER_TRANS("VN");

            }

        }



        protected void ddItemList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtItemList = oItem.GET_ITEM_DATA();

            DataRow[] dr;
            dr = dtItemList.Select("ItemCode = '" + ddItemList.SelectedValue.ToString() + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                  
                    lblInvUom.Text = row["InvUomCode"].ToString();
                    lblSupplierUOM.Text = row["PurchasingUomCode"].ToString();
                   // lblSupplierPrice.Text = row["PriceAmount"].ToString();

                   

                    if ((bool)row["IsSubCat"])
                    {
                        displayItemSubCatList();

                        ddItemSubList_SelectedIndexChanged(sender, e);
                    }
                    else
                    {
                        ddItemSubList.Items.Clear();
                    }
                }
            }
        }

        protected void U_Save_S_Click(object sender, EventArgs e)
        {
            if (gvSupplierItems.Rows.Count > 0)
            {

       
                //Saving Data on Supplier Transaction HDR

                oTransaction.INSERT_SUPPLIER_VOUCHER_HDR(oSystem.GENERATE_SERIES_NUMBER_TRANS("VN"), ddSupplierList.SelectedValue.ToString(), txtBank.Text.ToUpper(), txtChequeNumber.Text, Convert.ToDateTime(txtReceiveDate.Text), txtRemarks.Text, "-----");

                if (gvSupplierItems.Rows.Count > 0)
                {

                    //Saving Rows Transaction of Supplier
                    foreach (GridViewRow row in gvSupplierItems.Rows)
                    {
                        string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("VN");
                        Session["G_VOUCHERNUM"]  = SeriesNum;

                        string sItemCode = row.Cells[1].Text;
                        int iItemSubID = int.Parse(row.Cells[2].Text);
                        double dInvQty = double.Parse(row.Cells[4].Text);
                        string sInvUOM = row.Cells[5].Text;
                        double dSupplierQty = double.Parse(row.Cells[6].Text);
                        string sSupplierUOM = row.Cells[7].Text;
                        double dSupplierPrice = double.Parse(row.Cells[8].Text);

                        //double dInvPrice = double.Parse(row.Cells[8].Text);


                        // oSupplier.INSERT_SUPPLIER_ORDER_TRANS_ROWS(ddSupplierList.SelectedValue.ToString(), SeriesNum, sItemCode, dInvQty, dInvPrice, sInvUOM, dSupplierQty, dSupplierPrice, sSupplierUOM, Convert.ToDateTime(txtDeliveryDate.Text), Session["G_USERCODE"].ToString());
                        oTransaction.INSERT_SUPPLIER_VOUCHER_ROWS(SeriesNum, sItemCode,iItemSubID, dInvQty,sInvUOM, dSupplierQty, sSupplierUOM, dSupplierPrice, "----");


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
            }
            else
            {
                //Prompt a message.
                //lblErrorPrompt.Text = "No item was added.";
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }
        }



        protected void lnkAdd_Click(object sender, EventArgs e)
        {


            if (ddItemList.SelectedIndex == 0 || string.IsNullOrEmpty(txtReceiveDate.Text) || ddSupplierList.SelectedIndex == 0 || string.IsNullOrEmpty(txtQuantity.Text) || string.IsNullOrEmpty(txtConversionQty.Text))
            {
                //Prompt a message.
                //lblErrorPrompt.Text = "Required fields should fill up first.";
                //ScriptManager(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

                ErrorOccured("Required fields should fill up first.");
            }

            //DISABLE TO ALLOW ZERO PRICE OF ITEM
            //else if (lblPrice.Text == "0" || string.IsNullOrEmpty(lblPrice.Text))
            //{
            //    //Prompt a message.
            //    lblErrorPrompt.Text = "No Supplier price indicated, cannot proceed.";
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            //}

            else
            {
                //Check if item already on the list
                if (ExistItem(ddItemList.SelectedValue.ToString()))
                {

                    //Prompt a message.
                   ErrorOccured("Item already exist on current request list.");
                }
                else
                {

                    double itemPrice = Convert.ToDouble(lblSupplierPrice.Text);
                    //Instantiate table 
                    DataTable dt = (DataTable)Session["tempSupplierOrder"];

                    //Add New Row
                    DataRow newRow = dt.NewRow();

                    newRow["CODE"] = ddItemList.SelectedValue.ToString();
                    newRow["ISUB"] = ddItemSubList.SelectedIndex.ToString();
                    if (ddItemSubList.SelectedIndex == -1)
                    {
                        newRow["DESC"] = ddItemList.SelectedItem.Text;
                    }
                    else
                    { 
                        newRow["DESC"] = ddItemList.SelectedItem.Text + " " + ddItemSubList.SelectedItem.Text;
                    }
                    newRow["QTY"] = double.Parse(txtQuantity.Text);
                    newRow["UOM"] = lblInvUom.Text;
                    newRow["SQ"] = double.Parse(txtConversionQty.Text);
                    newRow["SU"] = lblSupplierUOM.Text;
                    newRow["PRICE"] = itemPrice;
                    double sSubTotal = double.Parse(txtConversionQty.Text) * itemPrice;
                    newRow["TOTAL"] = string.Format("{0:N}", sSubTotal);
              
                    
                    dt.Rows.Add(newRow);

                    Session["tempSupplierOrder"] = dt;

                    gvSupplierItems.DataSource = Session["tempSupplierOrder"];
                    gvSupplierItems.DataBind();

                    ddItemList.SelectedIndex = 0;
                    //ddItemSubList.SelectedIndex = 0;

                    lblRunningTotal.Text = string.Format("Total Cost: {0:N}", computeRunningTotal());

                    //Clear Text
                    lblSupplierPrice.Text = "";
                    lblInvUom.Text = "";
                    txtQuantity.Text = "";

                    txtConversionQty.Text = "";
                    lblSupplierUOM.Text = "";
                   

                }
            }
        }

        private void createTempItemTable()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("CODE", System.Type.GetType("System.String"));
            dt.Columns.Add("ISUB", System.Type.GetType("System.Int32"));
            dt.Columns.Add("DESC", System.Type.GetType("System.String"));
            dt.Columns.Add("QTY", System.Type.GetType("System.Double"));
            dt.Columns.Add("UOM", System.Type.GetType("System.String"));
            dt.Columns.Add("SQ", System.Type.GetType("System.Double"));
            dt.Columns.Add("SU", System.Type.GetType("System.String"));
            dt.Columns.Add("PRICE", System.Type.GetType("System.Double"));
            dt.Columns.Add("TOTAL", System.Type.GetType("System.Double"));
          
            
            Session["tempSupplierOrder"] = dt;

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




        private void displayItemList()
        {
            DataTable dt = oItem.GET_ITEM_DATA();
            
            ddItemList.DataSource = dt;
            ddItemList.DataTextField = dt.Columns["ItemName"].ToString();
            ddItemList.DataValueField = dt.Columns["ItemCode"].ToString();
            ddItemList.DataBind();

            ddItemList.Items.Insert(0, new ListItem("-- SELECT ITEM --"));
        }

        private void displayItemSubCatList() {
            DataTable dt = oUtility.GET_ITEM_SUBCAT_LIST();

            DataView dv = dt.DefaultView;
            dv.RowFilter="ItemCode = '" + ddItemList.SelectedValue + "'";
            if (dv.Count > 0)
            {
            ddItemSubList.DataSource = dv;
            ddItemSubList.DataTextField = dv.Table.Columns["ItemSubName"].ToString();
            ddItemSubList.DataValueField = dv.Table.Columns["ItemSubCatID"].ToString();
            ddItemSubList.DataBind();
            }

           


           // ddItemSubList.Items.Insert(0, new ListItem(""));
        }


        //Check if item exist on gridview

        private bool ExistItem(string _itemCode)
        {
            bool bExist = false;

            foreach (GridViewRow gvr in gvSupplierItems.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {

                    string sCode = gvr.Cells[1].Text;
                    int iItemSub = Convert.ToInt32(gvr.Cells[2].Text);
                    if (sCode == ddItemList.SelectedValue.ToString() &&  iItemSub == ddItemSubList.SelectedIndex)
                    {
                        bExist = true;
                    }

                }
            }


            return bExist;
        }

        private double computeRunningTotal()
        {
            double dRunningTotal = 0;

            foreach (GridViewRow gvr in gvSupplierItems.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    dRunningTotal = dRunningTotal + Convert.ToDouble(gvr.Cells[9].Text);

                }
            }

            return dRunningTotal;
        }

        //Remove Button Action
        protected void lnkRemoveItem_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            string selCode = r.Cells[1].Text;


            DataTable dt = (DataTable)Session["tempSupplierOrder"];

            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                DataRow drow = dt.Rows[i];
                if (drow["CODE"].ToString() == selCode)
                    drow.Delete();
            }

            dt.AcceptChanges();

            Session["tempSupplierOrder"] = dt;


            gvSupplierItems.DataSource = dt;
            gvSupplierItems.DataBind();

            lblRunningTotal.Text = string.Format("Total Cost: {0:N}", computeRunningTotal());
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
            }

        }


        //RESET ALL Fields
        private void resetFields()
        {

            //txtRequestDate.Text = "";
            //txtRemarks.Text = "";
            //txtQuantity.Text = "";

            //ddSupplierList.SelectedIndex = 0;
            //ddItemList.SelectedIndex = 0;



            //lblPrice.Text = "";
            //lblUOM.Text = "";
            //lblRunningTotal.Text = "";
            //lblSupplierAddress.Text = "";
            //lblSupplierContact.Text = "";
            //lblSupplierNumbers.Text = "";
            ////Clearing Gridview
            //gvSupplierItems.DataSource = null;
            //gvSupplierItems.DataBind();

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

        protected void ddItemSubList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Display Supplier Price indicated
            DataTable dtSPrice = oUtility.GET_SUPPLIER_ITEM_PRICE();
            DataRow[] dr;
            dr = dtSPrice.Select("SupplierCode = '" + ddSupplierList.SelectedValue.ToString() + "' and ItemSubCatID = '" + Convert.ToInt32(ddItemSubList.SelectedValue) + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                    lblSupplierPrice.Text = row["PriceAmount"].ToString();
                }
            }
            else
            {
                lblSupplierPrice.Text = "";
            }
        }
    }
}