using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using  CitySeva.Models;
using System.Net.Mail;

namespace QaToolApp
{
    public partial class service : System.Web.UI.Page
    {
        dllCommonUtility commonUtilityOBJ = new dllCommonUtility();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<EntityCategory> getCategory(string CatName) 
        {
            List<EntityCategory> CatObj = new List<EntityCategory>();
            string cs = ConfigurationManager.ConnectionStrings["conn"].ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand com = new SqlCommand())
                    {
                        com.CommandText = string.Format("select categoryId,catgory_name from tbl_category where  catgory_name like '{0}%'", CatName);
                        com.Connection = con;
                        con.Open();
                        SqlDataReader sdr = com.ExecuteReader();
                        EntityCategory Cat = null;
                        while (sdr.Read())
                        {
                            Cat = new EntityCategory();
                            // Cat.catgory_name = Convert.ToInt32(sdr["catgory_name"]);
                            Cat.catgory_name = Convert.ToString(sdr["catgory_name"]);
                            //Cat.Address = Convert.ToString(sdr["Address"]);
                            CatObj.Add(Cat);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error {0}", ex.Message);
            }
            return CatObj;
        }

        [WebMethod]
        public  static string UpdateOrder(string order , string type)
        {
            dllCommonUtility commonUtilityOBJ = new dllCommonUtility();
            string result = commonUtilityOBJ.GetLocationCategoryUpdateOrder(order, type);
            return result;


        }
        [WebMethod]
        public static string RequestQuoteAdd(string FullName, string Email_Id, string PhoneNumber,
            string EventDate, string MessageRequest,string BusinessId)
        {
           

            dllCommonUtility commonUtilityOBJ = new dllCommonUtility();
            string result = commonUtilityOBJ.RequestQuoteAdd(FullName,  Email_Id,  PhoneNumber,
             EventDate,  MessageRequest, BusinessId);
            if (result == "1")
            {
               // SendEmail( Email_Id,  FullName);
            }

            return result;


        }

        public static void SendEmail(string emailid, string name)
        {


            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(emailid);
            mail.To.Add("hemantgabra.designer@gmail.com");
            //mail.To.Add("mansingh.pundir@gmail.com");
            mail.From = new MailAddress("citiseva@gmail.com", "Citiseva Admin", System.Text.Encoding.UTF8);
            mail.Subject = "citiseva- Request";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Body = "Dear " + name + ",<br> Your Request successfully send to citiseva";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("citiseva@gmail.com", "123456@citiseva.com");
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