<%@ Page Title="" Language="C#" MasterPageFile="~/loginCitySeva.Master" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="CitySeva.forgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container_fixed">
        <div class="login_box">
            <div class="login_form">
                <h3 class="text-center">Get your password</h3>



               
                <div class="form-group">

                    <asp:TextBox ID="txt_Emailid" runat="server" CssClass="form-control" placeholder="Please enter your email" />
                </div>



                <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" CssClass="btn btn-block btn-danger login_btn" Text="Submit"></asp:Button>


                <br />
                <asp:Label ID="lblmessage" runat="server"></asp:Label>
            </div>

        </div>
    </div>
</asp:Content>
