<%@ Page Title="" Language="C#" MasterPageFile="~/loginCitySeva.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CitySeva.login" %>

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
                <h3 class="text-center">Log in to your account</h3>
                <span class="text-center">Don't have an account? Free sign up</span>


                <div class="form-group">

                    <asp:TextBox ID="txt_Email" CssClass="form-control" placeholder="Your Email" runat="server"></asp:TextBox>

                </div>
                <div class="form-group">
                    <asp:TextBox ID="txt_Password" TextMode="Password" CssClass="form-control" placeholder="Your Password" runat="server"></asp:TextBox>

                </div>


                <p class="text-right forgot"><a href="forgot.aspx">Forgot your password</a></p>
                <asp:Button ID="btn_Login" CssClass="btn btn-block btn-danger login_btn" OnClick="btn_Login_Click" Text="Log In" runat="server" />
                <br />

                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
