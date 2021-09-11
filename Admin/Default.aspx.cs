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

namespace CitySeva.Admin
{
    public partial class Default1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string st = "Select * from tbl_admin where username = '" + txt_username.Text + "' and password = '" + txt_pswd.Text + "'";
            SqlDataAdapter ad = new SqlDataAdapter(st, conn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["email"] = dt.Rows[0][0].ToString();

                Response.Redirect("Addcategory.aspx");
          
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "hello", "alert('Incorrect Login details, please provide correct details.');", true);
            }
        }
    }
}