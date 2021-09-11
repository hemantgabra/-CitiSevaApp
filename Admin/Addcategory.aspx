<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Addcategory.aspx.cs" Inherits="CitySeva.Admin.Addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%--<script>

        $(document).ready(function () {

            
            $('#categoryRpttbl').DataTable({});
           
        });
    </script>--%>
    <div>

        <h2>Add Services</h2>


        <div>

            <asp:HiddenField ID="hidUpdatevalue" runat="server" />
            <asp:Label ID="lblSID" runat="server" Visible="false"></asp:Label>
        </div>


        
        <div class="form-group mt-3">
            <div class="row">
                <div class="col-sm-3"><asp:TextBox ID="txt_category" runat="server" class="form-control form-control-sm" placeholder="Add New Service" name="Category" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="regform" ControlToValidate="txt_category" Display="Dynamic" ForeColor="Red" ErrorMessage="Category name is required" runat="server"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-3 pl-0">
                    <asp:Button ID="btn_category" ValidationGroup="regform" runat="server" class="btn btn-primary btn-sm" OnClick="btn_category_Click" Text="Add New Service" />
                    <asp:Button ID="btnUpdate" ValidationGroup="regform"  OnClick="btnUpdate_Click" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" Visible="false" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-dark btn-sm" />
                </div>
            </div>
            


            

        </div>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        

        <asp:Repeater ID="categoryRpt" runat="server" OnItemCommand="categoryRpt_ItemCommand">
            <HeaderTemplate>
                <table id="categoryRpttbl" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>sno
                            </th>
                            
                            <th>catgory_name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>

                    <td><%# Container.ItemIndex + 1%></td>


                    <td><%#Eval("catgory_name")%></td>

                    <td>
                        <asp:Button ID="btn_edit"  CausesValidation="false"  CommandArgument='<%#Eval("categoryId")%>' CommandName="Edit1"  CssClass="btn btn-primary btn-sm" Text="Edit" runat="server" />
                        <asp:Button ID="btn_delete" CausesValidation="false" CommandArgument='<%#Eval("categoryId")%>' CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Delete" runat="server" />
                    </td>
                </tr>




            </ItemTemplate>
            <FooterTemplate>
                </table>  

            </FooterTemplate>
        </asp:Repeater>



    </div>









</asp:Content>
