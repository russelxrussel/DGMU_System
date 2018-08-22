using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class PartnerPO : System.Web.UI.Page
    {
        Supplier_C oSupplier = new Supplier_C();
        Partner_C oPartner = new Partner_C();
        Branch_C oBranch = new Branch_C();
        Item_C oItem = new Item_C();
        
        System_C oSystem = new System_C();
        Transaction_C oTransaction = new Transaction_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayPartnerList();

                displayItemList();



                //Create Temporary Table for Ordered item from Supplier
                createTempItemPO();

             

            }

        }



        protected void ddItemList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtItemList = oTransaction.GET_PARTNER_PRICE_AMOUNT();

            DataRow[] dr;
            dr = dtItemList.Select("PartnerCode = '" + ddPartnerList.SelectedValue.ToString() + "' and ItemCode = '" + ddItemList.SelectedValue.ToString() + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                    
                    //lblUOM.Text = row["UomCode"].ToString();
                    lblPartnerUOM.Text = row["SellingUOMCode"].ToString();
                    lblConversion.Text = row["ConversionQty"].ToString();
                    lblPrice.Text = string.Format("{0:N}", row["PriceAmount"].ToString()); 
                   
                
                }
            }
        }

        protected void U_Save_S_Click(object sender, EventArgs e)
        {
            if (gvPartnerItems.Rows.Count > 0)
            {

       
                //Saving Data on Supplier Transaction HDR

               oTransaction.INSERT_PARTNER_PURCHASE_ORDER_TRANS_HDR(oSystem.GENERATE_SERIES_NUMBER_TRANS("PO"), ddPartnerList.SelectedValue.ToString(), Convert.ToDateTime(txtRequestDate.Text), txtRemarks.Text, "-----");


                if (gvPartnerItems.Rows.Count > 0)
                {

                    ////Saving Rows Transaction of Supplier
                    foreach (GridViewRow row in gvPartnerItems.Rows)
                    {
                        string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("PO");
                        Session["G_PONUM"] = SeriesNum;

                        string sBranchCode = row.Cells[1].Text;
                        string sItemCode = row.Cells[2].Text;
                        double dInvQty = double.Parse(row.Cells[6].Text);
                       // string sInvUOM = row.Cells[7].Text;
                        double dPartnerQty = double.Parse(row.Cells[4].Text);
                        string sPartnerUOM = row.Cells[5].Text;
                        double dPrice = double.Parse(row.Cells[7].Text);
                        double dTotalPrice = double.Parse(row.Cells[8].Text);

                       // double dInvPrice = double.Parse(row.Cells[9].Text);


                        oTransaction.INSERT_PARTNER_PURCHASE_ORDER_TRANS_ROWS(SeriesNum, sBranchCode, sItemCode, dInvQty, dPartnerQty, sPartnerUOM,dPrice, dTotalPrice, dPartnerQty, "----");
                        
                    }



                    //Update Series Number
                    oSystem.UPDATE_SERIES_NUMBER("PO");


                    //Direct to the print
                    PRINT_NOW("repPO.aspx");

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


            if (ddItemList.SelectedIndex == 0 || string.IsNullOrEmpty(txtRequestDate.Text) || ddPartnerList.SelectedIndex == 0 || string.IsNullOrEmpty(txtQuantity.Text) || string.IsNullOrEmpty(lblConversion.Text))
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
                if (ExistItem(ddBranchList.SelectedValue.ToString(),ddItemList.SelectedValue.ToString()))
                {

                    //Prompt a message.
                   // lblErrorPrompt.Text = "Item already exist on current request list.";
                   // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                    ErrorOccured("Item already exist on current request list.");
                }
                else
                {

                    double itemPrice = Convert.ToDouble(lblPrice.Text);
                    //Instantiate table 
                    DataTable dt = (DataTable)Session["tempSupplierOrder"];

                    //Add New Row
                    DataRow newRow = dt.NewRow();

                    newRow["B_CODE"] = ddBranchList.SelectedValue.ToString();
                    newRow["CODE"] = ddItemList.SelectedValue.ToString();
                    newRow["DESC"] = ddItemList.SelectedItem.Text;
                    newRow["QTY"] = double.Parse(txtQuantity.Text);
                    newRow["UOM"] =  lblPartnerUOM.Text;
                    double dConversionQty = double.Parse(lblConversion.Text) * double.Parse(txtQuantity.Text);
                    newRow["I_QTY"] = dConversionQty;
                    newRow["PRICE"] = itemPrice;
                    double dSubTotal = dConversionQty * itemPrice;
                    newRow["TOTAL"] = string.Format("{0:N}", dSubTotal);
              

                    dt.Rows.Add(newRow);

                    Session["tempSupplierOrder"] = dt;

                    gvPartnerItems.DataSource = Session["tempSupplierOrder"];
                    gvPartnerItems.DataBind();

                    ddItemList.SelectedIndex = 0;


                    lblRunningTotal.Text = string.Format("Total Cost: {0:N}", computeRunningTotal());

                    //Clear Text
                   
                    lblPrice.Text = "";
                    txtQuantity.Text = "";


                }
            }
        }

        private void createTempItemPO()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("B_CODE", System.Type.GetType("System.String"));
            dt.Columns.Add("CODE", System.Type.GetType("System.String"));
            dt.Columns.Add("DESC", System.Type.GetType("System.String"));
            dt.Columns.Add("QTY", System.Type.GetType("System.Double"));
            dt.Columns.Add("UOM", System.Type.GetType("System.String"));
            dt.Columns.Add("I_QTY", System.Type.GetType("System.Double"));
            dt.Columns.Add("PRICE", System.Type.GetType("System.Double"));
            dt.Columns.Add("TOTAL", System.Type.GetType("System.Double"));
          
       
            Session["tempSupplierOrder"] = dt;

        }

        private void displayPartnerList()
        {

            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartnerList.DataSource = dt;
            ddPartnerList.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartnerList.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartnerList.DataBind();

            ddPartnerList.Items.Insert(0, new ListItem("-- SELECT PARTNER --"));
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

        private void displayBranchList(string _partnerCode)
        {
            DataTable dt = oBranch.GET_BRANCHES_DATA();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode = '" + _partnerCode + "'";

            if(dv.Count > 0)
            {
                ddBranchList.DataSource = dv;
                ddBranchList.DataTextField = dv.Table.Columns["BranchName"].ToString();
                ddBranchList.DataValueField = dv.Table.Columns["BranchCode"].ToString();
                ddBranchList.DataBind();
            }
            else
            { ddBranchList.Items.Clear(); }
        }


        //Check if item exist on gridview

        private bool ExistItem(string _branchCode, string _itemCode)
        {
            bool bExist = false;

            foreach (GridViewRow gvr in gvPartnerItems.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {

                    string sBCode = gvr.Cells[1].Text;
                    string sCode = gvr.Cells[2].Text;
                    if (sCode == ddItemList.SelectedValue.ToString() && sBCode == ddBranchList.SelectedValue.ToString())
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

            foreach (GridViewRow gvr in gvPartnerItems.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    dRunningTotal = dRunningTotal + Convert.ToDouble(gvr.Cells[8].Text);

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
            string selBCode = r.Cells[1].Text;
            string selCode = r.Cells[2].Text;


            DataTable dt = (DataTable)Session["tempSupplierOrder"];

            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                DataRow drow = dt.Rows[i];
                if (drow["B_CODE"].ToString() == selBCode && drow["CODE"].ToString() == selCode)
                    drow.Delete();
            }

            dt.AcceptChanges();

            Session["tempSupplierOrder"] = dt;


            gvPartnerItems.DataSource = dt;
            gvPartnerItems.DataBind();

            lblRunningTotal.Text = string.Format("Total Cost: {0:N}", computeRunningTotal());
        }

        protected void ddPartnerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtPartnerList = oPartner.GET_PARTNERS_DATA();

            DataRow[] dr;
            dr = dtPartnerList.Select("PartnerCode = '" + ddPartnerList.SelectedValue.ToString() + "'");

            if (dr.Length > 0)
            {
                //Will display the selected supplier info
                foreach (DataRow row in dr)
                {
                    
                    lblContactPerson.Text = row["P_ContactPerson"].ToString();
                    lblPartnerNumbers.Text = row["P_ContactNumber"].ToString();
                    lblAddress.Text = row["P_Address"].ToString();

                
                }

                displayBranchList(ddPartnerList.SelectedValue.ToString());
            }

        }


        //RESET ALL Fields
        private void resetFields()
        {

            txtRequestDate.Text = "";
            txtRemarks.Text = "";
            txtQuantity.Text = "";

            ddPartnerList.SelectedIndex = 0;
            ddItemList.SelectedIndex = 0;
            ddBranchList.Items.Clear();



            lblPrice.Text = "";
           
            lblRunningTotal.Text = "";
            lblAddress.Text = "";
            lblContactPerson.Text = "";
            lblPartnerUOM.Text = "";
            lblPartnerNumbers.Text = "";
            //Clearing Gridview

            gvPartnerItems.DataSource = null;
            gvPartnerItems.DataBind();

            ////Will Clear local data table
            DataTable dt = (DataTable)Session["tempSupplierOrder"];
            dt.Clear();
        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            Session["G_PONUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repPO.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }
    }
}