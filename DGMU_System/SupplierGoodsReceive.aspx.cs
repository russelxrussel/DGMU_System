using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class SupplierGoodsReceive : System.Web.UI.Page
    {

        Supplier_C oSupplier = new Supplier_C();
        Transaction_C oTransaction = new Transaction_C();
        System_C oSystem = new System_C();

        private static string _sPONum;

        private static bool _overQty;
        private static bool _emptyAllItem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displaySupplierList();

            }

        }





        protected void U_Save_S_Click(object sender, EventArgs e)
       {

            //Need to validate
            if (string.IsNullOrEmpty(txtDateTrans.Text) || string.IsNullOrEmpty(txtDeliveryDate.Text))
            {
                //Prompt a message.
                //lblErrorPrompt.Text = "Document Date and Delivery Date required.";
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }

            else if (gvPOItems.Rows.Count > 0)
            {

                //Check if user input have greater than PO quantity
                OVER_QUANTITY_CHECK_POINT();

                //Check if user input have zero or empty
                EMPTY_ZERO_ALL_ITEM_CHECK_POINT();

                if (_overQty)
                {
                    ////Means that there is over quantity 
                    //lblErrorPrompt.Text = "Please check received item input over PO Item quantity.";
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                }
                else if (_emptyAllItem)
                {
                    //    //Means that there is over quantity 
                    //lblErrorPrompt.Text = "Received Quantity not allowed zero or Empty.";
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                }
                else
                {
                    //Proceed on Saving


                    //oSupplier.INSERT_SUPPLIER_ORDER_TRANS_HDR(_sPONum, ddSupplierList.SelectedValue.ToString(), Convert.ToDateTime(txtDateTrans.Text), Convert.ToDateTime(txtDeliveryDate.Text), oSeriesNumber.GENERATE_SERIES_NUMBER_TRANS("ST"), txtRemarks.Text, Session["G_USERCODE"].ToString());
                //    oTransaction.INSERT_SUPPLIER_GRPO_TRANS_HDR(oSystem.GENERATE_SERIES_NUMBER_TRANS("GRPO"), _sPONum, ddSupplierList.SelectedValue.ToString(), Convert.ToDateTime(txtRequestDate.Text), txtRemarks.Text, "-----");
                    ////Saving Rows Transaction of Supplier
                    foreach (GridViewRow row in gvPOItems.Rows)
                    {
                        string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("ST");
                        //Session["G_SNUM"] = SeriesNum;

                        int iPoItemID = int.Parse(row.Cells[0].Text);
                        string sItemCode = row.Cells[1].Text;
                        double dSupplierQty = double.Parse(row.Cells[3].Text);
                        string sSupplierUOM = row.Cells[4].Text;
                        double dSupplierPrice = double.Parse(row.Cells[5].Text);

                        TextBox txtReceivedQty = (TextBox)row.Cells[6].FindControl("txtReceivedItem");

                        double dReceivedQty = double.Parse(txtReceivedQty.Text);
                        double dInvQty = double.Parse(row.Cells[7].Text);

                        //Multiply Receiving Item against Inventory Conversion Qty
                        double dTotalInvQty = dReceivedQty * dInvQty;

                        string sInvUOM = row.Cells[8].Text;
                        double dInvPrice = double.Parse(row.Cells[9].Text);

                        //Remaining Qty to Update on PO Document
                        double dRemainingQty = dSupplierQty - dReceivedQty;

                        string sRowStatus = "";

                        if (dRemainingQty == 0)
                        {
                            sRowStatus = "C";
                        }
                        else
                        {
                            sRowStatus = "O";
                        }


                        if (string.IsNullOrEmpty(txtReceivedQty.Text) || double.Parse(txtReceivedQty.Text) == 0)
                        {
                            //Don't save 
                        }
                        else
                        {
                            //       oSupplier.INSERT_SUPPLIER_ORDER_TRANS_ROWS(_sPONum, ddSupplierList.SelectedValue.ToString(), SeriesNum, sItemCode, dTotalInvQty, dInvPrice, sInvUOM, double.Parse(txtReceivedQty.Text), dSupplierPrice, sSupplierUOM, Convert.ToDateTime(txtDeliveryDate.Text), dRemainingQty, sRowStatus, iPoItemID, Session["G_USERCODE"].ToString());

                        }



                    }

                    //Update Series Number
                    oSystem.UPDATE_SERIES_NUMBER("GRPO");

                    ////UPDATE PO Header if ALL item is closed

                    VALIDATE_UPDATE_PO_STATUS();


                    //resetFields();

                    ////Direct to the print
                    //PRINT_NOW("SITransaction_Report.aspx");

                    lblMessageSuccess.Text = "Transaction successfully recorded.";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);




                }





                //else
                //{
                //    ////Prompt a message.
                //  //  lblErrorPrompt.Text = "No item to save.";
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

                //}


            }
        }







        private void displaySupplierList()
        {

            //oSupplier.GET_SUPPLIER_LIST_DD(ddSupplierList);
            DataTable dt = oSupplier.GET_SUPPLIERS_DATA();

            ddSupplierList.DataSource = dt;
            ddSupplierList.DataTextField = dt.Columns["SupplierName"].ToString();
            ddSupplierList.DataValueField = dt.Columns["SupplierCode"].ToString();
            ddSupplierList.DataBind();

            ddSupplierList.Items.Insert(0, new ListItem("-- SELECT SUPPLIER --"));
        }








        //Check if item exist on gridview



        private double computeRunningTotal()
        {
            double dRunningTotal = 0;

            foreach (GridViewRow gvr in gvPOItems.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    dRunningTotal = dRunningTotal + Convert.ToDouble(gvr.Cells[6].Text);

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
            }

        }


        //RESET ALL Fields
        private void resetFields()
        {
            txtDateTrans.Text = "";
            txtDeliveryDate.Text = "";
            txtRemarks.Text = "";


            ddSupplierList.SelectedIndex = 0;




            lblRunningTotal.Text = "";
            lblSupplierAddress.Text = "";
            lblSupplierContact.Text = "";
            lblSupplierNumbers.Text = "";


            //Clearing Gridview
            gvPOItems.DataSource = null;
            gvPOItems.DataBind();


        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            //oGlobal.G_SSNUM = txtPrintTransaction.Text;
            PRINT_NOW("SITransaction_Report.aspx");

        }

        protected void lnkBrowsePO_Click(object sender, EventArgs e)
        {
           DataTable dt = oTransaction.GET_LIST_OPEN_SUPPLIER_PO(ddSupplierList.SelectedValue.ToString());

            gvPOList.DataSource = dt;
            gvPOList.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#modalPO').modal('show');</script>", false);
        }

        protected void gvSELECT_Click(object sender, EventArgs e)
        {

            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;

            _sPONum = r.Cells[1].Text;

            lblPONum.Text = _sPONum;

            //Display Records of selected PO

            DISPLAY_SELECTED_PO_ITEMS(_sPONum);



            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#modalPO').modal('hide');</script>", false);

        }

        private void DISPLAY_SELECTED_PO_ITEMS(string _ponum)
        {
            DataTable dt = oTransaction.GET_SELECTED_SUPPLIER_PO_ITEM(_ponum);

            gvPOItems.DataSource = dt;
            gvPOItems.DataBind();




        }


        protected void gvPOItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Verify if the item on PO already have receiving record.
            //If not then copy what quantity by default

            //This will execute when PO doesn't have yet receiving transaction record.
            DataTable dt = oTransaction.GET_SELECTED_SUPPLIER_PO_ITEM(_sPONum);

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtReceivingQty = (TextBox)e.Row.Cells[5].FindControl("txtReceivedItem");

                string txtBaseQty = e.Row.Cells[3].Text;

                if (txtBaseQty == "0")
                {
                    e.Row.Enabled = false;
                    e.Row.BackColor = System.Drawing.Color.DimGray;
                    e.Row.Visible = false;
                }
            }


        }

        private void OVER_QUANTITY_CHECK_POINT()
        {
            //reset over quantity
            _overQty = false;

            foreach (GridViewRow row in gvPOItems.Rows)
            {

                if (row.RowType == DataControlRowType.DataRow)
                {

                    string txtBaseQty = row.Cells[3].Text;
                    TextBox txtReceivedQty = (TextBox)row.Cells[5].FindControl("txtReceivedItem");

                    if (string.IsNullOrEmpty(txtBaseQty))
                    { txtBaseQty = "0"; }

                    if (string.IsNullOrEmpty(txtReceivedQty.Text))
                    { txtReceivedQty.Text = "0"; }

                    //Compare
                    if (double.Parse(txtReceivedQty.Text) > double.Parse(txtBaseQty))
                    {
                        _overQty = true;
                    }

                }
            }




        }

        //03112017
        private void EMPTY_ZERO_ALL_ITEM_CHECK_POINT()
        {
            //reset empty quantity input
            _emptyAllItem = false;

            foreach (GridViewRow row in gvPOItems.Rows)
            {

                if (row.RowType == DataControlRowType.DataRow)
                {

                    TextBox txtReceivedQty = (TextBox)row.Cells[5].FindControl("txtReceivedItem");

                    //Check
                    if (double.Parse(txtReceivedQty.Text) == 0 || string.IsNullOrEmpty(txtReceivedQty.Text))
                    {
                        _emptyAllItem = true;
                    }

                }
            }

        }

        //Check if all Item is close
        private void VALIDATE_UPDATE_PO_STATUS()
        {

            DataTable dt = oTransaction.GET_SELECTED_SUPPLIER_PO_ITEM(_sPONum);
            DataView dv = dt.DefaultView;

            dv.RowFilter = "RowStatus= '" + "O" + "'";

            //Check if all Item in PO have open status
            if (dv.Count > 0)
            {

            }
            else
            {
                ////Update PO to Closed
                //oPO.UPDATE_PURCHASE_ORDER_TRANS_HDR_STATUS(_sPONum, "C");
                oTransaction.UPDATE_SUPPLIER_PURCHASE_ORDER_TRANS_HDR_STATUS(_sPONum, "C");
            }


        }



    }

}