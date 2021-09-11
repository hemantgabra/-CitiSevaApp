<%@ Page Title="" Language="C#" MasterPageFile="~/loginCitySeva.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CitySeva.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="container_fixed">

        <div class="login_box">
            <div class="login_img">
                <img src="Images/login_img.jpg" />
                <div class="overlap"></div>

            </div>
            <div class="login_form">
                <h3 class="text-center">Or sign up with your email</h3>
                <span class="text-center">Don't have an account? Free sign up</span>


                <div class="form-group">

                    <asp:TextBox ID="txt_FirstName" runat="server" MaxLength="50"  CssClass="form-control" autocomplete="off" placeholder="First Name" />

                    <asp:RequiredFieldValidator ID="requ1"  ValidationGroup="regform" ControlToValidate="txt_FirstName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_LateName" autocomplete="off" runat="server" CssClass="form-control" placeholder="Last Name" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="regform" ControlToValidate="txt_LateName" Display="Dynamic" ForeColor="Red" ErrorMessage="Last name is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_email" autocomplete="off" runat="server" MaxLength="50" CssClass="form-control" placeholder="Email" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="regform" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red" ErrorMessage="Email name is required" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reg1" runat="server" ValidationGroup="regform" Display="Dynamic" ForeColor="Red" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email address is not valid"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_password" autocomplete="off" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="regform" ControlToValidate="txt_password" Display="Dynamic" ForeColor="Red" ErrorMessage="Password name is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txt_confirmPassword" autocomplete="off" TextMode="Password" runat="server" CssClass="form-control" placeholder="Confirm Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="regform" ControlToValidate="txt_confirmPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Confirm password name is required" runat="server"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="RequiredFieldValidator5" ValidationGroup="regform" ControlToValidate="txt_confirmPassword" ControlToCompare="txt_password" Display="Dynamic" ForeColor="Red" ErrorMessage="Confirm password not matched" runat="server"></asp:CompareValidator>

                </div>
                <div class="form-group">


                    <asp:TextBox ID="txt_city" runat="server" autocomplete="off" CssClass="form-control" placeholder="City" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="regform" ControlToValidate="txt_city" Display="Dynamic" ForeColor="Red" ErrorMessage="City is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">


                    <asp:TextBox ID="txt_serviceDate" autocomplete="off"     ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Service date : YYYY-MM-DD" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="regform" ControlToValidate="txt_serviceDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Service Date is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_mobileNumber" autocomplete="off"  runat="server" CssClass="form-control" MaxLength="10" placeholder="Phone number" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ValidationGroup="regform" ControlToValidate="txt_mobileNumber" Display="Dynamic" ForeColor="Red" ErrorMessage="Mobile number is required" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="regform"  runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txt_mobileNumber" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Mobile number is not valid"></asp:RegularExpressionValidator>

                </div>
                <p class="condition"> <asp:CheckBox ID="chkterm" runat="server" /> I accept the Terms of Use of CitiSeva.in.</p>
                <asp:Button ID="btn_Submit" runat="server" CssClass="btn btn-block btn-danger login_btn" ValidationGroup="regform" OnClick="btn_Submit_Click" Text="Sign Up"></asp:Button>
                <p class="already_sign">Already have an account? <a href="Login.aspx">Log In</a></p>

                <br />

                <br />
                <asp:Label ID="lblmessage" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
