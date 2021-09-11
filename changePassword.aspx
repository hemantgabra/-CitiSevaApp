<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="CitySeva.changePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_fixed">
        <div class="login_box">
            <div class="login_form">
                <h3 class="text-center">Change Password</h3>



                <div class="form-group">

                    <asp:TextBox ID="txt_OldPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="old Passwrod" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="regform" ControlToValidate="txt_OldPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Old Password is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_NewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="New Password" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="regform" ControlToValidate="txt_NewPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="New Password is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm password" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="regform" ControlToValidate="txt_ConfirmPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Confirm Password is required" runat="server"></asp:RequiredFieldValidator>
               <asp:CompareValidator ID="CompareValidator1" ValidationGroup="regform"  ControlToValidate="txt_ConfirmPassword" ControlToCompare="txt_NewPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Confirm password not matched" runat="server"></asp:CompareValidator>
                    </div>



                <asp:Button ID="btn_Submit" runat="server" ValidationGroup="regform" OnClick="btn_Submit_Click" CssClass="btn btn-block btn-danger login_btn" Text="Submit"></asp:Button>


                <br />
                <asp:Label ID="lblmessage" runat="server"></asp:Label>
            </div>

        </div>
    </div>
</asp:Content>
