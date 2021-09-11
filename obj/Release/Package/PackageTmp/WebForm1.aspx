<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CitySeva.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Latest compiled and minified CSS -->
    
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
        a:hover,
        a:focus {
            text-decoration: none;
            outline: none;
        }

        .demo {
            background-color: #F3F1F8;
        }

        .vertical-tab {
            font-family: 'Karla', sans-serif;
            display: table;
        }

            .vertical-tab .nav-tabs {
                display: table-cell;
                width: 30%;
                min-width: 30%;
                border: none;
                vertical-align: top;
            }

                .vertical-tab .nav-tabs li {
                    float: none;
                }

                    .vertical-tab .nav-tabs li a {
                        color: #555;
                        background: #fff;
                        font-size: 16px;
                        font-weight: 200;
                        letter-spacing: 0.5px;
                        text-transform: uppercase;
                        text-align: center;
                        padding: 8px 7px 7px;
                        margin: 0 10px 12px 0;
                        border-radius: 30px;
                        border: none;
                        box-shadow: 0 0 5px rgba(0,0,0,0.1);
                        overflow: hidden;
                        position: relative;
                        z-index: 1;
                        transition: all 0.5s ease 0s;
                    }

                        .vertical-tab .nav-tabs li a:hover,
                        .vertical-tab .nav-tabs li.active a,
                        .vertical-tab .nav-tabs li.active a:hover {
                            color: #fff;
                            background: #fff;
                            border: none;
                        }

                        .vertical-tab .nav-tabs li a:before {
                            content: '';
                            background-color: #B33771;
                            height: 7%;
                            width: 100%;
                            border-radius: 30px;
                            position: absolute;
                            left: 0;
                            bottom: 0;
                            z-index: -1;
                            transition: all 0.3s ease-out 0s;
                        }

                        .vertical-tab .nav-tabs li a:hover:before,
                        .vertical-tab .nav-tabs li.active a:before,
                        .vertical-tab .nav-tabs li.active a:hover:before {
                            height: 100%;
                        }

            .vertical-tab .tab-content {
                color: #777;
                background: #fff;
                font-size: 14px;
                font-weight: 500;
                line-height: 21px;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                display: table-cell;
                width: 600px;
            }

                .vertical-tab .tab-content h3 {
                    color: #B33771;
                    font-size: 22px;
                    font-weight: 500;
                    text-transform: capitalize;
                    margin: 0 0 5px;
                }

        @media only screen and (max-width: 479px) {
            .vertical-tab .nav-tabs {
                width: 100%;
                display: block;
            }

                .vertical-tab .nav-tabs li a {
                    padding: 10px 25px 9px;
                    margin: 0 0 12px;
                }

            .vertical-tab .tab-content {
                font-size: 14px;
                padding: 15px;
                display: block;
            }
        }
    </style>
    <!-- Latest compiled and minified JavaScript -->
    <script src="Scripts/jquery-3.3.1.min.js"></script>
     <script src="Scripts/bootstrap.min.js"></script>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-11">
                    <div class="vertical-tab" role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation"><a href="#dashboard" aria-controls="home" role="tab" data-toggle="tab">Dashboard</a></li>
                            <li role="presentation" class="active"><a href="#PersonalContact" aria-controls="home1" role="tab" data-toggle="tab">personal contact</a></li>
                            <li role="presentation"><a href="#BusinessContact" aria-controls="BusinessContact" role="tab" data-toggle="tab">Business Contact</a></li>
                            <li role="presentation"><a href="#AddServiceProduct" aria-controls="AddServiceProduct" role="tab" data-toggle="tab">Add Service / Product</a></li>
                            <li role="presentation"><a href="#PaymentType" aria-controls="PaymentType" role="tab" data-toggle="tab">Payment Type</a></li>
                            <li role="presentation"><a href="#BusinessInformation" aria-controls="BusinessInformation" role="tab" data-toggle="tab">Business Information</a></li>
                            <li role="presentation"><a href="#AddPhoto" aria-controls="AddPhoto" role="tab" data-toggle="tab">Add Photo</a></li>
                            <li role="presentation"><a href="#CustomerEnquiry" aria-controls="CustomerEnquiry" role="tab" data-toggle="tab">Customer Enquiry</a></li>
                            <li role="presentation"><a href="#PragrammeSetting" aria-controls="PragrammeSetting" role="tab" data-toggle="tab">Pragramme Setting</a></li>
                            <li role="presentation"><a href="#MenuSetting" aria-controls="MenuSetting" role="tab" data-toggle="tab">Menu Setting</a></li>
                            <li role="presentation"><a href="#BusinessKeyword" aria-controls="MenuSetting" role="tab" data-toggle="tab">Business Keyword</a></li>
                            <li role="presentation"><a href="#BusinessDescription" aria-controls="BusinessDescription" role="tab" data-toggle="tab">Business Description</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <div role="tabpanel" class="tab-pane fade" id="dashboard">
                                <h3>Dashboard</h3>
                               
                                       <table>
                                           <tr>
                                               <td><img src="https://lh3.googleusercontent.com/V9JH8cb7n9XqChoIwyIiELv4WP-GOgF-jj6HwWXFpE69BsMeX4OunFyR1JZqlAKIIHYuuAttrMQdaUtTY3TnAI7u5GxtgaopaSmRYS5edw=w512" width="300" height="300" /> </td>
                                               <td></td>
                                           </tr>
                                       </table>
                                 
                            </div>
                            <div role="tabpanel" class="tab-pane fade in active" id="PersonalContact">
                                <h3>personal contact</h3>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">First Name</label>
                                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="PersonalContactGroup" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Last Name</label>
                                    <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="PersonalContactGroup" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" ErrorMessage="Last name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="mobileNumber">Mobile Number</label>
                                    <asp:TextBox ID="txtMobileNumber" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="PersonalContactGroup" ControlToValidate="txtMobileNumber" Display="Dynamic" ForeColor="Red" ErrorMessage="Mobile number is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="PersonalContactGroup" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMobileNumber" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Mobile number is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label for="homeAddress">Home Address</label>
                                    <asp:TextBox ID="txtHomeAddress" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="PersonalContactGroup" ControlToValidate="txtHomeAddress" Display="Dynamic" ForeColor="Red" ErrorMessage="Address is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="emailId">Email Id</label>
                                    <asp:TextBox ID="txtEmailId" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="PersonalContactGroup" ControlToValidate="txtEmailId" Display="Dynamic" ForeColor="Red" ErrorMessage="Email name is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="reg1" runat="server" ValidationGroup="PersonalContactGroup" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email address is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label for="City">City</label>
                                    <asp:TextBox ID="txtCity" runat="server" MaxLength="50" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="PersonalContactGroup" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" ErrorMessage="city is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="pincode">Pincode</label>
                                    <asp:TextBox ID="txtPincode" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="PersonalContactGroup" ControlToValidate="txtPincode" Display="Dynamic" ForeColor="Red" ErrorMessage="Pin code is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="PersonalContactGroup" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPincode" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Pin code is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label for="state">State</label>

                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                        <asp:ListItem Selected="True" Value="0">State</asp:ListItem>
                                        <asp:ListItem Value="Delhi">Delhi</asp:ListItem>
                                        <asp:ListItem Value="UP">UP</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="PersonalContactGroup" InitialValue="0" ControlToValidate="ddlState" Display="Dynamic" ForeColor="Red" ErrorMessage="State is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                </div>
                                <asp:Button ID="btnSubmit" class="btn btn-primary" ValidationGroup="PersonalContactGroup" OnClick="btnSubmit_Click" runat="server" Text="Submit" />


                                <div>

                                    <asp:Label ID="lblmessageContact" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="BusinessContact">
                                <h3>Business Contact</h3>
                                <div class="form-group">
                                    <label for="businesssName">Business Name</label>
                                    <asp:TextBox ID="txtBusinessName" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="lblBusinessCategory">Business Category</label>
                                    <asp:TextBox ID="txtBusinessCategory" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessCategory" Display="Dynamic" ForeColor="Red" ErrorMessage="Last name is required" runat="server"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="lblBusinessAddress">Business Address</label>
                                    <asp:TextBox ID="txtBusinessAddress" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessAddress" Display="Dynamic" ForeColor="Red" ErrorMessage=" Business Address is required" runat="server"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="lbltxtBusinessCity">City</label>
                                    <asp:TextBox ID="txtBusinessCity" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessCity" Display="Dynamic" ForeColor="Red" ErrorMessage="City is required" runat="server"></asp:RequiredFieldValidator>

                                </div>

                                <div class="from-group">
                                    <label for="lbltxtBusinessCity">Other City</label>
                                    <asp:CheckBox ID="chkYes" CssClass="list-group-item" runat="server" Text="&nbsp;Yes" />
                                    <asp:CheckBox ID="chkTravel" CssClass="list-group-item" runat="server" Text="&nbsp;Travel & Stay by Client" />
                                </div>
                                <div class="form-group">
                                    <label for="lblpincode">Pincode</label>
                                    <asp:TextBox ID="txtBusinessPinCode" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessPinCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Pin code is required" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="BusinessContactGroup" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtBusinessPinCode" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Pin code is not valid"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label for="lblState">City</label>
                                    <asp:TextBox ID="txtState" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="BusinessContactGroup" ControlToValidate="txtState" Display="Dynamic" ForeColor="Red" ErrorMessage="State is required" runat="server"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <label for="lblBusinessRunningFrom">Business Running From (YYYY)</label>
                                    <asp:TextBox ID="txtBusinessRunning" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessRunning" Display="Dynamic" ForeColor="Red" ErrorMessage="Business Running from is required" runat="server"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                </div>
                                <asp:Button ID="btnBusinessContact" class="btn btn-primary" ValidationGroup="BusinessContactGroup" OnClick="btnBusinessContact_Click" runat="server" Text="Submit" />


                                <div>

                                    <asp:Label ID="lblmessageBusiness" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="AddServiceProduct">
                                <h3>AddServiceProduct</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="PaymentType">
                                <h3>Payment Type</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="BusinessInformation">
                                <h3>Business Information</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="AddPhoto">
                                <h3>Business Information</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="CustomerEnquiry">
                                <h3>CustomerEnquiry</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="PragrammeSetting">
                                <h3>PragrammeSetting</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="MenuSetting">
                                <h3>MenuSetting</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="BusinessKeyword">
                                <h3>BusinessKeyword</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="BusinessDescription">
                                <h3>BusinessDescription</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
