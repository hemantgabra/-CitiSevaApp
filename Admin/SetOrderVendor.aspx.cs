using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitySeva.Models;
namespace CitySeva.Admin
{
    public partial class SetOrderVendor : System.Web.UI.Page
    {
        dllVendeRregistration vendeRregistrationOBJ = new dllVendeRregistration();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVendorList();
                BindCategoryList();
            }
        }

        public void BindVendorList()
        {

            DataTable dt = vendeRregistrationOBJ.GetAllVendorLostForOrder();
            if (dt.Rows.Count > 0)
            {
                lstCatLoc.SelectedIndex = -1;
                lstCatLoc.DataSource = dt;
                lstCatLoc.DataValueField = "id";
                lstCatLoc.DataTextField = "Vendor";
                lstCatLoc.DataBind();



            }
        }

        public void BindVendorList(int categoryId)
        {

            DataTable dt = vendeRregistrationOBJ.GetAllVendorLostForOrderByid(categoryId);

            lstCatLoc.SelectedIndex = -1;
            lstCatLoc.DataSource = dt;
            lstCatLoc.DataValueField = "id";
            lstCatLoc.DataTextField = "Vendor";
            lstCatLoc.DataBind();




        }
        public void BindCategoryList()
        {

            DataTable dt = vendeRregistrationOBJ.GetCategoryListForVendorOrder();
            if (dt.Rows.Count > 0)
            {
                //ddlCategoryList.SelectedIndex = -1;
                ddlCategoryList.AppendDataBoundItems = true;
                ddlCategoryList.Items.Insert(0, new ListItem { Text = "All", Value = "All" });
                ddlCategoryList.DataSource = dt;
                ddlCategoryList.DataValueField = "categoryId";
                ddlCategoryList.DataTextField = "catgory_name";
                ddlCategoryList.DataBind();



            }
        }


        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }

        protected void ddlCategoryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoryList.SelectedValue == "0")
            {

            }
            else if (ddlCategoryList.SelectedValue == "All")
            {
                BindVendorList();
            }
            else
            {

                BindVendorList(Convert.ToInt32(ddlCategoryList.SelectedValue));
            }

        }
    }
}