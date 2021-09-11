<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="WebForm2.aspx.cs" Inherits="CitySeva.WebForm2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="table table-borderless position-absolute mt-5">
        <tr>

            <td class="col-3">

                <div class="nav flex-column nav-pills" style="width: 100%;" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                    <asp:Button ID="Dashboardtab" class="nav-link" OnClick="Dashboardtab_Click" Text="Dashboard" runat="server"></asp:Button>
                    <asp:Button ID="Personaltab" class="nav-link" OnClick="Personaltab_Click" Text="Personal Contact" runat="server"></asp:Button>
                    <asp:Button ID="Businesstab" class="nav-link" OnClick="Businesstab_Click" Text="Business Contact" runat="server"></asp:Button>

                    <asp:Button ID="Producttab" class="nav-link" OnClick="Producttab_Click" Text="Add Service / Product" runat="server"></asp:Button>
                    <%-- 
                    
                    
                    <a class="nav-link" id="v-pills-Product-tab" data-toggle="pill" href="#v-pills-Product" role="tab" aria-controls="v-pills-Product" aria-selected="false">Add Service / Product</a>
                    <a class="nav-link" id="v-pills-Payment-tab" data-toggle="pill" href="#v-pills-Payment" role="tab" aria-controls="v-pills-Payment" aria-selected="false">Payment Type</a>
                    <a class="nav-link" id="v-pills-Photo-tab" data-toggle="pill" href="#v-pills-Photo" role="tab" aria-controls="v-pills-Photo" aria-selected="false">Add Photo</a>
                    <a class="nav-link" id="v-pills-Customer-tab" data-toggle="pill" href="#v-pills-Customer" role="tab" aria-controls="v-pills-Customer" aria-selected="false">Customer Enquiry</a>
                    <a class="nav-link" id="v-pills-Pragramme-tab" data-toggle="pill" href="#v-pills-Pragramme" role="tab" aria-controls="v-pills-Pragramme" aria-selected="false">Pragramme Setting</a>
                    <a class="nav-link" id="v-pills-Menu-tab" data-toggle="pill" href="#v-pills-Menu" role="tab" aria-controls="v-pills-Menu" aria-selected="false">Menu Setting</a>
                    <a class="nav-link" id="v-pills-Keyword-tab" data-toggle="pill" href="#v-pills-Keyword" role="tab" aria-controls="v-pills-Keyword" aria-selected="false">Business Keyword</a>
                    <a class="nav-link" id="v-pills-Description-tab" data-toggle="pill" href="#v-pills-Description" role="tab" aria-controls="v-pills-Description" aria-selected="false">Business Description</a>--%>
                </div>
            </td>
            <td>

                <div class="col-9">



                    <div class="tab-content" id="v-pills-tabContent">
                        <asp:Panel ID="PanlDashboard" Visible="false" runat="server">ghgfhgfhfhgfhgfhgf</asp:Panel>
                        <asp:Panel ID="PanlPersonal" Visible="false" runat="server">

                            <div id="PersonalContact">
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

                        </asp:Panel>
                        <asp:Panel ID="PanlBusinessContact" Visible="false" runat="server">

                            <div id="BusinessContact">
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
                        </asp:Panel>
                        <asp:Panel ID="panlProduct" Visible="false" runat="server">
                            <asp:Button ID="btn_PricePerPlate" Text="Per Plate System" OnClick="btn_PricePerPlate_Click" CssClass=" btn btn-primary" runat="server" />
                            <asp:Button ID="btn_cookingPackage" Text="Cooking Package" OnClick="btn_cookingPackage_Click" CssClass=" btn btn-primary" runat="server" />

                            <asp:Panel ID="PanlPricePerPlate" Visible="false" runat="server">
                                <div id="Product">
                                    <h3>Business Contact</h3>
                                    <div class="form-group">
                                        <label for="businesssName">Per Plate Price</label>
                                        <asp:DropDownList ID="ddl_PerPlatePrice" runat="server">
                                            <asp:ListItem Text="300" Value="300"></asp:ListItem>
                                            <asp:ListItem Text="700" Value="700"></asp:ListItem>
                                            <asp:ListItem Text="1200" Value="1200"></asp:ListItem>
                                        </asp:DropDownList>

                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>--%>
                                    </div>

                                    <div class="form-group">
                                        <label for="businesssName"></label>

                                        <asp:Repeater ID="rept" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th>Cooking Items
                                                        </th>
                                                        <th>Item Type
                                                        </th>
                                                        <th>Item Name
                                                        </th>

                                                    </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>

                                                <tr>

                                                    <td>
                                                         <asp:CheckBox Text='<%#Eval("Item")%>' CssClass="form-control"  ID="chkRequired" runat="server" />
                                                         
                                                       
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_" CssClass="form-control"   runat="server"></asp:TextBox>

                                                    </td>
                                                    <td>

                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </div>
                                    <div class="form-group">
                                        <label  for="txtNoOfGust">No. Of Guest</label>
                                        <asp:TextBox ID="txtNoOfGust" CssClass="form-control" runat="server"></asp:TextBox>
                                         
                                    </div>
                                      <div class="form-group">
                                        <label for="businesssName">Services</label>
                                       <asp:CheckBoxList ID="chk_service"  runat="server">

                                       </asp:CheckBoxList>
                                    </div>
                                </div>

                            </asp:Panel>
                            <asp:Panel ID="PanlCookingPackag" Visible="false" runat="server">
                                 <div id="Cooking">
                                    <h3>Business Contact</h3>
                                    <div class="form-group">
                                        <label for="businesssName">Cooking Package Price</label>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="100000" Value="100000"></asp:ListItem>
                                            <asp:ListItem Text="150000" Value="150000"></asp:ListItem>
                                            <asp:ListItem Text="2000000" Value="200000"></asp:ListItem>
                                        </asp:DropDownList>

                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="BusinessContactGroup" ControlToValidate="txtBusinessName" Display="Dynamic" ForeColor="Red" ErrorMessage="First name is required" runat="server"></asp:RequiredFieldValidator>--%>
                                    </div>

                                    <div class="form-group">
                                        <label for="businesssName"></label>

                                        <asp:Repeater ID="RepeaterCooking" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th>Cooking Items
                                                        </th>
                                                        <th>Item Type
                                                        </th>
                                                        <th>Item Name
                                                        </th>

                                                    </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>

                                                <tr>

                                                    <td>
                                                         <asp:CheckBox Text='<%#Eval("Item")%>' CssClass="form-control"  ID="chkRequired" runat="server" />
                                                         
                                                       
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_" CssClass="form-control"   runat="server"></asp:TextBox>

                                                    </td>
                                                    <td>

                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </div>
                                    <div class="form-group">
                                        <label  for="txtNoOfGust">No. Of Guest</label>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                         
                                    </div>
                                      <div class="form-group">
                                        <label for="businesssName">Services</label>
                                       <asp:CheckBoxList ID="chk_serviceCooking"  runat="server">

                                       </asp:CheckBoxList>
                                    </div>
                                </div>

                            </asp:Panel>
                        </asp:Panel>




                        <div class="tab-pane fade" id="v-pills-Payment" role="tabpanel" aria-labelledby="v-pills-Payment-tab">Similarly, you can create pill based navigation by adding the class .nav-pills on the basic nav instead of class .nav-tabs, as shown in the following example:</div>
                        <div class="tab-pane fade" id="v-pills-Photo" role="tabpanel" aria-labelledby="v-pills-Photo-tab">Similarly, you can create pill based navigation by adding the class .nav-pills on the basic nav instead of class .nav-tabs, as shown in the following example:</div>
                        <div class="tab-pane fade" id="v-pills-Menu" role="tabpanel" aria-labelledby="v-pills-Menu-tab">Similarly, you can create pill based navigation by adding the class .nav-pills on the basic nav instead of class .nav-tabs, as shown in the following example:</div>
                        <div class="tab-pane fade" id="v-pills-Keyword" role="tabpanel" aria-labelledby="v-pills-Keyword-tab">Similarly, you can create pill based navigation by adding the class .nav-pills on the basic nav instead of class .nav-tabs, as shown in the following example:</div>
                        <div class="tab-pane fade" id="v-pills-Description" role="tabpanel" aria-labelledby="v-pills-Description-tab">Similarly, you can create pill based navigation by adding the class .nav-pills on the basic nav instead of class .nav-tabs, as shown in the following example:</div>
                    </div>
                </div>
            </td>
        </tr>

    </table>




</asp:Content>
