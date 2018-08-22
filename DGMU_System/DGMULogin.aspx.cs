using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DGMU_System
{
    public partial class DGMULogin : System.Web.UI.Page
    {
        System_C oSystem = new System_C();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["USER_CODE"] = "";
            Session["USER_NAME"] = "";
        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblDT.Text = oSystem.GET_SERVER_DATE_TIME().ToLongDateString() + " " + oSystem.GET_SERVER_DATE_TIME().ToLongTimeString();

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (oSystem.CHECK_USER(txtUserId.Text, txtPassword.Text))
            {
                Session["USER_CODE"] = oSystem._USERCODE;
                Session["USER_NAME"] = oSystem._USERNAME;

                Response.Redirect("~/Home.aspx");
               
            }
            else
            {

            }
        }
    }
}