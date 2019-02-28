using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace DGMU_System
{
    public partial class repDeliverySummaryList : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();

       
        private void Page_Init(object sender, EventArgs e)
        {
            oReportDocument.Load(Server.MapPath("~/Reports/DeliveryScheduleList_Reciept_Final_V2.rpt"));

            oReportDocument.SetParameterValue("Trip2", Convert.ToBoolean(Session["G_ISTRIP2"]));
            oReportDocument.SetParameterValue("DeliveryDate", Convert.ToDateTime(Session["G_DELIVERYDATE"])); // Set Parameter
            oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd"); // Supply user credentials
            CrystalReportViewer1.ReportSource = oReportDocument;
        }

        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();

        }
    }
}