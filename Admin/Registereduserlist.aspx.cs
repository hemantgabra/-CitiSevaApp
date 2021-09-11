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
    public partial class Registereduserlist : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        dllUserRegistration dllUser = new dllUserRegistration();
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
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string st = "select ROW_NUMBER() over(order by UserId) as row,UserId, fname, lname,mobile, email,username,password, address,date ,IsActive from tbl_registartion order by UserId desc";
                SqlDataAdapter Adp = new SqlDataAdapter(st, con);
                DataTable Dt = new DataTable();
               
                    Adp.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    UsersRpt.DataSource = Dt;
                    UsersRpt.DataBind();
                }
                //lbltotalcount.Text = grid1.Rows.Count.ToString();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }



        }
        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                Button btnActive = (Button)e.Item.FindControl("btn_edit");
                string text = btnActive.Text;
                string result = "";
                if (text == "Active")
                {
                    string userId = e.CommandArgument.ToString();
                     result = dllUser.UserRregistrationActiveInActive(userId, false);
                }
                if (text == "InActive")
                {
                    string userId = e.CommandArgument.ToString();
                     result = dllUser.UserRregistrationActiveInActive(userId, true);
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
                    (item.FindControl("btn_edit") as Button).Text = "Active";
                    //(item.FindControl("btn_edit") as Button).ForeColor = System.Drawing.Color.Green;
                    (item.FindControl("btn_edit") as Button).CssClass = "btn btn-primary";
                }
                if (hidIsactiveValue == "False")
                {
                    
                    (item.FindControl("btn_edit") as Button).Text = "InActive";
                   // (item.FindControl("btn_edit") as Button).ForeColor = System.Drawing.Color.Red;
                    (item.FindControl("btn_edit") as Button).CssClass = "btn btn-danger";
                }

            }
        }
    }
}