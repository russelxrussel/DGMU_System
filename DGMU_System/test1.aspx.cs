using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DGMU_System
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Timer1_Tick(sender, e);
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // lblDT.Text = oSystem.GET_SERVER_DATE_TIME().ToLongDateString() + " - " + oSystem.GET_SERVER_DATE_TIME().ToLongTimeString();
            lblDT.Text = DateTime.Now.ToString("hh:mm:ss tt");
        }
    }
}