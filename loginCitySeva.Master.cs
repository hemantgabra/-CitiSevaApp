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
using  CitySeva.Models;
namespace CitySeva
{
    public partial class loginCitySeva : System.Web.UI.MasterPage
    {
        dllAddCategory objdllAddCategory = new dllAddCategory();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                category();
                location();
                getDisplayCat();
            }
        }

        private void getDisplayCat() {

            DataTable dt = objdllAddCategory.GetAllCategoriesList();
            if (dt.Rows.Count > 0)
            {
                ddCategorylist.DataSource = dt;
                ddCategorylist.DataBind();
            }
        }

        void category()
        {
            //string com = "Select * from tbl_category";
            //SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            //DataTable dt = new DataTable();
            //adpt.Fill(dt);
            //dd_category.DataSource = dt;
            //dd_category.DataBind();
            //dd_category.DataTextField = "catgory_name";
            //dd_category.DataValueField = "categoryId";
            //dd_category.DataBind();
            //dd_category.Items.Insert(0, "Select Service");
        }

        void location()
        {
            string com = "Select * from tbl_location order by display_order Asc";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            dd_location.DataSource = dt;
            dd_location.DataBind();
            dd_location.DataTextField = "location";
            dd_location.DataValueField = "id";
            dd_location.DataBind();
            dd_location.Items.Insert(0, "Select Location");
        }

        protected void btn_success_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchListingNew.aspx?ser=" +selectService.Text+ "&lc=" + dd_location.SelectedValue + "");
        }
    }
    }
