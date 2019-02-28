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
    public partial class repBranchSalesSummaryFinal : System.Web.UI.Page
    {
        ReportDocument oReportDocument = new ReportDocument();
        Utility_C oUtil = new Utility_C();
        Branch_C oBranch = new Branch_C();
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                txtStartDate.Text = DateTime.Now.ToShortDateString();
                txtEndDate.Text = DateTime.Now.ToShortDateString();

                DisplayBranchList();

                DisplayReport();
            }

           





        }


        private void DisplayBranchList()
        {
            DataView dv = oBranch.GET_BRANCHES_DATA().DefaultView;
            dv.Sort = "BranchName";

            ddBranchList.DataSource = dv;
            ddBranchList.DataTextField = dv.Table.Columns["BranchName"].ToString();
            ddBranchList.DataValueField = dv.Table.Columns["BranchCode"].ToString();
            ddBranchList.DataBind();

            ddBranchList.Items.Insert(0, new ListItem("-- SELECT Branch --"));
        }

        private void DisplayReport()
        {
            DateTime dtStartDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime dtEndDate = Convert.ToDateTime(txtEndDate.Text);

            ParameterRangeValue myRangeValue = new ParameterRangeValue();
            myRangeValue.StartValue = dtStartDate;
            myRangeValue.EndValue = dtEndDate;


            //try
            //{
            if (ddBranchList.SelectedIndex == 0)
            {
                oReportDocument.Load(Server.MapPath("~/Reports/BranchSalesSummary_Final.rpt"));
            }
            else
            {
                oReportDocument.Load(Server.MapPath("~/Reports/BranchSalesSummary_PerBranch_Final.rpt"));
                oReportDocument.SetParameterValue("BranchCode", ddBranchList.SelectedValue);
            }
            oReportDocument.SetParameterValue("DateRange", myRangeValue);
                //oReportDocument.SetParameterValue("@STORAGECODE", ddStorage.SelectedValue.ToString());
                //oReportDocument.SetParameterValue("StorageName", ddStorage.SelectedItem.ToString());
                oReportDocument.SetDatabaseLogon("sa", "p@ssw0rd");

                CrystalReportViewer1.ReportSource = oReportDocument;
            //}
            //catch
            //{

            //}

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