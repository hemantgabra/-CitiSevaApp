using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitySeva.Models;
using System.Data;
namespace CitySeva
{
    public partial class Checklist : System.Web.UI.Page
    {
        dllPlanningTool planningTool = new dllPlanningTool();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {

            DataTable dt = planningTool.GetAllToolsUser();
            if (dt.Rows.Count > 0)
            {
                dataList1.DataSource = dt;
                dataList1.DataBind();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (HttpContext.Current.Session["UserInfo"] == null)
            {
                HttpContext.Current.Session["UserInfo"] =null;
                Session.Abandon();
                Response.Redirect("login.aspx",true);
            }

            else
            {

                string strPlanningToos = "";
                for (int i = 0; i < dataList1.Items.Count - 1; i++)
                {
                    CheckBox chb = (CheckBox)dataList1.Items[i].FindControl("checkboxtools");
                    if (chb.Checked == true)
                    {
                        strPlanningToos += dataList1.DataKeys[i].ToString() + ",";

                    }
                }
                if (!string.IsNullOrEmpty(strPlanningToos))
                {
                    string userId = clsMain.getLoggedUserID().ToString();
                    strPlanningToos = strPlanningToos.Substring(0, strPlanningToos.Length - 1);
                    string result = planningTool.UserPlanningToolSave(userId, strPlanningToos);
                    if (result == "1")
                    {
                        // ShowMessage("Planning tools added succssfully");
                        lblmessage.Text = " Planning tools added succssfully";
                    }
                    else
                    {
                        //ShowMessage("Planning tools not added");
                        lblmessage.Text = "Planning tools not added";
                    }

                }
                else
                {
                    //ShowMessage("Please select any one Planning tools");
                    lblmessage.Text = "Please select any one Planning tools";
                }
            }
        }

        void ShowMessage(string msg)
        {
           
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }
    }
}