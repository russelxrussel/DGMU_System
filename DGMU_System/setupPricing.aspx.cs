using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class setupPricing : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayPriceList();
            }
        }

        protected void lnkCreateItem_Click(object sender, EventArgs e)
        {
            ViewState["ACTION"] = "ADD";

            //Text of Save Button
            btnCreateUpdate.Text = "SAVE";

            txtPriceCode.Enabled = true;

            lblActionTitle.Text = "Create New Price";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
        }

        private void DisplayPriceList()
        {
            DataTable dt = oUtility.GET_PRICE_LIST();

            gvPriceList.DataSource = dt;
            gvPriceList.DataBind();
           
        }

     
        protected void btnCreateUpdate_Click(object sender, EventArgs e)
        {

            if (ViewState["ACTION"].ToString() == "ADD")
            {
                //Check if PriceCode Exist
                if (!ItemExist(txtPriceCode.Text))
                {
                    oUtility.INSERT_PRICE(txtPriceCode.Text.ToUpper(), Convert.ToDouble(txtPriceAmount.Text), txtRemarks.Text, "------");

                    DisplayPriceList();
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
                oUtility.UPDATE_PRICE(txtPriceCode.Text, Convert.ToDouble(txtPriceAmount.Text), txtRemarks.Text, "------");
                DisplayPriceList();
                //Refresh the current web page  
                Response.Redirect(Request.RawUrl);
            }
        }

        private bool ItemExist(string _code)
        {
            bool x = false;

            DataTable dt = oUtility.GET_PRICE_LIST();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "PriceCode = '" + _code + "'";

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
            string sPriceCode = r.Cells[1].Text;

            DataTable dt = oUtility.GET_PRICE_LIST();

            DataRow[] dr;
            dr = dt.Select("PriceCode = '" + sPriceCode + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                    txtPriceCode.Text = row["PriceCode"].ToString();
                    txtPriceAmount.Text = row["PriceAmount"].ToString();
                    txtRemarks.Text = row["PriceDescription"].ToString();


                    txtPriceCode.Enabled = false;
                }

            }

            ViewState["ACTION"] = "MODIFY";
           
            //Text of Save Button
            btnCreateUpdate.Text = "Update";



            lblActionTitle.Text = "Modify Price - " + sPriceCode;

            //Will use as reference to update item.


            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
      
        }
    }
}