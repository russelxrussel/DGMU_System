using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Home : System.Web.UI.Page
    {
        System_C oSystem = new System_C();
        Transaction_C oTransaction = new Transaction_C();
        Inventory_C oInventory = new Inventory_C();
        Item_C oItem = new Item_C();

        string _selectedItem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                //**** IMPORTANT *****
                //It Will get the previous ending stock and treat as Opening Stock
                //oSystem.PRE_INITIALIZE_ENDING_STOCK();
                //VERSION 2 --UPDATE CHANGE NOT INCLUDE ANYMORE. 02/19/2019

                oSystem.INITIALIZE_OPENING_ENDING_STOCK();

              //  lblDT.Text = oSystem.GET_SERVER_DATE_TIME().ToLongDateString();
                //lblDeliveryTextTitle.Text =  oSystem.GET_SERVER_DATE_TIME().ToShortDateString();
                txtSelectedDate.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString();
                //lblDT.Text =  DateTime.Now.ToString("hh:mm:ss tt");
                // DisplayDeliveryTemp();


                Display_Per_Storage_Stock();

              //SET DELIVERY DATE FOR TODAY
              // UpdateDeliveryStatusForToday();

                //DisplayDeliveryScheduleToday();

                //UPDATE ISSCHED TO TRUE OF PREVIOUS DAY
                oTransaction.UPDATE_DELIVERY_SCHEDULE_CLOSE();

                //Display Opening Stock and Running Stock
               // Display_Opening_Ending_Stock();
                
               //Display_Running_Item_Transaction();

               //Display_Storage_Stock();

                Display_Stat_Total();


              // Session["USER_CODE"] = "DGMU_DEBUGGER";




                // ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }

         
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
           // lblDT.Text = oSystem.GET_SERVER_DATE_TIME().ToLongDateString() + " - " + oSystem.GET_SERVER_DATE_TIME().ToLongTimeString();
            lblDT.Text = oSystem.GET_SERVER_DATE_TIME().ToShortDateString() + "-" + oSystem.GET_SERVER_DATE_TIME().ToLongTimeString();
        }

      

        private void DisplayDeliveryScheduleToday()
        {
           // DateTime dtoday = oSystem.GET_SERVER_DATE_TIME();

           // DataTable dt = oTransaction.GET_SCHEDULED_DELIVERY(oSystem.GET_SERVER_DATE_TIME().Date);
           // DataView dv = dt.DefaultView;

           
           //gvDeliverySchedule.DataSource = dv;
           //gvDeliverySchedule.DataBind();
        }

       
        private void Display_Delivery_Date_Today()
        {
            //DataTable dt = oTransaction.GET_DELIVERY_LIST();

            //gvDeliverySchedule.DataSource = dt;
            //gvDeliverySchedule.DataBind();
        }


        //private void Display_Running_Item_Transaction()
        //{
        //    DataTable dt = oItem.GET_ITEM_DATA();

        //    gvSourceItem.DataSource = dt;
        //    gvSourceItem.DataBind();


        //}

      

        private void Display_Storage_Stock()
        {
            DataTable dt = oInventory.GET_STORAGE_DATA();

            gvStorageStockStatus.DataSource = dt;
            gvStorageStockStatus.DataBind();
        }

        private void Display_Per_Storage_Stock()
        {
            DataTable dt = oTransaction.GET_STORAGE_STOCK_LIST();

            gvStorageStockList.DataSource = dt;
            gvStorageStockList.DataBind();
        }

        //VERSION 1
        //private void Display_Opening_Running_Stock()
        //{
        //    DataTable dt = oTransaction.GET_OPENING_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
             
        //    gvOpeningRunningStock.DataSource = dt;
        //    gvOpeningRunningStock.DataBind();
        //}

        //Version 2
        private void Display_Opening_Ending_Stock()
        {
            DataTable dt = oTransaction.GET_OPENING_ENDING_STOCK(oSystem.GET_SERVER_DATE_TIME());

            gvOpeningRunningStock.DataSource = dt;
            gvOpeningRunningStock.DataBind();
        }

        private void Display_Stat_Total()
        {
            //DataTable dt = oTransaction.GET_OPENING_ENDING_STOCK(oSystem.GET_SERVER_DATE_TIME());

            DateTime serverDate = Convert.ToDateTime(txtSelectedDate.Text);
            
            double openFresh = 0, openFrozen = 0, openLiempo = 0, openLeeg = 0, openAtsara100 = 0, openAtsara160 = 0;
            double currFresh = 0, currFrozen =0, currLiempo=0, currLeeg=0, currAtsara100 =0, currAtsara160=0;
            double inFresh = 0, inFrozen = 0, inLiempo = 0, inLeeg = 0, inAtsara100 = 0, inAtsara160 = 0;
            double outFresh = 0, outFrozen = 0, outLiempo = 0, outLeeg = 0, outAtsara100 = 0, outAtsara160 = 0;
            
            //Opening Stock Item
            openFresh = oTransaction.GET_OPENING_ALL_STORAGE_STOCK(serverDate, "ITM001");
            openFrozen = oTransaction.GET_OPENING_ALL_STORAGE_STOCK(serverDate, "ITM002");
            openLiempo = oTransaction.GET_OPENING_ALL_STORAGE_STOCK(serverDate, "ITM003");
            openLeeg = oTransaction.GET_OPENING_ALL_STORAGE_STOCK(serverDate, "ITM004");
            openAtsara100 = oTransaction.GET_OPENING_ALL_STORAGE_STOCK(serverDate, "ITM005");
            openAtsara160 = oTransaction.GET_OPENING_ALL_STORAGE_STOCK(serverDate, "ITM006");

            lblFreshOpening.Text = string.Format("{0:n0}", openFresh);
            lblFrozenOpening.Text = string.Format("{0:n0}", openFrozen);
            lblLiempoOpening.Text = string.Format("{0:n0}", openLiempo);
            lblLeegOpening.Text = string.Format("{0:n0}", openLeeg);
            lblAtsara100Opening.Text = string.Format("{0:n0}", openAtsara100);
            lblAtsara160Opening.Text = string.Format("{0:n0}", openAtsara160);

            //Current Stock
            currFresh = oTransaction.GET_STORAGE_ALL_STOCK_PER_DAY(serverDate, "ITM001");
            currFrozen = oTransaction.GET_STORAGE_ALL_STOCK_PER_DAY(serverDate, "ITM002");
            currLiempo = oTransaction.GET_STORAGE_ALL_STOCK_PER_DAY(serverDate, "ITM003");
            currLeeg = oTransaction.GET_STORAGE_ALL_STOCK_PER_DAY(serverDate, "ITM004");
            currAtsara100 = oTransaction.GET_STORAGE_ALL_STOCK_PER_DAY(serverDate, "ITM005");
            currAtsara160 = oTransaction.GET_STORAGE_ALL_STOCK_PER_DAY(serverDate, "ITM006");
            
            lblFreshTotalStock.Text = string.Format("{0:n0}", currFresh);
            lblFrozenTotalStock.Text = string.Format("{0:n0}", currFrozen);
            lblLiempoTotalStock.Text = string.Format("{0:n0}", currLiempo);
            lblLeeg.Text = string.Format("{0:n0}", currLeeg);
            lblAtsara100.Text = string.Format("{0:n0}", currAtsara100);
            lblAtsara160.Text = string.Format("{0:n0}", currAtsara160);

            //STOCK ITEM IN
            inFresh = oTransaction.GET_STORAGE_ALL_STOCK_IN_PER_DAY(serverDate, serverDate, "ITM001");
            inFrozen = oTransaction.GET_STORAGE_ALL_STOCK_IN_PER_DAY(serverDate, serverDate, "ITM002");
            inLiempo = oTransaction.GET_STORAGE_ALL_STOCK_IN_PER_DAY(serverDate, serverDate, "ITM003");
            inLeeg = oTransaction.GET_STORAGE_ALL_STOCK_IN_PER_DAY(serverDate, serverDate, "ITM004");
            inAtsara100 = oTransaction.GET_STORAGE_ALL_STOCK_IN_PER_DAY(serverDate, serverDate, "ITM005");
            inAtsara160 = oTransaction.GET_STORAGE_ALL_STOCK_IN_PER_DAY(serverDate, serverDate, "ITM006");

            lblFreshIn.Text = string.Format("{0:n0}", inFresh);
            lblFrozenIn.Text = string.Format("{0:n0}", inFrozen);
            lblLiempoIn.Text = string.Format("{0:n0}", inLiempo);
            lblLeegIn.Text = string.Format("{0:n0}", inLeeg);
            lblAtsara100In.Text = string.Format("{0:n0}", inAtsara100);
            lblAtsara160In.Text = string.Format("{0:n0}", inAtsara160);

            //STOCK ITEM OUT
            outFresh = oTransaction.GET_STORAGE_ALL_STOCK_OUT_PER_DAY(serverDate, serverDate, "ITM001");
            outFrozen = oTransaction.GET_STORAGE_ALL_STOCK_OUT_PER_DAY(serverDate, serverDate, "ITM002");
            outLiempo = oTransaction.GET_STORAGE_ALL_STOCK_OUT_PER_DAY(serverDate, serverDate, "ITM003");
            outLeeg = oTransaction.GET_STORAGE_ALL_STOCK_OUT_PER_DAY(serverDate, serverDate, "ITM004");
            outAtsara100 = oTransaction.GET_STORAGE_ALL_STOCK_OUT_PER_DAY(serverDate, serverDate, "ITM005");
            outAtsara160 = oTransaction.GET_STORAGE_ALL_STOCK_OUT_PER_DAY(serverDate, serverDate, "ITM006");

            lblFreshOut.Text = string.Format("{0:n0}", outFresh);
            lblFrozenOut.Text = string.Format("{0:n0}", outFrozen);
            lblLiempoOut.Text = string.Format("{0:n0}", outLiempo);
            lblLeegOut.Text = string.Format("{0:n0}", outLeeg);
            lblAtsara100Out.Text = string.Format("{0:n0}", outAtsara100);
            lblAtsara160Out.Text = string.Format("{0:n0}", outAtsara160);



            //DataRow[] rowsFresh = dt.Select("ItemCode = '" + "ITM001" + "'");
            //foreach (DataRow row in rowsFresh)
            //{
            //    int sin, sout = 0;

            //    sin = (int)row["Stock_In"];
            //    sout = (int)row["Stock_Out"];

            //    lblFreshIn.Text = string.Format("{0:n0}", sin);
            //    lblFreshOut.Text = string.Format("{0:n0}", sout);

            //}

            //DataRow[] rowsLiempo = dt.Select("ItemCode = '" + "ITM003" + "'");
            //foreach (DataRow row in rowsLiempo)
            //{
            //    int total, opening, sin, sout = 0;


            //    opening = (int)row["Opening"];
            //    sin = (int)row["Stock_In"];
            //    sout = (int)row["Stock_Out"];
            //    total = (int)row["Ending"];



            //    lblLiempoOpening.Text = string.Format("{0:n0}", opening);
            //    lblLiempoIn.Text = string.Format("{0:n0}", sin);
            //    lblLiempoOut.Text = string.Format("{0:n0}", sout);

            //    lblLiempoTotalStock.Text = string.Format("{0:n0}", total);

            //}

            //DataRow[] rowsLeeg = dt.Select("ItemCode = '" + "ITM004" + "'");
            //foreach (DataRow row in rowsLeeg)
            //{
            //    int total, opening, sin, sout = 0;


            //    opening = (int)row["Opening"];
            //    sin = (int)row["Stock_In"];
            //    sout = (int)row["Stock_Out"];
            //    total = (int)row["Ending"];



            //    lblLeegOpening.Text = string.Format("{0:n0}", opening);
            //    lblLeegIn.Text = string.Format("{0:n0}", sin);
            //    lblLeegOut.Text = string.Format("{0:n0}", sout);
            //    lblLeeg.Text = string.Format("{0:n0}", total);
            //}

            //DataRow[] rowsAtsara100 = dt.Select("ItemCode = '" + "ITM005" + "'");
            //foreach (DataRow row in rowsAtsara100)
            //{
            //    int total, opening, sin, sout = 0;


            //    opening = (int)row["Opening"];
            //    sin = (int)row["Stock_In"];
            //    sout = (int)row["Stock_Out"];
            //    total = (int)row["Ending"];



            //    lblAtsara100Opening.Text = string.Format("{0:n0}", opening);
            //    lblAtsara100In.Text = string.Format("{0:n0}", sin);
            //    lblAtsara100Out.Text = string.Format("{0:n0}", sout);
            //    lblAtsara100.Text = string.Format("{0:n0}", total);
            //}

            //DataRow[] rowsAtsara160 = dt.Select("ItemCode = '" + "ITM006" + "'");
            //foreach (DataRow row in rowsAtsara160)
            //{
            //    int total, opening, sin, sout = 0;


            //    opening = (int)row["Opening"];
            //    sin = (int)row["Stock_In"];
            //    sout = (int)row["Stock_Out"];
            //    total = (int)row["Ending"];



            //    lblAtsara160Opening.Text = string.Format("{0:n0}", opening);
            //    lblAtsara160In.Text = string.Format("{0:n0}", sin);
            //    lblAtsara160Out.Text = string.Format("{0:n0}", sout);
            //    lblAtsara160.Text = string.Format("{0:n0}", total);
            //}


        }

       //}

       
        protected void gvStorageStockList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //double soh = 0, opening = 0, deliver = 0, returned = 0, sales = 0, adjIn = 0, adjOut = 0, transIn = 0, transOut = 0, usage = 0;
            double openingStock = 0, stockIn=0, stockOut=0, branchReturn=0, pickUp=0, adjIn=0, adjOut=0, transIn=0, transOut=0, currentStock=0;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //DateTime dateMonth = Convert.ToDateTime(txtSelectDate.Text);
                //string branchCode = 

                DataRowView dr = (DataRowView)e.Row.DataItem;
                string storageCode = dr["storageCode"].ToString();
                string itemCode = dr["itemCode"].ToString();

                Label lblOpeningStock = (e.Row.FindControl("lblOpening") as Label);
                Label lblStockIn = (e.Row.FindControl("lblStockIn") as Label);
                Label lblStockOut = (e.Row.FindControl("lblStockOut") as Label);

                Label lblBranchReturn = (e.Row.FindControl("lblBranchReturn") as Label);
                Label lblPickUp = (e.Row.FindControl("lblPickUp") as Label);

                Label lblAdjIn = (e.Row.FindControl("lblAdjIn") as Label);
                Label lblAdjOut = (e.Row.FindControl("lblAdjOut") as Label);
                Label lblTransIn = (e.Row.FindControl("lblTransIn") as Label);
                Label lblTransOut = (e.Row.FindControl("lblTransOut") as Label);

                Label lblCurrentStock = (e.Row.FindControl("lblCurrentStock") as Label);

                DateTime dtSelectedDate = Convert.ToDateTime(txtSelectedDate.Text);

                openingStock = oTransaction.GET_OPENING_STOCK(dtSelectedDate, storageCode, itemCode);

                stockIn = oTransaction.GET_STOCK_IN_STOCK(dtSelectedDate, dtSelectedDate, storageCode, itemCode);
                stockOut = oTransaction.GET_STOCK_OUT_STOCK(dtSelectedDate, dtSelectedDate, storageCode, itemCode);
                branchReturn = oTransaction.GET_STOCK_BRANCH_RETURN(dtSelectedDate, dtSelectedDate, storageCode, itemCode);
                pickUp = oTransaction.GET_STOCK_PICK_UP(dtSelectedDate, dtSelectedDate, storageCode, itemCode);

                adjIn = oTransaction.GET_STOCK_ADJ_IN(dtSelectedDate, dtSelectedDate, storageCode, itemCode);
                adjOut = oTransaction.GET_STOCK_ADJ_OUT(dtSelectedDate, dtSelectedDate, storageCode, itemCode);

                transIn = oTransaction.GET_STOCK_TRANSFER_IN(dtSelectedDate, dtSelectedDate, storageCode, itemCode);
                transOut = oTransaction.GET_STOCK_TRANSFER_OUT(dtSelectedDate, dtSelectedDate, storageCode, itemCode);

                currentStock = (openingStock + stockIn + branchReturn + adjIn + transIn) -
                                (stockOut + pickUp + adjOut + transOut);

                lblOpeningStock.Text = string.Format("{0:n0}", openingStock);
                lblStockIn.Text = string.Format("{0:n0}", stockIn);
                lblStockOut.Text = string.Format("{0:n0}", stockOut);

                lblBranchReturn.Text = string.Format("{0:n0}", branchReturn);
                lblPickUp.Text = string.Format("{0:n0}", pickUp);

                lblAdjIn.Text = string.Format("{0:n0}", adjIn);
                lblAdjOut.Text = string.Format("{0:n0}", adjOut);
                lblTransIn.Text = string.Format("{0:n0}", transIn);
                lblTransOut.Text = string.Format("{0:n0}", transOut);

                lblCurrentStock.Text = string.Format("{0:n0}",currentStock);

               
            }
        }

        protected void imgFreshIn_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM001";
            lblItemNameIn.Text = "FRESH CHICKEN STOCK IN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + true + "'";

            if (dv.Count > 0)
            {
                gvRunningItemIn.DataSource = dv;
            }
            else
            {
                gvRunningItemIn.DataSource = null;
            }
            gvRunningItemIn.DataBind();
        }

        protected void imgFreshOut_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM001";
            lblItemNameOut.Text = "FRESH CHICKEN STOCK-OUT TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerOut').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + false + "'";


            if (dv.Count > 0)
            {
                gvRunningItemOut.DataSource = dv;
                          }
            else
            {
                gvRunningItemOut.DataSource = null;
               
            }

            gvRunningItemOut.DataBind();

        }

        protected void imgLiempoIn_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM003";
            lblItemNameIn.Text = "LIEMPO STOCK-IN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + true + "'";


            if (dv.Count > 0)
            {
                gvRunningItemIn.DataSource = dv;
            }
            else
            {
                gvRunningItemIn.DataSource = null;
            }
            gvRunningItemIn.DataBind();
        }

        protected void imgLiempoOut_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM003";
            lblItemNameOut.Text = "LIEMPO STOCK-OUT TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerOut').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + false + "'";


            if (dv.Count > 0)
            {
                gvRunningItemOut.DataSource = dv;
            }
            else
            {
                gvRunningItemOut.DataSource = null;
            }
            gvRunningItemOut.DataBind();
        }

        protected void imgAtsara100In_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM005";
            lblItemNameIn.Text = "ATSARA100 STOCK-IN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + true + "'";


            if (dv.Count > 0)
            {
                gvRunningItemIn.DataSource = dv;
            }
            else
            {
                gvRunningItemIn.DataSource = null;
            }
            gvRunningItemIn.DataBind();
        }

        protected void imgAtsara100Out_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM005";
            lblItemNameOut.Text = "ATSARA100 STOCK-OUT TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerOut').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + false + "'";


            if (dv.Count > 0)
            {
                gvRunningItemOut.DataSource = dv;
            }
            else
            {
                gvRunningItemOut.DataSource = null;
            }
            gvRunningItemOut.DataBind();
        }

        protected void imgFrozenIn_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM002";
            lblItemNameIn.Text = "FROZEN CHICKEN STOCK-IN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + true + "'";


            if (dv.Count > 0)
            {
                gvRunningItemIn.DataSource = dv;
            }
            else
            {
                gvRunningItemIn.DataSource = null;
            }
            gvRunningItemIn.DataBind();

        }

        protected void imgFrozenOut_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM002";
            lblItemNameOut.Text = "FROZEN CHICKEN STOCK-OUT TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerOut').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + false + "'";


            if (dv.Count > 0)
            {
                gvRunningItemOut.DataSource = dv;
            }
            else
            {
                gvRunningItemOut.DataSource = null;
            }
            gvRunningItemOut.DataBind();
        }

        protected void imgLeegIn_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM004";
            lblItemNameIn.Text = "LEEG STOCK-IN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + true + "'";


            if (dv.Count > 0)
            {
                gvRunningItemIn.DataSource = dv;
            }
            else
            {
                gvRunningItemIn.DataSource = null;
            }
            gvRunningItemIn.DataBind();
        }

        protected void imgLeegOut_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM004";
            lblItemNameOut.Text = "LEEG STOCK-OUT TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerOut').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + false + "'";


            if (dv.Count > 0)
            {
                gvRunningItemOut.DataSource = dv;
            }
            else
            {
                gvRunningItemOut.DataSource = null;
            }
            gvRunningItemOut.DataBind();
        }

        protected void imgAtsara160In_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM006";
            lblItemNameIn.Text = "ATSARA160 STOCK-IN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + true + "'";


            if (dv.Count > 0)
            {
                gvRunningItemIn.DataSource = dv;
            }
            else
            {
                gvRunningItemIn.DataSource = null;
            }
            gvRunningItemIn.DataBind();
        }

        protected void imgAtsara160Out_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM006";
            lblItemNameOut.Text = "ATSARA160 STOCK-OUT TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainerIn').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(Convert.ToDateTime(txtSelectedDate.Text));
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "' and InvTypeOperation= '" + false + "'";


            if (dv.Count > 0)
            {
                gvRunningItemOut.DataSource = dv;
            }
            else
            {
                gvRunningItemOut.DataSource = null;
            }
            gvRunningItemOut.DataBind();

        }

        protected void lnkReviewStock_Click(object sender, EventArgs e)
        {
            //Display storage stock movement in particular date.
            Display_Per_Storage_Stock();

            //Display all Storage Stock
            Display_Stat_Total();
        }
    }
}