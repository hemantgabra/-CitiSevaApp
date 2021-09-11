<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddPlanningTool.aspx.cs" Inherits="CitySeva.Admin.AddPlanningTool" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <h2>Add Planning Tool</h2>


        <div>

            <asp:HiddenField ID="hidUpdatevalue" runat="server" />
            <asp:Label ID="lblSID" runat="server" Visible="false"></asp:Label>
        </div>


        
        <div class="form-group mt-3">
           <div class="form-group">
                <asp:TextBox ID="txt_toolname" runat="server" class="form-control" placeholder="Tool Name" name="Tool Name" />

                <asp:RequiredFieldValidator ID="requ1" ControlToValidate="txt_toolname"  ValidationGroup="regform" Display="Dynamic" ForeColor="Red" ErrorMessage="Tool name is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <%--<div class="form-group">
                <asp:TextBox ID="txt_heading" runat="server"  class="form-control" placeholder="Heading" name="Heading" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="regform" ControlToValidate="txt_heading" Display="Dynamic" ForeColor="Red" ErrorMessage="Mobile number is required" runat="server"></asp:RequiredFieldValidator>
               

            </div>--%>
            <div class="form-group">
                <asp:TextBox ID="txt_tooldescription" TextMode="MultiLine" runat="server" class="form-control" placeholder="Description" name="Description" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="regform" ControlToValidate="txt_tooldescription" Display="Dynamic" ForeColor="Red" ErrorMessage="Address is required" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:CheckBox ID="chk_active" Text="Is Active" runat="server" />

            </div>


            

        </div>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        
         <div class="form-group">
        <asp:Button ID="btn_Add" runat="server" ValidationGroup="regform" class="btn btn-primary" Text="Save" OnClick="btn_Add_Click"  />


        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-dark" OnClick="btnUpdate_Click" ValidationGroup="regform" Text="Update" Visible="false"  />
        <asp:Button ID="btnCancel" CausesValidation="false" runat="server" CssClass="btn btn-dark" OnClick="btnCancel_Click" Text="Cancel"  />


               <asp:Repeater ID="PlanningTools" runat="server" OnItemCommand="PlanningtoolsRpt_ItemCommand">
            <HeaderTemplate>
                <table id="PlanningToolstbl" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>sno
                            </th>
                            
                            <th>Tool name</th>
                             <th>Tool description</th>
                             <th>Is Active</th>

                            <th>Action</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>

                    <td><%# Container.ItemIndex + 1%></td>


                    <td><%#Eval("tool_name")%></td>
                     <td><%#Eval("tool_description")%></td>
                     <td><%#Eval("is_active")%></td>

                    <td>
                        <asp:Button ID="btn_edit"  CausesValidation="false"  CommandArgument='<%#Eval("tool_id")%>' CommandName="Edit1"  CssClass="btn btn-primary btn-sm" Text="Edit" runat="server" />
                        <asp:Button ID="btn_delete" CausesValidation="false" CommandArgument='<%#Eval("tool_id")%>' CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Delete" runat="server" />
                    </td>
                </tr>




            </ItemTemplate>
            <FooterTemplate>
                </table>  

            </FooterTemplate>
        </asp:Repeater>



    </div>
       </div>
</asp:Content>
