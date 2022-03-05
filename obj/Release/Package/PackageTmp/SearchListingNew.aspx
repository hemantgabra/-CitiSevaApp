<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="SearchListingNew.aspx.cs" Inherits="CitySeva.SearchListingNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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


        function openDilog() {

            $('#exampleModal').modal('show');
        }
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
    <div class="bread">

        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Wedding Venues</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List Page</li>
                </ol>
            </nav>
        </div>
    </div>
    <asp:HiddenField ID="hidrequestid" ClientIDMode="Static" runat="server" />
    <asp:Label ID="lbllstingMsg" runat="server"></asp:Label>
  
    <div class="citi_list">
        <div class="container citi_box">
            <div class="row">
                <div class="col-sm-3">
                    <div class="list_img">

                        <div class="owl-carousel owl-theme top-banner" id="imgListing" runat="server">
                           
                        </div>

                        <i class="fa fa-heart-o wistlist" aria-hidden="true"></i>

                    </div>
                </div>
                <div class="col-sm-9">

                    <asp:Repeater ID="categoryRpt"  runat="server" OnItemCommand="categoryRpt_ItemCommand">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="list_details">
                                <h3><%#Eval("business_name")%></h3>
                                <address><%#Eval("business_address")%></address>
                                <%--<span><%#Eval("service_name")%></span>--%>
                                <p class="booking_amout"><span>Booking amount :<%#Eval("BookingAmount")%></span></p>
                                <p><%#Eval("BusinessInfo")%> </p>
                                <div class="row">
                                    
                                    <div class="col-sm-4">
                                        <div class="list_btn">
                                            <asp:HiddenField ID="hidBusinessId"  Value='<%#Eval("business_Id")%>' runat="server"></asp:HiddenField>
                                            <asp:Button ID="btn_viewForm" Text="Request Pricing" class="btn btn-danger" CommandArgument='<%#Eval("vandor_Id")%>' CommandName="view" runat="server" />
                                            <%--<button type="button" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" class="btn btn-danger">Request Pricing</button>--%>
                                        </div>
                                    </div>
                                </div>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>



                </div>
            </div>

        </div>
    


    <div class="modal fade request_price" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Get Quote from Elysian Weddings</h5>
                    <span>Fill this form and Elysian Weddings will contact you shortly. All the information provided will be treated confidentially.</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
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
</asp:Content>
