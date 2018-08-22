using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DGMU_System
{
    public partial class Branch_Sales : System.Web.UI.Page
    {

        Partner_C oPartner = new Partner_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayPartner();

            }
        }



        private void DisplayPartner()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartnerList.DataSource = dt;
            ddPartnerList.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartnerList.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartnerList.DataBind();

            ddPartnerList.Items.Insert(0, new ListItem("--SELECT PARTNER--"));
        }

        protected void lnkSet_Click(object sender, EventArgs e)
        {
            if (ddPartnerList.SelectedIndex != 0)
            {

            }
            else
            { 
            lblErrorMessage.Text = "Date and Partner required.";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);
            }
        }
    }
}