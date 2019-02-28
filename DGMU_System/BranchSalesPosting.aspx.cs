using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class BranchSalesPosting : System.Web.UI.Page
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

                Display_For_Posting();

                //Display_Item_List();
                //Display_Partner_List();

               

              
            }
           
        }



       
        private void Display_Item_List()
        {
            DataTable dt = oItem.GET_BRANCH_ITEM_DATA();

            //ddItemList.DataSource = dt;
            //ddItemList.DataValueField = dt.Columns["Branch_ItemCode"].ToString();
            //ddItemList.DataTextField = dt.Columns["Branch_ItemName"].ToString();
            //ddItemList.DataBind();
        }

        private void Display_For_Posting()
        {
            DataTable dt = oTransaction.GET_BRANCH_SALES_FOR_POSTING();

            gvBranchSalesForPosting.DataSource = dt;
            gvBranchSalesForPosting.DataBind();
        }

        private void Display_Partner_List()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            DataView dv = dt.DefaultView;
            dv.Sort = "PartnerId";

            //ddPartnerList.DataSource = dv;
            //ddPartnerList.DataValueField = dv.Table.Columns["PartnerCode"].ToString();
            //ddPartnerList.DataTextField = dv.Table.Columns["PartnerName"].ToString();
            //ddPartnerList.DataBind();
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

        public void Display_Sales_Item_Not_Posted(string _salesNum)
        {
            DataTable dt = oTransaction.GET_BRANCH_SALES_NOT_YET_POSTED(_salesNum);

            gvSalesItemList.DataSource = dt;
            gvSalesItemList.DataBind();
        }

        protected void gvBranchSalesForPosting_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow);


            ViewState["SALESNUM"] = row.Cells[0].Text;
            ViewState["BRANCHNAME"] = row.Cells[1].Text;

            if (e.CommandName == "Post")
            {

                oTransaction.POST_BRANCH_SALES(ViewState["SALESNUM"].ToString());

                Display_For_Posting();

                lblMessageSuccess.Text = "Sales Number: " + ViewState["SALESNUM"].ToString() + " successfully posted.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);
            
            }
            
            else if (e.CommandName == "View")
            {

               
                Display_Sales_Item_Not_Posted(ViewState["SALESNUM"].ToString());

                lblActionTitle.Text = ViewState["SALESNUM"].ToString() + "-" + ViewState["BRANCHNAME"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
            }

            else if (e.CommandName == "Cancel")
            {
                oTransaction.CANCEL_BRANCH_SALES(ViewState["SALESNUM"].ToString());
                //Display_Sales_Item_Not_Posted(ViewState["SALESNUM"].ToString());

                //lblMessageSuccess.Text = "Sales Number: " + ViewState["SALESNUM"].ToString() + " successfully CANCEL.";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);
                Response.Redirect(Request.RawUrl);

            }





        }

        protected void lnkPostAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvBranchSalesForPosting.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string salesNum = row.Cells[0].Text;

                    oTransaction.POST_BRANCH_SALES(row.Cells[0].Text);

                    Display_For_Posting();

                    lblMessageSuccess.Text = "All sales successfully posted.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                }
            }
        }
    }

      
    }
      
