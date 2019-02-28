using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class DeliveryReceipt_Final : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();
        Partner_C oPartner = new Partner_C();
        Item_C oItem = new Item_C();
        Branch_C oBranch = new Branch_C();
        System_C oSystem = new System_C();

        Transaction_C oTransaction = new Transaction_C();

        double _dFreshInput = 0;
        double _dFrozenInput = 0;
        double _dLiempoInput = 0;
        double _dLeegInput = 0, _dAtsara100Input = 0, _dAtsara160Input = 0;

        bool _2trip = false;

        string _assigned_AreaCOde = "";

        string _branchRemarks = "", _t1Remarks = "", _t2Remarks;
        //string _sDriverName = "", _sHelperName = "", _sVehicleNum = "";

        int _t1Driver1 = 0, _t1Driver2 = 0, _t1Helper1 = 0, _t1Helper2 = 0, _t1Vehicle = 0;
        int _t2Driver1 = 0, _t2Driver2 = 0, _t2Helper1 = 0, _t2Helper2 = 0, _t2Vehicle = 0;


        public string SeriesNum { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtSchedule.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();

                DisplayAreaList(oSystem.GET_SERVER_DATE_TIME());
               // DisplayAreaList_Scheduled(oSystem.GET_SERVER_DATE_TIME());

                DisplayAdded_Scheduled(oSystem.GET_SERVER_DATE_TIME());

                //DisplayTodaySchedule();
                DisplayDropDownList();
               
                txtSchedule.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();
            }
        }

        private void ClearInputs()
        {

            ddBranchList.SelectedIndex = 0;
         
            txtRemarks.Text = "";

            ddBranchList.Enabled = true;
         
        }

        protected void lnkCreateItem_Click(object sender, EventArgs e)
        {

            double dFreshInput = 0, dFrozenInput = 0, dLiempoInput = 0, dLeegInput = 0, dAtsara100Input = 0, dAtsara160Input = 0;


            if (!string.IsNullOrEmpty(txtAddFresh.Text))
            {
                dFreshInput = Convert.ToDouble(txtAddFresh.Text);
            }
            else
            {
                dFreshInput = 0;
            }

            //CHICKEN FROZEN
            if (!string.IsNullOrEmpty(txtAddFrozen.Text))
            {
                dFrozenInput = Convert.ToDouble(txtAddFrozen.Text);
            }
            else
            {
                dFrozenInput = 0;
            }

          

            if (!string.IsNullOrEmpty(txtAddLiempo.Text))
            {
                dLiempoInput = Convert.ToDouble(txtAddLiempo.Text);
            }
            else
            {
                dLiempoInput = 0;
            }

            if (!string.IsNullOrEmpty(txtAddLeeg.Text))
            {
                dLeegInput = Convert.ToDouble(txtAddLeeg.Text);
            }
            else
            {
                dLeegInput = 0;
            }


            if (!string.IsNullOrEmpty(txtAddAtsara100.Text))
            {
                dAtsara100Input = Convert.ToDouble(txtAddAtsara100.Text);
            }
            else
            {
                dAtsara100Input = 0;
            }


            if (!string.IsNullOrEmpty(txtAddAtsara160.Text))
            {
                dAtsara160Input = Convert.ToDouble(txtAddAtsara160.Text);
            }
            else
            {
                dAtsara160Input = 0;
            }

            
            //Condition
            if (ddBranchList.SelectedIndex != 0)
            {
                string partnerCode = getPartnerCode(ddBranchList.SelectedValue.ToString());

                if (!checkExistSched(ddBranchList.SelectedValue.ToString(), Convert.ToDateTime(txtSchedule.Text)))
                {
                    string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("DR");
                    //oTransaction.INSERT_DELIVERY_RECEIPT_TRANS_FINAL(SeriesNum, partnerCode, ddBranchList.SelectedValue.ToString(), "ITM001", "ITM002", "ITM003", "ITM004", "ITM005", "ITM006",
                    //dFreshInput, dFrozenInput, dLiempoInput, dLeegInput, dAtsara100Input, dAtsara160Input,
                    //false, true, Convert.ToDateTime(txtSchedule.Text), txtAddedRemarks.Text, Session["USER_CODE"].ToString(), txtAdded_DriverName.Text, txtAdded_HelperName.Text, txtAdded_VehiclePlate.Text);


                    //Reset fields
                    ddBranchList.SelectedIndex = 0;
                    lblAPriceAmount.Text = "";
                    lblALiempoPrice.Text = "";
                    lblALeegPrice.Text = "";
                    lblAAtsaraPrice.Text = "";

                    lblATotalAmount.Text = "";
                    txtAddedRemarks.Text = "";
                    
                    txtAddFresh.Text = "";
                    txtAddFrozen.Text = "";
                    txtAddLiempo.Text = "";
                    txtAddLeeg.Text = "";
                    txtAddAtsara100.Text = "";
                    txtAddAtsara160.Text = "";



                    
                    //Refresh gridview
                    DisplayAdded_Scheduled(Convert.ToDateTime(txtSchedule.Text));

                    lblSuccessMessage.Text = "New Schedule added.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                }
                else
                {
                    lblErrorMessage.Text = "Branch Schedule exist!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
                }
            }
            else
            { 
            //Review inputs
                lblErrorMessage.Text = "Please review your inputs";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            }
        }

        private DataView DisplayBranchSchedule(string _laCode, DateTime _dateSelect)
        {
            //DateTime dtSelectedDate = oSystem.GET_SERVER_DATE_TIME();
            DataTable dt = oTransaction.GET_DELIVERY_INPUT();

            DataView dv = dt.DefaultView;

            switch (_dateSelect.DayOfWeek)
            {
                case DayOfWeek.Monday:
                    //dv.RowFilter = "M = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
                    dv.RowFilter = "M = 1 and LACode ='" + _laCode + "'";
                    break;

                case DayOfWeek.Tuesday:
                    dv.RowFilter = "T = 1 and LACode ='" + _laCode + "'";
                    break;

                case DayOfWeek.Wednesday:
                    dv.RowFilter = "W = 1 and LACode ='" + _laCode + "'";
                    break;

                case DayOfWeek.Thursday:
                    dv.RowFilter = "Th = 1 and LACode ='" + _laCode + "'";
                    break;

                case DayOfWeek.Friday:
                    dv.RowFilter = "F = 1 and LACode ='" + _laCode + "'";
                    break;

                case DayOfWeek.Saturday:
                    dv.RowFilter = "Sa = 1 and LACode ='" + _laCode + "'";
                    break;

                case DayOfWeek.Sunday:
                    dv.RowFilter = "S = 1 and LACode ='" + _laCode + "'";
                    break;

            }
            return dv;
        }

        private DataView DisplayScheduleDelivery(string _laCode, DateTime _selectedDate)
        {
            DataTable dt = oTransaction.GET_SCHEDULED_DELIVERY(_selectedDate);
            DataView dv = dt.DefaultView;

            dv.RowFilter = "LACode ='" + _laCode + "'";

            return dv;
        
        }

        private void DisplayAreaList(DateTime _selectedDate)
        {
            DataTable dt = oTransaction.GET_DELIVERY_INPUT();
            DataView dv = new DataView(dt);


            switch (_selectedDate.DayOfWeek)
            {
                case DayOfWeek.Monday:
                    dv.RowFilter = "M = 1";
                    break;

                case DayOfWeek.Tuesday:
                    dv.RowFilter = "T = 1";
                    break;

                case DayOfWeek.Wednesday:
                    dv.RowFilter = "W = 1";
                    break;

                case DayOfWeek.Thursday:
                    dv.RowFilter = "Th = 1";
                    break;

                case DayOfWeek.Friday:
                    dv.RowFilter = "F = 1";
                    break;

                case DayOfWeek.Saturday:
                    dv.RowFilter = "Sa = 1";
                    break;

                case DayOfWeek.Sunday:
                    dv.RowFilter = "S = 1";
                    break;

            }

            DataTable distinctValuesDT = dv.ToTable(true, "LACode", "LAName");
            dv = distinctValuesDT.DefaultView;
            dv.Sort = "LAName";
            
            ddAreaList.DataSource = dv;
            ddAreaList.DataTextField = dv.Table.Columns["LAName"].ToString();
            ddAreaList.DataValueField = dv.Table.Columns["LACode"].ToString();
            ddAreaList.DataBind();

            DataView dv2 = dv;
            dv2.RowFilter = "LACode ='" + ddAreaList.SelectedValue.ToString() + "'";

            gvScheduleList.DataSource = dv2;
            gvScheduleList.DataBind();
        }

        private bool checkExistSched(string _branchCode, DateTime _selectedDate)
        {
            bool x = false;

            DataTable dt = oTransaction.GET_SCHEDULED_DELIVERY(_selectedDate);
            DataRow[] drow = dt.Select("BranchCode='" + _branchCode + "' and orderDate ='" + _selectedDate + "' and Iscancel=0");

            if (drow.Length > 0)
            {
                x = true;

                foreach (DataRow row in drow)
                {
                    //Retrieve Item Inputs
                    _dFreshInput = Convert.ToDouble(row["FreshQty"]);
                    _dFrozenInput = Convert.ToDouble(row["FrozenQty"]);
                    _dLiempoInput = Convert.ToDouble(row["LiempoQty"]);
                    _dLeegInput = Convert.ToDouble(row["LeegQty"]);
                    _dAtsara100Input = Convert.ToDouble(row["Atsara100Qty"]);
                    _dAtsara160Input = Convert.ToDouble(row["Atsara160Qty"]);

                    _assigned_AreaCOde = row["Assigned_LACode"].ToString();

                    _branchRemarks = row["remarks"].ToString();
                    _2trip = (bool)row["Is2Trip"];
               
                }
            }
            else
            { x = false; }

            return x;
        }

        private bool checkDeliveryInfo(DateTime _selectedDate, string _laCode)
        {
            bool x = false;

            DataTable dt = oTransaction.GET_DELIVERY_INFO(_selectedDate, _laCode);
            DataRow[] drow = dt.Select("LACode='" + _laCode + "' and DeliveryOrder ='" + _selectedDate + "'");

            if (drow.Length > 0)
            {
                x = true;

                foreach (DataRow row in drow)
                {
                   
                    _t1Driver1 = Convert.ToInt32(row["T1Driver1"]);
                    _t1Driver2 = Convert.ToInt32(row["T1Driver2"]);
                    _t1Helper1 = Convert.ToInt32(row["T1Helper1"]);
                    _t1Helper2 = Convert.ToInt32(row["T1Helper2"]);
                    _t1Vehicle = Convert.ToInt32(row["T1Vehicle"]);


                    _t2Driver1 = Convert.ToInt32(row["T2Driver1"]);
                    _t2Driver2 = Convert.ToInt32(row["T2Driver2"]);
                    _t2Helper1 = Convert.ToInt32(row["T2Helper1"]);
                    _t2Helper2 = Convert.ToInt32(row["T2Helper2"]);
                    _t2Vehicle = Convert.ToInt32(row["T2Vehicle"]);

                    _t1Remarks = row["T1Remarks"].ToString();
                    _t2Remarks = row["T2Remarks"].ToString();
                  
                }
            }
            else
            { x = false;
            //_sDriverName = "";
            //_sHelperName = "";
            //_sVehicleNum = "";
            }

            return x;
        }

        private string getPartnerCode(string _branchCode)
        {
            string x = "";

            DataTable dt = oBranch.GET_BRANCHES_DATA();
            DataRow[] drow = dt.Select("BranchCode='" + _branchCode + "'");

            if (drow.Length > 0)
            {
                foreach (DataRow row in drow)
                {
                    return x = row["PartnerCode"].ToString();
                }
                
            }

            return x;

        }

      
        private void DisplayAreaList_Scheduled(DateTime _selectedDate)
        {
            DataTable dt = oTransaction.GET_SCHEDULED_DELIVERY(_selectedDate);
            DataView dv = new DataView(dt);

            DataTable distinctValuesDT = dv.ToTable(true, "LACode", "LAName");
      
            dv = distinctValuesDT.DefaultView;


      
        
        }

        private void DisplayAdded_Scheduled(DateTime _selectedDate)
        {
            DataTable dt = oTransaction.GET_SCHEDULED_DELIVERY(_selectedDate);
            DataView dv = new DataView(dt);


            dv = dt.DefaultView;
            dv.RowFilter = "IsAdded = 1";
            dv.Sort = "id desc";


            gvAddedScheduled.DataSource = dv;
            gvAddedScheduled.DataBind();
        }
     
        protected void btnCreateUpdate_Click(object sender, EventArgs e)
        {
            if (ddBranchList.SelectedIndex != 0 && !string.IsNullOrEmpty(txtAddSchedule.Text))
            {

        

            }
        }

      

        protected void lnkCancelItem_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            string branchCode = r.Cells[0].Text;

            oTransaction.UPDATE_DELIVERY_RECEIPT_TRANS_FINAL(branchCode, Convert.ToDateTime(txtSchedule.Text), txtAddedRemarks.Text, Session["USER_CODE"].ToString());

            DisplayAdded_Scheduled(Convert.ToDateTime(txtSchedule.Text));
            DisplayAreaList(Convert.ToDateTime(txtSchedule.Text));

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
            DataTable dt = oBranch.GET_BRANCHES_DATA();

            DataView dv = dt.DefaultView;

            ddBranchList.DataSource = dv;
            ddBranchList.DataTextField = dv.Table.Columns["BranchName"].ToString();
            ddBranchList.DataValueField = dv.Table.Columns["BranchCode"].ToString();
            ddBranchList.DataBind();

            ddBranchList.Items.Insert(0, new ListItem("SELECT BRANCH"));

        }

        protected void lnkUpcomingSched_Click(object sender, EventArgs e)
        {


            if (!string.IsNullOrEmpty(txtSchedule.Text)) { 
            

                DisplayAreaList(Convert.ToDateTime(txtSchedule.Text));
                DisplayAdded_Scheduled(Convert.ToDateTime(txtSchedule.Text));

                if (Convert.ToDateTime(txtSchedule.Text).Date >= oSystem.GET_SERVER_DATE_TIME().Date)
                {
                    panelInputs.Enabled = true;
                }
                else
                {
                    panelInputs.Enabled = false;
                }
                
            }
        }

        protected void lnkCreateScheduleList_Click(object sender, EventArgs e)
        {
            //For Driver Summary List of Delivery
            //string sDriverName = "";
            //string sHelperName = "";
            //string sVehiclePlateNum = "";

            int iTrip1Driver1, iTrip1Driver2, iTrip1Helper1, iTrip1Helper2, iTrip1Vehicle;
            int iTrip2Driver1 = 0, iTrip2Driver2 = 0, iTrip2Helper1 = 0, iTrip2Helper2 = 0, iTrip2Vehicle = 0;


            if (gvScheduleList.Rows.Count > 0)
            {
                foreach (GridViewRow row in gvScheduleList.Rows) {
                    TextBox txtTrip1Remarks = row.FindControl("txtTrip1Remarks") as TextBox;
                    TextBox txtTrip2Remarks = row.FindControl("txtTrip2Remarks") as TextBox;
                    
                    #region "Driver"
                    DropDownList ddDriverList1 = row.FindControl("ddDriver1") as DropDownList;
                    DropDownList ddDriverList2 = row.FindControl("ddDriver2") as DropDownList;
                    //Trip 2
                    DropDownList ddTrip2DriverList1 = row.FindControl("ddTrip2Driver1") as DropDownList;
                    DropDownList ddTrip2DriverList2 = row.FindControl("ddTrip2Driver2") as DropDownList;

    
                    #endregion

                    #region "Helper"
                    DropDownList ddHelperList1 = row.FindControl("ddHelper1") as DropDownList;
                    DropDownList ddHelperList2 = row.FindControl("ddHelper2") as DropDownList;
                    //Trip 2
                    DropDownList ddTrip2HelperList1 = row.FindControl("ddTrip2Helper1") as DropDownList;
                    DropDownList ddTrip2HelperList2 = row.FindControl("ddTrip2Helper2") as DropDownList;

                 
                    #endregion

                    #region "Vehicle"

                    DropDownList ddPlateNumber = row.FindControl("ddPlateNumber") as DropDownList;
                    DropDownList ddTrip2PlateNumber = row.FindControl("ddTrip2PlateNumber") as DropDownList;

                    #endregion
                    

                    //TRIP 1
                    if (ddDriverList1.SelectedIndex != 0)
                    {
                        iTrip1Driver1 = Convert.ToInt32(ddDriverList1.SelectedValue); 
                    }
                    else { iTrip1Driver1 = 0; }

                    if (ddDriverList2.SelectedIndex != 0)
                    {
                        iTrip1Driver2 = Convert.ToInt32(ddDriverList2.SelectedValue);
                    }
                    else { iTrip1Driver2 = 0; }

                    if (ddHelperList1.SelectedIndex != 0)
                    {
                        iTrip1Helper1 = Convert.ToInt32(ddHelperList1.SelectedValue);
                    }
                    else { iTrip1Helper1 = 0; }

                    if (ddHelperList2.SelectedIndex != 0)
                    {
                        iTrip1Helper2 = Convert.ToInt32(ddHelperList2.SelectedValue);
                    }
                    else { iTrip1Helper2 = 0; }

                    if (ddPlateNumber.SelectedIndex != 0)
                    {
                        iTrip1Vehicle = Convert.ToInt32(ddPlateNumber.SelectedValue);
                    }
                    else { iTrip1Vehicle = 0; }

                  
                  
                   
                  

                    //TRIP 2

                    if (ddTrip2DriverList1.SelectedIndex != 0)
                    {
                        iTrip2Driver1 = Convert.ToInt32(ddTrip2DriverList1.SelectedValue);
                    }
                    else { iTrip2Driver1 = 0; }

                    if (ddTrip2DriverList2.SelectedIndex != 0)
                    {
                        iTrip2Driver2 = Convert.ToInt32(ddTrip2DriverList2.SelectedValue);
                    }
                    else { iTrip2Driver2 = 0; }

                    if (ddTrip2HelperList1.SelectedIndex != 0)
                    {
                        iTrip2Helper1 = Convert.ToInt32(ddTrip2HelperList1.SelectedValue);
                    }
                    else { iTrip2Helper1 = 0; }

                    if (ddTrip2HelperList2.SelectedIndex != 0)
                    {
                        iTrip2Helper2 = Convert.ToInt32(ddTrip2HelperList2.SelectedValue);
                    }
                    else { iTrip2Helper2 = 0; }

                    if (ddTrip2PlateNumber.SelectedIndex != 0)
                    {
                        iTrip2Vehicle = Convert.ToInt32(ddTrip2PlateNumber.SelectedValue);
                    }
                    else { iTrip2Vehicle = 0; }

                  
                   
                  


                    string sLACode = row.Cells[0].Text; //Location Code
                     
                    //sDriverName = txtDriverName.Text;
                    //sHelperName = txtHelperName.Text;
                    //sVehiclePlateNum = txtVehiclePlate.Text;

                    if (row.RowType == DataControlRowType.DataRow) {   
                    
                    GridView gvBranchPerArea = row.FindControl("gvBranchPerArea") as GridView;
                    
                    if (gvBranchPerArea.Rows.Count > 0)
                    {
                        //Execute saving if cancel is false
                        foreach (GridViewRow r in gvBranchPerArea.Rows)
                        {


                            SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("DR");

                            string sBranchCode = r.Cells[0].Text;
                            string sFreshItemCode = r.Cells[1].Text;
                            string sFrozenItemCode = r.Cells[2].Text;
                            string sLiempoItemCode = r.Cells[3].Text;
                            string sLeegItemCode = r.Cells[4].Text;
                            string sAtsara100ItemCode = r.Cells[5].Text;
                            string sAtsara160ItemCode = r.Cells[6].Text;
                            string sPartnerCode = r.Cells[7].Text;


                            TextBox txtFreshInput = r.FindControl("txtFreshInput") as TextBox;
                            TextBox txtFrozenInput = r.FindControl("txtFrozenInput") as TextBox;
                            TextBox txtLiempoInput = r.FindControl("txtLiempoInput") as TextBox;
                            TextBox txtLeegInput = r.FindControl("txtLeegInput") as TextBox;
                            TextBox txtAtsara100Input = r.FindControl("txtAtsara100Input") as TextBox;
                            TextBox txtAtsara160Input = r.FindControl("txtAtsara160Input") as TextBox;


                            CheckBox chkTrip2 = r.FindControl("chkTrip2") as CheckBox;

                            CheckBox chkIsCancel = r.FindControl("chkIsCancel") as CheckBox;
                            TextBox txtRemarks = r.FindControl("txtRemarks") as TextBox;

                            DropDownList ddChangeAreaList = r.FindControl("ddChangeArea") as DropDownList;

                            double dFreshInput;
                            double dFrozenInput;
                            double dLiempoInput;
                            double dLeegInput;
                            double dAtsara100Input;
                            double dAtsara160Input;
 
                            //FRESH CHICKEN
                            if (string.IsNullOrEmpty(txtFreshInput.Text) || string.IsNullOrWhiteSpace(txtFreshInput.Text))
                            {
                                dFreshInput = 0;
                            }
                            else
                            {
                                dFreshInput = double.Parse(txtFreshInput.Text);
                               
                            }

                            //Frozen CHICKEN
                            if (string.IsNullOrEmpty(txtFrozenInput.Text) || string.IsNullOrWhiteSpace(txtFrozenInput.Text))
                            {
                                dFrozenInput = 0;
                          
                            }
                            else
                            {
                                dFrozenInput = double.Parse(txtFrozenInput.Text);
                              
                            }

                            //LIEMPO
                            if (string.IsNullOrEmpty(txtLiempoInput.Text) || string.IsNullOrEmpty(txtLiempoInput.Text))
                            {

                                dLiempoInput = 0;
                               
                            }
                            else
                            {

                                dLiempoInput = double.Parse(txtLiempoInput.Text);
                              
                            }

                            //LIEMPO
                            if (string.IsNullOrEmpty(txtLeegInput.Text) || string.IsNullOrEmpty(txtLeegInput.Text))
                            {

                                dLeegInput = 0;
                              
                            }
                            else
                            {
                                dLeegInput = double.Parse(txtLeegInput.Text);
                             
                            
                            }

                            //ATSARA 100
                            if (string.IsNullOrEmpty(txtAtsara100Input.Text) || string.IsNullOrEmpty(txtAtsara100Input.Text))
                            {
                                dAtsara100Input = 0;
                               
                            }
                            else
                            {
                                dAtsara100Input = double.Parse(txtAtsara100Input.Text);
                              

                               
                            }

                            //ATSARA 160
                            if (string.IsNullOrEmpty(txtAtsara160Input.Text) || string.IsNullOrEmpty(txtAtsara160Input.Text))
                            {
                                dAtsara160Input = 0;
                              
                            }
                            else
                            {
                                dAtsara160Input = double.Parse(txtAtsara160Input.Text);
                
                            }

                          
                               
                            






                            if (dFreshInput == 0 && dFrozenInput == 0 && dLiempoInput == 0 && dLeegInput == 0 && dAtsara100Input == 0 && dAtsara160Input == 0)
                            {
                                //NO ACTION
                            }
                            else
                            {

                                oTransaction.INSERT_DELIVERY_RECEIPT_TRANS_FINAL(SeriesNum, sPartnerCode, sBranchCode, 
                                 sFreshItemCode, sFrozenItemCode, sLiempoItemCode, sLeegItemCode,sAtsara100ItemCode,sAtsara160ItemCode,
                                 dFreshInput, dFrozenInput, dLiempoInput, dLeegInput, dAtsara100Input, dAtsara160Input,
                                 false, false, Convert.ToDateTime(txtSchedule.Text), txtRemarks.Text, ddChangeAreaList.SelectedValue, chkTrip2.Checked, Session["USER_CODE"].ToString(), 
                                 iTrip1Driver1,iTrip1Driver2,iTrip1Helper1,iTrip1Helper2,iTrip1Vehicle,txtTrip1Remarks.Text,iTrip2Driver1,
                                 iTrip2Driver2,iTrip2Helper1, iTrip2Helper2, iTrip2Vehicle, txtTrip2Remarks.Text);
                                //Update Series Number
                                //oSystem.UPDATE_SERIES_NUMBER("DR");

                               // DisplayAreaList(Convert.ToDateTime(txhttp://localhost:4606/DeliveryReceipt_Final.aspx.cstSchedule.Text));

                                //Display Print Out.

                                lblSuccessMessage.Text = "Schedule succefully process, DR ready to be Print.";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgSuccessModal').modal('show');</script>", false);

                               
                            }
                        }

                     
                    }

                    else {
                        gvBranchPerArea.DataSource = null;
                        gvBranchPerArea.DataBind();
                    }
                    }
                }  
                }

           
            
        }


        private void PRINT_NOW(string url)
        {
            string s = "window.open('" + url + "', 'popup_window', 'width=1024, height=768, left=0, top=0, resizable=yes');";
            ScriptManager.RegisterClientScriptBlock(this, this.Page.GetType(), "ReportScript", s, true);
        }

        protected void gvScheduleList_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            foreach (GridViewRow row in gvScheduleList.Rows)
            {
                string sLACode = row.Cells[0].Text;
                //TextBox txtDriverName = row.FindControl("txtDriverName") as TextBox;
                //TextBox txtHelperName = row.FindControl("txtHelperName") as TextBox;
                //TextBox txtVehiclePlateNum = row.FindControl("txtVehiclePlate") as TextBox;

                
                TextBox txtTrip1Remarks = row.FindControl("txtTrip1Remarks") as TextBox;
                TextBox txtTrip2Remarks = row.FindControl("txtTrip2Remarks") as TextBox;


                #region "Drivers"
                DropDownList ddDriverList1 = row.FindControl("ddDriver1") as DropDownList;
                DropDownList ddDriverList2 = row.FindControl("ddDriver2") as DropDownList;
                //Trip 2
                DropDownList ddTrip2DriverList1 = row.FindControl("ddTrip2Driver1") as DropDownList;
                DropDownList ddTrip2DriverList2 = row.FindControl("ddTrip2Driver2") as DropDownList;

                //DISPLAY LIST OF DRIVERS
                DataTable dtDrivers = oUtility.GET_DRIVER_LIST();
                ddDriverList1.DataSource = dtDrivers;
                ddDriverList1.DataTextField = dtDrivers.Columns["DriverName"].ToString();
                ddDriverList1.DataValueField = dtDrivers.Columns["DriverID"].ToString();
                ddDriverList1.DataBind();

                //Driver 2
                ddDriverList2.DataSource = dtDrivers;
                ddDriverList2.DataTextField = dtDrivers.Columns["DriverName"].ToString();
                ddDriverList2.DataValueField = dtDrivers.Columns["DriverID"].ToString();
                ddDriverList2.DataBind();

                //TRIP 2 DRIVERS
                ddTrip2DriverList1.DataSource = dtDrivers;
                ddTrip2DriverList1.DataTextField = dtDrivers.Columns["DriverName"].ToString();
                ddTrip2DriverList1.DataValueField = dtDrivers.Columns["DriverID"].ToString();
                ddTrip2DriverList1.DataBind();

                ddTrip2DriverList2.DataSource = dtDrivers;
                ddTrip2DriverList2.DataTextField = dtDrivers.Columns["DriverName"].ToString();
                ddTrip2DriverList2.DataValueField = dtDrivers.Columns["DriverID"].ToString();
                ddTrip2DriverList2.DataBind();



                ddDriverList1.Items.Insert(0, new ListItem("--Driver 1--"));
                ddDriverList2.Items.Insert(0, new ListItem("--Driver 2--"));
                ddTrip2DriverList1.Items.Insert(0, new ListItem("--Driver 1--"));
                ddTrip2DriverList2.Items.Insert(0, new ListItem("--Driver 2--"));
                #endregion

                #region "Helper"
                DropDownList ddHelperList1 = row.FindControl("ddHelper1") as DropDownList;
                DropDownList ddHelperList2 = row.FindControl("ddHelper2") as DropDownList;
                //Trip 2
                DropDownList ddTrip2HelperList1 = row.FindControl("ddTrip2Helper1") as DropDownList;
                DropDownList ddTrip2HelperList2 = row.FindControl("ddTrip2Helper2") as DropDownList;

                //DISPLAY LIST OF HELPER
                DataTable dtHelper = oUtility.GET_HELPER_LIST();
                ddHelperList1.DataSource = dtHelper;
                ddHelperList1.DataTextField = dtHelper.Columns["HelperName"].ToString();
                ddHelperList1.DataValueField = dtHelper.Columns["HelperID"].ToString();
                ddHelperList1.DataBind();

                //Helper 2
                ddHelperList2.DataSource = dtHelper;
                ddHelperList2.DataTextField = dtHelper.Columns["HelperName"].ToString();
                ddHelperList2.DataValueField = dtHelper.Columns["HelperID"].ToString();
                ddHelperList2.DataBind();

                //TRIP 2 HELPER 1
                ddTrip2HelperList1.DataSource = dtHelper;
                ddTrip2HelperList1.DataTextField = dtHelper.Columns["HelperName"].ToString();
                ddTrip2HelperList1.DataValueField = dtHelper.Columns["HelperID"].ToString();
                ddTrip2HelperList1.DataBind();

                //TRIP 2 HELPER 2
                ddTrip2HelperList2.DataSource = dtHelper;
                ddTrip2HelperList2.DataTextField = dtHelper.Columns["HelperName"].ToString();
                ddTrip2HelperList2.DataValueField = dtHelper.Columns["HelperID"].ToString();
                ddTrip2HelperList2.DataBind();

                ddHelperList1.Items.Insert(0, new ListItem("--Helper 1--"));
                ddHelperList2.Items.Insert(0, new ListItem("--Helper 2--"));

                ddTrip2HelperList1.Items.Insert(0, new ListItem("--Helper 1--"));
                ddTrip2HelperList2.Items.Insert(0, new ListItem("--Helper 2--"));
                #endregion

                #region "Vehicle"

                DropDownList ddPlateNumber = row.FindControl("ddPlateNumber") as DropDownList;
                //Trip 2
                DropDownList ddTrip2PlateNumber = row.FindControl("ddTrip2PlateNumber") as DropDownList;

              
                //DISPLAY PLATE NUMBER
                DataTable dtPlateNumber = oUtility.GET_VEHICLE_LIST();
                ddPlateNumber.DataSource = dtPlateNumber;
                ddPlateNumber.DataTextField = dtPlateNumber.Columns["Plate_CapLoad"].ToString();
                ddPlateNumber.DataValueField = dtPlateNumber.Columns["PlateID"].ToString();
                ddPlateNumber.DataBind();

                ddTrip2PlateNumber.DataSource = dtPlateNumber;
                ddTrip2PlateNumber.DataTextField = dtPlateNumber.Columns["Plate_CapLoad"].ToString();
                ddTrip2PlateNumber.DataValueField = dtPlateNumber.Columns["PlateID"].ToString();
                ddTrip2PlateNumber.DataBind();

                

                ddPlateNumber.Items.Insert(0, new ListItem("--Vehicle--"));
                ddTrip2PlateNumber.Items.Insert(0, new ListItem("--Vehicle--"));
                #endregion

                if (checkDeliveryInfo(Convert.ToDateTime(txtSchedule.Text),sLACode))
                {
                    
                   //Condition to avoid error
                    if (_t1Driver1 != 0) { 
                    ddDriverList1.SelectedValue = _t1Driver1.ToString();
                    }
                    if (_t1Driver2 != 0) { 
                    ddDriverList2.SelectedValue = _t1Driver2.ToString();
                    }
                    if (_t1Helper1 != 0) { 
                    ddHelperList1.SelectedValue = _t1Helper1.ToString();
                    }
                    if(_t1Helper2 != 0){
                    ddHelperList2.SelectedValue = _t1Helper2.ToString();
                    }
                    if (_t1Vehicle != 0) { 
                    ddPlateNumber.SelectedValue = _t1Vehicle.ToString();
                    }

                    txtTrip1Remarks.Text = _t1Remarks;

                    if (_t2Driver1 != 0) { 
                    ddTrip2DriverList1.SelectedValue = _t2Driver1.ToString();
                    }
                    if (_t2Driver2 != 0) { 
                    ddTrip2DriverList2.SelectedValue = _t2Driver2.ToString();
                    }
                    if (_t2Helper1 != 0) { 
                    ddTrip2HelperList1.SelectedValue = _t2Helper1.ToString();
                    }
                    if (_t2Helper2 != 0) { 
                    ddTrip2HelperList2.SelectedValue = _t2Helper2.ToString();
                    }
                    if (_t2Vehicle != 0) { 
                    ddTrip2PlateNumber.SelectedValue = _t2Vehicle.ToString();
                    }

                    txtTrip2Remarks.Text = _t2Remarks;
                }

            }

            if (e.Row.RowType == DataControlRowType.DataRow) {
                DataTable dt = oTransaction.GET_DELIVERY_INPUT();
                DataView dv = dt.DefaultView;

                string _laCode = gvScheduleList.DataKeys[e.Row.RowIndex].Value.ToString();

                
                GridView gvBranchPerArea = e.Row.FindControl("gvBranchPerArea") as GridView;
                gvBranchPerArea.DataSource = DisplayBranchSchedule(_laCode, Convert.ToDateTime(txtSchedule.Text));
                gvBranchPerArea.DataBind();

             

                //Execute saving if cancel is false
                foreach (GridViewRow r in gvBranchPerArea.Rows)
                {
                    //string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("DR");
                    //Session["G_DRNUM"] = SeriesNum;

                    string sBranchCode = r.Cells[0].Text;
                    string sFreshItemCode = r.Cells[1].Text;
                    string sFrozenItemCode = r.Cells[2].Text;
                    string sLiempoItemCode = r.Cells[3].Text;
                    string sLeegItemCode = r.Cells[4].Text;
                    string sAtsara100ItemCode = r.Cells[5].Text;
                    string sAtsara160ItemCode = r.Cells[6].Text;
                    string sPartnerCode = r.Cells[7].Text;

                    //TextBox txtPartnerPriceAmount = r.FindControl("txtPartnerPriceAmount") as TextBox;
                    //TextBox txtLiempoPriceAmount = r.FindControl("txtLiempoPrice") as TextBox;
                    //TextBox txtLeegPriceAmount = r.FindControl("txtLeegPrice") as TextBox;
                    //TextBox txtAtsaraPriceAmount = r.FindControl("txtAtsaraPrice") as TextBox;

                    TextBox txtFreshConversionSource = r.FindControl("txtFreshConversionSource") as TextBox;
                    TextBox txtFreshInput = r.FindControl("txtFreshInput") as TextBox;

                    TextBox txtFrozenConversionSource = r.FindControl("txtFrozenConversionSource") as TextBox;
                    TextBox txtFrozenInput = r.FindControl("txtFrozenInput") as TextBox;

                    TextBox txtLiempoConversionSource = r.FindControl("txtLiempoConversionSource") as TextBox;
                    TextBox txtLiempoInput = r.FindControl("txtLiempoInput") as TextBox;

                    TextBox txtLeegConvserionSource = r.FindControl("txtLeegConversionSource") as TextBox;
                    TextBox txtLeegInput = r.FindControl("txtLeegInput") as TextBox;

                    TextBox txtAtsara100ConvserionSource = r.FindControl("txtAtsara100ConversionSource") as TextBox;
                    TextBox txtAtsara100Input = r.FindControl("txtAtsara100Input") as TextBox;

                    TextBox txtAtsara160ConvserionSource = r.FindControl("txtAtsara160ConversionSource") as TextBox;
                    TextBox txtAtsara160Input = r.FindControl("txtAtsara160Input") as TextBox;

                    TextBox txtTotalCost = r.FindControl("txtTotalCost") as TextBox;
                    TextBox txtRemarks = r.FindControl("txtRemarks") as TextBox;

                    LinkButton lnkCancel = r.FindControl("lnkCancel") as LinkButton;

                    CheckBox chkTrip2 = r.FindControl("chkTrip2") as CheckBox;

                    DropDownList ddChangeAreaList = r.FindControl("ddChangeArea") as DropDownList;

                    DataTable dtAreaList = oUtility.GET_LOCATION_AREA_LIST();
                    ddChangeAreaList.DataSource = dtAreaList;
                    ddChangeAreaList.DataTextField = dtAreaList.Columns["LAName"].ToString();
                    ddChangeAreaList.DataValueField = dtAreaList.Columns["LACode"].ToString();
                    ddChangeAreaList.DataBind();

                  

                    txtFreshInput.Text = "0";
                    txtFrozenInput.Text = "0";
                    txtLiempoInput.Text = "0";
                    txtLeegInput.Text = "0";
                    txtAtsara100Input.Text = "0";
                    txtAtsara160Input.Text = "0";
                    
                   
                        if(checkExistSched(sBranchCode, Convert.ToDateTime(txtSchedule.Text)))
                        {
                            txtFreshInput.Text = _dFreshInput.ToString();
                            txtFrozenInput.Text = _dFrozenInput.ToString();
                            txtLiempoInput.Text = _dLiempoInput.ToString();
                            txtLeegInput.Text = _dLeegInput.ToString();
                            txtAtsara100Input.Text = _dAtsara100Input.ToString();
                            txtAtsara160Input.Text = _dAtsara160Input.ToString();
                          

                          //  txtTotalCost.Text = (_dTotalFreshPrice + _dTotalFrozenPrice + +_dTotalLiempoCost + _dTotalLeegCost + _dTotalAtsara100Cost + _dTotalAtsara160Cost).ToString();

                            txtFreshInput.Enabled = false;
                            txtFrozenInput.Enabled = false;
                            txtLiempoInput.Enabled = false;
                            txtLeegInput.Enabled = false;
                            txtAtsara100Input.Enabled = false;
                            txtAtsara160Input.Enabled = false;

                            lnkCancel.Visible = true;

                            txtRemarks.Text = _branchRemarks;
                            //txtRemarks.Enabled = false;


                            //r.Enabled = false;

                           // chkTrip2.Enabled = false;
                            chkTrip2.Checked = _2trip;

                            ddChangeAreaList.SelectedValue = _assigned_AreaCOde;
                           // ddChangeAreaList.Enabled = false;

                        }
                        else
                        {
                         txtFreshInput.Text = "0";
                         txtFrozenInput.Text = "0";
                         txtLiempoInput.Text = "0";
                         txtLeegInput.Text = "0";
                         txtAtsara100Input.Text = "0";
                         txtAtsara160Input.Text = "0";

                         ddChangeAreaList.SelectedValue = ddAreaList.SelectedValue.ToString();

                        //Check here if the partner have price for particular item/product

                         if (CheckPartnerPrice_Exist(sPartnerCode, sFreshItemCode))
                         {
                             txtFreshInput.Enabled = true;
                         }
                         else {
                             txtFreshInput.Enabled = false;
                         }


                         if (CheckPartnerPrice_Exist(sPartnerCode, sFrozenItemCode))
                         {
                             txtFrozenInput.Enabled = true;
                         }
                         else
                         {
                             txtFrozenInput.Enabled = false;
                         }


                         if (CheckPartnerPrice_Exist(sPartnerCode, sLiempoItemCode))
                         {
                             txtLiempoInput.Enabled = true;
                         }
                         else
                         {
                             txtLiempoInput.Enabled = false;
                         }

                        if (CheckPartnerPrice_Exist(sPartnerCode, sLeegItemCode))
                         {
                             txtLeegInput.Enabled = true;
                         }
                         else { txtLeegInput.Enabled = false; }


                        if (CheckPartnerPrice_Exist(sPartnerCode, sAtsara100ItemCode))
                        {
                            txtAtsara100Input.Enabled = true;
                        }else
                        { txtAtsara100Input.Enabled = false; }

                        if (CheckPartnerPrice_Exist(sPartnerCode, sLeegItemCode))
                        {
                            txtAtsara160Input.Enabled = true;
                        }
                        else { txtAtsara160Input.Enabled = false; }

                         lnkCancel.Visible = false;
                         txtRemarks.Text = "";
                         txtRemarks.Enabled = true;
  
                        }

               
                    
                }

            }

            
        }

     

   

        protected void ddBranchList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GET PartnerPrice
            //DataTable dt = oUtility.GET_PARTNER_PRICE_FINAL();
            //DataRow[] dr = dt.Select("BranchCode ='" + ddBranchList.SelectedValue.ToString() + "'");

            //if (dr.Length > 0)
            //{
            //            foreach (DataRow row in dr)
            //            {
            //                lblAPriceAmount.Text = row["PriceAmount"].ToString();
            //                lblALiempoPrice.Text = row["LiempoPrice"].ToString();
            //                lblALeegPrice.Text = row["LeegPrice"].ToString();
            //                lblAAtsaraPrice.Text = row["AtsaraPrice"].ToString();
            //            }
                 
                
              
            //}

        }

        protected void lnkPrintDRSummary_Click(object sender, EventArgs e)
        {
          
            Session["G_DELIVERYDATE"] = txtSchedule.Text;
            PRINT_NOW("repDeliveryReceipt_Batch.aspx");
        }

        protected void lnkPrintSchedulePerArea_Click(object sender, EventArgs e)
        {
            Session["G_ISTRIP2"] = false;
            Session["G_DELIVERYDATE"] = Convert.ToDateTime(txtSchedule.Text);
            PRINT_NOW("repDeliverySummaryList.aspx");
        }



        private bool CheckPartnerPrice_Exist(string _partnerCode, string _itemCode)
        {

            bool result = false;
            DataTable dt = oUtility.GET_PARTNERS_PRICE();

            DataRow[] dr = dt.Select("PartnerCode='" + _partnerCode + "' and ItemCode= '" + _itemCode + "'");

            if (dr.Length > 0)
            {
                result = true;
            }
            else
            { result = false;}

            return result;
        }

        protected void lnkPrintTrip2_Click(object sender, EventArgs e)
        {
            Session["G_ISTRIP2"] = true;
            Session["G_DELIVERYDATE"] = Convert.ToDateTime(txtSchedule.Text);
            PRINT_NOW("repDeliverySummaryList.aspx");
        }

        protected void ddAreaList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = oTransaction.GET_DELIVERY_INPUT();
            DataView dv = new DataView(dt);

            DateTime _selectedDate = Convert.ToDateTime(txtSchedule.Text);

            switch (_selectedDate.DayOfWeek)
            {
                case DayOfWeek.Monday:
                    dv.RowFilter = "M = 1";
                    break;

                case DayOfWeek.Tuesday:
                    dv.RowFilter = "T = 1";
                    break;

                case DayOfWeek.Wednesday:
                    dv.RowFilter = "W = 1";
                    break;

                case DayOfWeek.Thursday:
                    dv.RowFilter = "Th = 1";
                    break;

                case DayOfWeek.Friday:
                    dv.RowFilter = "F = 1";
                    break;

                case DayOfWeek.Saturday:
                    dv.RowFilter = "Sa = 1";
                    break;

                case DayOfWeek.Sunday:
                    dv.RowFilter = "S = 1";
                    break;

            }

            

            DataTable distinctValuesDT = dv.ToTable(true, "LACode", "LAName");
            dv = distinctValuesDT.DefaultView;
            dv.RowFilter = "LACode ='" + ddAreaList.SelectedValue.ToString() + "'";
            dv.Sort = "LAName";

            //ddAreaList.DataSource = dv;
            //ddAreaList.DataTextField = dv.Table.Columns["LAName"].ToString();
            //ddAreaList.DataValueField = dv.Table.Columns["LACode"].ToString();
            //ddAreaList.DataBind();

            DataView dv2 = dv;
            dv2.RowFilter = "LACode = '" + ddAreaList.SelectedValue.ToString() + "'";
            gvScheduleList.DataSource = dv2;
            gvScheduleList.DataBind();
        }



    }
}