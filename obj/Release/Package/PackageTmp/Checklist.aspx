<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Checklist.aspx.cs" Inherits="CitySeva.Checklist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="checklist_img">
        <h3>
            Checklist
        </h3>
       
    </div>
    <div class="checklist_box text-center">
        <div class="container">
            <h3 class="text-center">
                Tools that make wedding planning simple

            </h3>
            <span>
                Create your free WeddingWire account to start planning.

            </span>

            <div class="checklist_form">
               <ul>
                <asp:DataList ID="dataList1" DataKeyField="tool_id"   RepeatColumns="3" RepeatDirection="Horizontal" runat="server">
                   
                    <ItemTemplate>
                         
                         <li>
                        <p class="checklist_name"><%#Eval("tool_name") %></p>
                        <span class="checklist_det"><%#Eval("tool_description") %></span>
                        <div class="clearfix"></div>
                              <asp:CheckBox ID="checkboxtools" CausesValidation="false"  CssClass="checkmark" runat="server" />
                           
                        <%--<label class="checklist_check">

                            
                            <span class="checkmark"></span>
                        </label>--%>
                    </li>
                       
                    </ItemTemplate>
                  
                </asp:DataList>
                </ul>
                <asp:Label ID="lblmessage" Font-Bold="true"  ForeColor="Green" runat="server"></asp:Label>
 
                <asp:Button ID="btnSubmit" CausesValidation="false" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
