using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class DeliveryScheduleListing : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();
        Partner_C oPartner = new Partner_C();
        Item_C oItem = new Item_C();
        System_C oSystem = new System_C();

        Transaction_C oTransaction = new Transaction_C();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayTodaySchedule();
                DisplayDropDownList();
                lblScheduleText.Text = oSystem.GET_SERVER_DATE_TIME().ToLongDateString();
                txtSchedule.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();
            }
        }

        private void ClearInputs()
        {
            ddDRNum.SelectedIndex = 0;
         
            txtRemarks.Text = "";

            ddDRNum.Enabled = true;
         
        }

        protected void lnkCreateItem_Click(object sender, EventArgs e)
        {
            ViewState["ACTION"] = "ADD";

            //Text of Save Button
            btnCreateUpdate.Text = "SAVE";

            ClearInputs();

            lblActionTitle.Text = "Add Schedule";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
        }

        private void DisplayTodaySchedule()
        {
            DataTable dt = oTransaction.GET_DELIVERY_SCHEDULE();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "dtDeliveryDate ='" + oSystem.GET_SERVER_DATE_TIME().Date + "'";

            gvScheduleList.DataSource = dv;
            gvScheduleList.DataBind();
        }

     
        protected void btnCreateUpdate_Click(object sender, EventArgs e)
        {
            if (ddDRNum.SelectedIndex != 0 && !string.IsNullOrEmpty(txtAddSchedule.Text))
            {

                    oTransaction.UPDATE_DELIVERY_SCHEDULE_ADD(ddDRNum.SelectedValue.ToString(),txtRemarks.Text, Convert.ToDateTime(txtAddSchedule.Text));
               
                    DisplayTodaySchedule();
                    //Refresh the current web page  
                    Response.Redirect(Request.RawUrl);

            }
        }

      

        protected void lnkCancelItem_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            string sDRNum = r.Cells[2].Text;


            oTransaction.UPDATE_DELIVERY_SCHEDULE_CANCEL(sDRNum, "This delivery was postpone.");

            DisplayTodaySchedule();

        }

        protected void lnkPrintDR_Click(object sender, EventArgs e)
        {
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
           
            string sDRNum = r.Cells[2].Text;
            Session["G_DRNUM"] = sDRNum;
           
            PRINT_NOW("repDeliveryReceipt.aspx");
        }

        private void DisplayDropDownList()
        {
            DataTable dt = oTransaction.GET_DELIVERY_SCHEDULE();

            DataView dv = dt.DefaultView;

            dv.RowFilter = "(IsSched = 0 or IsPostpone = 0) and DeliveryDate IS NULL";

            
            ddDRNum.DataSource = dv;
            ddDRNum.DataTextField = dv.Table.Columns["DRBranch"].ToString();
            ddDRNum.DataValueField = dv.Table.Columns["DRNum"].ToString();
            ddDRNum.DataBind();

            ddDRNum.Items.Insert(0, new ListItem("SELECT DELIVERY RECEIPT NUMBER"));

          


         
          
        }

        protected void lnkUpcomingSched_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSchedule.Text)) { 
            //Display Available DR for the selected date

                
                DateTime dtSelectedDate = Convert.ToDateTime(txtSchedule.Text);


                if (dtSelectedDate.Date >= oSystem.GET_SERVER_DATE_TIME().Date)
                {
                    DataTable dt = oTransaction.GET_DELIVERY_SCHEDULE();
                    DataView dv = dt.DefaultView;
                    DataView dv2 = dt.DefaultView;
                    DataView dvSet = dt.DefaultView;

                    switch (dtSelectedDate.DayOfWeek)
                    {
                        case DayOfWeek.Monday:
                            dv.RowFilter = "M = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                        case DayOfWeek.Tuesday:
                            dv.RowFilter = "T = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                        case DayOfWeek.Wednesday:
                            dv.RowFilter = "W = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                        case DayOfWeek.Thursday:
                            dv.RowFilter = "Th = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                        case DayOfWeek.Friday:
                            dv.RowFilter = "F = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                        case DayOfWeek.Saturday:
                            dv.RowFilter = "Sa = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                        case DayOfWeek.Sunday:
                            dv.RowFilter = "S = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                            break;

                    }

                    // dv.RowFilter = "dtDeliveryDate = '" + dtoday.Date + "'";
                    if (dv.Count > 0)
                    {
                        gvScheduleList.DataSource = dv;
                        gvScheduleList.DataBind();
                    }
                    else {
                        gvScheduleList.DataSource = null;
                        gvScheduleList.DataBind();
                    }

                    //Display Added Delivery
                    dv2.RowFilter = "IsAdd = 1 and DeliveryDate = '" + dtSelectedDate.Date + "'";
                    if (dv2.Count > 0)
                    {
                        gvAddedSchedule.DataSource = dv2;
                        gvAddedSchedule.DataBind();
                    }
                    else
                    {

                        gvAddedSchedule.DataSource = null;
                        gvAddedSchedule.DataBind();
                    }

                    //Display Set Delivery
                    dvSet.RowFilter = "IsSet = 1 and DeliveryDate = '" + dtSelectedDate.Date + "'";

                    if (dvSet.Count > 0)
                    {
                        gvSetSchedule.DataSource = dvSet;
                        gvSetSchedule.DataBind();
                    }
                    else
                    {
                        gvSetSchedule.DataSource = null;
                        gvSetSchedule.DataBind();
                    }

                    lblScheduleText.Text = Convert.ToDateTime(txtSchedule.Text).ToLongDateString();
                }
                else
                { 
                //Prompt message here.
                    gvScheduleList.DataSource = null;
                    gvScheduleList.DataBind();

                    gvAddedSchedule.DataSource = null;
                    gvAddedSchedule.DataBind();

                    gvSetSchedule.DataSource = null;
                    gvSetSchedule.DataBind();
                }
                
            }
        }

        protected void lnkCreateScheduleList_Click(object sender, EventArgs e)
        {
            if (gvScheduleList.Rows.Count > 0) 
            { 
            //Update all record in listed.

             foreach (GridViewRow row in gvScheduleList.Rows)
             {
                    if (row.RowType == DataControlRowType.DataRow)
                    {

                        string sDRNum = row.Cells[2].Text;

                        oTransaction.UPDATE_DELIVERY_SCHEDULE(sDRNum, Convert.ToDateTime(txtSchedule.Text));

                    }
             }

          
            }

          


            //Display Print Out.
            Session["G_DELIVERYDATE"] = txtSchedule.Text;
            PRINT_NOW("repDeliveryScheduleList.aspx");
            
        }

        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }


        
    }
}