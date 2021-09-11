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
    public partial class Addcategory : System.Web.UI.Page
    {
       private   dllAddCategory obj_addcategory = new dllAddCategory();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Grid();
                btnUpdate.Visible = false;
                btn_category.Visible = true;
            }
        }

        public void Grid()
        {

            try
            {
                DataTable Dt = obj_addcategory.GetAllCategories();
                categoryRpt.DataSource = Dt;
                categoryRpt.DataBind();
                //lbltotalcount.Text = categoryRpt.Rows.Count.ToString();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }



        }

        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }

        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {

                int catID = Convert.ToInt32(e.CommandArgument);
                DataTable dt = obj_addcategory.GetCategoryById(catID);
                if (dt.Rows.Count > 0)
                {
                    txt_category.Text = dt.Rows[0]["catgory_name"].ToString();
                    hidUpdatevalue.Value = dt.Rows[0]["categoryId"].ToString();
                    btnUpdate.Visible = true;
                    btn_category.Visible = false;
                }

            }
            if (e.CommandName == "Delete")
            {
                int catID = Convert.ToInt32(e.CommandArgument);
                string result = obj_addcategory.DeleteCategoryName(catID);
                if (result == "1")
                {
                    Grid();
                    lblmsg.Text = "<span style='color:green;'>Category Delete</span>";
                }
                else
                {
                    lblmsg.Text = "<span style='color:red;'>Category not Delete</span>";
                }
            }

        }

        protected void btn_category_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!string.IsNullOrEmpty(txt_category.Text))
                {

                    string result = obj_addcategory.AddCategoryName(txt_category.Text.Trim(), "", true);
                    if (result == "1")
                    {
                        Grid();
                        txt_category.Text = "";

                        lblmsg.Text = "<span style='color:green;'>Category Added</span>";

                    }
                    else
                    {
                        lblmsg.Text = "<span style='color:red;'>Category not Added</span>";
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txt_category.Text))
            {
                string result = obj_addcategory.UpdateCategoryName(Convert.ToInt32(hidUpdatevalue.Value), txt_category.Text.Trim(), "", true);
                if (result == "1")
                {
                    Grid();
                    btnUpdate.Visible = false;
                    btn_category.Visible = true;
                    lblmsg.Text = "<span style='color:green;'>Category Updated</span>";
                    txt_category.Text = "";
                }
                else
                {
                    lblmsg.Text = "<span style='color:red;'>Category not Updated</span>";
                }
            }
        }
    }
}