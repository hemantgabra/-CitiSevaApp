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
    public partial class AddLocationold : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Grid();
            }
        }

        void clear()
        {
            txt_location.Text = string.Empty;
            txt_location.Focus();
        }
      

        void Grid()
        {

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string st = "select  ROW_NUMBER() over(order by id) as row,id,location from tbl_location";
                SqlDataAdapter Adp = new SqlDataAdapter(st, con);
                DataTable Dt = new DataTable();
                Adp.Fill(Dt);
                grid1.DataSource = Dt;
                grid1.DataBind();
                lbltotalcount.Text = grid1.Rows.Count.ToString();
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

        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }

        protected void btn_location_Click(object sender, EventArgs e)
        {
            if (txt_location.Text != "")
            {

                string st = "insert into tbl_location (location) values (@location)";
                cmd = new SqlCommand(st, con);
                cmd.Parameters.AddWithValue("@location", txt_location.Text.Trim());

                try
                {
                    con.Open();
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        ShowMessage("Registered successfully......!");
                        clear();
                        Grid();
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