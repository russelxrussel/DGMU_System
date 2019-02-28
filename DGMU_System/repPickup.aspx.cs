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
    public partial class repPickup : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        Supplier_C oSupplier = new Supplier_C();
        Transaction_C oTransaction = new Transaction_C();

        protected void Page_Load(object sender, EventArgs e)
        {
           
                displayReport();
           
        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();

        }

 

    

        private void displayReport()
        {
         
                //This will display specific supplier transaction only
                oReportDocument.Load(Server.MapPath("~/Reports/DeliveryPickUp.rpt"));
                try
                {
                    oReportDocument.SetParameterValue("PTNum", Session["S_PTNNUM"].ToString());
                    oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd"); // Supply user credentials

                    CrystalReportViewer1.ReportSource = oReportDocument;
                }
                catch
                {

                }

            

        }

     
    }
}