using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitySeva.Models;
namespace CitySeva
{
    public partial class changePassword : System.Web.UI.Page
    {
        dllUserRegistration userRegistrationOB = new dllUserRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                if (txt_NewPassword.Text != "" && txt_NewPassword.Text != "")
                {

                    try
                    {

                        string UserId = Convert.ToString(clsMain.getLoggedUserID());
                        string result = userRegistrationOB.UserRregistrationChangePassword(UserId,
                        txt_OldPassword.Text, txt_NewPassword.Text);


                        if (result == "1")
                        {
                            HttpContext.Current.Session["UserInfo"] = null;
                            HttpContext.Current.Session.Abandon();
                            Response.Redirect("ChangeLogin.aspx");

                            // lblmessage.Text = "<b>password Updated   successfully </b>";

                        }
                        else
                        {

                            lblmessage.Text = "<b> User already exists   </b>";
                        }

                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                }
                else
                {
                    lblmessage.Text = "<b>All Fields are mandatory    </b>";
                }
            }
        }
    }
}