using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class setupPartnerPrice : System.Web.UI.Page
    {
        Utility_C oUtility = new Utility_C();
        Partner_C oPartner = new Partner_C();
        Item_C oItem = new Item_C();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayPartnerPriceList();
                DisplayDropDownList();
            }
        }

        private void ClearInputs()
        {
            ddPartner.SelectedIndex = 0;
            ddPrice.SelectedIndex = 0;
            ddItem.SelectedIndex = 0;
            txtRemarks.Text = "";

            ddPartner.Enabled = true;
            ddItem.Enabled = true;
        }

        protected void lnkCreateItem_Click(object sender, EventArgs e)
        {
            ViewState["ACTION"] = "ADD";

            //Text of Save Button
            btnCreateUpdate.Text = "SAVE";

            ClearInputs();

            lblActionTitle.Text = "Create New Partner Price";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
        }

        private void DisplayPartnerPriceList()
        {
            DataTable dt = oUtility.GET_PARTNER_PRICE_LIST();

            gvPartnerPriceList.DataSource = dt;
            gvPartnerPriceList.DataBind();
        }

     
        protected void btnCreateUpdate_Click(object sender, EventArgs e)
        {
            if (ddPartner.SelectedIndex != 0 && ddItem.SelectedIndex != 0 && ddPrice.SelectedIndex != 0)
            {

                if (ViewState["ACTION"].ToString() == "ADD")
                {
                    //Check if PriceCode Exist
                    if (!ItemExist(ddPartner.SelectedValue.ToString(), ddItem.SelectedValue.ToString()))
                    {
                        oUtility.INSERT_PARTNER_PRICE(ddPartner.SelectedValue.ToString(), ddItem.SelectedValue.ToString(), ddPrice.SelectedValue.ToString(), txtRemarks.Text, "------");

                        DisplayPartnerPriceList();
                        //Refresh the current web page  
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "<script>alert('Partner and Item Already Exist.');</script>", false);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
                    }
                }
                else
                {
                    oUtility.UPDATE_PARTNER_PRICE(Convert.ToInt32(ViewState["PPID"]), ddPrice.SelectedValue.ToString(), txtRemarks.Text, "------");
                    
                    DisplayPartnerPriceList();
                    //Refresh the current web page  
                    Response.Redirect(Request.RawUrl);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert", "<script>alert('Input required.');</script>", false);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
                  
            }
        }

        private bool ItemExist(string _partnerCode, string _itemCode)
        {
            bool x = false;

            DataTable dt = oUtility.GET_PARTNER_PRICE_LIST();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "PartnerCode = '" + _partnerCode + "' and ItemCode='" + _itemCode + "'";

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

        protected void lnkEditItem_Click(object sender, EventArgs e)
        {
            //THIS WILL GET THE CELL VALUE OF SELECTED ROW IN GRIDVIEW VIA COMMAND WITHIN TEMPLATE FIELDS.
            var selEdit = (Control)sender;
            GridViewRow r = (GridViewRow)selEdit.NamingContainer;
            // string selAppNum = r.Cells[2].Text;
            int iPartnerPrice = Convert.ToInt32( r.Cells[1].Text);

            ViewState["PPID"] = iPartnerPrice;
            DataTable dt = oUtility.GET_PARTNER_PRICE_LIST();

            DataRow[] dr;
            dr = dt.Select("PPID = '" + iPartnerPrice + "'");

            if (dr.Length > 0)
            {
                //Will display the selected item info
                foreach (DataRow row in dr)
                {
                    ddPartner.SelectedValue = row["PartnerCode"].ToString();
                    ddItem.SelectedValue = row["ItemCode"].ToString();
                    ddPrice.SelectedValue = row["PriceCode"].ToString();
                    txtRemarks.Text = row["Description"].ToString();


                    ddPartner.Enabled = false;
                    ddItem.Enabled = false;
                }

            }

            ViewState["ACTION"] = "MODIFY";

            //Text of Save Button
            btnCreateUpdate.Text = "Update";
           



            lblActionTitle.Text = "Modify - " + iPartnerPrice.ToString();

            //Will use as reference to update item.


            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#ItemContainer').modal('show');</script>", false);
      
        }

        private void DisplayDropDownList()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartner.DataSource = dt;
            ddPartner.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartner.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartner.DataBind();

            ddPartner.Items.Insert(0, new ListItem("SELECT PARTNER"));

            //ITEM
            DataTable dtItem = oItem.GET_ITEM_DATA();


            ddItem.DataSource = dtItem;
            ddItem.DataTextField = dtItem.Columns["ItemName"].ToString();
            ddItem.DataValueField = dtItem.Columns["ItemCode"].ToString();
            ddItem.DataBind();

            ddItem.Items.Insert(0, new ListItem("SELECT ITEM"));

            //PRICE
            DataTable dtPrice = oUtility.GET_PRICE_LIST();
            ddPrice.DataSource = dtPrice;
            ddPrice.DataTextField = dtPrice.Columns["PriceAmount"].ToString();
            ddPrice.DataValueField = dtPrice.Columns["PriceCode"].ToString();
            ddPrice.DataBind();

            ddPrice.Items.Insert(0, new ListItem("SELECT PRICE"));
        }
    }
}