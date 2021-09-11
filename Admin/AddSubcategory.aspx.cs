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
    public partial class AddSubcategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Category();
                Grid();

            }
        }
        void Category()
        {
            string query = "select * from tbl_category ";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable table = new DataTable();
            da.Fill(table);
            if (table.Rows.Count > 0)
            {

                da.Fill(table);
                dd_category.DataSource = table;

                dd_category.DataTextField = "catgory_name";
                dd_category.DataValueField = "id";
                dd_category.DataBind();
                dd_category.Items.Insert(0, "Select");

            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
        void clear()
        {
            txt_category.Text = string.Empty;
            txt_category.Focus();
        }
       
        protected void btn_category_Click(object sender, EventArgs e)
        {
            if (txt_category.Text != "")
            {

                string st = "insert into tbl_subcategory (category_id,sub_category) values (@category_id,@sub_category)";
                cmd = new SqlCommand(st, con);
                cmd.Parameters.AddWithValue("@category_id", dd_category.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sub_category", txt_category.Text.Trim());

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

       
        void Grid()
        {

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string st = "select  ROW_NUMBER() over(order by sc.id) as row,sc.id, c.catgory_name, sub_category from tbl_subcategory sc join tbl_category c on sc.category_id = c.id";
                SqlDataAdapter Adp = new SqlDataAdapter(st, con);
                DataTable Dt = new DataTable();
                Adp.Fill(Dt);
                GridView1.DataSource = Dt;
                GridView1.DataBind();
                lbltotalcount.Text = GridView1.Rows.Count.ToString();
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

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}