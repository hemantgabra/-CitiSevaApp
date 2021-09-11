<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddLocationold.aspx.cs" Inherits="CitySeva.Admin.AddLocationold" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <h2>Add Location</h2>

    
         <div>

         
                <asp:Label ID="lblSID" runat="server" Visible="false"></asp:Label> 
         </div>
		    
      
		<div class="form-group w-25 mt-3">
            <asp:TextBox ID="txt_location" runat="server" class="form-control" placeholder="Location" name="Location" />


            <asp:Button ID="btn_location" runat="server" class="btn btn-primary btn-sm" Text="Add Location" OnClick="btn_location_Click"   />
          
      
              <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary btn-sm" Text="Update" Visible="false"   />  
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-dark btn-sm"  />

         </div>

         <br />
         <p>  
            Total Category:<asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>  
        </p>  
          <br />
        <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
         ForeColor="#333333" GridLines="None" AllowPaging="True"   Width="469px"  
               PageSize="25"  
         >  
     <AlternatingRowStyle BackColor="White" />
       <Columns>
        
         <asp:TemplateField HeaderText="S.No.">
           
             <ItemTemplate>  
                 <asp:Label ID="row" runat="server" Font-Size="Medium" Text='<%#Bind("row") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField> 
         
             <asp:TemplateField HeaderText="Category Id">  
             <ItemTemplate>  
                 <asp:Label ID="id" runat="server" Font-Size="Medium" Text='<%#Bind("id") %>'></asp:Label>  
             </ItemTemplate> 
           
         </asp:TemplateField> 

         <asp:TemplateField HeaderText="Category Name">  
             <ItemTemplate>  
                 <asp:Label ID="LblCompanyName" runat="server" Font-Size="Medium" Text='<%#Bind("location") %>'></asp:Label>  
             </ItemTemplate> 
           
         </asp:TemplateField> 
         
         
         
      

            <asp:CommandField HeaderText="Update" ShowSelectButton="True" />  
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" /> 
      
     </columns>  
     <EditRowStyle BackColor="#2461BF" />  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
 </asp:GridView>
    </div>
      





        

</asp:Content>
