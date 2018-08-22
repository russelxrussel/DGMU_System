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
    public partial class repDeliveryReceipt_Batch : System.Web.UI.Page
    {

        ReportDocument oReportDocument = new ReportDocument();

        protected void Page_Init(object sender, EventArgs e)
        {
            oReportDocument.Load(Server.MapPath("~/Reports/DeliveryReceipt_Final.rpt"));
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