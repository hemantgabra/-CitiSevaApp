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
using CitySeva.Models;
using System.Text;
using System.IO;

namespace CitySeva.Admin
{
    public partial class Venderregistration : System.Web.UI.Page
    {

        dllCommonUtility commonUtility = new dllCommonUtility();
        dllVendeRregistration vendeRregistration = new dllVendeRregistration();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                category();
                location();
                Grid();
                imgFileUpload1.Visible = false;
                imgFileUpload2.Visible = false;
                imgFileUpload3.Visible = false;
                imgFileUpload4.Visible = false;
                imgFileUpload5.Visible = false;

                txt_bs_priceStart.Visible = false;             
                txt_bs_package.Visible = false;

            }

        }

        protected void btn_save_Click(object sender, EventArgs e)

        {
            if (Page.IsValid)
            {
                if (txt_name.Text != "" && txt_mobile.Text != "" && txt_address.Text != "")
                {

                    try
                    {
                        string img1 = Img1Upload();
                        string img2 = Img2Upload();
                        string img3 = Img3Upload();
                        string img4 = Img4Upload();
                        string img5 = Img5Upload();

                        string package = "";
                        string packagecook = "";
                        if (ddlPackage.SelectedValue == "CookingPackage")
                        {
                            packagecook = txt_bs_package.Text.Trim();
                        }
                        if (ddlPackage.SelectedValue == "Package")
                        {
                            package = txt_bs_package.Text.Trim();
                        }
                        string pricestart = "";
                        string pricePer = "";
                        if (ddlPackage.SelectedValue == "PricePerPlateFrom")
                        {
                            pricePer = txt_bs_priceStart.Text.Trim();
                        }
                        if (ddlPackage.SelectedValue == "PriceStart")
                        {
                            pricestart = txt_bs_priceStart.Text.Trim();
                        }


                        string result = vendeRregistration.VendeRregistrationAdd(
                            txt_name.Text, txt_mobile.Text, txt_address.Text, txt_email.Text, dd_category.SelectedValue, dd_location.SelectedValue,
                            img1, img2, img3, img4, img5, txt_bs_name.Text.Trim(), txt_bs_address.Text.Trim(), txt_bs_priceStart.Text.Trim(),
                            txt_bs_guest.Text.Trim(), package, txt_bs_service.Text, 
                            txt_bs_patmentMode.Text.Trim(), txt_bs_bookimgAmt.Text.Trim(),
                            txt_description.Text.Trim(), pricePer, packagecook, txt_Service_offer.Text.Trim(), txt_Cancellation_Order.Text.Trim());


                        if (result == "1")
                        {

                            SendEmail(txt_email.Text.Trim(), txt_name.Text.Trim());
                            clearField();
                            Grid();
                            lblmessage.Text = "<b> Vender Rregistred  successfully </b>";

                        }
                        else
                        {

                            lblmessage.Text = "<b> Vender mobile already exists Rregistred   </b>";
                        }

                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "", "alert('Field marked with * are mondetory to be filled..');", true);
                }
            }
        }

        public string Img1Upload()
        {
            string fname = "";
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType == "image/jpeg")
                    {
                        if (FileUpload1.PostedFile.ContentLength < 502400)
                        {
                            string filename = Path.GetFileName(FileUpload1.FileName);
                            fname = filename;
                            FileUpload1.SaveAs(Server.MapPath("~/img_vendor/") + filename);
                            lblmessage.Text = "";//  "Upload status: File uploaded!";
                        }
                        else
                            lblmessage.Text = "";// "Upload status: The file has to be less than 100 kb!";
                    }
                    else
                        lblmessage.Text = "";// "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "";// "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return fname;
        }
        public string Img2Upload()
        {
            string fname = "";
            if (FileUpload2.HasFile)
            {
                try
                {
                    if (FileUpload2.PostedFile.ContentType == "image/jpeg")
                    {
                        if (FileUpload2.PostedFile.ContentLength < 502400)
                        {
                            string filename = Path.GetFileName(FileUpload2.FileName);
                            fname = filename;
                            FileUpload2.SaveAs(Server.MapPath("~/img_vendor/") + filename);
                            lblmessage.Text = "Upload status: File uploaded!";
                        }
                        else
                            lblmessage.Text = "";//  "Upload status: The file has to be less than 100 kb!";
                    }
                    else
                        lblmessage.Text = "";// "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "";// "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return fname;
        }
        public string Img3Upload()
        {
            string fname = "";
            if (FileUpload3.HasFile)
            {
                try
                {
                    if (FileUpload3.PostedFile.ContentType == "image/jpeg")
                    {
                        if (FileUpload3.PostedFile.ContentLength < 502400)
                        {
                            string filename = Path.GetFileName(FileUpload3.FileName);
                            fname = filename;
                            FileUpload3.SaveAs(Server.MapPath("~/img_vendor/") + filename);
                            lblmessage.Text = "";// "Upload status: File uploaded!";
                        }
                        else
                            lblmessage.Text = "";// "Upload status: The file has to be less than 100 kb!";
                    }
                    else
                        lblmessage.Text = "";// "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "";// "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return fname;
        }
        public string Img4Upload()
        {
            string fname = "";
            if (FileUpload4.HasFile)
            {
                try
                {
                    if (FileUpload4.PostedFile.ContentType == "image/jpeg")
                    {
                        if (FileUpload4.PostedFile.ContentLength < 502400)
                        {
                            string filename = Path.GetFileName(FileUpload4.FileName);
                            fname = filename;
                            FileUpload4.SaveAs(Server.MapPath("~/img_vendor/") + filename);
                            lblmessage.Text = "";//  "Upload status: File uploaded!";
                        }
                        else
                            lblmessage.Text = "";//  "Upload status: The file has to be less than 100 kb!";
                    }
                    else
                        lblmessage.Text = "";// "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "";// "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return fname;
        }

        public string Img5Upload()
        {
            string fname = "";
            if (FileUpload5.HasFile)
            {
                try
                {
                    if (FileUpload5.PostedFile.ContentType == "image/jpeg")
                    {
                        if (FileUpload5.PostedFile.ContentLength < 502400)
                        {
                            string filename = Path.GetFileName(FileUpload5.FileName);
                            fname = filename;
                            FileUpload5.SaveAs(Server.MapPath("~/img_vendor/") + filename);
                            lblmessage.Text = "Upload status: File uploaded!";
                        }
                        else
                            lblmessage.Text = "";// "Upload status: The file has to be less than 100 kb!";
                    }
                    else
                        lblmessage.Text = "";//  "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "";// "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return fname;
        }



        private void clearField()
        {
            txt_name.Text = "";
            txt_mobile.Text = "";
            txt_address.Text = "";
            txt_email.Text = "";
            dd_category.SelectedValue = "0";
            dd_location.SelectedValue = "0";
            txt_bs_address.Text = "";
            txt_bs_priceStart.Text = "";
            txt_bs_guest.Text = "";
            txt_bs_package.Text = "";
            txt_bs_priceStart.Text = "";
            txt_bs_patmentMode.Text = "";
            txt_bs_bookimgAmt.Text = "";
            txt_bs_name.Text = "";
            txt_bs_service.Text = "";
            txt_description.Text = "";
             
            imgFileUpload1.ImageUrl = "";
            imgFileUpload2.ImageUrl = "";
            imgFileUpload3.ImageUrl = "";
            imgFileUpload4.ImageUrl = "";
            imgFileUpload5.ImageUrl = "";
            imgFileUpload1.Visible = false;
            imgFileUpload2.Visible = false;
            imgFileUpload3.Visible = false;
            imgFileUpload4.Visible = false;
            imgFileUpload5.Visible = false;
            txt_Cancellation_Order.Text = "";
            txt_Service_offer.Text = "";
        }
        private void Grid()
        {





            DataTable Dt = vendeRregistration.GetAllVendor();
            if (Dt.Rows.Count > 0)
            {
                categoryRpt.DataSource = Dt;
                categoryRpt.DataBind();
            }





        }


        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txt_name.Text != "" && txt_mobile.Text != "" && txt_address.Text != "")
                {

                    try
                    {
                        string img1 = Img1Upload();
                        string img2 = Img2Upload();
                        string img3 = Img3Upload();
                        string img4 = Img4Upload();
                        string img5 = Img5Upload();
                        if (string.IsNullOrEmpty(img1))
                        {
                          var img1Array=imgFileUpload1.ImageUrl.Split('/');
                            img1 = img1Array[2].ToString();
;                        }
                        if (string.IsNullOrEmpty(img2))
                        {
                            var img1Array = imgFileUpload2.ImageUrl.Split('/');
                            img2 = img1Array[2].ToString();
                            
                        }
                        if (string.IsNullOrEmpty(img3))
                        {
                            var img1Array = imgFileUpload3.ImageUrl.Split('/');
                            img3 = img1Array[2].ToString();
                            
                        }
                        if (string.IsNullOrEmpty(img4))
                        {
                            var img1Array = imgFileUpload4.ImageUrl.Split('/');
                            img4 = img1Array[2].ToString();
                            
                        }
                        if (string.IsNullOrEmpty(img5))
                        {
                            var img1Array = imgFileUpload5.ImageUrl.Split('/');
                            img5 = img1Array[2].ToString();
                            
                        }

                        string package = "";
                        string packagecook = "";
                        if (ddlPackage.SelectedValue == "CookingPackage")
                        {
                            packagecook = txt_bs_package.Text.Trim();
                        }
                        if (ddlPackage.SelectedValue == "Package")
                        {
                            package=txt_bs_package.Text.Trim();
                        }
                        string pricestart = "";
                        string pricePer = "";
                        if (ddlPackage.SelectedValue == "PricePerPlateFrom")
                        {
                            pricePer = txt_bs_priceStart.Text.Trim();
                        }
                        if (ddlPackage.SelectedValue == "PriceStart")
                        {
                            pricestart = txt_bs_priceStart.Text.Trim();
                        }

                        string result = vendeRregistration.VendeRregistrationUpdate(Convert.ToInt32(hidupdate.Value),
                            txt_name.Text, txt_mobile.Text, txt_address.Text, txt_email.Text, dd_category.SelectedValue, dd_location.SelectedValue,
                            img1, img2, img3, img4, img5,
                            txt_bs_name.Text.Trim(), txt_bs_address.Text.Trim(), pricestart,
                            txt_bs_guest.Text.Trim(), package,txt_bs_service.Text, txt_bs_patmentMode.Text.Trim(), txt_bs_bookimgAmt.Text.Trim()
                            ,txt_description.Text.Trim(), pricePer, packagecook, txt_Service_offer.Text.Trim(), txt_Cancellation_Order.Text.Trim());


                        if (result == "1")
                        {

                            clearField();
                            Grid();
                            hidupdate.Value = "";
                            reqvalfile1.Enabled = true;
                            RegularExpressionValidator2.Enabled = true;
                            btnUpdate.Visible = false;
                            btn_save.Visible = true;
                            lblmessage.Text = "<b> Vender Updated  successfully </b>";

                        }
                        else
                        {

                            lblmessage.Text = "<b> Vender not Updated  </b>";
                        }

                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "", "alert('Field marked with * are mondetory to be filled..');", true);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearField();
            hidupdate.Value = "";
            reqvalfile1.Enabled = true;
            RegularExpressionValidator2.Enabled = true;
            btnUpdate.Visible = false;
            btn_save.Visible = true;
            Response.Redirect("Venderregistration.aspx",true);
        }


        private void category()
        {
            dd_category.Items.Clear();
            dd_category.AppendDataBoundItems = true;
            dd_category.Items.Insert(0, new ListItem { Text = "Select category", Value = "0" });

            dd_category.DataSource = commonUtility.GetCategoryList();

            dd_category.DataTextField = "catgory_name";
            dd_category.DataValueField = "categoryId";
            dd_category.DataBind();
        }

        private void location()
        {

            dd_location.Items.Clear();
            dd_location.AppendDataBoundItems = true;
            dd_location.Items.Insert(0, new ListItem { Text = "Select location", Value = "0" });

            DataTable dt = commonUtility.GetLocationList();
            dd_location.DataSource = dt;

            dd_location.DataTextField = "location";
            dd_location.DataValueField = "id";
            dd_location.DataBind();
        }

        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int vendorID = Convert.ToInt32(e.CommandArgument);
                string result = vendeRregistration.DeleteVendeRregistration(vendorID);
                if (result == "1")
                {
                    Grid();
                    lblmessage.Text = "<b>Vender Rregistration deleted successfully</b>";
                }
            }
            if (e.CommandName == "Edit1")
            {
                int vendorID = Convert.ToInt32(e.CommandArgument);
                DataTable dt =vendeRregistration.GetAllVendorById(vendorID);
                if (dt.Rows.Count>0)
                {
                    txt_name.Text = dt.Rows[0]["name"].ToString();
                    txt_mobile.Text = dt.Rows[0]["mobile"].ToString();
                    txt_address.Text = dt.Rows[0]["address"].ToString();
                    txt_email.Text = dt.Rows[0]["email"].ToString();
                    dd_category.SelectedValue = dt.Rows[0]["category"].ToString();
                    dd_location.SelectedValue = dt.Rows[0]["sub_category"].ToString();
                    txt_bs_name.Text= dt.Rows[0]["business_name"].ToString();
                    txt_bs_address.Text = dt.Rows[0]["business_address"].ToString();
                    
                    txt_bs_guest.Text = dt.Rows[0]["number_of_guest"].ToString();
                    txt_bs_package.Text = dt.Rows[0]["package"].ToString();                   
                    txt_bs_patmentMode.Text = dt.Rows[0]["payment_mode"].ToString();
                    txt_bs_bookimgAmt.Text = dt.Rows[0]["booking_amount"].ToString();                  
                    txt_bs_service.Text = dt.Rows[0]["service_name"].ToString();
                    txt_description.Text = dt.Rows[0]["description"].ToString();

                    string priceStart= dt.Rows[0]["price_start_from"].ToString();
                    string pricePer= dt.Rows[0]["price_per_plate_from"].ToString();
                    if (string.IsNullOrEmpty(priceStart))
                    {
                        ddlPriceStart.SelectedValue = "PricePerPlateFrom";
                       // txt_bs_priceStart.Style.Add("display", "block");
                        txt_bs_priceStart.Visible = true;
                        // txt_bs_priceStart.Attributes.Add("style", "display:block;");
                        txt_bs_priceStart.Text = pricePer;
                    }
                    if (string.IsNullOrEmpty(pricePer))
                    {
                        ddlPriceStart.SelectedValue = "PriceStart";
                        // txt_bs_priceStart.Attributes.Add("style", "display:block;");
                        txt_bs_priceStart.Visible = true;
                        txt_bs_priceStart.Text = priceStart;
                    }
                    //txt_bs_priceStart.Text = dt.Rows[0]["price_start_from"].ToString();
                    // txt_price_per_Plate_from.Text = dt.Rows[0]["price_per_plate_from"].ToString();
                   string package= dt.Rows[0]["package"].ToString();
                   string package_cook = dt.Rows[0]["cooking_package"].ToString();

                    if (string.IsNullOrEmpty(package))
                    {
                        ddlPackage.SelectedValue = "CookingPackage";
                       
                      
                        txt_bs_package.Visible = true;
                        txt_bs_package.Text = package_cook;
                    }
                    if (string.IsNullOrEmpty(package_cook))
                    {
                        ddlPackage.SelectedValue = "Package";
                        txt_bs_package.Visible = true;
                        txt_bs_package.Text = package;
                    }

                    txt_Cancellation_Order.Text = dt.Rows[0]["Cancellation_Order"].ToString();
                    txt_Service_offer.Text = dt.Rows[0]["Service_offer"].ToString();
                    hidupdate.Value = dt.Rows[0]["id"].ToString();
                    reqvalfile1.Enabled = false;
                    RegularExpressionValidator2.Enabled = false;
                    btnUpdate.Visible = true;
                    btn_save.Visible = false;
                    imgFileUpload1.Visible = true;
                    imgFileUpload2.Visible = true;
                    imgFileUpload3.Visible = true;
                    imgFileUpload4.Visible = true;
                    imgFileUpload5.Visible = true;
                    imgFileUpload1.ImageUrl= "~/img_vendor/" + dt.Rows[0]["img1_url"].ToString();
                    imgFileUpload2.ImageUrl = "~/img_vendor/" + dt.Rows[0]["img2_url"].ToString();
                    imgFileUpload3.ImageUrl = "~/img_vendor/" + dt.Rows[0]["img3_url"].ToString();
                    imgFileUpload4.ImageUrl = "~/img_vendor/" + dt.Rows[0]["img4_url"].ToString();
                    imgFileUpload5.ImageUrl = "~/img_vendor/" + dt.Rows[0]["img5_url"].ToString();
                }
            }
        }

        public void SendEmail(string emailid, string name)
        {


            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(emailid);
            mail.To.Add("hemantgabra.designer@gmail.com");
            //mail.To.Add("mansingh.pundir@gmail.com");
            mail.From = new MailAddress("citiseva@gmail.com", "Citiseva Admin", System.Text.Encoding.UTF8);
            mail.Subject = "Vendor Citiseva registration";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Body = "Dear " + name + ",<br> Your registration successfully with citiseva";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
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

        protected void ddlPriceStart_SelectedIndexChanged(object sender, EventArgs e)
        {
            string price = ddlPriceStart.SelectedValue;
            if (price == "0")
            {
                txt_bs_priceStart.Visible = false;


            }
            else {
                txt_bs_priceStart.Visible = true;
            }

            

        }

        protected void ddlPackage_SelectedIndexChanged(object sender, EventArgs e)
        {
            string package = ddlPackage.SelectedValue;
            if (package == "0")
            {
                txt_bs_package.Visible = false;


            }
            else
            {
                txt_bs_package.Visible = true;
            }

        }
    }


}
