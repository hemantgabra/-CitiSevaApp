using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitySeva.Models;
namespace CitySeva
{
    public partial class profile : System.Web.UI.Page
    {
        dllUserRegistration userRegistrationOB = new dllUserRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GetUserDetails();
            }
        }



        
        private void GetUserDetails()
        {
            string UserId = Convert.ToString(clsMain.getLoggedUserID());
            DataTable dt = userRegistrationOB.GetUserDetails(UserId);
            if (dt.Rows.Count > 0)
            {
                txt_FirstName.Text = dt.Rows[0]["fname"].ToString();
                txt_LateName.Text = dt.Rows[0]["lname"].ToString();
                txt_serviceDate.Text = dt.Rows[0]["date"].ToString();
                txt_mobileNumber.Text = dt.Rows[0]["mobile"].ToString();
               

            }


        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txt_FirstName.Text != "" && txt_LateName.Text != "" && txt_mobileNumber.Text != "")
                {

                    try
                    {

                        string UserId = Convert.ToString(clsMain.getLoggedUserID());
                        string result = userRegistrationOB.UserRregistrationUpdate(UserId,
                        txt_FirstName.Text, txt_LateName.Text, txt_serviceDate.Text, txt_mobileNumber.Text, "NULL", txt_city.Text);


                        if (result == "1")
                        {


                            lblmessage.Text = "<b> Update Profile  successfully </b>";

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