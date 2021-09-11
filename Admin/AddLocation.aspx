<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddLocation.aspx.cs" Inherits="CitySeva.Admin.AddLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <script>

        $(document).ready(function () {

            
            $('#categoryRpttbl').DataTable({});
           
        });
    </script>--%>
    <div>

        <h2>Add Location</h2>


        <div>

            <asp:HiddenField ID="hidUpdatevalue" runat="server" />
            <asp:Label ID="lblSID" runat="server" Visible="false"></asp:Label>
        </div>


        
        <div class="form-group mt-3">
            <div class="row">
                <div class="col-sm-3"><asp:TextBox ID="txt_location" ValidationGroup="regform" runat="server" class="form-control form-control-sm" placeholder="Add New Location" name="Location" />

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="regform" ControlToValidate="txt_location" Display="Dynamic" ForeColor="Red" ErrorMessage="Location name is required" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-3 pl-0">
                    <asp:Button ID="btn_Add" runat="server" class="btn btn-primary btn-sm" OnClick="btn_Add_Click" Text="Add New Location" />
                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" Visible="false" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-dark btn-sm" />
                </div>
            </div>
            


            

        </div>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        

        <asp:Repeater ID="LocatiionRpt" runat="server" OnItemCommand="categoryRpt_ItemCommand">
            <HeaderTemplate>
                <table id="LocationRpttbl" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>sno
                            </th>
                            
                            <th>location</th>
                            <th>Action</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>

                    <td><%# Container.ItemIndex + 1%></td>


                    <td><%#Eval("location")%></td>

                    <td>
                        <asp:Button ID="btn_edit"  CausesValidation="false"  CommandArgument='<%#Eval("id")%>' CommandName="Edit1"  CssClass="btn btn-primary btn-sm" Text="Edit" runat="server" />
                        <asp:Button ID="btn_delete" CausesValidation="false" CommandArgument='<%#Eval("id")%>' CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Delete" runat="server" />
                    </td>
                </tr>




            </ItemTemplate>
            <FooterTemplate>
                </table>  

            </FooterTemplate>
        </asp:Repeater>



    </div>









</asp:Content>
