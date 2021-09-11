using CitySeva.Models;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitySeva.Admin
{
    public partial class AddPlanningTool : System.Web.UI.Page
    {
        dllPlanningTool obj_dllPlanningTool = new dllPlanningTool();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Grid();
                btnUpdate.Visible = false;
                btn_Add.Visible = true;
            }
        }

        public void Grid()
        {

           
                DataTable Dt = obj_dllPlanningTool.GetAllTools();
                if (Dt.Rows.Count > 0)
                {
                    PlanningTools.DataSource = Dt;
                    PlanningTools.DataBind();
                }

              
           


        }

        

        protected void PlanningtoolsRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {

                int catID = Convert.ToInt32(e.CommandArgument);
                DataTable dt = obj_dllPlanningTool.GetToolsById(catID);
                if (dt.Rows.Count > 0)
                {
                    txt_toolname.Text = dt.Rows[0]["tool_name"].ToString();
                    txt_tooldescription.Text= dt.Rows[0]["tool_description"].ToString();
                    hidUpdatevalue.Value = dt.Rows[0]["tool_id"].ToString();
                    btnUpdate.Visible = true;
                    btn_Add.Visible = false;
                }

            }
            if (e.CommandName == "Delete")
            {
                int catID = Convert.ToInt32(e.CommandArgument);
                string result = obj_dllPlanningTool.DeleteTools(catID);
                if (result == "1")
                {
                    Grid();
                    lblmsg.Text = "<span style='color:green;'>Tools Delete</span>";
                }
                else
                {
                    lblmsg.Text = "<span style='color:red;'>Tools not Delete</span>";
                }
            }

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {

           
                if (Page.IsValid)
                {
                if (string.IsNullOrEmpty(txt_toolname.Text))
                {
                }

                else if (string.IsNullOrEmpty(txt_tooldescription.Text))
                {
                }
                else
                {

                    string result = obj_dllPlanningTool.AddTools("0", txt_toolname.Text.Trim(), txt_tooldescription.Text.Trim(), "", chk_active.Checked);
                    if (result == "1")
                    {
                        Grid();
                        ClearFiled();

                        lblmsg.Text = "<span style='color:green;'>Planning Tool Added</span>";

                    }
                    else
                    {
                        lblmsg.Text = "<span style='color:red;'>Tool not Added</span>";
                    }
                }
                }
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (string.IsNullOrEmpty(txt_toolname.Text))
                { }
                
                else if (string.IsNullOrEmpty(txt_tooldescription.Text))
                { }
                else
                {
                    string result = obj_dllPlanningTool.UpdateTools(hidUpdatevalue.Value, txt_toolname.Text.Trim(), txt_tooldescription.Text.Trim(),"", chk_active.Checked);
                    if (result == "1")
                    {
                        Grid();
                        btnUpdate.Visible = false;
                        btn_Add.Visible = true;
                        ClearFiled();
                        lblmsg.Text = "<span style='color:green;'>Tools Updated</span>";

                    }
                    else
                    {
                        lblmsg.Text = "<span style='color:red;'>Tools not Updated</span>";
                    }
                }

            }
           
        }

        private void ClearFiled()
        {
            txt_toolname.Text = "";
            
            txt_tooldescription.Text = "";
            hidUpdatevalue.Value = "";
            


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("AddPlanningTool.aspx");
        }
    }
}