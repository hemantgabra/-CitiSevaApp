using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using  CitySeva.Models;
using System.Net.Mail;

namespace CitySeva
{
    public partial class forgot : System.Web.UI.Page
    {
        dllUserRegistration userRegistrationOB = new dllUserRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (txt_Emailid.Text != "")
            {
                DataTable dataTable = userRegistrationOB.ForgetPasswordByEmail(txt_Emailid.Text);
                if (dataTable.Rows.Count > 0)
                {
                    if (dataTable.Rows[0]["IsActive"].ToString() == "False")
                    {
                        lblmessage.Text = "Your account has been Incative  , Please contact to site Admin";
                    }
                    else
                    {
                        SendEmail(txt_Emailid.Text.Trim(), dataTable.Rows[0]["username"].ToString(), dataTable.Rows[0]["password"].ToString());
                        txt_Emailid.Text = "";

                        lblmessage.Text = "We have sent password on your email id , Please check your Inbox";
                    }
                }
                else
                {
                    lblmessage.Text = "Email does't exists";
                }
            }
            else
            {
                lblmessage.Text = "Email address is required";
            }
        }
        public void SendEmail(string emailid, string name,string password)
        {


            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(emailid);
            mail.To.Add("hemantgabra.designer@gmail.com");
             
            mail.From = new MailAddress("citisevaservice@gmail.com", "Citiseva Admin", System.Text.Encoding.UTF8);
            mail.Subject = "Citiseva Forgot Password";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Body = "Dear " + name + ",<br> Your Username: "+ emailid + " and Password: "+ password + " with citiseva,Please login "; 
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