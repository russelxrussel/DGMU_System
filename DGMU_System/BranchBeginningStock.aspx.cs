using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class BranchBeginningStock : System.Web.UI.Page
    {

        System_C oSystem = new System_C();
        Transaction_C oTransaction = new Transaction_C();
        Branch_C oBranch = new Branch_C();
        Item_C oItem = new Item_C();
        Partner_C oPartner = new Partner_C();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display_Item_List();
                Display_Partner_List();

                Display_Branch_Stock(ddItemList.SelectedValue, ddPartnerList.SelectedValue);
            }
           
        }



       
        private void Display_Item_List()
        {
            DataTable dt = oItem.GET_BRANCH_ITEM_DATA();

            ddItemList.DataSource = dt;
            ddItemList.DataValueField = dt.Columns["Branch_ItemCode"].ToString();
            ddItemList.DataTextField = dt.Columns["Branch_ItemName"].ToString();
            ddItemList.DataBind();
        }

        private void Display_Partner_List()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            DataView dv = dt.DefaultView;
            dv.Sort = "PartnerId";

            ddPartnerList.DataSource = dv;
            ddPartnerList.DataValueField = dv.Table.Columns["PartnerCode"].ToString();
            ddPartnerList.DataTextField = dv.Table.Columns["PartnerName"].ToString();
            ddPartnerList.DataBind();
        }

        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void lnkPrintTransaction_Click(object sender, EventArgs e)
        {
            //Session["S_PTNNUM"] = txtPrintTransaction.Text;
            //PRINT_NOW("repPickUp.aspx");

        }

        private void ErrorOccured(string _errorMessage)
        {
            lblErrorMessage.Text = _errorMessage;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

        }

        protected void gvBranchStockList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //double opening = 0, inStock = 0, outStock = 0, stockOnHand = 0;

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    //DateTime dateMonth = Convert.ToDateTime(txtSelectDate.Text);
            //    //string branchCode = 

            //    DataRowView dr = (DataRowView)e.Row.DataItem;
            //    //string storageCode = dr["storageCode"].ToString();
            //    string branchCode = dr["branchCode"].ToString();
            //    string itemCode = ddItemList.SelectedValue;

            //    Label lblOpening = (e.Row.FindControl("lblOpening") as Label);
            //    Label lblDelivered = (e.Row.FindControl("lblDelivered") as Label);
            //    Label lblSalesReturn = (e.Row.FindControl("lblSalesReturn") as Label);
            //    Label lblStockOnHand = (e.Row.FindControl("lblStockOnHand") as Label);

            //    DateTime dtimeSelected = Convert.ToDateTime(txtSelectedDate.Text);

            //    opening = oTransaction.GET_BRANCH_STOCK_OPENING(dtimeSelected, branchCode, itemCode);
            //    inStock = oTransaction.GET_BRANCH_STOCK_IN(dtimeSelected, branchCode, itemCode);
            //    outStock = oTransaction.GET_BRANCH_STOCK_OUT(dtimeSelected, branchCode, itemCode);

            //    stockOnHand = (opening + inStock) - outStock;

            //    lblOpening.Text = string.Format("{0:n0}", opening);
            //    lblDelivered.Text = string.Format("{0:n0}", inStock);
            //    lblSalesReturn.Text = string.Format("{0:n0}", outStock);

            //    lblStockOnHand.Text = string.Format("{0:n0}", stockOnHand);

            //}
        }

        private void Display_Branch_Stock(string _itemCode, string _partnerCode)
        {
            lblPartnersBranch.Text = " <strong>" + ddPartnerList.SelectedItem + " - " + ddItemList.SelectedItem + " </strong> Beginning Stock.";

            DataTable dt = oTransaction.GET_BRANCH_INVENTORY_DETAILS(_itemCode);
            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode ='" + _partnerCode + "'";
            dv.Sort = "BranchName";


            gvBranchStockList.DataSource = dv;
            gvBranchStockList.DataBind();
        }

        protected void lnkViewStock_Click(object sender, EventArgs e)
        {
            Display_Branch_Stock(ddItemList.SelectedValue, ddPartnerList.SelectedValue);
        }

        protected void lnkUpdateBeginning_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvBranchStockList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string branchCode = row.Cells[0].Text;

                    TextBox txtQuantity = (row.FindControl("txtBeginningStock") as TextBox);

                    double begStock = 0;

                    if (txtQuantity.Text == "") {
                        begStock = 0;
                    }
                    else
                    {
                        begStock = Convert.ToDouble(txtQuantity.Text);
                    }


                   if(begStock > 0)
                    { 
                        oTransaction.UPDATE_BEGINNING_STOCK(ddItemList.SelectedValue, branchCode, begStock);
                    }

                    lnkViewStock_Click(sender, e);

                    lblMessageSuccess.Text = "Branches beginning successfully updated.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                }
            }
        }
    }
}