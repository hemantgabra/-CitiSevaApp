<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Registereduserlist.aspx.cs" Inherits="CitySeva.Admin.Registereduserlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><h2>User Registration List</h2> </div>
  
		
		
        <br />
     <div style="overflow:scroll;">


         
    <asp:Repeater ID="UsersRpt" runat="server" OnItemCommand="categoryRpt_ItemCommand" OnItemDataBound="UsersRpt_ItemDataBound">
        <HeaderTemplate>
            <table id="UsersRpttbl" class="table table-bordered">
                <thead>
                    <tr>
                        <th>sno</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Mobile</th>
                     
                        <th>email</th>
                        <th>Address</th>
                        <th>User Name</th>
                        <th>Password </th>
                        <th>Date</th>
                        
                       
                         <th>IsActive</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Container.ItemIndex + 1%></td>
                <td> <asp:Label ID="LblCompanyName" runat="server" Font-Size="Medium" Text='<%#Bind("fname") %>'></asp:Label>  </td>
                <td><asp:Label ID="Label1" runat="server" Font-Size="Medium" Text='<%#Bind("lname") %>'></asp:Label></td>
                <td> <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text='<%#Bind("mobile") %>'></asp:Label> </td>
                
                <td> <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text='<%#Bind("email") %>'></asp:Label>  </td>
                <td><asp:Label ID="Label4" runat="server" Font-Size="Medium" Text='<%#Bind("address") %>'></asp:Label> </td>
                <td> <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text='<%#Bind("username") %>'></asp:Label> </td>
                <td> <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text='<%#Bind("password") %>'></asp:Label>  </td>
                <td>  <asp:Label ID="Label7" runat="server" Font-Size="Medium" Text='<%#Bind("date") %>'></asp:Label>  </td>               
               
                <td>
                    <asp:HiddenField ID="hiIsActive" runat="server" Value='<%#Bind("IsActive") %>'  />
                    <asp:Button ID="btn_edit" CausesValidation="false" CommandArgument='<%#Eval("userID")%>' CommandName="Edit1" CssClass="btn btn-primary" Text="Edit" runat="server" />
                    
                </td>
            </tr>


        </ItemTemplate>
        <FooterTemplate>
            </table>  

        </FooterTemplate>
    </asp:Repeater>


        
         </div>
</asp:Content>
