using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Direct_Receiving : System.Web.UI.Page
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
               
                displaySupplierList();
                displayItemList();

            }

        }




        protected void U_Save_S_Click(object sender, EventArgs e)
        {
            if (ddSupplierList.SelectedIndex != 0)
            {

                if (!string.IsNullOrEmpty(txtReceiveDate.Text))
                {
                    string irNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("IR");

                    foreach (GridViewRow row in gvItemList.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            string itemCode = row.Cells[0].Text;

                            TextBox txtQuantity = (TextBox)row.Cells[2].FindControl("txtQuantity");
                            int quantity;
                            if (string.IsNullOrEmpty(txtQuantity.Text))
                            { quantity = 0; }
                            else
                            { 
                            quantity = Convert.ToInt32(txtQuantity.Text);
                            }



                            if (quantity != 0)
                            {
                                //  oTransaction.INSERT_STOCK_BRANCH_RETURN(srNum, ddBranchList.SelectedValue.ToString(), itemCode, quantity, chkCreditToPartner.Checked, Convert.ToDateTime(txtReturnDate.Text), txtRemarks.Text);
                                oTransaction.INSERT_RECEIVED_ITEM(irNum, ddSupplierList.SelectedValue.ToString(), itemCode, quantity, Convert.ToDateTime(txtReceiveDate.Text), txtRemarks.Text, Session["USER_CODE"].ToString());
                            }

                        }
                    }

                    Session["G_IRNUM"] = irNum;

                    resetFields();

                    lblMessageSuccess.Text = "Received Item successfully added to Inventory.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                    
                    //Direct to the print
                    PRINT_NOW("repDirectReceive.aspx");

                }
                else
                {
                    //Prompt Message
                    lblErrorMessage.Text = "Please enter receive date.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                }

            }

            else
            {
                //Prompt Message
                lblErrorMessage.Text = "Please review your inputs";
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

            ddSupplierList.Items.Insert(0, new ListItem("-- Select Supplier --"));
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
            txtReceiveDate.Text = "";
            txtRemarks.Text = "";
            ddSupplierList.SelectedIndex = 0;

            foreach (GridViewRow row in gvItemList.Rows)
            {
                TextBox txtQuantity = (TextBox)row.Cells[2].FindControl("txtQuantity");

                txtQuantity.Text = "0";
            }


        }

        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            Session["G_IRNUM"] = txtPrintTransaction.Text;
            PRINT_NOW("repDirectReceive.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

       

       
    }
}