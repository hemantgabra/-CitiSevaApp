<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AllRequests.aspx.cs" Inherits="CitySeva.Admin.AllRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><h2>Request List</h2> </div>
  
		
		
        <br />
     <div style="overflow:scroll;">


         
    <asp:Repeater ID="RequestRpt" runat="server" OnItemCommand="categoryRpt_ItemCommand" OnItemDataBound="UsersRpt_ItemDataBound">
        <HeaderTemplate>
            <table id="UsersRpttbl" class="table table-bordered">
                <thead>
                    <tr>
                        <th>sno</th>
                        <th>Business Name</th>
                          <th>Catgory Name</th>
                        <th>FullName</th>
                        <th>City</th>
                     
                        <th>PhoneNumber</th>
                        <th>EventDate</th>
                        <th>MessageRequest</th>
                        <th>Created_Date </th>
                   
                         <th>IsActive</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Container.ItemIndex + 1%></td>
                <td> <asp:Label ID="LblCompanyName" runat="server" Font-Size="Medium" Text='<%#Bind("business_name") %>'></asp:Label>  </td>
                 <td><asp:Label ID="Label7" runat="server" Font-Size="Medium" Text='<%#Bind("catgory_name") %>'></asp:Label></td>
                <td><asp:Label ID="Label1" runat="server" Font-Size="Medium" Text='<%#Bind("FullName") %>'></asp:Label></td>
                <td> <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text='<%#Bind("Email_Id") %>'></asp:Label> </td>
                
                <td> <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text='<%#Bind("PhoneNumber") %>'></asp:Label>  </td>
                <td><asp:Label ID="Label4" runat="server" Font-Size="Medium" Text='<%#Bind("EventDate") %>'></asp:Label> </td>
                <td> <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text='<%#Bind("MessageRequest") %>'></asp:Label> </td>
                <td> <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text='<%#Bind("Created_Date") %>'></asp:Label>  </td>
                               
               
                <td>
                    <asp:HiddenField ID="hiIsActive" runat="server" Value='<%#Bind("status") %>'  />
                    <asp:Button ID="btn_edit" CausesValidation="false" CommandArgument='<%#Eval("Requestd")%>' CommandName="Edit1" CssClass="btn btn-primary" Text="Edit" runat="server" />
                    
                </td>
            </tr>


        </ItemTemplate>
        <FooterTemplate>
            </table>  

        </FooterTemplate>
    </asp:Repeater>


        
         </div>
</asp:Content>
