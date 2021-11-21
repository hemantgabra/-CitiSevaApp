using CitySeva.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitySeva
{
    public partial class Vendor : System.Web.UI.Page
    {
        #region Tabs hide show
        public void ShowHidePanel(Panel pnl, bool show)
        {
            PanlDashboard.Visible = false;
            PanlPersonal.Visible = false;
            PanlBusinessContact.Visible = false;
            panlProduct.Visible = false;
            PanlUploadPhotos.Visible = false;
            PanlBusinessInfo.Visible = false;
            PanlPaymentType.Visible = false;
            PanlOrderBooking.Visible = false;
            PanlWorker.Visible = false;
            PanlCustomerEnquery.Visible = false;
            lblMessagePaymentMode.Text = "";
            lblmessageBusiness.Text = "";
            lblmessageContact.Text = "";
            pnl.Visible = show;

        }
        public void LinkActiveInActive(Button btn, string isActive)
        {



            Dashboardtab.CssClass = "nav-link";
            Personaltab.CssClass = "nav-link";
            Businesstab.CssClass = "nav-link";
            Producttab.CssClass = "nav-link";
            UploadPhotos.CssClass = "nav-link";
            PaymentType.CssClass = "nav-link";
            btnWorkers.CssClass = "nav-link";
            BusinessInformationBtn.CssClass = "nav-link";
            btnBookingOrderTab.CssClass = "nav-link";
            btnCustomerEnquery.CssClass= "nav-link";
            btn.CssClass = "nav-link " + isActive;



        }
        #endregion
        clsMain clsMain = new clsMain();
        dllVendor dllVendor = new dllVendor();
        ClsCommonFun ClsCommon = new ClsCommonFun();
        dllCommonUtility DllCommonUtilityOBJ = new dllCommonUtility();
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
                    lblPaymentMode.Text = ds.Tables[1].Rows[0]["PaymentMode"].ToString();
                    lblBookingAmount.Text = ds.Tables[1].Rows[0]["BookingAmount"].ToString();
                    lblRestAmount.Text = ds.Tables[1].Rows[0]["RestAmount"].ToString();
                    lblCancellationPolicy.Text = ds.Tables[1].Rows[0]["OrderCancellled"].ToString();
                    lblBusinessInfoHeading.InnerText = ds.Tables[1].Rows[0]["business_name"].ToString();
                    lblBusinessInfo.InnerText = ds.Tables[1].Rows[0]["Businessinfo"].ToString();
                    lblServiceCity.Text = ds.Tables[1].Rows[0]["city"].ToString();
                    chkYesDash.Checked = ds.Tables[1].Rows[0]["other_city"].ToString() == "True" ? true : false;
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
                            chkServices += "<div class='form-check'>"
                                           + "<input class='form-check-input' type='checkbox' checked='true' value='' id='defaultCheck1'>"
                                           + "<label class='form-check-label' for='defaultCheck1'>" + strServices[i].ToString() + "</label>"
                                           + "</div>";
                        }
                    }
                    divServices.InnerHtml = chkServices;

                    lblPlatePrice.InnerText = ds.Tables[2].Rows[0]["PerPlatePrice"].ToString();
                    lblPlateItems.InnerText = ds.Tables[2].Rows[0]["Items"].ToString();
                    lblCookingPriceStart.InnerText = ds.Tables[2].Rows[1]["PerPlatePrice"].ToString();
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

            GetPricePerPlate(0);
            GetVendorServiceList();
        }




        protected void btn_PricePerPlate_Click(object sender, EventArgs e)
        {
            // BindPricePerPlate();
            PanlPricePerPlate.Visible = true;
            PanlCookingPackag.Visible = false;
            GetPricePerPlate(0);
            GetVendorServiceList();

        }

        private void GetPricePerPlate(int serviceId)
        {
            DataSet ds = dllVendor.GetSerivceTpye(clsMain.getLoggedUserID(), "Plate System", serviceId);
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
                repNonPriceVegitable.DataSource = ds.Tables[2];
                repNonPriceVegitable.DataBind();
            }
            if (ds.Tables[3].Rows.Count > 0)
            {
                chk_service.DataSource = ds.Tables[3];
                chk_service.DataTextField = "Service";
                chk_service.DataValueField = "ServiceId";
                chk_service.DataBind();


                foreach (ListItem item in chk_service.Items)
                {

                    foreach (DataRow dr in ds.Tables[3].Rows)
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


            DataSet ds = dllVendor.GetSerivceTpye(clsMain.getLoggedUserID(), "Cooking System", 0);
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
                    rptCookingNonVegetables.DataSource = ds.Tables[2];
                    rptCookingNonVegetables.DataBind();
                }
                if (ds.Tables[3].Rows.Count > 0)
                {
                    chk_serviceCooking.DataSource = ds.Tables[3];
                    chk_serviceCooking.DataTextField = "Service";
                    chk_serviceCooking.DataValueField = "ServiceId";
                    chk_serviceCooking.DataBind();

                    foreach (ListItem item in chk_serviceCooking.Items)
                    {

                        foreach (DataRow dr in ds.Tables[3].Rows)
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

                    for (int n = 0; n < repNonPriceVegitable.Items.Count; n++)
                    {
                        CheckBox chkItemN = (CheckBox)repNonPriceVegitable.Items[n].FindControl("chkCooking");
                        TextBox txtItemTypeN = (TextBox)repNonPriceVegitable.Items[n].FindControl("txtItemTypeCooking");
                        TextBox txtItemNameN = (TextBox)repNonPriceVegitable.Items[n].FindControl("txtItemNameCooking");
                        HiddenField hiddenItemIdN = (HiddenField)repNonPriceVegitable.Items[n].FindControl("hidItemIDCooking");

                        if (chkItemN.Checked)
                        {
                            result = dllVendor.SaveServiceItem(Convert.ToInt32(hiddenItemIdN.Value), Convert.ToInt32(Id), hiddenItemIdN.Value, txtItemTypeN.Text.Trim(), txtItemNameN.Text.Trim(), chkItemN.Checked);

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
                    // GetCookingPacking();
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

                    for (int i = 0; i < repNonPriceVegitable.Items.Count; i++)
                    {
                        CheckBox chkItem = (CheckBox)repNonPriceVegitable.Items[i].FindControl("chkRequired");
                        TextBox txtItemType = (TextBox)repNonPriceVegitable.Items[i].FindControl("txtItemType");
                        TextBox txtItemName = (TextBox)repNonPriceVegitable.Items[i].FindControl("txtItemName");
                        HiddenField hiddenItemId = (HiddenField)repNonPriceVegitable.Items[i].FindControl("hidItemID");

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
                    GetPricePerPlate(0);
                    GetVendorServiceList();
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

        private void GetVendorServiceList()
        {
            DataTable dt = dllVendor.GetSerivceList(clsMain.getLoggedUserID(), "Plate System");
            if (dt.Rows.Count > 0)
            {
                StringBuilder sbstr = new StringBuilder();
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    sbstr.AppendFormat("<button type='button' id='btnPrice_{0}' class='btn btn-primary w-25'>{1}</button>", dt.Rows[i]["Id"].ToString(), dt.Rows[i]["PerPlatePrice"].ToString());

                }
                divPlateSystem.InnerHtml = sbstr.ToString();

            }

        }

        protected void PaymentType_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(PaymentType, "active");
            ShowHidePanel(PanlPaymentType, true);

            BindPaymentInfo();
        }
        #region Booking order
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

        protected void btnBookingOrderTab_Click(object sender, EventArgs e)
        {
            BindCustomers();
            LinkActiveInActive(btnBookingOrderTab, "active");
            ShowHidePanel(PanlOrderBooking, true);
        }

        protected void btnSameBookingOrder_Click(object sender, EventArgs e)
        {

            if (btnSameBookingOrder.Text != "Update")
            {


                int vendorId = clsMain.getLoggedUserID();
                string result = dllVendor.SaveCustomerInfo(Convert.ToInt32(hidUpdateBookingOrder.Value), txtCustomerName.Text
                    , txtCustomerContact.Text, Convert.ToDateTime(txtProgrameDate.Text), txtProgrameName.Text, txtProgrameAddress.Text, txtProgrameCity.Text, vendorId);

                if (result == "1")
                {
                    ClearCustomer();
                    BindCustomers();
                    lblBookingOrderMessage.Text = "Customer infomation saved successfully!";
                }


            }

            else
            {

                int vendorId = clsMain.getLoggedUserID();
                string result = dllVendor.SaveCustomerInfo(Convert.ToInt32(hidUpdateBookingOrder.Value), txtCustomerName.Text
                    , txtCustomerContact.Text, Convert.ToDateTime(txtProgrameDate.Text), txtProgrameName.Text, txtProgrameAddress.Text, txtProgrameCity.Text, vendorId);

                if (result == "1")
                {
                    ClearCustomer();
                    BindCustomers();
                    btnSameBookingOrder.Text = "Submit";
                    hidUpdateBookingOrder.Value = "0";
                    lblBookingOrderMessage.Text = "Customer infomation updated successfully!";
                }
            }
        }
        private void BindCustomers()
        {
            int vendorId = clsMain.getLoggedUserID();
            DataTable dt = dllVendor.GetCustomersInfoByVendor(vendorId);
            if (dt.Rows.Count > 0)
            {
                rptBookingOrder.DataSource = dt;
                rptBookingOrder.DataBind();

            }

        }

        private void ClearCustomer()
        {

            hidUpdateBookingOrder.Value = "0";
            txtCustomerName.Text = "";
            txtCustomerContact.Text = "";
            txtProgrameDate.Text = "";
            txtProgrameName.Text = "";
            txtProgrameAddress.Text = "";
            txtProgrameCity.Text = "";
        }

        protected void rptBookingOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                DataTable dt = dllVendor.GetCustomersInfoByCustomerId(Convert.ToInt32(e.CommandArgument));
                if (dt.Rows.Count > 0)
                {
                    txtCustomerName.Text = dt.Rows[0]["CustomerName"].ToString();
                    txtCustomerContact.Text = dt.Rows[0]["Contact"].ToString();
                    txtProgrameDate.Text = dt.Rows[0]["ProgrameDate"].ToString();
                    txtProgrameName.Text = dt.Rows[0]["ProgrameName"].ToString();
                    txtProgrameAddress.Text = dt.Rows[0]["ProgrameAddress"].ToString();
                    txtProgrameCity.Text = dt.Rows[0]["ProgrameCity"].ToString();
                    hidUpdateBookingOrder.Value = dt.Rows[0]["Id"].ToString();
                    btnSameBookingOrder.Text = "Update";

                }

            }

            if (e.CommandName == "Delete")
            {
                string result = dllVendor.DeleteCustomersInfoByVendor(Convert.ToInt32(e.CommandArgument));
                if (result == "1")
                {
                    lblBookingOrderMessage.Text = "Deleted successfully";
                    BindCustomers();
                }
            }
            if (e.CommandName == "View")
            {
                DataTable dt = dllVendor.GetCustomersInfoByCustomerId(Convert.ToInt32(e.CommandArgument));
                if (dt.Rows.Count > 0)
                {
                    lblProgrammeCustomerName.Text = dt.Rows[0]["CustomerName"].ToString();
                    //lblProgrammeName.Text = dt.Rows[0]["Contact"].ToString();
                    lblProgrammeDate.Text = dt.Rows[0]["ProgrameDate"].ToString();
                    lblProgrammeName.Text = dt.Rows[0]["ProgrameName"].ToString();
                    lblProgrameAddress.Text = dt.Rows[0]["ProgrameAddress"].ToString();
                    // txtProgrameCity.Text = dt.Rows[0]["ProgrameCity"].ToString();


                }

                DataTable dtWorker = dllVendor.GetProgrameWorkerDetails(Convert.ToInt32(e.CommandArgument));
                if (dtWorker.Rows.Count > 0)
                {
                    repeaterProgramePopup.DataSource = dtWorker;
                    repeaterProgramePopup.DataBind();

                }

                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript'>  openDilog();</script> ");


            }
        }

        protected void btnSameBookingOrderCancel_Click(object sender, EventArgs e)
        {
            ClearCustomer();
            btnSameBookingOrder.Text = "Submit";
        }
        #endregion
        #region Worker

        protected void btnAddWorkerSave_Click(object sender, EventArgs e)
        {

            if (btnAddWorkerSave.Text != "Update")
            {


                int vendorId = clsMain.getLoggedUserID();
                string result = dllVendor.SaveWorkerInfo(Convert.ToInt32(hidAddWorkerId.Value), txtWorkerName.Text.Trim()
                    , txtWorkerPost.Text.Trim(), txtWorkerContact.Text.Trim(), txtWorkerAddress.Text, vendorId);

                if (result == "1")
                {
                    ClearWorkers();
                    BindWorkers();
                    lblBookingOrderMessage.Text = "Worker infomation saved successfully!";
                }


            }

            else
            {

                int vendorId = clsMain.getLoggedUserID();
                string result = dllVendor.SaveWorkerInfo(Convert.ToInt32(hidAddWorkerId.Value), txtWorkerName.Text.Trim()
                    , txtWorkerPost.Text.Trim(), txtWorkerContact.Text.Trim(), txtWorkerAddress.Text, vendorId);

                if (result == "1")
                {
                    ClearWorkers();
                    BindWorkers();
                    btnAddWorkerSave.Text = "Submit";
                    lblBookingOrderMessage.Text = "Worker infomation updated successfully!";
                }
            }
        }

        protected void btnAddWorkerCancel_Click(object sender, EventArgs e)
        {
            ClearWorkers();
            btnAddWorkerSave.Text = "Submit";
            lblAddWorkerMessage.Text = "";
        }

        protected void btnAddWorker_Click(object sender, EventArgs e)
        {


            PanlAddWorker.Visible = true;
            PanlSelectWorkerForProgramme.Visible = false;
            BindWorkers();
        }

        protected void btnSelectWorkerForProgramme_Click(object sender, EventArgs e)
        {

            PanlAddWorker.Visible = false;
            PanlSelectWorkerForProgramme.Visible = true;
            BindWorkersSelect();
            BindProgrammeDateList();

        }

        protected void btnWorkers_Click(object sender, EventArgs e)
        {
            LinkActiveInActive(btnWorkers, "active");
            ShowHidePanel(PanlWorker, true);
            PanlAddWorker.Visible = true;
            lblAddWorkerMessage.Text = "";
            BindWorkers();
        }




        private void BindWorkers()
        {
            int vendorId = clsMain.getLoggedUserID();
            DataTable dt = dllVendor.GetWorkerInfoByVendor(vendorId);
            if (dt.Rows.Count > 0)
            {
                ReptWorker.DataSource = dt;
                ReptWorker.DataBind();

            }

        }

        private void ClearWorkers()
        {

            hidAddWorkerId.Value = "0";
            txtWorkerName.Text = "";
            txtWorkerPost.Text = "";
            txtWorkerContact.Text = "";
            txtWorkerAddress.Text = "";

        }

        protected void ReptWorker_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                DataTable dt = dllVendor.GetWorkerInfoByCustomerId(Convert.ToInt32(e.CommandArgument));
                if (dt.Rows.Count > 0)
                {
                    txtWorkerName.Text = dt.Rows[0]["WorkerName"].ToString();
                    txtWorkerPost.Text = dt.Rows[0]["WorkerPost"].ToString();
                    txtWorkerContact.Text = dt.Rows[0]["Contact"].ToString();
                    txtWorkerAddress.Text = dt.Rows[0]["Address"].ToString();
                    hidAddWorkerId.Value = dt.Rows[0]["Id"].ToString();
                    btnAddWorkerSave.Text = "Update";
                    lblAddWorkerMessage.Text = "";
                }

            }

            if (e.CommandName == "Delete")
            {
                string result = dllVendor.DeleteWorkerInfoById(Convert.ToInt32(e.CommandArgument));
                if (result == "1")
                {
                    lblAddWorkerMessage.Text = "Deleted successfully";
                    BindWorkers();
                }
            }
        }


        #endregion
        #region Worker for programme


        private void BindWorkersSelect()
        {
            int vendorId = clsMain.getLoggedUserID();
            DataTable dt = dllVendor.GetWorkerInfoByVendor(vendorId);
            if (dt.Rows.Count > 0)
            {
                repeaterWorkerPrograme.DataSource = dt;
                repeaterWorkerPrograme.DataBind();

            }

        }
        private void BindProgrammeDateList()
        {
            int vendorId = clsMain.getLoggedUserID();
            DataTable dt = dllVendor.GetCustomersInfoByVendor(vendorId);
            if (dt.Rows.Count > 0)
            {
                ddlWorkerProgrammeDate.Items.Clear();
                ddlWorkerProgrammeDate.AppendDataBoundItems = true;
                ddlWorkerProgrammeDate.Items.Insert(0, new ListItem() { Text = "Select", Value = "0" });
                ddlWorkerProgrammeDate.DataSource = dt;
                ddlWorkerProgrammeDate.DataValueField = "Id";
                ddlWorkerProgrammeDate.DataTextField = "ProgrameDate";
                ddlWorkerProgrammeDate.DataBind();

            }

        }


        #endregion

        protected void ddlWorkerProgrammeDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            int vendorId = clsMain.getLoggedUserID();
            DataTable dt = dllVendor.GetProgrammeDetailsById(Convert.ToInt32(ddlWorkerProgrammeDate.SelectedValue), vendorId);
            if (dt.Rows.Count > 0)
            {
                txtWorkerNameAdd.Text = dt.Rows[0]["ProgrameName"].ToString();

            }
        }

        protected void btnProgrammeWorkerSave_Click(object sender, EventArgs e)
        {

            string strWorkerId = "";
            for (int i = 0; i < repeaterWorkerPrograme.Items.Count; i++)
            {
                HiddenField chkItemValue = (HiddenField)repeaterWorkerPrograme.Items[i].FindControl("hdnWorkerId");
                CheckBox chkItemChecked = (CheckBox)repeaterWorkerPrograme.Items[i].FindControl("chkWorkerName");


                if (chkItemChecked.Checked)
                {
                    strWorkerId += "," + chkItemValue.Value;
                }


            }
            if (!string.IsNullOrEmpty(strWorkerId))
                strWorkerId = strWorkerId.Substring(1);

            int programmeID;
            int.TryParse(ddlWorkerProgrammeDate.SelectedValue, out programmeID);
            if (!string.IsNullOrEmpty(strWorkerId) && programmeID != 0)
            {

                string result = dllVendor.SaveWorkerProgramme(programmeID, strWorkerId);
                if (result == "1")
                {

                    lblProgrammeWorkerSave.Text = "Programme saved Successfully";
                    ddlWorkerProgrammeDate.SelectedValue = "0";
                    txtWorkerNameAdd.Text = "";
                    for (int i = 0; i < repeaterWorkerPrograme.Items.Count; i++)
                    {

                        CheckBox chkItemChecked = (CheckBox)repeaterWorkerPrograme.Items[i].FindControl("chkWorkerName");
                        chkItemChecked.Checked = false;


                    }

                }
            }

        }

        protected void btnCustomerEnquery_Click(object sender, EventArgs e)
        {
            ShowHidePanel(PanlCustomerEnquery, true);
            LinkActiveInActive(btnCustomerEnquery, "active");
            GridCustomerEnquery();
        }
        void GridCustomerEnquery()
        {

            try
            {


                DataTable Dt = DllCommonUtilityOBJ.GetRequestList();
                if (Dt.Rows.Count > 0)
                {
                    RequestRpt.DataSource = Dt;
                    RequestRpt.DataBind();
                }

            }
            catch (Exception ex)
            {
                //   ShowMessage(ex.Message);
            }



        }
        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {
                Button btnActive = (Button)e.Item.FindControl("btn_edit");
                string text = btnActive.Text;
                string result = "";
                if (text == "Pending")
                {
                    string userId = e.CommandArgument.ToString();
                    result = DllCommonUtilityOBJ.RequestActiveInActive(userId, false);
                }
                if (text == "Closed")
                {
                    string userId = e.CommandArgument.ToString();
                    result = DllCommonUtilityOBJ.RequestActiveInActive(userId, true);
                }
                GridCustomerEnquery();

            }
        }
        protected void UsersRpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Reference the Repeater Item.
                RepeaterItem item = e.Item;

                //Reference the Controls.
                string hidIsactiveValue = (item.FindControl("hiIsActive") as HiddenField).Value;

                if (hidIsactiveValue == "True")
                {
                    (item.FindControl("btn_edit") as Button).Text = "Pending";
                    //(item.FindControl("btn_edit") as Button).ForeColor = System.Drawing.Color.Green;
                    (item.FindControl("btn_edit") as Button).CssClass = "btn btn-primary";
                }
                if (hidIsactiveValue == "False")
                {

                    (item.FindControl("btn_edit") as Button).Text = "Closed";
                    // (item.FindControl("btn_edit") as Button).ForeColor = System.Drawing.Color.Red;
                    (item.FindControl("btn_edit") as Button).CssClass = "btn btn-danger";
                }

            }
        }
    }
}