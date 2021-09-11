<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Venderregistration.aspx.cs" Inherits="CitySeva.Admin.Venderregistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(function () {
            $("[id*=txtDate]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'images/calendar.png'
            });

            //$("#txt_bs_priceStart").attr("style", "display:none");             
            //$("#txt_bs_package").attr("style", "display:none");
            //$("#ddlPriceStart").change(function () {

            //    var price = $("#ddlPriceStart option:selected").val();
            //    if (price !== "0") {
            //        $("#txt_bs_priceStart").removeAttr("style", "display:none");   
            //        $("#txt_bs_priceStart").attr("style", "display:block"); 
            //    }
            //    else {
            //        $("#txt_bs_priceStart").attr("style", "display:none");                    
            //        $("#txt_bs_priceStart").val("");
            //    }
            //});

            //$("#ddlPackage").change(function () {
            //     var Package = $("#ddlPackage option:selected").val();
               

            //     if (Package !== "0") {
            //         $("#txt_bs_package").show();
            //          $("#txt_bs_package").removeAttr("style", "display:none");   
            //        $("#txt_bs_package").attr("style", "display:block"); 

            //    }
            //     else {
            //         $("#txt_bs_package").attr("style", "display:none");     
            //         $("#txt_bs_package").val("");
            //    }
            //});



        });
    </script>

    <h2>Vender Registration</h2>
    <asp:HiddenField ID="hidupdate" runat="server" />
    <div class="row mt-5">
        <div class="col-sm-3">
            <h5>Personal Detail</h5>
            <div class="form-group">
                <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="Full Name" name="Name" />

                <asp:RequiredFieldValidator ID="requ1" ControlToValidate="txt_name" Display="Dynamic" ForeColor="Red" ErrorMessage="Full name is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_mobile" runat="server" MaxLength="12" class="form-control" placeholder="Mobile" name="Mobile" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="regform" ControlToValidate="txt_mobile" Display="Dynamic" ForeColor="Red" ErrorMessage="Mobile number is required" runat="server"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="regform" Display="Dynamic" ForeColor="Red" ControlToValidate="txt_mobile" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Mobile number is not valid"></asp:RegularExpressionValidator>

            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_address" TextMode="MultiLine" runat="server" class="form-control" placeholder="Address" name="Address" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="regform" ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red" ErrorMessage="Address is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="Email" name="Email" />
                <asp:RegularExpressionValidator ID="reg1" runat="server" ValidationGroup="regform" Display="Dynamic" ForeColor="Red" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email address is not valid"></asp:RegularExpressionValidator>

            </div>
            <div class="form-group">
                <asp:DropDownList ID="dd_category" runat="server" class="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="regform" ControlToValidate="dd_category" Display="Dynamic" ForeColor="Red" InitialValue="0" ErrorMessage="Category is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="dd_location" runat="server" class="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="regform" ControlToValidate="dd_location" Display="Dynamic" ForeColor="Red" InitialValue="0" ErrorMessage="Location is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Select Image</label>
                <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                <asp:Image ID="imgFileUpload1" runat="server" Height="100" Width="100" />
                <asp:RequiredFieldValidator ID="reqvalfile1" ErrorMessage="Image is Required" ValidationGroup="regform" ControlToValidate="FileUpload1"
                    runat="server" Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="regform" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg)$"
                    ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select a valid PNG or JPG file."
                    Display="Dynamic" />
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <br />
                <asp:Image ID="imgFileUpload2" runat="server" Height="100" Width="100" />
                <%-- <asp:RequiredFieldValidator ErrorMessage="Image is Required" ValidationGroup="regform" ControlToValidate="FileUpload2"
                    runat="server" Display="Dynamic" ForeColor="Red" />--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="regform" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg)$"
                    ControlToValidate="FileUpload2" runat="server" ForeColor="Red" ErrorMessage="Please select a valid PNG or JPG file."
                    Display="Dynamic" />
                <asp:FileUpload ID="FileUpload3" runat="server" />
                <br />
                <asp:Image ID="imgFileUpload3" runat="server" Height="100" Width="100" />
                <%-- <asp:RequiredFieldValidator ErrorMessage="Image is Required" ValidationGroup="regform" ControlToValidate="FileUpload3"
                    runat="server" Display="Dynamic" ForeColor="Red" />--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="regform" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg)$"
                    ControlToValidate="FileUpload3" runat="server" ForeColor="Red" ErrorMessage="Please select a valid PNG or JPG File file."
                    Display="Dynamic" />
                <asp:FileUpload ID="FileUpload4" runat="server" />
                <br />
                <asp:Image ID="imgFileUpload4" runat="server" Height="100" Width="100" />
                <%-- <asp:RequiredFieldValidator ErrorMessage="Image is Required" ValidationGroup="regform" ControlToValidate="FileUpload4"
                    runat="server" Display="Dynamic" ForeColor="Red" />--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="regform" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg)$"
                    ControlToValidate="FileUpload4" runat="server" ForeColor="Red" ErrorMessage="Please select a valid PNG or JPG file."
                    Display="Dynamic" />
                <asp:FileUpload ID="FileUpload5" runat="server" />
                <asp:Image ID="imgFileUpload5" runat="server" Height="100" Width="100" />
                <%--  <asp:RequiredFieldValidator ErrorMessage="Image is Required" ValidationGroup="regform" ControlToValidate="FileUpload5"
                    runat="server" Display="Dynamic" ForeColor="Red" />--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="regform" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg)$"
                    ControlToValidate="FileUpload5" runat="server" ForeColor="Red" ErrorMessage="Please select a valid PNG or JPG file."
                    Display="Dynamic" />
            </div>

        </div>
        <div class="col-sm-3">
            <h5>Business Detail</h5>
            <div class="form-group">
                <asp:TextBox ID="txt_bs_name" runat="server" CssClass="form-control" placeholder="Name" name="Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="regform" ControlToValidate="txt_bs_name" Display="Dynamic" ForeColor="Red" ErrorMessage="Business name is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_bs_address" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Address" name="Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="regform" ControlToValidate="txt_bs_address" Display="Dynamic" ForeColor="Red" ErrorMessage="Address is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">

                <asp:DropDownList ID="ddlPriceStart" AutoPostBack="true" OnSelectedIndexChanged="ddlPriceStart_SelectedIndexChanged" ClientIDMode="Static" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Select Price" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Price per Plate from" Value="PricePerPlateFrom"></asp:ListItem>
                    <asp:ListItem Text="Price start" Value="PriceStart"></asp:ListItem>
                </asp:DropDownList>
                   <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="regform" ControlToValidate="ddlPriceStart" InitialValue="0" Display="Dynamic" ForeColor="Red" ErrorMessage="Price is required" runat="server"></asp:RequiredFieldValidator>--%>
                <asp:TextBox ID="txt_bs_priceStart" ClientIDMode="Static" runat="server" ValidationGroup="regform" CssClass="form-control"   name="Price Start From"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="regform" ControlToValidate="txt_bs_priceStart" Display="Dynamic" ForeColor="Red" ErrorMessage="Price is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_bs_guest" runat="server" CssClass="form-control" placeholder="No. of Guest" name="No. of Guest"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="regform" ControlToValidate="txt_bs_guest" Display="Dynamic" ForeColor="Red" ErrorMessage="No. of Guest From is required" runat="server"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="form-group">

                <asp:DropDownList ID="ddlPackage" AutoPostBack="true" OnSelectedIndexChanged="ddlPackage_SelectedIndexChanged" ClientIDMode="Static" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Select Package" Value="0"></asp:ListItem>
                    <asp:ListItem Text="cooking Package" Value="CookingPackage"></asp:ListItem>
                    <asp:ListItem Text="Package" Value="Package"></asp:ListItem>
                </asp:DropDownList>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="regform" ControlToValidate="ddlPackage" InitialValue="0" Display="Dynamic" ForeColor="Red" ErrorMessage="Package is required" runat="server"></asp:RequiredFieldValidator>--%>
                <asp:TextBox ID="txt_bs_package" ClientIDMode="Static" runat="server" CssClass="form-control"   name="Package"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="regform" ControlToValidate="txt_bs_package" Display="Dynamic" ForeColor="Red" ErrorMessage="Package is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_bs_service" runat="server" CssClass="form-control" placeholder="Service" name="Service"></asp:TextBox>
                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="regform" ControlToValidate="txt_bs_service" Display="Dynamic" ForeColor="Red" ErrorMessage="Service is required" runat="server"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_bs_patmentMode" runat="server" CssClass="form-control" placeholder="Payment Mode" name="Payment Mode"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="regform" ControlToValidate="txt_bs_patmentMode" Display="Dynamic" ForeColor="Red" ErrorMessage="Payment Mode is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_bs_bookimgAmt" runat="server" CssClass="form-control" placeholder="Booking Amount" name="Booking Amount"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="regform" ControlToValidate="txt_bs_bookimgAmt" Display="Dynamic" ForeColor="Red" ErrorMessage="Booking Amount is required" runat="server"></asp:RequiredFieldValidator>
                <span class="note">*Rest of payment will have to be done of event day</span>
            </div>
            
            <div class="form-group">
                <asp:TextBox ID="txt_Service_offer" runat="server" CssClass="form-control" placeholder="Service offer" name="Service_offer"></asp:TextBox>


            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_Cancellation_Order" runat="server" CssClass="form-control" placeholder="Cancellation Order" name="Cancellation_Order"></asp:TextBox>


            </div>
            <div class="form-group">
                <asp:TextBox ID="txt_description" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Description" name="Description"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="regform" ControlToValidate="txt_description" Display="Dynamic" ForeColor="Red" ErrorMessage="Description is required" runat="server"></asp:RequiredFieldValidator>

            </div>

        </div>
    </div>




    <div>


        <asp:Label ID="lblSID" runat="server" Visible="false"></asp:Label>
    </div>
    <br />
    <asp:Label ID="lblmessage" runat="server" />
    <br />
    <div class="form-group">
        <asp:Button ID="btn_save" runat="server" ValidationGroup="regform" class="btn btn-primary btn-sm" Text="Save" OnClick="btn_save_Click" />


        <asp:Button ID="btnUpdate" runat="server" ValidationGroup="regform" class="btn btn-primary btn-sm" Visible="false" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-dark btn-sm" Text="Cancel" OnClick="btnCancel_Click" />

    </div>

    <br />


    <asp:Repeater ID="categoryRpt" runat="server" OnItemCommand="categoryRpt_ItemCommand">
        <HeaderTemplate>
            <table id="VendorRpttbl" class="table table-bordered">
                <thead>
                    <tr>
                        <th>sno</th>
                        <th>Name</th>
                        <th>mobile</th>
                        <th>Date</th>
                        <th>address</th>
                        <th>email</th>
                        <th>category</th>
                        <th>Location</th>
                        <th>business_name</th>
                        <th>business address</th>
                        <th>price start from</th>
                        <th>number of guest</th>
                        <th>package</th>
                        <th>service name</th>
                        <th>payment mode</th>
                        <th>booking amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Container.ItemIndex + 1%></td>
                <td><%#Eval("name")%></td>
                <td><%#Eval("mobile")%></td>
                <td><%#Eval("Date")%></td>
                <td><%#Eval("address")%></td>
                <td><%#Eval("email")%></td>
                <td><%#Eval("catgory_name")%></td>
                <td><%#Eval("location")%></td>
                <td><%#Eval("business_name")%></td>
                <td><%#Eval("business_address")%></td>
                <td><%#Eval("price_start_from")%></td>
                <td><%#Eval("number_of_guest")%></td>
                <td><%#Eval("package")%></td>
                <td><%#Eval("service_name")%></td>
                <td><%#Eval("payment_mode")%></td>
                <td><%#Eval("booking_amount")%></td>
                <td>
                    <asp:Button ID="btn_edit" CausesValidation="false" CommandArgument='<%#Eval("id")%>' CommandName="Edit1" CssClass="btn btn-primary" Text="Edit" runat="server" />
                    <asp:Button ID="btn_delete" CausesValidation="false" CommandArgument='<%#Eval("id")%>' CommandName="Delete" CssClass="btn btn-danger" Text="Delete" runat="server" />
                </td>
            </tr>


        </ItemTemplate>
        <FooterTemplate>
            </table>  

        </FooterTemplate>
    </asp:Repeater>
    <br />
</asp:Content>
