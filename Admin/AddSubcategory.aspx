<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddSubcategory.aspx.cs" Inherits="CitySeva.Admin.AddSubcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
     
		<h2>Add Sub Category</h2>
		
        <br />
         <div>
             

         </div>
        <div class="form-group w-25 mt-4">
            <asp:DropDownList ID="dd_category" class="form-control" runat="server" />
           <asp:TextBox ID="txt_category" runat="server" class="form-control" placeholder="Category" name="Category" />
        	
        </div>
         <div>

         
                <asp:Label ID="lblSID" runat="server" Visible="false"></asp:Label> 
         </div>
		      <br />
      
		<div class="form-group">
            <asp:Button ID="btn_category" runat="server" class="btn btn-success btn-lg btn-block" Text="Add Category" OnClick="btn_category_Click"  />
          
      
              <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click"   />  
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"  />

         </div>

         <br />
         <p>  
            Total Category:<asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>  
        </p>  
          <br />

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
         ForeColor="#333333" GridLines="None" AllowPaging="True"   Width="469px" OnRowEditing="GridView1_RowEditing" 
             OnSelectedIndexChanging="GridView1_SelectedIndexChanging">

               <AlternatingRowStyle BackColor="White" />
       <Columns>
        
         <asp:TemplateField HeaderText="S.No.">
           
             <ItemTemplate>  
                 <asp:Label ID="LblCompanyId" runat="server" Font-Size="Medium" Text='<%#Bind("row") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField> 
         
              <asp:TemplateField HeaderText="Category Name">  
             <ItemTemplate>  
                 <asp:Label ID="LblCompanyName" runat="server" Font-Size="Medium" Text='<%#Bind("catgory_name") %>'></asp:Label>  
             </ItemTemplate> 
              <EditItemTemplate>  
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("catgory_name") %>'>
                            </asp:TextBox>  
                    </EditItemTemplate>  
         </asp:TemplateField> 

         <asp:TemplateField HeaderText="Sub Category Name">  
             <ItemTemplate>  
                 <asp:Label ID="LblCompanyName" runat="server" Font-Size="Medium" Text='<%#Bind("sub_category") %>'></asp:Label>  
             </ItemTemplate> 
              <EditItemTemplate>  
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("sub_category") %>'>
                            </asp:TextBox>  
                    </EditItemTemplate>  
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
      </form>
</asp:Content>
