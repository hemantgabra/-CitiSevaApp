<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewUserPlanningTools.aspx.cs" Inherits="CitySeva.Admin.ViewUserPlanningTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>View Planning Tools</h2>



        <asp:Repeater ID="PlannigRpt" runat="server">
            <HeaderTemplate>
                <table id="LocationRpttbl" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>SNO </th>
                            <th>User Name</th>
                            <th>Tool Name</th>
                            <th>Tool Description</th>

                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>

                    <td><%# Container.ItemIndex + 1%></td>

                    <td><%#Eval("userName")%></td>
                    <td><%#Eval("tool_name")%></td>
                    <td><%#Eval("tool_description")%></td>


                </tr>




            </ItemTemplate>
            <FooterTemplate>
                </table>  

            </FooterTemplate>
        </asp:Repeater>



    </div>









</asp:Content>
