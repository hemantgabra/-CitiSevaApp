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


namespace CitySeva
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_register_Click(object sender, EventArgs e)
        {
            if (txt_fname.Text != "" && txt_lname.Text != "" && txt_email.Text != "" && txt_pswd.Text != "")
            {
                cmd = new SqlCommand("pre_registration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fname", txt_fname.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", txt_lname.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_email.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txt_pswd.Text.Trim());
                cmd.Parameters.AddWithValue("@val", 1);
                try
                {
                    con.Open();
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(Page, GetType(), "", "alert('Registration has been successfully done.');", true);

                    }
                    else
                    {


                    }

                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "", "alert('Field marked with * are mondetory to be filled..');", true);
            }
        }
    }
}