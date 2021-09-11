using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitySeva.Models;

namespace CitySeva
{
    public partial class UserPlanningTools : System.Web.UI.Page
    {
        dllPlanningTool planningToolOBJ = new dllPlanningTool();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindPlanningTool();
            }
        }



        private void BindPlanningTool()
        {
            int userID = clsMain.getLoggedUserID();
            DataTable dt = planningToolOBJ.GetToolsUserById(userID);
            if (dt.Rows.Count > 0)
            {
                PlanningRpt.DataSource = dt;
                PlanningRpt.DataBind();

            }

        }
    }
}