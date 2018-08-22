using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class DeliveryReceipt_Final_X : System.Web.UI.Page
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
        
        double _dPartnerChickenPrice = 0, _dPartnerLiempoPrice = 0, _dPartnerLeegPrice = 0, _dPartnerAtsaraPrice = 0;
        double _dFreshConversionSource = 20, _dFrozenConversionSource = 25, _dLiempoConversionSource = 30, _dLeegConversionSource = 1, _dAtsara100ConversionSource = 100, _dAtsara160ConversionSource = 160;
        double _dTotalFreshPrice = 0, _dTotalFrozenPrice = 0, _dTotalLiempoCost = 0, _dTotalLeegCost = 0, _dTotalAtsara100Cost = 0, _dTotalAtsara160Cost = 0;

        string _remarks = "";
        string _sDriverName = "", _sHelperName = "", _sVehicleNum = "";
        


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

            double dConvertedFresh = 0, dConvertedFrozen = 0, dConvertedLiempo = 0, dConvertedLeeg = 0, dConvertedAtsara100 = 0, dConvertedAtsara160 = 0;
            double dFreshInput = 0, dFrozenInput = 0, dLiempoInput = 0, dLeegInput = 0, dAtsara100Input = 0, dAtsara160Input = 0;
            double dTotalFreshCost = 0, dTotalFrozenCost = 0, dTotalLiempoCost = 0, dTotalLeegCost = 0, dTotalAtsara100Cost = 0, dTotalAtsara160Cost = 0;
            double dPriceAmount = 0, dLiempoPrice = 0, dLeegPrice = 0, dAtsaraPrice = 0;
            double dTotalCost = 0;

            //CHICKEN FRESH
            if (!string.IsNullOrEmpty(lblAPriceAmount.Text))
            {
                dPriceAmount = Convert.ToDouble(lblAPriceAmount.Text);
            }
            
            
            if (!string.IsNullOrEmpty(txtAddFresh.Text))
            {
                dConvertedFresh = _dFreshConversionSource * Convert.ToDouble(txtAddFresh.Text);
                dFreshInput = Convert.ToDouble(txtAddFresh.Text);
                dTotalFreshCost = dConvertedFresh * dPriceAmount;
            }
            else
            {
                dConvertedFresh = 0;
                dFreshInput = 0;
                dTotalFreshCost = 0;
            }

            //CHICKEN FROZEN

            if (!string.IsNullOrEmpty(txtAddFrozen.Text))
            {
                dConvertedFrozen = _dFrozenConversionSource * Convert.ToDouble(txtAddFrozen.Text);
                dFrozenInput = Convert.ToDouble(txtAddFrozen.Text);
                dTotalFrozenCost = dConvertedFrozen * dPriceAmount;
            }
            else
            {
                dConvertedFrozen = 0;
                dFrozenInput = 0;
                dTotalFrozenCost = 0;
            }

            //LIEMPO
            if (!string.IsNullOrEmpty(lblALiempoPrice.Text))
            {
                dLiempoPrice = Convert.ToDouble(lblALiempoPrice.Text);
            }

            if (!string.IsNullOrEmpty(txtAddLiempo.Text))
            {

                dConvertedLiempo = _dLiempoConversionSource * Convert.ToDouble(txtAddLiempo.Text);
                dLiempoInput = Convert.ToDouble(txtAddLiempo.Text);
                dTotalLiempoCost = dConvertedLiempo * dLiempoPrice;
            }
            else
            {
                dConvertedLiempo = 0;
                dLiempoInput = 0;
                dTotalLiempoCost = 0;
            }


            //LEEG
            if (!string.IsNullOrEmpty(lblALeegPrice.Text))
            {
                dLeegPrice = Convert.ToDouble(lblALeegPrice.Text);
            }

            if (!string.IsNullOrEmpty(txtAddLeeg.Text))
            {
                dConvertedLeeg = _dLeegConversionSource * Convert.ToDouble(txtAddLeeg.Text);
                dLeegInput = Convert.ToDouble(txtAddLeeg.Text);
                dTotalLeegCost = dConvertedLeeg * dLeegPrice;
            }
            else
            {
                dConvertedLeeg = 0;
                dLeegInput = 0;
                dTotalLeegCost = 0;
            }

            //ATSARA 100
            if (!string.IsNullOrEmpty(lblAAtsaraPrice.Text))
            {
                dAtsaraPrice = Convert.ToDouble(lblAAtsaraPrice.Text);
            }

            if (!string.IsNullOrEmpty(txtAddAtsara100.Text))
            {
                dConvertedAtsara100 = _dAtsara100ConversionSource * Convert.ToDouble(txtAddAtsara100.Text);
                dAtsara100Input = Convert.ToDouble(txtAddAtsara100.Text);
                dTotalAtsara100Cost = dConvertedAtsara100 * dAtsaraPrice;
            }
            else
            {
                dConvertedAtsara100 = 0;
                dAtsara100Input = 0;
                dTotalAtsara100Cost = 0;

            }


            if (!string.IsNullOrEmpty(txtAddAtsara160.Text))
            {
                dConvertedAtsara160 = _dAtsara160ConversionSource * Convert.ToDouble(txtAddAtsara160.Text);
                dAtsara160Input = Convert.ToDouble(txtAddAtsara160.Text);
                dTotalAtsara160Cost = dConvertedAtsara160 * dAtsaraPrice;
            }
            else
            {
                dConvertedAtsara160 = 0;
                dAtsara160Input = 0;
                dTotalAtsara160Cost = 0;
            }

            dTotalCost = dTotalFreshCost + dTotalFrozenCost + dTotalLiempoCost;
            
            //Condition
            if (ddBranchList.SelectedIndex != 0 && dTotalCost != 0)
            {
                if (!checkExistSched(ddBranchList.SelectedValue.ToString(), Convert.ToDateTime(txtSchedule.Text)))
                {
                    string SeriesNum = oSystem.GENERATE_SERIES_NUMBER_TRANS("DR");
                    //oTransaction.INSERT_DELIVERY_RECEIPT_TRANS_FINAL(SeriesNum, ddBranchList.SelectedValue.ToString(), "ITM001", "ITM002", "ITM003", "ITM004", "ITM005", "ITM006", 
                    //_dFreshConversionSource, _dFrozenConversionSource, _dLiempoConversionSource, _dLeegConversionSource, _dAtsara100ConversionSource, _dAtsara160ConversionSource,
                    //dFreshInput, dFrozenInput, dLiempoInput, dLeegInput, dAtsara100Input, dAtsara160Input,
                    //dConvertedFresh, dConvertedFrozen, dConvertedLiempo, dConvertedLeeg, dConvertedAtsara100, dConvertedAtsara160,
                    //double.Parse(lblAPriceAmount.Text), double.Parse(lblALiempoPrice.Text), double.Parse(lblALeegPrice.Text), double.Parse(lblAAtsaraPrice.Text),
                    //dTotalFreshCost, dTotalFrozenCost, dTotalLiempoCost, dTotalLeegCost, dTotalAtsara100Cost, dTotalAtsara160Cost,
                    //false, true, Convert.ToDateTime(txtSchedule.Text), txtAddedRemarks.Text, Session["USER_CODE"].ToString(),txtAdded_DriverName.Text,txtAdded_HelperName.Text,txtAdded_VehiclePlate.Text);


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
                    //dv.RowFilter = "M = 1 and IsSched = 0 and IsAdd = 0 and IsSet = 0";
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
            gvScheduleList.DataSource = dv;
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

                    _dTotalFreshPrice = Convert.ToDouble(row["TotalPriceFresh"]);
                    _dTotalFrozenPrice = Convert.ToDouble(row["TotalPriceFrozen"]);
                  

                    _remarks = row["remarks"].ToString();

               
                    
                    //Retrieve Price per Items
                    _dPartnerChickenPrice = Convert.ToDouble(row["PartnerPrice"]);
                    _dPartnerLiempoPrice = Convert.ToDouble(row["LiempoPrice"]);
                    _dPartnerLeegPrice = Convert.ToDouble(row["LeegPrice"]);
                    _dPartnerAtsaraPrice = Convert.ToDouble(row["AtsaraPrice"]);
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
                    _sDriverName = row["DriverName"].ToString();
                    _sHelperName = row["HelperName"].ToString();
                    _sVehicleNum = row["VehiclePlateNumber"].ToString();
                }
            }
            else
            { x = false;
            _sDriverName = "";
            _sHelperName = "";
            _sVehicleNum = "";
            }

            return x;
        }

        private void getPreviousInput(string _branchCode)
        {
            DataTable dt = oTransaction.GET_PREVIOUS_SCHEDULED_DELIVERY(_branchCode);
            DataRow[] drow = dt.Select("BranchCode='" + _branchCode + "'");

            if (drow.Length > 0)
            {

                foreach (DataRow row in drow)
                {
                    _dFreshInput = Convert.ToDouble(row["FreshQty"]);
                    _dFrozenInput = Convert.ToDouble(row["FrozenQty"]);
                    _dTotalFreshPrice = Convert.ToDouble(row["TotalPriceFresh"]);
                    _dTotalFrozenPrice = Convert.ToDouble(row["TotalPriceFrozen"]);

                    //Price of Items
                    _dPartnerChickenPrice = Convert.ToDouble(row["PartnerPrice"]);
                    _dPartnerLiempoPrice = Convert.ToDouble(row["LiempoPrice"]);
                }
            }
        
        }

       
        private void DisplayAreaList_Scheduled(DateTime _selectedDate)
        {
            DataTable dt = oTransaction.GET_SCHEDULED_DELIVERY(_selectedDate);
            DataView dv = new DataView(dt);

            DataTable distinctValuesDT = dv.ToTable(true, "LACode", "LAName");
      
            dv = distinctValuesDT.DefaultView;


            //gvScheduledDelivery.DataSource = dv;
            //gvScheduledDelivery.DataBind();
        
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

             //       oTransaction.UPDATE_DELIVERY_SCHEDULE_ADD(ddBranchList.SelectedValue.ToString(),txtRemarks.Text, Convert.ToDateTime(txtAddSchedule.Text));
               
             ////       DisplayTodaySchedule();
             //       //Refresh the current web page  
             //       Response.Redirect(Request.RawUrl);

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
            string sDriverName = "";
            string sHelperName = "";
            string sVehiclePlateNum = "";

            if (gvScheduleList.Rows.Count > 0)
            {
                foreach (GridViewRow row in gvScheduleList.Rows) {
                    TextBox txtDriverName = row.FindControl("txtDriverName") as TextBox;
                    TextBox txtHelperName = row.FindControl("txtHelperName") as TextBox;
                    TextBox txtVehiclePlate = row.FindControl("txtVehiclePlate") as TextBox;

                    string sLACode = row.Cells[0].Text; //Location Code
                     
                    sDriverName = txtDriverName.Text;
                    sHelperName = txtHelperName.Text;
                    sVehiclePlateNum = txtVehiclePlate.Text;

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


                            TextBox txtFreshConversionSource = r.FindControl("txtFreshConversionSource") as TextBox;
                            TextBox txtFrozenConversionSource = r.FindControl("txtFrozenConversionSource") as TextBox;
                            TextBox txtLiempoConversionSource = r.FindControl("txtLiempoConversionSource") as TextBox;
                            TextBox txtLeegConvserionSource = r.FindControl("txtLeegConversionSource") as TextBox;
                            TextBox txtAtsara100ConvserionSource = r.FindControl("txtAtsara100ConversionSource") as TextBox;
                            TextBox txtAtsara160ConvserionSource = r.FindControl("txtAtsara160ConversionSource") as TextBox;

                            TextBox txtFreshInput = r.FindControl("txtFreshInput") as TextBox;
                            TextBox txtFrozenInput = r.FindControl("txtFrozenInput") as TextBox;
                            TextBox txtLiempoInput = r.FindControl("txtLiempoInput") as TextBox;
                            TextBox txtLeegInput = r.FindControl("txtLeegInput") as TextBox;
                            TextBox txtAtsara100Input = r.FindControl("txtAtsara100Input") as TextBox;
                            TextBox txtAtsara160Input = r.FindControl("txtAtsara160Input") as TextBox;

                            //Chicken Price
                            TextBox txtPartnerPriceAmount = r.FindControl("txtPartnerPriceAmount") as TextBox;

                            //Liempo Price
                            TextBox txtLiempoPriceAmount = r.FindControl("txtLiempoPrice") as TextBox;

                            //Leeg Price
                            TextBox txtLeegPriceAmount = r.FindControl("txtLeegPrice") as TextBox;
                        
                            //Atsara Price
                            TextBox txtAtsaraPriceAmount = r.FindControl("txtAtsaraPrice") as TextBox;


                            CheckBox chkIsCancel = r.FindControl("chkIsCancel") as CheckBox;
                            TextBox txtRemarks = r.FindControl("txtRemarks") as TextBox;


                            double dFreshInput;
                            double dFrozenInput;
                            double dLiempoInput;
                            double dLeegInput;
                            double dAtsara100Input;
                            double dAtsara160Input;

                            double dConvertedFreshQty;
                            double dConvertedFrozenQty;
                            double dConvertedLiempoQty;
                            double dConvertedLeegQty;
                            double dConvertedAtsara100Qty;
                            double dConvertedAtsara160Qty;

                            double dTotalFresh;
                            double dTotalFrozen;
                            double dTotalLiempoCost;
                            double dTotalLeegCost;
                            double dTotalAtsara100Cost;
                            double dTotalAtsara160Cost;

                         
                            //double dLiempoPrice;
                           
                            
                            //FRESH CHICKEN
                            if (string.IsNullOrEmpty(txtFreshInput.Text) || string.IsNullOrWhiteSpace(txtFreshInput.Text))
                            {
                                dFreshInput = 0;
                                dConvertedFreshQty = 0;
                                dTotalFresh = 0;
                            }
                            else
                            {
                                dFreshInput = double.Parse(txtFreshInput.Text);
                                dConvertedFreshQty = double.Parse(txtFreshConversionSource.Text) * dFreshInput;
                                dTotalFresh = dConvertedFreshQty * double.Parse(txtPartnerPriceAmount.Text);
                            }

                            //Frozen CHICKEN
                            if (string.IsNullOrEmpty(txtFrozenInput.Text) || string.IsNullOrWhiteSpace(txtFrozenInput.Text))
                            {
                                dFrozenInput = 0;
                                dConvertedFrozenQty = 0;
                                dTotalFrozen = 0;
                            }
                            else
                            {
                                dFrozenInput = double.Parse(txtFrozenInput.Text);
                                dConvertedFrozenQty = double.Parse(txtFrozenConversionSource.Text) * dFrozenInput;
                                dTotalFrozen = dConvertedFrozenQty * double.Parse(txtPartnerPriceAmount.Text);
                            }

                            //LIEMPO
                            if (string.IsNullOrEmpty(txtLiempoInput.Text) || string.IsNullOrEmpty(txtLiempoInput.Text))
                            {

                                dLiempoInput = 0;
                                dConvertedLiempoQty = 0;
                                dTotalLiempoCost = 0;
                            }
                            else
                            {

                                dLiempoInput = double.Parse(txtLiempoInput.Text);
                                dConvertedLiempoQty = double.Parse(txtLiempoConversionSource.Text) * dLiempoInput;
                                dTotalLiempoCost = dConvertedLiempoQty * double.Parse(txtLiempoPriceAmount.Text);
                            }

                            //LIEMPO
                            if (string.IsNullOrEmpty(txtLeegInput.Text) || string.IsNullOrEmpty(txtLeegInput.Text))
                            {

                                dLeegInput = 0;
                                dConvertedLeegQty = 0;
                                dTotalLeegCost = 0;
                            }
                            else
                            {
                                dLeegInput = double.Parse(txtLeegInput.Text);
                                dConvertedLeegQty = double.Parse(txtLeegConvserionSource.Text) * dLeegInput;
                                dTotalLeegCost = dConvertedLeegQty * double.Parse(txtLeegPriceAmount.Text);
                            
                            }

                            //ATSARA 100
                            if (string.IsNullOrEmpty(txtAtsara100Input.Text) || string.IsNullOrEmpty(txtAtsara100Input.Text))
                            {
                                dAtsara100Input = 0;
                                dConvertedAtsara100Qty = 0;
                                dTotalAtsara100Cost = 0;
                            }
                            else
                            {
                                dAtsara100Input = double.Parse(txtAtsara100Input.Text);
                                dConvertedAtsara100Qty = double.Parse(txtAtsara100ConvserionSource.Text) * dAtsara100Input;
                                dTotalAtsara100Cost = dConvertedAtsara100Qty * double.Parse(txtAtsaraPriceAmount.Text);

                               
                            }

                            //ATSARA 160
                            if (string.IsNullOrEmpty(txtAtsara160Input.Text) || string.IsNullOrEmpty(txtAtsara160Input.Text))
                            {
                                dAtsara160Input = 0;
                                dConvertedAtsara160Qty = 0;
                                dTotalAtsara160Cost = 0;
                            }
                            else
                            {
                                dAtsara160Input = double.Parse(txtAtsara160Input.Text);
                                dConvertedAtsara160Qty = double.Parse(txtAtsara160ConvserionSource.Text) * dAtsara160Input;
                                dTotalAtsara160Cost = dConvertedAtsara160Qty * double.Parse(txtAtsaraPriceAmount.Text);


                            }

                          
                               
                                //Session["G_DRNUM"] = SeriesNum;
                           






                            if (dFreshInput == 0 && dFrozenInput == 0 && dLiempoInput == 0 && dLeegInput == 0 && dAtsara100Input == 0 && dAtsara160Input == 0)
                            {
                                //NO ACTION
                            }
                            else
                            {

                                //oTransaction.INSERT_DELIVERY_RECEIPT_TRANS_FINAL(SeriesNum, sBranchCode, 
                                // sFreshItemCode, sFrozenItemCode, sLiempoItemCode, sLeegItemCode,sAtsara100ItemCode,sAtsara160ItemCode,
                                // double.Parse(txtFreshConversionSource.Text), double.Parse(txtFrozenConversionSource.Text),double.Parse(txtLiempoConversionSource.Text), 
                                // double.Parse(txtLeegConvserionSource.Text), double.Parse(txtAtsara100ConvserionSource.Text), double.Parse(txtAtsara160ConvserionSource.Text),
                                // dFreshInput, dFrozenInput, dLiempoInput, dLeegInput, dAtsara100Input, dAtsara160Input,
                                // dConvertedFreshQty, dConvertedFrozenQty,dConvertedLiempoQty, dConvertedLeegQty, dConvertedAtsara100Qty, dConvertedAtsara160Qty,
                                // double.Parse(txtPartnerPriceAmount.Text), double.Parse(txtLiempoPriceAmount.Text), double.Parse(txtLeegPriceAmount.Text), double.Parse(txtAtsaraPriceAmount.Text),
                                // dTotalFresh, dTotalFrozen, dTotalLiempoCost, dTotalLeegCost, dTotalAtsara100Cost, dTotalAtsara160Cost,
                                // false, false, Convert.ToDateTime(txtSchedule.Text), txtRemarks.Text, Session["USER_CODE"].ToString(), sDriverName, sHelperName, sVehiclePlateNum);
                                //Update Series Number
                                //oSystem.UPDATE_SERIES_NUMBER("DR");

                                DisplayAreaList(Convert.ToDateTime(txtSchedule.Text));

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
                TextBox txtDriverName = row.FindControl("txtDriverName") as TextBox;
                TextBox txtHelperName = row.FindControl("txtHelperName") as TextBox;
                TextBox txtVehiclePlateNum = row.FindControl("txtVehiclePlate") as TextBox;

                if (checkDeliveryInfo(Convert.ToDateTime(txtSchedule.Text),sLACode))
                {
                    txtDriverName.Text = _sDriverName;
                    txtHelperName.Text = _sHelperName;
                    txtVehiclePlateNum.Text = _sVehicleNum;
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

                    TextBox txtPartnerPriceAmount = r.FindControl("txtPartnerPriceAmount") as TextBox;
                    TextBox txtLiempoPriceAmount = r.FindControl("txtLiempoPrice") as TextBox;
                    TextBox txtLeegPriceAmount = r.FindControl("txtLeegPrice") as TextBox;
                    TextBox txtAtsaraPriceAmount = r.FindControl("txtAtsaraPrice") as TextBox;

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
                          

                            txtTotalCost.Text = (_dTotalFreshPrice + _dTotalFrozenPrice + +_dTotalLiempoCost + _dTotalLeegCost + _dTotalAtsara100Cost + _dTotalAtsara160Cost).ToString();

                            txtFreshInput.Enabled = false;
                            txtFrozenInput.Enabled = false;
                            txtLiempoInput.Enabled = false;
                            txtLeegInput.Enabled = false;
                            txtAtsara100Input.Enabled = false;
                            txtAtsara160Input.Enabled = false;

                            lnkCancel.Visible = true;

                            txtRemarks.Text = _remarks;
                            txtRemarks.Enabled = false;

                            txtPartnerPriceAmount.Text = _dPartnerChickenPrice.ToString();
                            txtLiempoPriceAmount.Text = _dPartnerLiempoPrice.ToString();


                        }
                        else
                        {
                         txtFreshInput.Text = "0";
                         txtFrozenInput.Text = "0";
                         txtLiempoInput.Text = "0";
                         txtLeegInput.Text = "0";
                         txtAtsara100Input.Text = "0";
                         txtAtsara160Input.Text = "0";

                         txtFreshInput.Enabled = true;
                         txtFrozenInput.Enabled = true;
                         txtLiempoInput.Enabled = true;
                         txtLeegInput.Enabled = true;
                         txtAtsara100Input.Enabled = true;
                         txtAtsara160Input.Enabled = true;

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
            DataTable dt = oUtility.GET_PARTNER_PRICE_FINAL();
            DataRow[] dr = dt.Select("BranchCode ='" + ddBranchList.SelectedValue.ToString() + "'");

            if (dr.Length > 0)
            {
                        foreach (DataRow row in dr)
                        {
                            lblAPriceAmount.Text = row["PriceAmount"].ToString();
                            lblALiempoPrice.Text = row["LiempoPrice"].ToString();
                            lblALeegPrice.Text = row["LeegPrice"].ToString();
                            lblAAtsaraPrice.Text = row["AtsaraPrice"].ToString();
                        }
                 
                
              
            }

        }

        protected void lnkPrintDRSummary_Click(object sender, EventArgs e)
        {
            Session["G_DELIVERYDATE"] = txtSchedule.Text;
            PRINT_NOW("repDeliveryReceipt_Batch.aspx");
        }

        protected void lnkPrintSchedulePerArea_Click(object sender, EventArgs e)
        {
            Session["G_DELIVERYDATE"] = Convert.ToDateTime(txtSchedule.Text);
            PRINT_NOW("repDeliverySummaryList.aspx");
        }

     




    }
}