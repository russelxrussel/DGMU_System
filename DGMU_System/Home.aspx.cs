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
                //VERSION 2
                oSystem.INITIALIZE_OPENING_ENDING_STOCK();

              //  lblDT.Text = oSystem.GET_SERVER_DATE_TIME().ToLongDateString();
                lblDeliveryTextTitle.Text =  oSystem.GET_SERVER_DATE_TIME().ToShortDateString();
                
                //lblDT.Text =  DateTime.Now.ToString("hh:mm:ss tt");
               // DisplayDeliveryTemp();
                
              
             
              //SET DELIVERY DATE FOR TODAY
              // UpdateDeliveryStatusForToday();

               //DisplayDeliveryScheduleToday();

              //UPDATE ISSCHED TO TRUE OF PREVIOUS DAY
               oTransaction.UPDATE_DELIVERY_SCHEDULE_CLOSE();

                //Display Opening Stock and Running Stock
                Display_Opening_Ending_Stock();
                
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
            DataTable dt = oTransaction.GET_OPENING_ENDING_STOCK(oSystem.GET_SERVER_DATE_TIME());

            DataRow[] rowsFresh = dt.Select("ItemCode = '" + "ITM001" + "'");
            foreach (DataRow row in rowsFresh)
            {
                int total, opening, sin, sout = 0;

               
                opening = (int)row["Opening"];
                sin = (int)row["Stock_In"];
                sout = (int)row["Stock_Out"];
                total = (int) row["Ending"];


                lblFreshOpening.Text = string.Format("{0:n0}", opening);
                lblFreshIn.Text = string.Format("{0:n0}", sin);
                lblFreshOut.Text = string.Format("{0:n0}", sout);
                lblFreshTotalStock.Text = string.Format("{0:n0}", total);
                
            }

            DataRow[] rowsFrozen = dt.Select("ItemCode = '" + "ITM002" + "'");
            foreach (DataRow row in rowsFrozen)
            {
                int total, opening, sin, sout = 0;
                opening = (int)row["Opening"];
                sin = (int)row["Stock_In"];
                sout = (int)row["Stock_Out"];
                total = (int)row["Ending"];

                
                lblFrozenOpening.Text = string.Format("{0:n0}", opening);
                lblFrozenIn.Text = string.Format("{0:n0}", sin);
                lblFrozenOut.Text = string.Format("{0:n0}", sout);
                lblFrozenTotalStock.Text = string.Format("{0:n0}", total);
            }

            DataRow[] rowsLiempo = dt.Select("ItemCode = '" + "ITM003" + "'");
            foreach (DataRow row in rowsLiempo)
            {
                int total, opening, sin, sout = 0;


                opening = (int)row["Opening"];
                sin = (int)row["Stock_In"];
                sout = (int)row["Stock_Out"];
                total = (int)row["Ending"];


                
                lblLiempoOpening.Text = string.Format("{0:n0}", opening);
                lblLiempoIn.Text = string.Format("{0:n0}", sin);
                lblLiempoOut.Text = string.Format("{0:n0}", sout);
           
                lblLiempoTotalStock.Text = string.Format("{0:n0}", total);

            }

            DataRow[] rowsLeeg = dt.Select("ItemCode = '" + "ITM004" + "'");
            foreach (DataRow row in rowsLeeg)
            {
                int total, opening, sin, sout = 0;


                opening = (int)row["Opening"];
                sin = (int)row["Stock_In"];
                sout = (int)row["Stock_Out"];
                total = (int)row["Ending"];



                lblLeegOpening.Text = string.Format("{0:n0}", opening);
                lblLeegIn.Text = string.Format("{0:n0}", sin);
                lblLeegOut.Text = string.Format("{0:n0}", sout);
                lblLeeg.Text = string.Format("{0:n0}", total);
            }

            DataRow[] rowsAtsara100 = dt.Select("ItemCode = '" + "ITM005" + "'");
            foreach (DataRow row in rowsAtsara100)
            {
                int total, opening, sin, sout = 0;


                opening = (int)row["Opening"];
                sin = (int)row["Stock_In"];
                sout = (int)row["Stock_Out"];
                total = (int)row["Ending"];



                lblAtsara100Opening.Text = string.Format("{0:n0}", opening);
                lblAtsara100In.Text = string.Format("{0:n0}", sin);
                lblAtsara100Out.Text = string.Format("{0:n0}", sout);
                lblAtsara100.Text = string.Format("{0:n0}", total);
            }

            DataRow[] rowsAtsara160 = dt.Select("ItemCode = '" + "ITM006" + "'");
            foreach (DataRow row in rowsAtsara160)
            {
                int total, opening, sin, sout = 0;


                opening = (int)row["Opening"];
                sin = (int)row["Stock_In"];
                sout = (int)row["Stock_Out"];
                total = (int)row["Ending"];



                lblAtsara160Opening.Text = string.Format("{0:n0}", opening);
                lblAtsara160In.Text = string.Format("{0:n0}", sin);
                lblAtsara160Out.Text = string.Format("{0:n0}", sout);
                lblAtsara160.Text = string.Format("{0:n0}", total);
            }


        }

       //}

       

        protected void btnFresh_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM001";
            lblItemName.Text = "FRESH CHICKEN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "'";


            gvRunningItem.DataSource = dv;
            gvRunningItem.DataBind();

        }

        protected void btnLiempo_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM003";
            lblItemName.Text = "LIEMPO TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "'";


            gvRunningItem.DataSource = dv;
            gvRunningItem.DataBind();
        }

        protected void btnAtsara100_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM005";
            lblItemName.Text = "ATSARA 100 TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "'";


            gvRunningItem.DataSource = dv;
            gvRunningItem.DataBind();
        }

        protected void btnFrozen_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM002";
            lblItemName.Text = "FROZEN CHICKEN TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "'";


            gvRunningItem.DataSource = dv;
            gvRunningItem.DataBind();
        }

        protected void btnLeeg_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM004";
            lblItemName.Text = "LEEG TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "'";


            gvRunningItem.DataSource = dv;
            gvRunningItem.DataBind();
        }

        protected void btnAtsara160_Click(object sender, ImageClickEventArgs e)
        {
            _selectedItem = "ITM006";
            lblItemName.Text = "ATSARA 160 TRANSACTION HISTORY";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);

            DataTable dt = oTransaction.GET_ITEM_RUNNING_STOCK(oSystem.GET_SERVER_DATE_TIME());
            DataView dv = dt.DefaultView;

            dv.RowFilter = "ItemCode = '" + _selectedItem + "'";


            gvRunningItem.DataSource = dv;
            gvRunningItem.DataBind();
        }
        //}
    }
}