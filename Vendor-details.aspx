<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="Vendor-details.aspx.cs" Inherits="CitySeva.dashboard.Vendor_details" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>

        $(document).ready(function () {
            $("#txt_buttonRequest").click(function () {

                SaveOrderData();

            });
            $("#txt_Date").datepicker();
            $('#txt_phoneNumber').keyup(function (e) {
                if (/\D/g.test(this.value)) {
                    // Filter non-digits from input value.
                    this.value = this.value.replace(/\D/g, '');
                }
            });
        });



        function SaveOrderData() {

            var requestid = $("#hidrequestid").val();
            var fullName = $("#txt_FullName").val();
            var email = $("#txt_email").val();
            var phoneNumber = $("#txt_phoneNumber").val();
            var date = $("#txt_Date").val();
            var message = $("#txt_message").val();
            if (fullName == "") {
                alert("FullName is required");
            }
            else if (email == "") {
                alert("Email is required");
            }
            else if (phoneNumber == "") {
                alert("Phone Number is required");
            }
            else if (date == "") {
                alert("Event Date is required");
            }
            else if (message == "") {
                alert("Message is required");
            }
            else {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "service.aspx/RequestQuoteAdd",
                    data: "{'FullName':'" + fullName + "','Email_Id':'" + email + "','PhoneNumber':'" + phoneNumber + "','EventDate':'" + date + "','MessageRequest':'" + message + "','BusinessId':'" + requestid + "'}",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        var result = data.d;
                        if (result == 1) {


                            $("#hidrequestid").val("");
                            $("#txt_FullName").val("");
                            $("#txt_email").val("");
                            $("#txt_phoneNumber").val("");
                            $("#txt_Date").val("");
                            $("#txt_message").val("");
                            alert("Request send successfully");


                        }

                        else {
                            alert("Request not successfully");
                        }



                    },
                    error: OnErrorCall
                });
            }
        }



        function OnErrorCall(response) {
            alert(response.status + " " + response.statusText);


            return false;
        }



    </script>
    <asp:Panel ID="PanlDashboard" runat="server">
          <asp:HiddenField ID="hidrequestid" ClientIDMode="Static" runat="server" />
        <div class="container">
        <div class="row mt-5 mb-5">
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
                        <div class="modal-body">

                            <div class="form-group">

                                <input type="text" class="form-control" id="txt_FullName" placeholder="First and last name">
                            </div>
                            <div class="form-group">

                                <input type="text" class="form-control" id="txt_email" placeholder="City">
                            </div>
                            <div class="form-group">

                                <input type="text" class="form-control" maxlength="10" id="txt_phoneNumber" placeholder="Phone number">
                            </div>
                            <div class="form-group">

                                <input type="text" class="form-control" id="txt_Date" placeholder="Date (YYYY-MM-DD)">
                            </div>
                            <div class="form-group">

                                <textarea class="form-control" cols="5" rows="5" id="txt_message" placeholder="Write your message"></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <p>By clicking "Send Request" you are signing up and agreeing to the legal terms of WeddingWire.in</p>
                            <input type="button" id="txt_buttonRequest" class="btn btn-danger" value="Submit" />
                            <%--  <button type="button" class="btn btn-danger" data-dismiss="modal">Get quote</button>--%>
                        </div>
                    </div>


                </div>
            </div>
        </div>
            </div>
    </asp:Panel>


</asp:Content>
