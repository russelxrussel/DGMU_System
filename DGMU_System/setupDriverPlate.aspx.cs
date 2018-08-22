using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    
    public partial class setupDriverPlate : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DISPLAY_DRIVER_LIST();
                DISPLAY_HELPER_LIST();
                DISPLAY_VEHICLE_LIST();

                Init_Action_Driver();
                Init_Action_Helper();
                Init_Action_Vehicle();
            }
        }

        protected void U_Save_Driver_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtDriverName.Text))
            {
                oUtility.UPDATE_DRIVER_DATA(Convert.ToInt32(lblDriverID.Text), txtDriverName.Text.ToUpper(), txtLicenseNumber.Text, chkStatus.Checked);
                
                Init_Action_Driver();
                DISPLAY_DRIVER_LIST();
                panelDriverInput.Enabled = false;
            }
         

        }

        private void Init_Action_Driver()
        {
            txtDriverName.Text = "";
            txtLicenseNumber.Text = "";
            chkStatus.Checked = true;
            lblDriverID.Text = "0";
        }

        private void Init_Action_Helper()
        {
            txtHelperName.Text = "";
            chkHelperStatus.Checked = true;
            lblHelperID.Text = "0";
        }

        private void Init_Action_Vehicle()
        {
            txtPlateNumber.Text = "";
            txtVehicleDescription.Text = "";
            txtLoadCapacity.Text = "0";
            lblPlateID.Text = "0";
        }

       

        private void DISPLAY_DRIVER_LIST()
        {
            DataTable dt = oUtility.GET_DRIVER_LIST();

            gvDriverList.DataSource = dt;
            gvDriverList.DataBind();
        }

        private void DISPLAY_HELPER_LIST()
        {
            DataTable dt = oUtility.GET_HELPER_LIST();

            gvHelperList.DataSource = dt;
            gvHelperList.DataBind();
        
        }

        private void DISPLAY_VEHICLE_LIST()
        {
            DataTable dt = oUtility.GET_VEHICLE_LIST();

            gvVehicleList.DataSource = dt;
            gvVehicleList.DataBind();
        }

        protected void lnkEditDriver_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            int iDriverID = Convert.ToInt32(r.Cells[0].Text);


            DataTable dt = oUtility.GET_DRIVER_LIST();

            DataRow[] dr;
            dr = dt.Select("DriverID = '" + iDriverID + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                    //DRIVER_ID = (int)row["DriverID"];
                    lblDriverID.Text = row["DriverID"].ToString();
                    txtDriverName.Text = row["DriverName"].ToString();
                    txtLicenseNumber.Text = row["LicenseNumber"].ToString();
                    chkStatus.Checked = (bool)row["Status"];
                }

                panelDriverInput.Enabled = true;
                txtDriverName.Focus();
            }
        }

        protected void lnkEditHelper_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            int iHelperID = Convert.ToInt32(r.Cells[0].Text);


            DataTable dt = oUtility.GET_HELPER_LIST();

            DataRow[] dr;
            dr = dt.Select("HelperID = '" + iHelperID + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                   lblHelperID.Text =  row["HelperID"].ToString();
                    txtHelperName.Text = row["HelperName"].ToString();
                    chkHelperStatus.Checked = (bool)row["Status"];
                }
                
                panelHelperInput.Enabled = true;
                txtHelperName.Focus();
            }
        }

        protected void lnkEditVehicle_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            int iPlateID = Convert.ToInt32(r.Cells[0].Text);


            DataTable dt = oUtility.GET_VEHICLE_LIST();

            DataRow[] dr;
            dr = dt.Select("PlateID = '" + iPlateID + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                    lblPlateID.Text = row["PlateID"].ToString();
                    txtPlateNumber.Text = row["PlateNumber"].ToString();
                    txtVehicleDescription.Text = row["VehicleDescription"].ToString();
                    txtLoadCapacity.Text = row["LoadCapacity"].ToString();
                }

                panelVehicleInput.Enabled = true;
                txtPlateNumber.Focus();
            }
        }

        protected void lnkNewDriver_Click(object sender, EventArgs e)
        {
            panelDriverInput.Enabled = true;
            Init_Action_Driver();
            txtDriverName.Focus();
        }

        protected void lnkNewHelper_Click(object sender, EventArgs e)
        {
            panelHelperInput.Enabled = true;
            txtHelperName.Focus();
            Init_Action_Helper();

        }

        protected void lnkSaveHelper_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtHelperName.Text))
            {
                oUtility.UPDATE_HELPER_DATA(Convert.ToInt32(lblHelperID.Text), txtHelperName.Text, chkHelperStatus.Checked);
                DISPLAY_HELPER_LIST();
                Init_Action_Helper();
                panelHelperInput.Enabled = false;
            }
        }

        protected void lnkNewVehicle_Click(object sender, EventArgs e)
        {
            panelVehicleInput.Enabled = true;
            txtPlateNumber.Focus();
            Init_Action_Vehicle();

        }

        protected void lnkSaveVehicle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtPlateNumber.Text) && !string.IsNullOrEmpty(txtVehicleDescription.Text))
            {
                oUtility.UPDATE_VEHICLE_DATA(Convert.ToInt32(lblPlateID.Text), txtPlateNumber.Text, txtVehicleDescription.Text, Convert.ToInt32(txtLoadCapacity.Text));
                DISPLAY_VEHICLE_LIST();
                Init_Action_Vehicle();
                panelVehicleInput.Enabled = false;
            }
        }
      
    }
}