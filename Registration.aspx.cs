using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitySeva.Models;
using System.Net.Mail;

namespace CitySeva
{
    public partial class Registration : System.Web.UI.Page
    {
        dllUserRegistration userRegistrationOB = new dllUserRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {

            if (chkterm.Checked == false)
            {
                MessageBoxDisplay("Please accept the Terms of Use of CitiSeva.in. ");
            }
            { 
            if (txt_FirstName.Text != "" && txt_LateName.Text != "" && txt_mobileNumber.Text != "" && txt_email.Text != "" && txt_password.Text != "")
            {

                try
                {

                    if (Page.IsValid)
                    {
                        string result = userRegistrationOB.UserRregistrationAdd(
                            txt_FirstName.Text, txt_LateName.Text, txt_email.Text.Trim(), txt_password.Text, txt_serviceDate.Text, txt_mobileNumber.Text, "NULL", txt_city.Text);


                        if (result == "1")
                        {

                            SendEmail(txt_email.Text.Trim(), txt_FirstName.Text.Trim() + " " + txt_LateName.Text.Trim());
                            clearField();
                            // lblmessage.Text = "<b> User Rregistred  successfully </b>";
                            MessageBoxDisplay(" User Rregistred  successfully ");


                        }
                        else
                        {

                            MessageBoxDisplay(" User already exists ");
                            // lblmessage.Text = "<b> User already exists   </b>";
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }
            else
            {
                    //lblmessage.Text = "<b>All Fields are mandatory    </b>";
                    MessageBoxDisplay("All Fields are mandatory");
            }
        }
        }

        public void MessageBoxDisplay( string msg)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "", "alert('"+ msg + "');", true);
        }
        private void clearField()
        {
            txt_FirstName.Text = "";
            txt_LateName.Text = "";
            txt_email.Text = "";
            txt_password.Text = "";
            txt_confirmPassword.Text = "";
            txt_serviceDate.Text = "";
            txt_mobileNumber.Text = "";
            txt_city.Text = "";
        }

        public void SendEmail(string emailid , string name)
        {


            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(emailid);
            mail.To.Add("hemantgabra.designer@gmail.com");
            //mail.To.Add("mansingh.pundir@gmail.com");
            mail.From = new MailAddress("citisevaservice@gmail.com", "Citiseva Admin", System.Text.Encoding.UTF8);
            mail.Subject = "Citiseva registration";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Body = "Dear "+ name + ",<br> Your registration successfully with citiseva";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("citisevaservice@gmail.com", "Citi2020");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                //Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='SendMail.aspx';}</script>");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
               // Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='SendMail.aspx';}</script>");
            }
        }
    }
}