<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="CitySeva.Listing" %>

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
    <asp:Repeater ID="categoryRpt" OnItemDataBound="categoryRpt_ItemDataBound" OnItemCommand="categoryRpt_ItemCommand"
        runat="server">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="citi_list">
                <div class="container citi_box">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="list_img">

                                <div class="owl-carousel owl-theme top-banner">
                                    <div class="item">
                                        <img width="285" height="198" src="img_vendor/<%#Eval("img1_url")%>" />
                                    </div>
                                    <div class="item">
                                        <img width="285" height="198" src="img_vendor/<%#Eval("img2_url")%>" />
                                    </div>
                                    <div class="item">
                                        <img width="285" height="198" src="img_vendor/<%#Eval("img3_url")%>" />
                                    </div>
                                    <div class="item">
                                        <img width="285" height="198" src="img_vendor/<%#Eval("img4_url")%>" />
                                    </div>
                                    <div class="item">
                                        <img width="285" height="198" src="img_vendor/<%#Eval("img5_url")%>" />
                                    </div>

                                </div>

                                <i class="fa fa-heart-o wistlist" aria-hidden="true"></i>

                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div class="list_details">
                                <h3><%#Eval("business_name")%></h3>
                                <address><%#Eval("business_address")%></address>
                                <span><%#Eval("service_name")%></span>

                                <p class="booking_amout"><span>Booking amount :<%#Eval("booking_amount")%></span></p>
                                <p><%#Eval("description")%> </p>
                                <div class="row">
                                    <div class="col-sm-8">

                                        <div id="div_price_start_from" runat="server" class="list_unit">
                                            <span>Price Start From</span>
                                            <i class="fa fa-inr" aria-hidden="true"></i>
                                            <asp:Label ID="lbl_price_start_from" runat="server" Text='<%# Eval("price_start_from") %>' />
                                        </div>
                                        <div id="div_price_per_plate_from" runat="server" class="list_unit">
                                            <span>Price Per Plate From</span>
                                            <i class="fa fa-inr" aria-hidden="true"></i>
                                            <asp:Label ID="lbl_price_per_plate_from" runat="server" Text='<%# Eval("price_per_plate_from") %>' />
                                        </div>
                                        <div id="div_number_of_guest" runat="server" class="list_unit">
                                            <span>Guest</span>
                                            <i class="fa fa-users" aria-hidden="true"></i>

                                            <asp:Label ID="lbl_number_of_guest" runat="server" Text='<%# Eval("number_of_guest") %>' />

                                        </div>
                                        <div id="div_package" runat="server" class="list_unit">
                                            <span>Package</span>
                                            <i class="fa fa-briefcase" aria-hidden="true"></i>

                                            <asp:Label ID="lbl_package" runat="server" Text='<%# Eval("package") %>' />
                                        </div>

                                        <div id="div_cooking_package" runat="server" class="list_unit">
                                            <span>Cooking Package</span>
                                            <i class="fa fa-briefcase" aria-hidden="true"></i>

                                            <asp:Label ID="lbl_cooking_package" runat="server" Text='<%# Eval("cooking_package") %>' />
                                        </div>
                                        <div id="div_payment_mode" runat="server" class="list_unit">
                                            <span>Paymant Mode</span>
                                            <i class="fa fa-money" aria-hidden="true"></i>
                                            <asp:Label ID="lbl_payment_mode" runat="server" Text='<%# Eval("payment_mode") %>' />
                                        </div>


                                        <%-- <div class="list_unit">
                                            <span>Minimum Price for Order</span>
                                            <i class="fa fa-inr" aria-hidden="true"></i>
                                            <%#Eval("price_start_from")%>
                                        </div>
                                        <div class="list_unit">
                                            <span>Guest</span>
                                            <i class="fa fa-users" aria-hidden="true"></i>
                                            <%#Eval("number_of_guest")%>
                                        </div>
                                        <div class="list_unit">
                                            <span>Package</span>
                                            <i class="fa fa-briefcase" aria-hidden="true"></i>
                                            <%#Eval("package")%>
                                        </div>
                                        <div class="list_unit">
                                            <span>Paymant Mode</span>
                                            <i class="fa fa-money" aria-hidden="true"></i>
                                            <%#Eval("payment_mode")%>
                                        </div>--%>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="list_btn">

                                            <asp:Button ID="btn_viewForm" Text="Request Pricing" class="btn btn-danger" CommandArgument='<%#Eval("id")%>' CommandName="view" runat="server" />
                                            <%-- <button id="btn_submitRequest" type="button" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" class="btn btn-danger">Request Pricing</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </table>  

        </FooterTemplate>
    </asp:Repeater>


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

                        <input type="text" class="form-control" readonly="readonly" id="txt_Date" placeholder="Date (YYYY-MM-DD)">
                    </div>
                    <div class="form-group">

                        <textarea class="form-control" cols="5" rows="5" id="txt_message" placeholder="Write your message"></textarea>
                    </div>

                </div>
                <div class="modal-footer">
                    <p>By clicking "Send Request" you are signing up and agreeing to the legal terms of WeddingWire.in</p>
                    <input type="button" id="txt_buttonRequest" class="btn btn-danger" value="Submit" />
                    <%--<button type="button" id="txt_buttonRequest" class="btn btn-danger" data-dismiss="modal">Submit</button>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
