<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CitySeva.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
  <script>  
$(function ()  
{  
    $('#txt_serviceDate').datepicker(  
    {  
        dateFormat: 'dd/mm/yy',  
        changeMonth: true,  
        changeYear: true,  
        yearRange: '1950:2100'  
    });  
})  
</script> 
    <div class="container_fixed">

        <div class="login_box">
            <div class="login_img">
                <img src="Images/login_img.jpg" />
                <div class="overlap"></div>

            </div>
            <div class="login_form">
                <h3 class="text-center">Update your Profile</h3>

                <div class="form-group">
                    <asp:TextBox ID="txt_FirstName" runat="server" CssClass="form-control" placeholder="First Name" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="regform" ControlToValidate="txt_FirstName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_LateName" runat="server" CssClass="form-control" placeholder="Last Name" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="regform" ControlToValidate="txt_LateName" Display="Dynamic" ForeColor="Red" ErrorMessage="Last name is required" runat="server"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">

                    <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="City" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="regform" ControlToValidate="txt_city" Display="Dynamic" ForeColor="Red" ErrorMessage="City is required" runat="server"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group">

                    <asp:TextBox ID="txt_serviceDate" runat="server" CssClass="form-control" placeholder="Service date : YYYY-MM-DD" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="regform" ControlToValidate="txt_serviceDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Service Date is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txt_mobileNumber" runat="server" CssClass="form-control" placeholder="Phone number" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="regform" ControlToValidate="txt_mobileNumber" Display="Dynamic" ForeColor="Red" ErrorMessage="Mobile number is required" runat="server"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="regform" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txt_mobileNumber" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Mobile number is not valid"></asp:RegularExpressionValidator>

                </div>

                <asp:Button ID="btn_Submit" runat="server" ValidationGroup="regform" CssClass="btn btn-block btn-danger login_btn" OnClick="btn_Submit_Click" Text="Submit"></asp:Button>


                <br />

                <br />
                <asp:Label ID="lblmessage" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
