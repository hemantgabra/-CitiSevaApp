using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  CitySeva.Models;
namespace CitySeva
{
	public partial class login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
              


                if (clsMain.requestAccess(txt_Password.Text, txt_Email.Text.Trim()) == true)
                {
                    //clsMain.UpdateLogindate(isExternal, txtUsername.Text.Trim());

                    if (clsMain.isActiveUser() == true)
                    {
                        Response.Redirect("Vendor.aspx");
                        //Response.Redirect("Admin/UserTaskDetails.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Invalid user name or password!";
                        txt_Email.Text = "";
                        txt_Password.Focus();
                    }

                }
                else
                {
                    lblMsg.Text = "Invalid user name or password!";
                    txt_Email.Text = "";
                    txt_Password.Focus();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Invalid user name or password!";
                txt_Password.Text = "";
                txt_Password.Focus();
            }
        }
    }
}