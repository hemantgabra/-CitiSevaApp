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
    public partial class Vendor : System.Web.UI.Page
    {
        clsMain clsMain = new clsMain();
        dllVendor dllVendor = new dllVendor();
        ClsCommonFun ClsCommon = new ClsCommonFun();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                // lblmsg.Text = clsMain.getLoggedUserID() + "," + clsMain.getLoggedUserEmail();
            }
            else
            {
                Response.Redirect("~/login.aspx");
                Session.Abandon();
            }

            if (!IsPostBack)
            {
                Dashboardtab.Attributes.Add("class", "nav-link active");
                PanlDashboard.Visible = true;
                PanlPricePerPlate.Visible = true;
                DisplayImages();
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
                txtBusinessCity.Text.Trim(), chkYes.Checked.ToString(), chkTravel.Checked.ToString(), txtBusinessRunning.Text.Trim(), txtBusinessPinCode.Text.Trim(), txtState.Text.Trim());
            if (message == "Success")
            {
                lblmessageBusiness.Text = "Business contact details saved";
            }
            else
            {
                lblmessageBusiness.Text = "Business contact details not saved";
            }
        }


        protected void Dashboardtab_Click(object sender, EventArgs e)
        {
            ShowHidePanel(PanlDashboard, true);
            LinkActiveInActive(Dashboardtab, "active");
            DisplayImages();
        }

        private void DisplayImages()
        {

            DataSet ds = dllVendor.GetVendorProfileData(clsMain.getLoggedUserID());
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    string img = "";
                    string img1 = "<img class='xzoom5' id='xzoom-magnific'   width='400px' height='250' src='Uploads/" + ds.Tables[0].Rows[0]["ImagePath"].ToString() + "' xoriginal='Uploads/" + ds.Tables[0].Rows[0]["ImagePath"].ToString() + "' />" + "<div class='xzoom-thumbs'>";
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        img += "<a href='Uploads/" + ds.Tables[0].Rows[i]["ImagePath"].ToString() + "'>"
                              + "<img class='xzoom-gallery5' width='80' height='60' src='Uploads/" + ds.Tables[0].Rows[i]["ImagePath"].ToString() + "' title='The description goes here'></a>";
                    }
                    img1 = img1 + img + "</div>";

                    //string htmlImage = "<img class='xzoom5' id='xzoom-magnific' src='images/gallery/preview/01_b_car.jpg' xoriginal='images/gallery/original/01_b_car.jpg' />"
                    //                                    + "<div class='xzoom-thumbs'>"
                    //                                        + "<a href='images/gallery/original/01_b_car.jpg'>"
                    //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/thumbs/01_b_car.jpg' xpreview='images/gallery/preview/01_b_car.jpg' title='The description goes here'></a>"
                    //                                        + "<a href='images/gallery/original/02_o_car.jpg'>"
                    //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/preview/02_o_car.jpg' title='The description goes here'></a>"
                    //                                        + "<a href='images/gallery/original/03_r_car.jpg'>"
                    //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/preview/03_r_car.jpg' title='The description goes here'></a>"
                    //                                        + "<a href='images/gallery/original/04_g_car.jpg'>"
                    //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/preview/04_g_car.jpg' title='The description goes here'></a>"
                    //                                    + "</div>";
                    ProfileImages.InnerHtml = img1;
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    lblBusinessName.Text = ds.Tables[1].Rows[0]["business_name"].ToString();
                    lblBusinessAddress.Text = ds.Tables[1].Rows[0]["business_address"].ToString();
                    lblPaymentMode.Text= ds.Tables[1].Rows[0]["PaymentMode"].ToString();
                    lblBookingAmount.Text = ds.Tables[1].Rows[0]["BookingAmount"].ToString();
                    lblRestAmount.Text = ds.Tables[1].Rows[0]["RestAmount"].ToString();
                    lblCancellationPolicy.Text = ds.Tables[1].Rows[0]["OrderCancellled"].ToString();
                    lblBusinessInfoHeading.InnerText = ds.Tables[1].Rows[0]["business_name"].ToString();
                    lblBusinessInfo.InnerText= ds.Tables[1].Rows[0]["Businessinfo"].ToString();
                    lblServiceCity.Text= ds.Tables[1].Rows[0]["city"].ToString();
                    chkYesDash.Checked=ds.Tables[1].Rows[0]["other_city"].ToString()=="True"?true:false;
                    chkTravelDash.Checked = ds.Tables[1].Rows[0]["travel_and_stay"].ToString() == "True" ? true : false;                     



                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    hometab.InnerText = ds.Tables[2].Rows[0]["ServiceType"].ToString();
                    profiletab.InnerText = ds.Tables[2].Rows[1]["ServiceType"].ToString();

                    string[] strServices = ds.Tables[2].Rows[0]["services"].ToString().Split(',');
                    string chkServices = "";
                    if (strServices.Length > 0)
                    {
                        for (int i = 0; i < strServices.Length; i++)
                        {
                            chkServices+= "<div class='form-check'>"
                                           + "<input class='form-check-input' type='checkbox' checked='true' value='' id='defaultCheck1'>"
                                           + "<label class='form-check-label' for='defaultCheck1'>"+strServices[i].ToString()+"</label>"
                                           + "</div>";
                        }
                    }
                    divServices.InnerHtml = chkServices;

                    lblPlatePrice.InnerText = ds.Tables[2].Rows[0]["PerPlatePrice"].ToString();
                    lblPlateItems.InnerText = ds.Tables[2].Rows[0]["Items"].ToString();
                    lblCookingPriceStart.InnerText= ds.Tables[2].Rows[1]["PerPlatePrice"].ToString();
                    lblNumberGuest.InnerText = ds.Tables[2].Rows[1]["NumOfGuest"].ToString();

                }
            }


        }




        protected void Personaltab_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(Personaltab, "active");
            ShowHidePanel(PanlPersonal, true);


        }
        protected void Businesstab_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(Businesstab, "active");
            ShowHidePanel(PanlBusinessContact, true);
        }

        protected void Producttab_Click(object sender, EventArgs e)
        {

            LinkActiveInActive(Producttab, "active");
            ShowHidePanel(panlProduct, true);

            GetPricePerPlate();
        }

        public void LinkActiveInActive(Button btn, string isActive)
        {



            Dashboardtab.CssClass = "nav-link";
            Personaltab.CssClass = "nav-link";
            Businesstab.CssClass = "nav-link";
            Producttab.CssClass = "nav-link";
            UploadPhotos.CssClass = "nav-link";
            PaymentType.CssClass = "nav-link";
            BusinessInformationBtn.CssClass = "nav-link";
            btn.CssClass = "nav-link " + isActive;



        }
        public void ShowHidePanel(Panel pnl, bool show)
        {
            PanlDashboard.Visible = false;
            PanlPersonal.Visible = false;
            PanlBusinessContact.Visible = false;
            panlProduct.Visible = false;
            PanlUploadPhotos.Visible = false;
            PanlBusinessInfo.Visible = false;
            PanlPaymentType.Visible = false;
            lblMessagePaymentMode.Text = "";
            lblmessageBusiness.Text = "";
            lblmessageContact.Text = "";
            pnl.Visible = show;

        }


        protected void btn_PricePerPlate_Click(object sender, EventArgs e)
        {
            // BindPricePerPlate();
            PanlPricePerPlate.Visible = true;
            PanlCookingPackag.Visible = false;
            GetPricePerPlate();

        }

        private void GetPricePerPlate()
        {
            DataSet ds = dllVendor.GetSerivceTpye(clsMain.getLoggedUserID(), "Plate System");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddl_PerPlatePrice.SelectedValue = ds.Tables[0].Rows[0]["PerPlatePrice"].ToString();
                hidPerPlatePrice.Value = ds.Tables[0].Rows[0]["Id"].ToString();
            }
            if (ds.Tables[1].Rows.Count > 0)
            {
                reptPricePerPlate.DataSource = ds.Tables[1];
                reptPricePerPlate.DataBind();
            }
            if (ds.Tables[2].Rows.Count > 0)
            {
                chk_service.DataSource = ds.Tables[2];
                chk_service.DataTextField = "Service";
                chk_service.DataValueField = "ServiceId";
                chk_service.DataBind();


                foreach (ListItem item in chk_service.Items)
                {

                    foreach (DataRow dr in ds.Tables[2].Rows)
                    {


                        if (item.Value == dr["ServiceOfferedId"].ToString())
                        {
                            item.Selected = true;
                        }

                    }
                }
            }
        }

        protected void btn_cookingPackage_Click(object sender, EventArgs e)
        {

            PanlPricePerPlate.Visible = false;
            PanlCookingPackag.Visible = true;
            GetCookingPacking();
        }

        private void GetCookingPacking()
        {


            DataSet ds = dllVendor.GetSerivceTpye(clsMain.getLoggedUserID(), "Cooking System");
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlCooking.SelectedValue = ds.Tables[0].Rows[0]["PerPlatePrice"].ToString();
                    hidCookingPrice.Value = ds.Tables[0].Rows[0]["Id"].ToString();
                    txtNoOfGustCooking.Text = ds.Tables[0].Rows[0]["NumOfGuest"].ToString();
                }


                if (ds.Tables[1].Rows.Count > 0)
                {
                    RepeaterCooking.DataSource = ds.Tables[1];
                    RepeaterCooking.DataBind();
                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    chk_serviceCooking.DataSource = ds.Tables[2];
                    chk_serviceCooking.DataTextField = "Service";
                    chk_serviceCooking.DataValueField = "ServiceId";
                    chk_serviceCooking.DataBind();

                    foreach (ListItem item in chk_serviceCooking.Items)
                    {

                        foreach (DataRow dr in ds.Tables[2].Rows)
                        {


                            if (item.Value == dr["ServiceOfferedId"].ToString())
                            {
                                item.Selected = true;
                            }
                        }
                    }

                }
            }

        }

        protected void UploadPhotos_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(UploadPhotos, "active");
            ShowHidePanel(PanlUploadPhotos, true);
            GetImages();
        }

        protected void btnUploadPhotos_Click(object sender, EventArgs e)
        {

            StartUpLoad(txtImageName.Text.ToString());
            GetImages();
        }
        private void StartUpLoad(string imageName)
        {
            //get the file name of the posted image  
            string imgName = FilePhotosUpload.FileName;
            //sets the image path  
            string imgPath = "Uploads/" + imgName;
            //get the size in bytes that  

            // int imgSize = FilePhotosUpload.PostedFile.ContentLength;
            decimal imgSize = Math.Round(((decimal)FilePhotosUpload.PostedFile.ContentLength / (decimal)1024), 2);


            //validates the posted file before saving  
            if (FilePhotosUpload.PostedFile != null && FilePhotosUpload.PostedFile.FileName != "")
            {
                // 10240 KB means 10MB, You can change the value based on your requirement  
                if (imgSize > 10240)
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
                }
                else
                {

                    string result = "";
                    //then save it to the Folder  
                    FilePhotosUpload.SaveAs(Server.MapPath(imgPath));
                    if (hidOldImage.Value != "")
                    {
                        string imgPathOld = Server.MapPath("Uploads//" + hidOldImage.Value);
                        ClsCommon.DeleteFileFromFolder(hidOldImage.Value, imgPathOld);
                    }

                    if (btnUploadPhotos.Text == "Update")
                    {

                        result = dllVendor.SaveVendorImage(Convert.ToInt32(hidUpdate.Value), imageName, imgName, clsMain.getLoggedUserID());
                        btnUploadPhotos.Text = "Save";
                        hidUpdate.Value = "";
                        imgEdit.ImageUrl = "";
                        imgEdit.Visible = false;
                    }
                    else
                    {
                        result = dllVendor.SaveVendorImage(0, imageName, imgName, clsMain.getLoggedUserID());
                    }
                    //  Image1.ImageUrl = "~/" + imgPath;
                    if (result == "Success")
                    {
                        //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Image saved!')", true);
                        txtImageName.Text = "";
                    }


                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Image not saved! some thing wrong')", true);
                    }




                }

            }
        }
        private void GetImages()
        {

            DataTable dt = dllVendor.GetVendorImages(clsMain.getLoggedUserID());
            if (dt.Rows.Count > 0)
            {
                ReptPhotos.DataSource = dt;
                ReptPhotos.DataBind();
            }

        }

        protected void ReptPhotos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                DataTable dt = dllVendor.GetVendorImagesById(Convert.ToInt32(e.CommandArgument));
                if (dt.Rows.Count > 0)
                {
                    imgEdit.ImageUrl = "Uploads/" + dt.Rows[0]["ImagePath"].ToString();
                    txtImageName.Text = dt.Rows[0]["ImageName"].ToString();
                    hidUpdate.Value = dt.Rows[0]["Id"].ToString();
                    imgEdit.Visible = true;
                    btnUploadPhotos.Text = "Update";
                    hidOldImage.Value = dt.Rows[0]["ImagePath"].ToString();
                }
                //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Image not saved! some thing wrong')", true);
            }

            if (e.CommandName == "Delete")
            {
                // Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Image not saved! some thing wrong')", true);
            }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            btnUploadPhotos.Text = "Save";
            hidUpdate.Value = "";
            imgEdit.ImageUrl = "";
            imgEdit.Visible = false;
            txtImageName.Text = "";


        }

        protected void BusinessInformationBtn_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(BusinessInformationBtn, "active");
            ShowHidePanel(PanlBusinessInfo, true);
            DataTable dt = dllVendor.GetBusinessInfoById(clsMain.getLoggedUserID());
            if (dt.Rows.Count > 0)
            {
                txtBusinessInfo.Text = dt.Rows[0]["BusinessInfo"].ToString();
                hidBusinessInfo.Value = dt.Rows[0]["Id"].ToString();
            }
        }

        protected void btnSaveBusinessInfo_Click(object sender, EventArgs e)
        {

            try
            {


                string result = "";
                if (string.IsNullOrEmpty(hidBusinessInfo.Value))
                {
                    result = dllVendor.SaveBusinessInfo(0, txtBusinessInfo.Text, clsMain.getLoggedUserID());

                }
                else
                {
                    result = dllVendor.SaveBusinessInfo(Convert.ToInt32(hidBusinessInfo.Value), txtBusinessInfo.Text, clsMain.getLoggedUserID());
                }
                if (result == "Success")
                {
                    lblMessageBusinessInfo.Text = "Business information saved";
                    hidBusinessInfo.Value = "";
                }
                else
                {
                    lblMessageBusinessInfo.Text = "Business information  not saved";
                }
            }
            catch (Exception ex)
            {

                lblMessageBusinessInfo.Text = ex.Message;
            }
        }



        protected void btnSaveCookingPackage_Click(object sender, EventArgs e)
        {
            try
            {

                string result = "";
                int serviceId = hidCookingPrice.Value == "" ? 0 : Convert.ToInt32(hidCookingPrice.Value);
                string Id = dllVendor.SaveServiceAndProduct(serviceId, "Cooking System", ddlCooking.SelectedValue, Convert.ToInt32(txtNoOfGustCooking.Text.Trim()), clsMain.getLoggedUserID());
                if (!string.IsNullOrEmpty(Id))
                {
                    for (int i = 0; i < RepeaterCooking.Items.Count; i++)
                    {
                        CheckBox chkItem = (CheckBox)RepeaterCooking.Items[i].FindControl("chkCooking");
                        TextBox txtItemType = (TextBox)RepeaterCooking.Items[i].FindControl("txtItemTypeCooking");
                        TextBox txtItemName = (TextBox)RepeaterCooking.Items[i].FindControl("txtItemNameCooking");
                        HiddenField hiddenItemId = (HiddenField)RepeaterCooking.Items[i].FindControl("hidItemIDCooking");

                        if (chkItem.Checked)
                        {
                            result = dllVendor.SaveServiceItem(Convert.ToInt32(hiddenItemId.Value), Convert.ToInt32(Id), hiddenItemId.Value, txtItemType.Text.Trim(), txtItemName.Text.Trim(), chkItem.Checked);
                        }


                    }
                    List<string> selectedValues = chk_serviceCooking.Items.Cast<ListItem>()
                                                          .Where(li => li.Selected)
                                                          .Select(li => li.Value)
                                                          .ToList();

                    foreach (var item in selectedValues)
                    {

                        result = dllVendor.SaveServiceOffered(Convert.ToInt32(Id), item);
                    }
                }
                if (result == "Success")
                {
                    lblMessageCooking.Text = "Cooking system Saved";
                    GetCookingPacking();
                }
                else
                {
                    lblMessageCooking.Text = "Cooking system not Saved";
                }
            }
            catch (Exception ex)
            {

                lblMessageCooking.Text = ex.Message;
            }
        }

        protected void btnSaveProductPerPalte_Click(object sender, EventArgs e)
        {
            try
            {



                string result = "";
                int serviceId = hidPerPlatePrice.Value == "" ? 0 : Convert.ToInt32(hidPerPlatePrice.Value);
                string Id = dllVendor.SaveServiceAndProduct(serviceId, "Plate System", ddl_PerPlatePrice.SelectedValue, 0, clsMain.getLoggedUserID());
                if (!string.IsNullOrEmpty(Id))
                {
                    for (int i = 0; i < reptPricePerPlate.Items.Count; i++)
                    {
                        CheckBox chkItem = (CheckBox)reptPricePerPlate.Items[i].FindControl("chkRequired");
                        TextBox txtItemType = (TextBox)reptPricePerPlate.Items[i].FindControl("txtItemType");
                        TextBox txtItemName = (TextBox)reptPricePerPlate.Items[i].FindControl("txtItemName");
                        HiddenField hiddenItemId = (HiddenField)reptPricePerPlate.Items[i].FindControl("hidItemID");

                        if (chkItem.Checked)
                        {
                            result = dllVendor.SaveServiceItem(Convert.ToInt32(hiddenItemId.Value), Convert.ToInt32(Id), hiddenItemId.Value, txtItemType.Text.Trim(), txtItemName.Text.Trim(), chkItem.Checked);
                        }


                    }
                    List<string> selectedValues = chk_service.Items.Cast<ListItem>()
                                                          .Where(li => li.Selected)
                                                          .Select(li => li.Value)
                                                          .ToList();

                    foreach (var item in selectedValues)
                    {

                        result = dllVendor.SaveServiceOffered(Convert.ToInt32(Id), item);
                    }
                }
                if (result == "Success")
                {
                    lblMessageServicePlateSystem.Text = "Plate system Saved";
                    GetPricePerPlate();
                }
                else
                {
                    lblMessageServicePlateSystem.Text = "Plate system not Saved";
                }
            }
            catch (Exception ex)
            {

                lblMessageServicePlateSystem.Text = ex.Message;
            }

        }

        protected void PaymentType_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(PaymentType, "active");
            ShowHidePanel(PanlPaymentType, true);

            BindPaymentInfo();
        }

        public void BindPaymentInfo()
        {
            DataTable dt = dllVendor.GetVendorPaymentData(clsMain.getLoggedUserID());
            if (dt.Rows.Count > 0)
            {
                ddlPaymentMode.SelectedValue = dt.Rows[0]["PaymentMode"].ToString();
                ddlBookingAmount.SelectedValue = dt.Rows[0]["BookingAmount"].ToString();
                ddlProgramDay.SelectedValue = dt.Rows[0]["RestAmount"].ToString();
                ddlBookingOrderCancel.SelectedValue = dt.Rows[0]["OrderCancellled"].ToString();
                hidPaymentType.Value = dt.Rows[0]["PaymentId"].ToString();
            }
        }
        protected void btnSavePaymentMode_Click(object sender, EventArgs e)
        {

            try
            {

                string result = "";
                if (string.IsNullOrEmpty(hidPaymentType.Value))
                {
                    result = dllVendor.SavePaymentInfo(0, ddlPaymentMode.SelectedValue, ddlBookingAmount.SelectedValue, ddlProgramDay.SelectedValue, ddlBookingOrderCancel.SelectedValue, clsMain.getLoggedUserID());

                }
                else
                {
                    result = dllVendor.SavePaymentInfo(Convert.ToInt32(hidPaymentType.Value), ddlPaymentMode.SelectedValue, ddlBookingAmount.SelectedValue, ddlProgramDay.SelectedValue, ddlBookingOrderCancel.SelectedValue, clsMain.getLoggedUserID());
                }
                if (result == "Success")
                {
                    lblMessagePaymentMode.Text = "Paymnet information saved";
                    hidPaymentType.Value = "";
                    BindPaymentInfo();
                }
                else
                {
                    lblMessagePaymentMode.Text = "Paymnet not saved";
                }
            }
            catch (Exception ex)
            {

                lblMessagePaymentMode.Text = ex.Message;
            }
        }
    }
}