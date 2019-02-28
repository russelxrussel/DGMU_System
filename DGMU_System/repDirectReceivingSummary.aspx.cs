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
    public partial class repDirectReceivingSummary : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        Branch_C oBranch = new Branch_C();
        Supplier_C oSupplier = new Supplier_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtStartDate.Text = DateTime.Now.ToShortDateString();
                txtEndDate.Text = DateTime.Now.ToShortDateString();

                DisplaySupplierList();
            }

            displayReport();
        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();

        }

        private void DisplaySupplierList()
        {
            DataTable dt = oSupplier.GET_SUPPLIERS_DATA();

            ddSupplierList.DataSource = dt;
            ddSupplierList.DataTextField = dt.Columns["SupplierName"].ToString();
            ddSupplierList.DataValueField = dt.Columns["SupplierCode"].ToString();
            ddSupplierList.DataBind();

            ddSupplierList.Items.Insert(0, new ListItem("-- SELECT Supplier --"));
        }


        private void displayReport()
        {
            DateTime dtStartDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime dtEndDate = Convert.ToDateTime(txtEndDate.Text);

            ParameterRangeValue myRangeValue = new ParameterRangeValue();
            myRangeValue.StartValue = dtStartDate; //txtDateStart.Text;
            myRangeValue.EndValue = dtEndDate;
            
                try
                {
                if (ddSupplierList.SelectedIndex > 0)
                {
                    oReportDocument.Load(Server.MapPath("~/Reports/Direct_Receive_Supplier_Summary.rpt"));
                    oReportDocument.SetParameterValue("SupplierCode", ddSupplierList.SelectedValue.ToString());
                    
                }
                else
                {
                    oReportDocument.Load(Server.MapPath("~/Reports/Direct_Receive_Summary.rpt"));
                }

                oReportDocument.SetParameterValue("DateRange", myRangeValue);
                oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd"); 

                CrystalReportViewer1.ReportSource = oReportDocument;
                }
                catch
                {

                }

            

        }

        protected void U_Print_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtStartDate.Text) || string.IsNullOrEmpty(txtEndDate.Text))
            {

                lblErrorPrompt.Text = "Input required.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }
            else
            {
                displayReport();
            }
        }
    }
}