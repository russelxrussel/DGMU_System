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
    public partial class repBranchDeliverySummary : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        Branch_C oBranch = new Branch_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtStartDate.Text = DateTime.Now.ToShortDateString();
                txtEndDate.Text = DateTime.Now.ToShortDateString();

                DisplayBranchList();
            }

            displayReport();
        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {

            //Cleaning Report Documents
            oReportDocument.Close();

        }

        private void DisplayBranchList()
        {
            DataTable dt = oBranch.GET_BRANCHES_DATA();

            ddBranchList.DataSource = dt;
            ddBranchList.DataTextField = dt.Columns["BranchName"].ToString();
            ddBranchList.DataValueField = dt.Columns["BranchCode"].ToString();
            ddBranchList.DataBind();

            ddBranchList.Items.Insert(0, new ListItem("-- SELECT BRANCH --"));
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
                    oReportDocument.Load(Server.MapPath("~/Reports/BranchDeliverySummary.rpt"));
                    oReportDocument.SetParameterValue("BranchCode", ddBranchList.SelectedValue.ToString());
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
            if (ddBranchList.SelectedIndex == 0 || string.IsNullOrEmpty(txtStartDate.Text) || string.IsNullOrEmpty(txtEndDate.Text))
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