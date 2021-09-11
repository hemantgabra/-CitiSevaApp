<%@ Page Title="" Language="C#" MasterPageFile="~/loginCitySeva.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CitySeva.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="signup-form">
    <form action="/examples/actions/confirmation.php" method="post">
		<h2>Register</h2>
		<p class="hint-text">Create your account. It's free and only takes a minute.</p>
        <div class="form-group">
			<div class="row">
                <div class="col-xs-6"><asp:TextBox ID="txt_fname" runat="server" class="form-control" placeholder="First Name" required="required" /></div>
                 <div class="col-xs-6"><asp:TextBox ID="txt_lname" runat="server" class="form-control" placeholder="Last Name" required="required" /></div>
				
			</div>        	
        </div>
        <div class="form-group">
           <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="email" required="required" name="email" />
        	
        </div>
		<div class="form-group">
            <asp:TextBox ID="txt_pswd" runat="server" class="form-control" placeholder="Password" required="required" TextMode="Password" />
          
        </div>
		<div class="form-group">
               <asp:TextBox ID="txt_cpswd" runat="server" class="form-control" placeholder="Confirm Password" required="required" TextMode="Password" />
         
        </div>        
        <div class="form-group">
            <label class="checkbox-inline"><asp:CheckBox ID="chk_tc" runat="server" required="required"/>I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
			
		</div>
		<div class="form-group">
            <asp:Button ID="btn_register" runat="server" class="btn btn-success btn-lg btn-block" Text="Register Now" OnClick="btn_register_Click"  />
          
        </div>
    </form>
	<div class="text-center">Already have an account? <a href="#">Sign in</a></div>
</div>
</asp:Content>
