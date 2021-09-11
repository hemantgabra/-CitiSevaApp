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
    public partial class AllRequests : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        dllCommonUtility DllCommonUtilityOBJ = new dllCommonUtility();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
                Grid();
            }
        }

        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }
        void Grid()
        {

            try
            {


                DataTable Dt = DllCommonUtilityOBJ.GetRequestList();
                if (Dt.Rows.Count > 0)
                {
                   RequestRpt.DataSource = Dt;
                    RequestRpt.DataBind();
                }
                
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
            


        }
        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                Button btnActive = (Button)e.Item.FindControl("btn_edit");
                string text = btnActive.Text;
                string result = "";
                if (text == "Pending")
                {
                    string userId = e.CommandArgument.ToString();
                     result = DllCommonUtilityOBJ.RequestActiveInActive(userId, false);
                }
                if (text == "Closed")
                {
                    string userId = e.CommandArgument.ToString();
                    result = DllCommonUtilityOBJ.RequestActiveInActive(userId, true);
                }
                Grid();

            }
        }

        protected void UsersRpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Reference the Repeater Item.
                RepeaterItem item = e.Item;

                //Reference the Controls.
                string hidIsactiveValue = (item.FindControl("hiIsActive") as HiddenField).Value;
               
                if (hidIsactiveValue == "True")
                {
                    (item.FindControl("btn_edit") as Button).Text = "Pending";
                    //(item.FindControl("btn_edit") as Button).ForeColor = System.Drawing.Color.Green;
                    (item.FindControl("btn_edit") as Button).CssClass = "btn btn-primary";
                }
                if (hidIsactiveValue == "False")
                {
                    
                    (item.FindControl("btn_edit") as Button).Text = "Closed";
                   // (item.FindControl("btn_edit") as Button).ForeColor = System.Drawing.Color.Red;
                    (item.FindControl("btn_edit") as Button).CssClass = "btn btn-danger";
                }

            }
        }
    }
}