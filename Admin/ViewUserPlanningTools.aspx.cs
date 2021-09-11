using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using CitySeva.Models;

namespace CitySeva.Admin
{
    public partial class ViewUserPlanningTools : System.Web.UI.Page
    {
        dllPlanningTool dllPlanningOBJ = new dllPlanningTool();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridPlanning();

            }
        }

        public void GridPlanning()
        {

            try
            {
                DataTable Dt = dllPlanningOBJ.GetPlanningToolsAlUsers();
                if (Dt.Rows.Count > 0)
                {
                    PlannigRpt.DataSource = Dt;
                    PlannigRpt.DataBind();
                }

            }
            catch (Exception ex)
            {

            }



        }
    }
}