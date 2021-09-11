<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CitySeva.Admin.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CitiSeva</title>
    <link href="Css/login.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../Vendor/bootstrap/js/bootstrap.min.js"></script>
    <link href="../Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>


    <form id="form1" runat="server">
    <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-left">Sign In</h5>
            
              <div class="form-label-group">
                <asp:TextBox ID="txt_username" runat="server" class="form-control" placeholder="Username" name="email" />
                <%--<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>--%>
              </div>

              <div class="form-label-group">
                <asp:TextBox ID="txt_pswd" runat="server" class="form-control" placeholder="Password" TextMode="Password" />
                <%--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>--%>
              </div>

             
              <asp:Button ID="btn_login" runat="server" class="btn btn-success btn-lg btn-block" Text="Login" OnClick="btn_login_Click" />
              <%--<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>--%>
            
          </div>
        </div>
      </div>
    </div>
  </div>
    </form>
</body>
</html>
