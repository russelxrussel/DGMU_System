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
    public partial class repPartnerDeliverySummary : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        ReportDocument oReportDocument2 = new ReportDocument();
        Partner_C oPartner = new Partner_C();

      
        protected void Page_Init(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            txtStartDate.Text = DateTime.Now.ToShortDateString();
            txtEndDate.Text = DateTime.Now.ToShortDateString();

            DisplayPartnerList();
            //}

            displayReport();
        }

        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();
            oReportDocument2.Close();

        }

        private void DisplayPartnerList()
        {
            DataTable dt = oPartner.GET_PARTNERS_DATA();

            ddPartnerList.DataSource = dt;
            ddPartnerList.DataTextField = dt.Columns["PartnerName"].ToString();
            ddPartnerList.DataValueField = dt.Columns["PartnerCode"].ToString();
            ddPartnerList.DataBind();

            ddPartnerList.Items.Insert(0, new ListItem("-- ALL --"));
        }


        private void displayReport()
        {
            DateTime dtStartDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime dtEndDate = Convert.ToDateTime(txtEndDate.Text);

            ParameterRangeValue myRangeValue = new ParameterRangeValue();
            myRangeValue.StartValue = dtStartDate; //txtDateStart.Text;
            myRangeValue.EndValue = dtEndDate;



            //This will display specific supplier transaction only
            //oReportDocument.Load(Server.MapPath("~/Reports/PartnerDeliverySummary.rpt"));
            //oReportDocument2.Load(Server.MapPath("~/Reports/PartnerSOASummary.rpt"));
            try
            {
                if (ddPartnerList.SelectedIndex == 0)
                {
                    oReportDocument2.Load(Server.MapPath("~/Reports/DeliverySummary_Partners_ALL.rpt"));

                    //oReportDocument2.SetParameterValue("PartnerCode", ddPartnerList.SelectedValue.ToString());
                    oReportDocument2.SetParameterValue("DateRange", myRangeValue);
                    oReportDocument2.SetDatabaseLogon("sa", "p@ssw0rd"); // Supply user credentials

                    CrystalReportViewer1.ReportSource = oReportDocument2;
                }
                else
                {
                    oReportDocument.Load(Server.MapPath("~/Reports/DeliverySummary_Partners.rpt"));

                    oReportDocument.SetParameterValue("PartnerCode", ddPartnerList.SelectedValue.ToString());
                    oReportDocument.SetParameterValue("DateRange", myRangeValue);
                    oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd"); // Supply user credentials

                    CrystalReportViewer1.ReportSource = oReportDocument;
                }
                //oReportDocument2.SetParameterValue("PartnerCode", ddPartnerList.SelectedValue.ToString());
                //oReportDocument2.SetParameterValue("DateRange", myRangeValue);
                //oReportDocument2.SetDatabaseLogon("sa", "p@ssw0rd"); // Supply user credentials

                //CrystalReportViewer2.ReportSource = oReportDocument2;
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