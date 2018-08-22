using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class setupLocationArea : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayLocationAreaList();
            }
        }

        protected void lnkCreateItem_Click(object sender, EventArgs e)
        {
            ViewState["ACTION"] = "ADD";

            //Text of Save Button
            btnCreateUpdate.Text = "SAVE";

            txtLocationAreaCode.Enabled = true;

            lblActionTitle.Text = "Create Location Area";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
        }

        private void DisplayLocationAreaList()
        {
            DataTable dt = oUtility.GET_LOCATION_AREA_LIST();

            gvLocationArea.DataSource = dt;
            gvLocationArea.DataBind();
           
        }

     
        protected void btnCreateUpdate_Click(object sender, EventArgs e)
        {

            if (ViewState["ACTION"].ToString() == "ADD")
            {
                //Check if PriceCode Exist
                if (!ItemExist(txtLocationAreaCode.Text))
                {
                    oUtility.INSERT_LOCATION_AREA(txtLocationAreaCode.Text.ToUpper(), txtLocationName.Text.ToUpper(), "------");

                    DisplayLocationAreaList();
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
                oUtility.UPDATE_LOCATION_AREA(txtLocationAreaCode.Text.ToUpper(), txtLocationName.Text.ToUpper(), "------");
                DisplayLocationAreaList();
                //Refresh the current web page  
                Response.Redirect(Request.RawUrl);
            }
        }

        private bool ItemExist(string _code)
        {
            bool x = false;

            DataTable dt = oUtility.GET_LOCATION_AREA_LIST();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "LACode = '" + _code + "'";

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
            string sLACode = r.Cells[2].Text;

            DataTable dt = oUtility.GET_LOCATION_AREA_LIST();

            DataRow[] dr;
            dr = dt.Select("LACode = '" + sLACode + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {

                    txtLocationAreaCode.Text = row["LACode"].ToString();
                    txtLocationName.Text = row["LAName"].ToString();
                   

                    txtLocationAreaCode.Enabled = false;
                }

            }

            ViewState["ACTION"] = "MODIFY";
           
            //Text of Save Button
            btnCreateUpdate.Text = "Update";



            lblActionTitle.Text = "Modify Location - " + sLACode;

            //Will use as reference to update item.


            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
      
        }
    }
}