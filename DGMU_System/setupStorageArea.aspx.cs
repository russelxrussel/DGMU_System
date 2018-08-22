using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class setupStorageArea : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayStorageAreaList();
            }
        }

        protected void lnkCreateItem_Click(object sender, EventArgs e)
        {

            ViewState["ACTION"] = "ADD";

            //Text of Save Button
            btnCreateUpdate.Text = "SAVE";

            txtStorageCode.Enabled = true;
            txtStorageCode.Text = "";
            txtStorageName.Text = "";
            txtDescription.Text = "";
            txtStorageCode.Focus();

            lblActionTitle.Text = "Create Storage Area";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
        }

        private void DisplayStorageAreaList()
        {
            DataTable dt = oUtility.GET_STORAGE_AREA_LIST();

            gvStorageArea.DataSource = dt;
            gvStorageArea.DataBind();
           
        }

     
        protected void btnCreateUpdate_Click(object sender, EventArgs e)
        {
          

            if (ViewState["ACTION"].ToString() == "ADD")
            {
                //Check if PriceCode Exist
                if (!ItemExist(txtStorageCode.Text))
                {
                    oUtility.INSERT_STORAGE_AREA(txtStorageCode.Text.ToUpper(), txtStorageName.Text.ToUpper(),txtDescription.Text, "------");

                    DisplayStorageAreaList();
                    //Refresh the current web page  
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "<script>alert('Price Code Already Exist.');</script>", false);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
                }
            }
            else
            {
                oUtility.UPDATE_STORAGE_AREA(txtStorageCode.Text.ToUpper(), txtStorageName.Text.ToUpper(), txtDescription.Text, "------");

                 DisplayStorageAreaList();
                //Refresh the current web page  
                Response.Redirect(Request.RawUrl);
            }
        }

        private bool ItemExist(string _code)
        {
            bool x = false;

            DataTable dt = oUtility.GET_STORAGE_AREA_LIST();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "StorageCode = '" + _code + "'";

            if (dv.Count > 0)
            {
                x = true;
            }
            else
            {
                x = false;
            }

            return x;
        }

        protected void btnEditItem_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            string sSTCode = r.Cells[2].Text;

            DataTable dt = oUtility.GET_STORAGE_AREA_LIST();

            DataRow[] dr;
            dr = dt.Select("StorageCode = '" + sSTCode + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {

                    txtStorageCode.Text = row["StorageCode"].ToString();
                    txtStorageName.Text = row["StorageName"].ToString();
                    txtDescription.Text = row["Remarks"].ToString();
                    txtStorageName.Focus();
                    txtStorageCode.Enabled = false;
                }

            }

            ViewState["ACTION"] = "MODIFY";
           
            //Text of Save Button
            btnCreateUpdate.Text = "Update";



            lblActionTitle.Text = "Modify Location - " + sSTCode;

            //Will use as reference to update item.


            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
      
        }
    }
}