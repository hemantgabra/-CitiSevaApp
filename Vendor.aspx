<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Vendor.aspx.cs" Inherits="CitySeva.Vendor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>


        function openDilog() {

            $('#programeModal').modal('show');
        }






    </script>
    <div class="container">
        <div class="row">
            <div class="modal fade request_price" id="programeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Booking Order</h5>
                            <%-- <span>Fill this form and Elysian Weddings will contact you shortly. All the information provided will be treated confidentially.</span>--%>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <div class="col-4">Customer Name</div>
                                <div class="col-4">
                                    <asp:Label ID="lblProgrammeCustomerName" Text="sdj" runat="server"></asp:Label>
                                </div>

                                <div class="col-4">Programme Name</div>
                                <div class="col-4">
                                    <asp:Label ID="lblProgrammeName" Text="sdj" runat="server"></asp:Label>
                                </div>

                                <div class="col-4">Programme Date</div>
                                <div class="col-4">
                                    <asp:Label ID="lblProgrammeDate" runat="server"></asp:Label>
                                </div>
                                <div class="col-4">Programme Address</div>
                                <div class="col-4">
                                    <asp:Label ID="lblProgrameAddress" runat="server"></asp:Label>
                                </div>

                            </div>
                            <div class="form-group">

                                <asp:Repeater ID="repeaterProgramePopup" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Worker Name
                                                </th>
                                                <th>Post
                                                </th>
                                                <th>Select
                                                </th>

                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <tr>

                                            <td>
                                                <asp:Label ID="lblWorkerName" runat="server" Text='<%#Eval("WorkerName")%>'></asp:Label>


                                            </td>
                                            <td>
                                                <asp:Label ID="lblWorkerPost" runat="server" Text='<%#Eval("WorkerPost")%>'></asp:Label>


                                            </td>
                                            <td>
                                                <asp:Label ID="Label8" runat="server" Font-Bold="true" Text="&#10003;"></asp:Label>
                                                <%-- <asp:CheckBox ID="chkWorkerName" runat="server" />
                                                    <asp:HiddenField ID="hdnWorkerId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Id")  %>' />--%>
                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>


                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <div class="nav flex-column nav-pills col-2 pt-5 vendor-reg-left" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                <asp:Button ID="Dashboardtab" class="nav-link" OnClick="Dashboardtab_Click" Text="Dashboard" runat="server"></asp:Button>
                <asp:Button ID="Personaltab" class="nav-link" OnClick="Personaltab_Click" Text="Personal Contact" runat="server"></asp:Button>
                <asp:Button ID="Businesstab" class="nav-link" OnClick="Businesstab_Click" Text="Business Contact" runat="server"></asp:Button>
                <asp:Button ID="PaymentType" class="nav-link" OnClick="PaymentType_Click" Text="Payment Type" runat="server"></asp:Button>
                <asp:Button ID="Producttab" class="nav-link" OnClick="Producttab_Click" Text="Add Service / Product" runat="server"></asp:Button>
                <asp:Button ID="UploadPhotos" class="nav-link" OnClick="UploadPhotos_Click" Text="Upload Photos" runat="server"></asp:Button>
                <asp:Button ID="BusinessInformationBtn" class="nav-link" OnClick="BusinessInformationBtn_Click" Text="Business Information" runat="server"></asp:Button>
                <asp:Button ID="btnBookingOrderTab" class="nav-link" OnClick="btnBookingOrderTab_Click" Text="Booking order" runat="server"></asp:Button>
                <asp:Button ID="btnWorkers" class="nav-link" Text="Workers" OnClick="btnWorkers_Click" runat="server"></asp:Button>
                <asp:Button ID="btnCustomerEnquery" class="nav-link" Text="Custome Enquery" OnClick="btnCustomerEnquery_Click" runat="server"></asp:Button>
            </div>


            <div class="col-10 pl-5 pt-3">



                <div class="tab-content pt-3" id="v-pills-tabContent">
                    <asp:Panel ID="PanlDashboard" Visible="false" runat="server">

                        <div class="row">
                            <div class="col-6">
                                <section id="magnific">
                                    <div class="row">
                                        <%--<div class="large-12 column">
                                            <h3>With Magnific Pop-up</h3>
                                            Left click while zooming
                                        </div>--%>


                                        <div class="large-5 column">
                                            <div class="xzoom-container" id="ProfileImages" runat="server">
                                            </div>
                                        </div>
                                        <div class="large-7 column">
                                            <div>
                                                <table class="table table-bordered m-1">

                                                    <tr>
                                                        <td>Payment Type
                                                        </td>
                                                        <td>-
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPaymentMode" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Booking Amount
                                                        </td>
                                                        <td>-
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBookingAmount" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Rest Amount
                                                        </td>
                                                        <td>-
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblRestAmount" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Cancellation Policy
                                                        </td>
                                                        <td>-
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblCancellationPolicy" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Service City
                                                        </td>
                                                        <td>-
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblServiceCity" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Other City
                                                        </td>
                                                        <td>-
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="chkYesDash" Text="Yes" runat="server" /><br />
                                                            <asp:CheckBox ID="chkTravelDash" Text="Travel & Stay paid by Client" runat="server" />

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div>
                                                <hr />
                                                <label>Information about </label>
                                                <label id="lblBusinessInfoHeading" runat="server"></label>
                                                <label id="lblBusinessInfo" runat="server"></label>

                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="col-6">
                                <h2>
                                    <asp:Label ID="lblBusinessName" runat="server"></asp:Label></h2>
                                <h6>
                                    <asp:Label ID="lblBusinessAddress" runat="server"></asp:Label></h6>

                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">

                                        <button class="nav-link active" id="hometab" runat="server" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profiletab" runat="server" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>
                                    </li>
                                </ul>
                                <div class="row h-50">
                                    <div class="tab-content col-6" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="hometab">

                                            <div class="form-group">
                                                <br />
                                                <h3>
                                                    <label for="lblPlatePrice">Plate Price</label></h3>
                                                <br />
                                                <label id="lblPlatePrice" runat="server"></label>
                                                <br />
                                                <h3>
                                                    <label for="lblPlateItems">Plate Items</label></h3>
                                                <br />
                                                <label id="lblPlateItems" runat="server"></label>
                                                <br />
                                                <h3>
                                                    <label for="lblCustomPlatePrice">Custom Plate</label></h3>
                                                <br />
                                                <label id="lblCustomPlatePrice" runat="server" class="list-group-item-light">Custom Plate option available according to need.</label>


                                            </div>


                                        </div>
                                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profiletab">


                                            <div class="form-group">
                                                <br />
                                                <h3>
                                                    <label for="lblCookingPriceStart">Cooking Price Start</label></h3>
                                                <br />
                                                <label id="lblCookingPriceStart" runat="server" class="list-group-item-light"></label>
                                                <br />
                                                <h3>
                                                    <label for="lblNumberGuest">No. of Guest</label></h3>
                                                <br />
                                                <label id="lblNumberGuest" runat="server" class="list-group-item-light"></label>
                                                <br />
                                                <h3>
                                                    <label for="lblCustomCooking">Custom Option</label></h3>
                                                <br />
                                                <label id="lblCustomCooking" runat="server" class="list-group-item-light">Custom Cooking package option available according to need.</label>


                                            </div>


                                        </div>
                                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                            Contact Data something (such as a story or movie) considered as an object to be examined, explicated, or deconstructed


                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <h5>Service Offered</h5>
                                        <div id="divServices" runat="server">
                                        </div>


                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">

                                            <h3>Contact- Vendor</h3>
                                            <span>Fill this form and vendor will contact you shortly. All information provided will be treated confidently. </span>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtCityform" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtContactNo" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtDate" CssClass="form-control" placeholder="Date" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <p>
                                                By clicking Request Pricing you agree to sign up and accept CitiSeva's <a href="#">Terms of use</a>
                                            </p>
                                        </div>
                                        <div class="form-group text-light">
                                            <button type="button" class="btn btn-block bg-primary ">Submit</button>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                    <asp:Panel ID="PanlPersonal" Visible="false" runat="server">

                        <div id="PersonalContact">
                            <h3>personal contact</h3>
                            <div class="row">
                                <div class="col">
                                    <label for="exampleInputEmail1">First Name</label>
                                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="PersonalContactGroup" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="exampleInputPassword1">Last Name</label>
                                    <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="PersonalContactGroup" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" ErrorMessage="Last name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col">
                                    <label for="mobileNumber">Mobile Number</label>
                                    <asp:TextBox ID="txtMobileNumber" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="PersonalContactGroup" ControlToValidate="txtMobileNumber" Display="Dynamic" ForeColor="Red" ErrorMessage="Mobile number is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="PersonalContactGroup" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMobileNumber" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Mobile number is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col">
                                    <label for="homeAddress">Home Address</label>
                                    <asp:TextBox ID="txtHomeAddress" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="PersonalContactGroup" ControlToValidate="txtHomeAddress" Display="Dynamic" ForeColor="Red" ErrorMessage="Address is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col">
                                    <label for="emailId">Email Id</label>
                                    <asp:TextBox ID="txtEmailId" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="PersonalContactGroup" ControlToValidate="txtEmailId" Display="Dynamic" ForeColor="Red" ErrorMessage="Email name is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="reg1" runat="server" ValidationGroup="PersonalContactGroup" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email address is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col">
                                    <label for="City">City</label>
                                    <asp:TextBox ID="txtCity" runat="server" MaxLength="50" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="PersonalContactGroup" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" ErrorMessage="city is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-4 mb-4">
                                <div class="col">
                                    <label for="pincode">Pincode</label>
                                    <asp:TextBox ID="txtPincode" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="PersonalContactGroup" ControlToValidate="txtPincode" Display="Dynamic" ForeColor="Red" ErrorMessage="Pin code is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="PersonalContactGroup" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPincode" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Pin code is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col">
                                    <label for="state">State</label>

                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                        <asp:ListItem Selected="True" Value="0">State</asp:ListItem>
                                        <asp:ListItem Value="Delhi">Delhi</asp:ListItem>
                                        <asp:ListItem Value="UP">UP</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="PersonalContactGroup" InitialValue="0" ControlToValidate="ddlState" Display="Dynamic" ForeColor="Red" ErrorMessage="State is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <asp:Button ID="btnSubmit" class="btn btn-primary" ValidationGroup="PersonalContactGroup" OnClick="btnSubmit_Click" runat="server" Text="Submit" />


                            <div>

                                <asp:Label ID="lblmessageContact" runat="server"></asp:Label>
                            </div>
                        </div>

                    </asp:Panel>
                    <asp:Panel ID="PanlBusinessContact" Visible="false" runat="server">

                        <div id="BusinessContact">
                            <h3>Business Contact</h3>
                            <div class="row mb-4">
                                <div class="col">
                                    <label for="businesssName">Business Name</label>
                                    <asp:TextBox ID="txtBusinessName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="lblBusinessCategory">Business Category</label>                                     
                                    <asp:DropDownList ID="ddlBusinessCategory" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="BusinessContactGroup" ControlToValidate="ddlBusinessCategory" InitialValue="0" Display="Dynamic" ForeColor="Red" ErrorMessage="Last name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <div class="col">
                                    <label for="lblBusinessAddress">Business Address</label>
                                    <asp:TextBox ID="txtBusinessAddress" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessAddress" Display="Dynamic" ForeColor="Red" ErrorMessage=" Business Address is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="lbltxtBusinessCity">City</label>

                                    <asp:DropDownList ID="ddlBusinessCity" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="BusinessContactGroup" ControlToValidate="ddlBusinessCity" InitialValue="0" Display="Dynamic" ForeColor="Red" ErrorMessage="City is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <div class="col">
                                    <label for="lbltxtBusinessCity">Other City</label>
                                    <div>
                                        <div class="form-check form-check-inline">

                                            <asp:CheckBox ID="chkYes" CssClass="form-check-input" runat="server" />
                                            <label class="form-check-label" for="inlineCheckbox1">Yes</label>

                                        </div>
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox ID="chkTravel" CssClass="form-check-input" runat="server" />
                                            <label class="form-check-label" for="inlineCheckbox2">Travel & Stay by Client</label>
                                        </div>


                                    </div>
                                </div>
                                <div class="col">
                                    <label for="lblpincode">Pincode</label>
                                    <asp:TextBox ID="txtBusinessPinCode" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessPinCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Pin code is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="BusinessContactGroup" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtBusinessPinCode" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Pin code is not valid"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col">
                                    <label for="lblState">City</label>
                                    <asp:TextBox ID="txtState" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="BusinessContactGroup" ControlToValidate="txtState" Display="Dynamic" ForeColor="Red" ErrorMessage="State is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="lblBusinessRunningFrom">Business Running From (YYYY)</label>
                                    <asp:TextBox ID="txtBusinessRunning" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessRunning" Display="Dynamic" ForeColor="Red" ErrorMessage="Business Running from is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <asp:Button ID="btnBusinessContact" class="btn btn-primary" ValidationGroup="BusinessContactGroup" OnClick="btnBusinessContact_Click" runat="server" Text="Submit" />


                            <div>

                                <asp:Label ID="lblmessageBusiness" runat="server"></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>


                    <asp:Panel ID="panlProduct" Width="100%" Visible="false" runat="server">
                        <asp:HiddenField ID="hidCategoryId" runat="server" />
                        <div id="divProductAndServices" runat="server">
                            
                              <div class="form-group">
                                    
                                    <label for="businesssName">Service Type</label>
                                  <asp:DropDownList id="ddlBusinessSubCategory" CssClass="form-control" runat="server"></asp:DropDownList>

                                    
                                </div>
                             <div class="form-group">
                                 <label for="businesssName">Title</label>
                                 <asp:TextBox ID="txtServiceNameTitle" CssClass="form-control" runat="server"></asp:TextBox>
                             </div>
                            <div class="form-group">

                                 <label for="businesssName">Price/Text</label>
                                <asp:LinkButton ID="btnLinkItem" runat="server" Text="Add Items" ></asp:LinkButton>
                                <asp:LinkButton ID="btnLinkServices" runat="server" Text="Add Services" ></asp:LinkButton>
                            </div>
                            <div class="form-group">
                                  <label for="businesssName">Price/Text</label>
                                    <label for="businesssName">Vegetable Items</label>
                                    <asp:HiddenField ID="hidPlateSystemUpdate" runat="server" />
                                    <asp:Repeater ID="reptPricePerPlate" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Cooking Items
                                                    </th>
                                                    <th>Item Type
                                                    </th>
                                                    <th>Item Name
                                                    </th>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>

                                                <td>
                                                    <asp:CheckBox Text='<%#Eval("Item")%>' Checked='<%#Eval("IsItem").ToString()=="1"?true:false%>' CssClass="form-control" ID="chkRequired" runat="server" />
                                                    <asp:HiddenField ID="hidItemID" Value='<%#Eval("ItemId")%>' runat="server" />
                                                    <asp:HiddenField ID="hidItemIdUpdate" Value='<%#Eval("ItemId")%>' runat="server" />

                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemType" Text='<%#Eval("ItemType")%>' CssClass="form-control" runat="server"></asp:TextBox>

                                                </td>
                                                <td>

                                                    <asp:TextBox ID="txtItemName" Text='<%#Eval("ItemName")%>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </div>
                              <div class="form-group">
                                    <label for="businesssName">Services</label>
                                    <asp:CheckBoxList ID="chk_service" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                             <div class="form-group">



                                 
                                 <asp:TextBox ID="txtBusinessSubCategoryPrice" CssClass="form-control" runat="server"></asp:TextBox>
                             </div>
                             <div style="clear: both; height: 10px;"></div>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-sm" Text="Save" />
                                <asp:Label ID="Label9" runat="server"></asp:Label>
                                <div style="clear: both; height: 100px;"></div>
                        </div>
                        <asp:Button ID="btn_PricePerPlate" Text="Per Plate System" OnClick="btn_PricePerPlate_Click" CssClass=" btn btn-primary" runat="server" />
                        <asp:Button ID="btn_cookingPackage" Text="Cooking Package" OnClick="btn_cookingPackage_Click" CssClass=" btn btn-primary" runat="server" />

                        <asp:Panel ID="PanlPricePerPlate" Visible="false" runat="server">
                            <div id="Product">
                                <h3>Per Plate System</h3>
                                <div id="divPlateSystem" runat="server" class="form-group">
                                </div>
                                <div class="form-group">
                                    <asp:HiddenField ID="hidPerPlatePrice" runat="server" />
                                    <label for="businesssName">Per Plate Price</label>
                                    <asp:DropDownList ID="ddl_PerPlatePrice" runat="server">
                                        <asp:ListItem Text="300" Value="300"></asp:ListItem>
                                        <asp:ListItem Text="700" Value="700"></asp:ListItem>
                                        <asp:ListItem Text="1200" Value="1200"></asp:ListItem>
                                    </asp:DropDownList>

                                    <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>--%>
                                </div>

                                

                                <div class="form-group">
                                    <label for="businesssName">Non Vegetable Items</label><asp:CheckBox ID="chkNonVegePlate" Text="Display" runat="server" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:Repeater ID="repNonPriceVegitable" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Cooking Items
                                                    </th>
                                                    <th>Item Type
                                                    </th>
                                                    <th>Item Name
                                                    </th>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>

                                                <td>
                                                    <asp:CheckBox Text='<%#Eval("Item")%>' Checked='<%#Eval("IsItem").ToString()=="1"?true:false%>' CssClass="form-control" ID="chkRequired" runat="server" />
                                                    <asp:HiddenField ID="hidItemID" Value='<%#Eval("ItemId")%>' runat="server" />
                                                    <asp:HiddenField ID="hidItemIdUpdate" Value='<%#Eval("ItemId")%>' runat="server" />

                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemType" Text='<%#Eval("ItemType")%>' CssClass="form-control" runat="server"></asp:TextBox>

                                                </td>
                                                <td>

                                                    <asp:TextBox ID="txtItemName" Text='<%#Eval("ItemName")%>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </div>
                                <div class="form-group">
                                    <label for="txtNoOfGust">No. Of Guest</label>
                                    <asp:TextBox ID="txtNoOfGust" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                              

                                <div style="clear: both; height: 10px;"></div>
                                <asp:Button ID="btnSaveProductPerPalte" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnSaveProductPerPalte_Click" Text="Save" />
                                <asp:Label ID="lblMessageServicePlateSystem" runat="server"></asp:Label>
                                <div style="clear: both; height: 100px;"></div>
                            </div>

                        </asp:Panel>
                        <asp:Panel ID="PanlCookingPackag" Visible="false" runat="server">
                            <div id="Cooking">
                                <h3>Cooking Package</h3>
                                <div class="form-group">
                                    <asp:HiddenField ID="hidCookingPrice" runat="server" />
                                    <label for="businesssName">Cooking Package Price</label>
                                    <asp:DropDownList ID="ddlCooking" runat="server">
                                        <asp:ListItem Text="100000" Value="100000"></asp:ListItem>
                                        <asp:ListItem Text="150000" Value="150000"></asp:ListItem>
                                        <asp:ListItem Text="2000000" Value="200000"></asp:ListItem>
                                    </asp:DropDownList>

                                    <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>--%>
                                </div>

                                <div class="form-group">
                                    <label for="businesssName"></label>

                                    <asp:Repeater ID="RepeaterCooking" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Cooking Items
                                                    </th>
                                                    <th>Item Type
                                                    </th>
                                                    <th>Item Name
                                                    </th>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>

                                                <td>
                                                    <asp:CheckBox Text='<%#Eval("Item")%>' Checked='<%#Eval("IsItem").ToString()=="1"?true:false%>' CssClass="form-control" ID="chkCooking" runat="server" />
                                                    <asp:HiddenField ID="hidItemIDCooking" Value='<%#Eval("ItemId")%>' runat="server" />
                                                    <asp:HiddenField ID="hidItemIdUpdateCooking" Value='<%#Eval("ItemId")%>' runat="server" />


                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemTypeCooking" Text='<%#Eval("ItemType")%>' CssClass="form-control" runat="server"></asp:TextBox>

                                                </td>
                                                <td>

                                                    <asp:TextBox ID="txtItemNameCooking" Text='<%#Eval("ItemName")%>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </div>

                                <div class="form-group">
                                    <label for="businesssName">Non Vegetable Items</label><asp:CheckBox ID="chkNonVegeCooking" Text="Display" runat="server" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <asp:Repeater ID="rptCookingNonVegetables" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Cooking Items
                                                    </th>
                                                    <th>Item Type
                                                    </th>
                                                    <th>Item Name
                                                    </th>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>

                                                <td>
                                                    <asp:CheckBox Text='<%#Eval("Item")%>' Checked='<%#Eval("IsItem").ToString()=="1"?true:false%>' CssClass="form-control" ID="chkRequired" runat="server" />
                                                    <asp:HiddenField ID="hidItemID" Value='<%#Eval("ItemId")%>' runat="server" />
                                                    <asp:HiddenField ID="hidItemIdUpdate" Value='<%#Eval("ItemId")%>' runat="server" />

                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItemType" Text='<%#Eval("ItemType")%>' CssClass="form-control" runat="server"></asp:TextBox>

                                                </td>
                                                <td>

                                                    <asp:TextBox ID="txtItemName" Text='<%#Eval("ItemName")%>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </div>
                                <div class="form-group">
                                    <label for="txtNoOfGust">No. Of Guest</label>
                                    <asp:TextBox ID="txtNoOfGustCooking" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <label for="businesssName">Services</label>
                                    <asp:CheckBoxList ID="chk_serviceCooking" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                                <div style="clear: both; height: 10px;"></div>
                                <asp:Button ID="btnSaveCookingPackage" runat="server" OnClick="btnSaveCookingPackage_Click" Text="Save" />
                                <asp:Label ID="lblMessageCooking" runat="server"></asp:Label>
                                <div style="clear: both; height: 100px;"></div>
                            </div>

                        </asp:Panel>


                    </asp:Panel>
                    <asp:Panel ID="PanlUploadPhotos" Visible="false" runat="server">
                        <asp:Image ID="imgEdit" Width="100px" Height="100px" Visible="false" runat="server" />
                        <asp:HiddenField ID="hidUpdate" runat="server" />
                        <asp:HiddenField ID="hidOldImage" runat="server" />
                        <asp:FileUpload ID="FilePhotosUpload" CssClass="form-control" runat="server" />

                        <asp:RequiredFieldValidator ID="reqPhotos" runat="server" ControlToValidate="FilePhotosUpload" ValidationGroup="imageUpload" ForeColor="Red" ErrorMessage="Please select image" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div class="form-group">
                            <label for="name">Name</label>
                            <asp:TextBox ID="txtImageName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="imageUpload" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" ErrorMessage="Image name is required" runat="server"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnUploadPhotos" runat="server" Text="Save" ValidationGroup="imageUpload" OnClick="btnUploadPhotos_Click" />
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" CausesValidation="false" ValidationGroup="imageUpload" OnClick="btnCanel_Click" />

                        <div class="form-group">
                            <label for="businesssName"></label>

                            <asp:Repeater ID="ReptPhotos" OnItemCommand="ReptPhotos_ItemCommand" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-striped table-bordered table-light">
                                        <tr>

                                            <td style="width:180px">
                                                <asp:Image ID="Image1" ImageUrl='<%# String.Format(string.Concat("Uploads/",Eval("ImagePath")))%>' Width="170px" Height="150px" runat="server" />

                                            </td>
                                            <td style="width:500px">
                                                <asp:Label ID="lblImageName" runat="server" CssClass="txt20" Text='<%#Eval("ImageName") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Button ID="btnEdit" Text="Edit" CssClass="btn btn-primary btn-sm" CommandArgument='<%#Eval("Id")%>' CommandName="Edit1" runat="server" />
                                                <asp:Button ID="btnDelete" Text="Delete" CssClass="btn btn-primary btn-sm" OnClientClick="return confirm('Are you sure you want do  delete image')" CommandArgument='<%#Eval("Id")%>' CommandName="Delete" runat="server" />

                                            </td>

                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PanlBusinessInfo" Visible="false" runat="server">
                        <asp:HiddenField ID="hidBusinessInfo" runat="server" />
                        <div id="businessInfo">
                            <h3>Business Information</h3>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Business Information</label>
                                <asp:TextBox ID="txtBusinessInfo" runat="server" TextMode="MultiLine" Height="300px" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="BusinessInfoGroup" ControlToValidate="txtBusinessInfo" Display="Dynamic" ForeColor="Red" ErrorMessage="Business is required" runat="server"></asp:RequiredFieldValidator>
                            </div>




                            <div class="form-group">
                            </div>
                            <asp:Button ID="btnSaveBusinessInfo" class="btn btn-primary" ValidationGroup="BusinessInfoGroup" OnClick="btnSaveBusinessInfo_Click" runat="server" Text="Save" />


                            <div>

                                <asp:Label ID="lblMessageBusinessInfo" runat="server"></asp:Label>
                            </div>
                        </div>

                    </asp:Panel>


                    <asp:Panel ID="PanlPaymentType" Visible="false" runat="server">
                        <div id="Payment">
                            <h3>Payment Type</h3>
                            <asp:HiddenField ID="hidPaymentType" runat="server" />
                            <div class="form-group">
                                <label for="businesssName">Payment Mode</label>
                                <asp:DropDownList ID="ddlPaymentMode" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                                    <asp:ListItem Text="Online" Value="Online"></asp:ListItem>
                                </asp:DropDownList>

                            </div>

                            <div class="form-group">
                                <label for="businesssName">Booking Amount</label>
                                <asp:DropDownList ID="ddlBookingAmount" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div class="form-group">
                                <label for="businesssName">Rest Amount(70%)</label>
                                <asp:DropDownList ID="ddlProgramDay" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Program Day" Value="Program Day"></asp:ListItem>

                                </asp:DropDownList>

                            </div>
                            <div class="form-group">
                                <label for="businesssName">Booking order cancelled Conditions</label>
                                <asp:DropDownList ID="ddlBookingOrderCancel" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Not Return" Value="Not Return"></asp:ListItem>
                                    <asp:ListItem Text="50% Return of booking Amount" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="30% Return of booking Amount" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="10% Return of booking Amount" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                                </asp:DropDownList>

                            </div>


                            <div style="clear: both; height: 10px;"></div>
                            <asp:Button ID="btnSavePaymentMode" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnSavePaymentMode_Click" Text="Save" />
                            <asp:Label ID="lblMessagePaymentMode" runat="server"></asp:Label>
                            <div style="clear: both; height: 100px;"></div>
                        </div>

                    </asp:Panel>
                    <asp:Panel ID="PanlOrderBooking" Visible="false" runat="server">
                        <asp:HiddenField ID="hidUpdateBookingOrder" Value="0" runat="server" />
                        <div id="OrderBooking">
                            <h3>Order Booking</h3>
                            <div class="row">
                                <div class="col">
                                    <label for="exampleInputEmail1">Customer Name</label>
                                    <asp:TextBox ID="txtCustomerName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ValidationGroup="OrderBooking" ControlToValidate="txtCustomerName" Display="Dynamic" ForeColor="Red" ErrorMessage="Customer name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="exampleInputPassword1">Customer Contact</label>
                                    <asp:TextBox ID="txtCustomerContact" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="OrderBooking" ControlToValidate="txtCustomerContact" Display="Dynamic" ForeColor="Red" ErrorMessage="Customer contact is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="OrderBooking" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCustomerContact" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Customer contact is not valid"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col">
                                    <label for="mobileNumber">Programe Date</label>
                                    <asp:TextBox ID="txtProgrameDate" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ValidationGroup="OrderBooking" ControlToValidate="txtProgrameDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Programe Date number is required" runat="server"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col">
                                    <label for="homeAddress">Programe Name</label>
                                    <asp:TextBox ID="txtProgrameName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="OrderBooking" ControlToValidate="txtProgrameName" Display="Dynamic" ForeColor="Red" ErrorMessage="Programe Name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col">
                                    <label for="emailId">Programe Address</label>
                                    <asp:TextBox ID="txtProgrameAddress" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ValidationGroup="OrderBooking" ControlToValidate="txtProgrameAddress" Display="Dynamic" ForeColor="Red" ErrorMessage="Programe Address is required" runat="server"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col">
                                    <label for="City">Programe City</label>
                                    <asp:TextBox ID="txtProgrameCity" runat="server" MaxLength="50" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ValidationGroup="OrderBooking" ControlToValidate="txtProgrameCity" Display="Dynamic" ForeColor="Red" ErrorMessage="Programe city is required" runat="server"></asp:RequiredFieldValidator>
                                </div>


                            </div>
                            <div class="row mt-4">
                                <div class="col">
                                    <asp:Button ID="btnSameBookingOrder" class="btn btn-primary" ValidationGroup="OrderBooking" OnClick="btnSameBookingOrder_Click" runat="server" Text="Submit" />

                                    <asp:Button ID="btnSameBookingOrderCancel" class="btn btn-primary" OnClick="btnSameBookingOrderCancel_Click" runat="server" Text="Cancel" />

                                    <br />
                                    <asp:Label ID="lblBookingOrderMessage" runat="server"></asp:Label>
                                </div>
                            </div>


                        </div>

                        <div id="OrderBookingRep" class="row mt-3">
                            <div class="col">
                                <asp:Repeater ID="rptBookingOrder" OnItemCommand="rptBookingOrder_ItemCommand" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-bordered">

                                            <tr>
                                                <td>
                                                    <strong>S.NO</strong>
                                                </td>
                                                <td>
                                                    <strong>CustomerName</strong>
                                                </td>
                                                <td>
                                                    <strong>Contact</strong>
                                                </td>
                                                <td>
                                                    <strong>Programe Date</strong>
                                                </td>
                                                <td>
                                                    <strong>Programe Name</strong>
                                                </td>
                                                <td>
                                                    <strong>Programe Address</strong>
                                                </td>
                                                <td>
                                                    <strong>Programe City</strong>
                                                </td>
                                                <td>
                                                    <strong>BookingStatus</strong>
                                                </td>
                                                <td>
                                                    <strong>Action</strong>
                                                </td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <tr>
                                            <td>
                                                <asp:Label ID="Label6" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("CustomerName") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="lblImageName" runat="server" Text='<%#Eval("Contact") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("ProgrameDate") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("ProgrameName") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("ProgrameAddress") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text='<%#Eval("ProgrameCity") %>'></asp:Label>

                                            </td>
                                            <td>
                                                <asp:Label ID="Label7" runat="server" Text='<%#Eval("BookingStatus") %>'></asp:Label>

                                            </td>

                                            <td>
                                                <asp:Button ID="btnEdit" Text="edit" CommandArgument='<%#Eval("Id")%>' CssClass="btn btn-dark" CommandName="Edit1" runat="server" />
                                                <asp:Button ID="btnDelete" Text="delete" OnClientClick="return confirm('Are you sure you want do  delete')" CssClass="btn btn-danger" CommandArgument='<%#Eval("Id")%>' CommandName="Delete" runat="server" />
                                                <asp:Button ID="btnViewWorker" Text="View" CssClass="btn btn-dark" CommandArgument='<%#Eval("Id")%>' CommandName="View" runat="server" />

                                            </td>

                                        </tr>

                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                    </asp:Panel>
                    <asp:Panel ID="PanlWorker" Visible="false" runat="server">
                        <asp:Button ID="btnAddWorker" Text="Add Worker" OnClick="btnAddWorker_Click" CssClass="btn btn-primary" runat="server" />
                        <asp:Button ID="btnSelectWorkerForProgramme" OnClick="btnSelectWorkerForProgramme_Click" Text="Select Worker for programme" CssClass="btn btn-primary" runat="server" />


                        <asp:Panel ID="PanlAddWorker" Visible="false" runat="server">
                            <asp:HiddenField ID="hidAddWorkerId" Value="0" runat="server" />
                            <h3>Add worker</h3>

                            <div class="row">
                                <div class="col">
                                    <label for="exampleInputEmail1">Name</label>
                                    <asp:TextBox ID="txtWorkerName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ValidationGroup="AddWorker" ControlToValidate="txtWorkerName" Display="Dynamic" ForeColor="Red" ErrorMessage="Worker name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="exampleInputPassword1">Post</label>
                                    <asp:TextBox ID="txtWorkerPost" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ValidationGroup="AddWorker" ControlToValidate="txtWorkerPost" Display="Dynamic" ForeColor="Red" ErrorMessage="Worker post contact is required" runat="server"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col">
                                    <label for="exampleInputPassword1">Contact</label>
                                    <asp:TextBox ID="txtWorkerContact" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ValidationGroup="AddWorker" ControlToValidate="txtWorkerContact" Display="Dynamic" ForeColor="Red" ErrorMessage="Worker contact is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="AddWorker" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtWorkerContact" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Worker contact is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col">
                                    <label for="exampleInputPassword1">Address</label>
                                    <asp:TextBox ID="txtWorkerAddress" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ValidationGroup="AddWorker" ControlToValidate="txtWorkerAddress" Display="Dynamic" ForeColor="Red" ErrorMessage="Worker address contact is required" runat="server"></asp:RequiredFieldValidator>

                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <asp:Button ID="btnAddWorkerSave" class="btn btn-primary" OnClick="btnAddWorkerSave_Click" ValidationGroup="AddWorker" runat="server" Text="Submit" />

                                        <asp:Button ID="btnAddWorkerCancel" class="btn btn-primary" OnClick="btnAddWorkerCancel_Click" runat="server" Text="Cancel" />

                                        <br />
                                        <asp:Label ID="lblAddWorkerMessage" runat="server"></asp:Label>
                                    </div>
                                </div>


                            </div>
                            <div class="row">

                                <div class="col  mt-3">
                                    <asp:Repeater ID="ReptWorker" OnItemCommand="ReptWorker_ItemCommand" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered">

                                                <tr>
                                                    <td>
                                                        <strong>S.NO</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Name</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Post</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Contact</strong>
                                                    </td>
                                                    <td>
                                                        <strong>Address</strong>
                                                    </td>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text='<%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>'></asp:Label>

                                                </td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("WorkerName") %>'></asp:Label>

                                                </td>
                                                <td>
                                                    <asp:Label ID="lblImageName" runat="server" Text='<%#Eval("WorkerPost") %>'></asp:Label>

                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Contact") %>'></asp:Label>

                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Address") %>'></asp:Label>

                                                </td>


                                                <td>
                                                    <asp:Button ID="btnEdit" Text="edit" CommandArgument='<%#Eval("Id")%>' CssClass="btn btn-dark" CommandName="Edit1" runat="server" />
                                                    <asp:Button ID="btnDelete" Text="delete" OnClientClick="return confirm('Are you sure you want do  delete')" CssClass="btn btn-danger" CommandArgument='<%#Eval("Id")%>' CommandName="Delete" runat="server" />

                                                </td>

                                            </tr>

                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>

                            </div>



                        </asp:Panel>
                        <asp:Panel ID="PanlSelectWorkerForProgramme" Visible="false" runat="server">
                            <div id="Worker">
                                <h3>Select Worker for programme</h3>
                                <div class="form-group">
                                    <asp:HiddenField ID="HiddenField6" runat="server" />
                                    <label for="businesssName">Programme Date</label>
                                    <asp:DropDownList ID="ddlWorkerProgrammeDate" AutoPostBack="true" OnSelectedIndexChanged="ddlWorkerProgrammeDate_SelectedIndexChanged"
                                        CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" ValidationGroup="AddWorkerAdd" InitialValue="0" ControlToValidate="ddlWorkerProgrammeDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Programme sate is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">

                                    <label for="businesssName">Programme Name</label>
                                    <asp:TextBox ID="txtWorkerNameAdd" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>

                                <div class="form-group">
                                    <label for="businesssName"></label>

                                    <asp:Repeater ID="repeaterWorkerPrograme" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Worker Name
                                                    </th>
                                                    <th>Post
                                                    </th>
                                                    <th>Select
                                                    </th>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblWorkerName" runat="server" Text='<%#Eval("WorkerName")%>'></asp:Label>


                                                </td>
                                                <td>
                                                    <asp:Label ID="lblWorkerPost" runat="server" Text='<%#Eval("WorkerPost")%>'></asp:Label>


                                                </td>
                                                <td>

                                                    <asp:CheckBox ID="chkWorkerName" runat="server" />
                                                    <asp:HiddenField ID="hdnWorkerId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Id")  %>' />
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </div>

                                <div class="form-group">
                                    <div class="col">
                                        <asp:Button ID="btnProgrammeWorkerSave" CssClass="btn btn-primary btn-sm" OnClick="btnProgrammeWorkerSave_Click" ValidationGroup="AddWorkerAdd" runat="server" Text="Submit" />



                                        <br />
                                        <asp:Label ID="lblProgrammeWorkerSave" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>

                    </asp:Panel>

                    <asp:Panel ID="PanlCustomerEnquery" Visible="false" runat="server">
                        <div id="CustomerEnquery">
                            <h3>Customer Enquery</h3>

                            <div class="form-group">
                                <label for="businesssName"></label>

                                <div style="overflow: scroll;">



                                    <asp:Repeater ID="RequestRpt" runat="server" OnItemCommand="categoryRpt_ItemCommand" OnItemDataBound="UsersRpt_ItemDataBound">
                                        <HeaderTemplate>
                                            <table id="UsersRpttbl" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>sno</th>
                                                        <th>Business Name</th>
                                                        <th>Catgory Name</th>
                                                        <th>FullName</th>
                                                        <th>City</th>

                                                        <th>PhoneNumber</th>
                                                        <th>EventDate</th>
                                                        <th>MessageRequest</th>
                                                        <th>Created_Date </th>

                                                        <th>IsActive</th>
                                                    </tr>
                                                </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Container.ItemIndex + 1%></td>
                                                <td style="min-width: 400px">
                                                    <asp:Label ID="LblCompanyName" runat="server" Font-Size="Medium" Text='<%#Bind("business_name") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label7" runat="server" Font-Size="Medium" Text='<%#Bind("catgory_name") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text='<%#Bind("FullName") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text='<%#Bind("Email_Id") %>'></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text='<%#Bind("PhoneNumber") %>'></asp:Label>
                                                </td>
                                                <td style="min-width: 250px">
                                                    <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text='<%#Bind("EventDate") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text='<%#Bind("MessageRequest") %>'></asp:Label>
                                                </td>
                                                <td style="min-width: 250px">
                                                    <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text='<%#Bind("Created_Date") %>'></asp:Label>
                                                </td>


                                                <td>
                                                    <asp:HiddenField ID="hiIsActive" runat="server" Value='<%#Bind("status") %>' />
                                                    <asp:Button ID="btn_edit" CausesValidation="false" CommandArgument='<%#Eval("Requestd")%>' CommandName="Edit1" CssClass="btn btn-primary" Text="Edit" runat="server" />

                                                </td>
                                            </tr>


                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>  

                                        </FooterTemplate>
                                    </asp:Repeater>



                                </div>

                            </div>


                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>
        </div>






</asp:Content>
