using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;

namespace DGMU_System
{
    public partial class repCheckPayment : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        Supplier_C oSupplier = new Supplier_C();
        Transaction_C oTransaction = new Transaction_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                DisplayPartnerList();
            }

           //displayReport();
        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();

        }

        private void DisplayPartnerList()
        {
            DataTable dt = oSupplier.GET_SUPPLIERS_DATA();

            ddSupplier.DataSource = dt;
            ddSupplier.DataTextField = dt.Columns["SupplierName"].ToString();
            ddSupplier.DataValueField = dt.Columns["SupplierCode"].ToString();
            ddSupplier.DataBind();

            ddSupplier.Items.Insert(0, new ListItem("-- SELECT SUPPLIER--"));
        }

        private void DisplayVoucherList(string _partnerCode)
        {
            DataTable dt = oTransaction.GET_SUPPLIER_VOUCHER_HDR();
            DataView dv = dt.DefaultView;

            dv.RowFilter = "SupplierCode = '" + _partnerCode + "'";

            if (dv.Count > 0)
            {
                ddVoucher.DataSource = dv;
                ddVoucher.DataTextField = dv.Table.Columns["VoucherNum"].ToString();
                ddVoucher.DataValueField = dv.Table.Columns["VoucherNum"].ToString();
                ddVoucher.DataBind();
            }

        }

        private void displayReport()
        {
         
                //This will display specific supplier transaction only
                oReportDocument.Load(Server.MapPath("~/Reports/CheckPayment.rpt"));
                try
                {
                    oReportDocument.SetParameterValue("VoucherNum", ddVoucher.SelectedValue.ToString());
                    oReportDocument.SetParameterValue("ChequeDate", Convert.ToDateTime(txtDateCheck.Text).ToShortDateString());
                    oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd"); // Supply user credentials

                    CrystalReportViewer1.ReportSource = oReportDocument;
                }
                catch
                {

                }

            

        }

        protected void U_Print_Click(object sender, EventArgs e)
        {
            if (ddSupplier.SelectedIndex == 0 || string.IsNullOrEmpty(txtDateCheck.Text))
            {

                lblErrorPrompt.Text = "Input required.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }
            else
            {
                displayReport(); 
            }
        }

        protected void ddPartnerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddSupplier.SelectedIndex != 0)
            {
                DisplayVoucherList(ddSupplier.SelectedValue.ToString());
            }
        }
    }
}