using CitySeva.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CitySeva
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        clsMain clsMain = new clsMain();
        dllVendor dllVendor = new dllVendor();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserInfo"] != null)
            {
                lblmsg.Text = clsMain.getLoggedUserID() + "," + clsMain.getLoggedUserEmail();
            }
            else
            {
                Response.Redirect("~/login.aspx");
                Session.Abandon();
            }

            if (!IsPostBack)
            {
                GetVendorContactDetails(clsMain.getLoggedUserID());
                GetVendorBusinessDetails(clsMain.getLoggedUserID());
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string message = dllVendor.UpdateVendorContactDetails(clsMain.getLoggedUserID(), txtFirstName.Text.Trim(), txtLastName.Text.Trim(), txtEmailId.Text.Trim(),
                txtMobileNumber.Text, txtHomeAddress.Text.Trim(), txtCity.Text.Trim(), txtPincode.Text.Trim(), ddlState.SelectedValue);
            if (message == "Success")
            {
                lblmessageContact.Text = "contact details saved";
            }
            else
            {
                lblmessageContact.Text = "contact details not saved";
            }
        }

        private void GetVendorContactDetails(int vendorId)
        {
            DataTable dt = dllVendor.GetVendorContactDetails(vendorId);
            if (dt.Rows.Count > 0)
            {
                txtFirstName.Text = dt.Rows[0]["fname"].ToString();
                txtLastName.Text = dt.Rows[0]["lname"].ToString();
                txtMobileNumber.Text = dt.Rows[0]["mobile"].ToString();
                txtHomeAddress.Text = dt.Rows[0]["address"].ToString();
                txtEmailId.Text = dt.Rows[0]["email"].ToString();
                txtCity.Text = dt.Rows[0]["City"].ToString();
                txtPincode.Text = dt.Rows[0]["PinCode"].ToString();
                string State = dt.Rows[0]["State"].ToString();
                if (string.IsNullOrEmpty(State))
                {
                    State = "0";
                }
                else
                {
                    State = dt.Rows[0]["State"].ToString();
                }
                ddlState.SelectedValue = State;
            }

        }




        private void GetVendorBusinessDetails(int vendorId)
        {

            DataTable dt = dllVendor.GetVendorBusinessDetails(vendorId);
            if (dt.Rows.Count > 0)
            {
                txtBusinessName.Text = dt.Rows[0]["business_name"].ToString();
                txtBusinessCategory.Text = dt.Rows[0]["category"].ToString();
                txtBusinessAddress.Text = dt.Rows[0]["business_address"].ToString();
                txtBusinessCity.Text = dt.Rows[0]["city"].ToString();
                chkYes.Checked = Convert.ToBoolean(dt.Rows[0]["other_city"]);
                chkTravel.Checked = Convert.ToBoolean(dt.Rows[0]["travel_and_stay"]);
                txtBusinessPinCode.Text = dt.Rows[0]["pinCode"].ToString();
                txtState.Text = dt.Rows[0]["state"].ToString();
                txtBusinessRunning.Text = dt.Rows[0]["business_running_from"].ToString();

            }

        }
        protected void btnBusinessContact_Click(object sender, EventArgs e)
        {
            string message = dllVendor.UpdateVendorBusinessDetails(clsMain.getLoggedUserID(), txtBusinessName.Text.Trim(), txtBusinessAddress.Text.Trim(), txtBusinessCategory.Text.Trim(),
                txtBusinessCity.Text.Trim(), chkYes.Checked.ToString(), chkTravel.Checked.ToString(), txtBusinessRunning.Text.Trim(), txtBusinessPinCode.Text.Trim(), txtState.Text.Trim(),0,0);
            if (message == "Success")
            {
                lblmessageBusiness.Text = "Business contact details saved";
            }
            else
            {
                lblmessageBusiness.Text = "Business contact details not saved";
            }
        }
    }
}