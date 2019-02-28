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
    public partial class repBeginning_Ending_Inventory_Summary : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        Utility_C oUtil = new Utility_C();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                txtStartDate.Text = DateTime.Now.ToShortDateString();

                DisplayStorageList();

                DisplayReport();
            }

           





        }


        private void DisplayStorageList()
        {
            DataTable dt = oUtil.GET_STORAGE_AREA_LIST();

            ddStorage.DataSource = dt;
            ddStorage.DataTextField = dt.Columns["StorageName"].ToString();
            ddStorage.DataValueField = dt.Columns["StorageCode"].ToString();
            ddStorage.DataBind();

            //ddStorage.Items.Insert(0, new ListItem("-- SELECT Supplier --"));
        }

        private void DisplayReport()
        {
            DateTime dtStartDate = Convert.ToDateTime(txtStartDate.Text);
            // DateTime dtEndDate = Convert.ToDateTime(txtEndDate.Text);

            //ParameterRangeValue myRangeValue = new ParameterRangeValue();
            //myRangeValue.StartValue = dtStartDate; //txtDateStart.Text;
            //myRangeValue.EndValue = dtEndDate;

            //Instantiate variables
            //ReportDocument reportDocument = new ReportDocument();
            //ParameterField paramField = new ParameterField();
            //ParameterFields paramFields = new ParameterFields();
            //ParameterDiscreteValue paramDiscreteValue = new ParameterDiscreteValue();

            ////Set instances for input parameter 1 -  @CustomerID
            //paramField.Name = "@DATE_SELECTED";


            //paramDiscreteValue.Value = dtStartDate;

            //paramField.CurrentValues.Add(paramDiscreteValue);
            //paramFields.Add(paramField);

            ////Add the paramField to paramFields
            //paramFields.Add(paramField);

            //CrystalReportViewer1.ParameterFieldInfo = paramFields;

            //string reportPath = Server.MapPath("~/Reports/Inventory_Opening_Ending_Stock.rpt");

            //reportDocument.Load(reportPath);

            //reportDocument.SetDatabaseLogon("sa", "p@ssw0rd");

            ////Load the report by setting the report source
            //CrystalReportViewer1.ReportSource = reportDocument;

            try
            {
                oReportDocument.Load(Server.MapPath("~/Reports/Inventory_Opening_Ending_Stock.rpt"));

                oReportDocument.SetParameterValue("@DATE_SELECTED", dtStartDate);
                oReportDocument.SetParameterValue("@STORAGECODE", ddStorage.SelectedValue.ToString());
                oReportDocument.SetParameterValue("StorageName", ddStorage.SelectedItem.ToString());
                oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd");

                CrystalReportViewer1.ReportSource = oReportDocument;
            }
            catch
            {

            }

        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();

        }

        protected void U_Print_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtStartDate.Text))
            {

                lblErrorPrompt.Text = "Input required.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>$('#msgErrorModal').modal('show');</script>", false);

            }
            else
            {
                DisplayReport();
            }
        }
    }
}