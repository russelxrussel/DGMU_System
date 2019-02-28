using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class BranchInventory : System.Web.UI.Page
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
                txtSelectedDate.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();

               
                
                Display_Item_List();
                Display_Partner_List();

                
            }

            Display_Branch_Stock(ddItemList.SelectedValue);

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

            ddPartnerList.Items.Insert(0, new ListItem("-- Select Partner --"));
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
            double opening = 0, inStock = 0, outStock = 0, adjIn, adjOut, stockOnHand = 0;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //DateTime dateMonth = Convert.ToDateTime(txtSelectDate.Text);
                //string branchCode = 

                DataRowView dr = (DataRowView)e.Row.DataItem;
                //string storageCode = dr["storageCode"].ToString();
                string branchCode = dr["branchCode"].ToString();
                string itemCode = ddItemList.SelectedValue;

                Label lblOpening = (e.Row.FindControl("lblOpening") as Label);
                Label lblDelivered = (e.Row.FindControl("lblDelivered") as Label);
                Label lblSalesReturn = (e.Row.FindControl("lblSalesReturn") as Label);

                Label lblAdjIN = (e.Row.FindControl("lblAdjIn") as Label);
                Label lblAdjOut = (e.Row.FindControl("lblAdjOut") as Label);

                Label lblStockOnHand = (e.Row.FindControl("lblStockOnHand") as Label);

                DateTime dtimeSelected = Convert.ToDateTime(txtSelectedDate.Text);

                opening = oTransaction.GET_BRANCH_STOCK_OPENING(dtimeSelected, branchCode, itemCode);
                inStock = oTransaction.GET_BRANCH_STOCK_IN(dtimeSelected, branchCode, itemCode);
                outStock = oTransaction.GET_BRANCH_STOCK_OUT(dtimeSelected, branchCode, itemCode);
                adjIn = oTransaction.GET_BRANCH_ADJ_IN(dtimeSelected, branchCode, itemCode);
                adjOut = oTransaction.GET_BRANCH_ADJ_OUT(dtimeSelected, branchCode, itemCode);

                stockOnHand = (opening + inStock + adjIn) - (outStock + adjOut);

                lblOpening.Text = string.Format("{0:n0}", opening);
                lblDelivered.Text = string.Format("{0:n0}", inStock);
                lblSalesReturn.Text = string.Format("{0:n0}", outStock);
                lblAdjIN.Text = string.Format("{0:n0}", adjIn);
                lblAdjOut.Text = string.Format("{0:n0}", adjOut);

                lblStockOnHand.Text = string.Format("{0:n0}", stockOnHand);

            }
        }

        private void Display_Branch_Stock_Partner(string _itemCode, string _partnerCode)
        {
            lblPartnersBranch.Text = " <strong>" + ddPartnerList.SelectedItem  + " - " + ddItemList.SelectedItem + " </strong> Item Stock Record as of " + txtSelectedDate.Text;

            DataTable dt = oTransaction.GET_BRANCH_INVENTORY_DETAILS(_itemCode);
            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode ='" + _partnerCode + "'";
            dv.Sort = "BranchName";


            gvBranchStockList.DataSource = dv;
            gvBranchStockList.DataBind();
        }

        private void Display_Branch_Stock(string _itemCode)
        {
            lblPartnersBranch.Text = " <strong>" + ddPartnerList.SelectedItem + " - " + ddItemList.SelectedItem + " </strong> Item Stock Record as of " + txtSelectedDate.Text;

            DataTable dt = oTransaction.GET_BRANCH_INVENTORY_DETAILS(_itemCode);
            DataView dv = dt.DefaultView;
            
            dv.Sort = "BranchName";


            gvBranchStockList.DataSource = dv;
            gvBranchStockList.DataBind();
        }

        protected void lnkViewStock_Click(object sender, EventArgs e)
        {
            if (ddPartnerList.SelectedIndex != 0)
            {
                Display_Branch_Stock_Partner(ddItemList.SelectedValue, ddPartnerList.SelectedValue);
            }
            else
            {
                Display_Branch_Stock(ddItemList.SelectedValue);
            }
        }
    }
}