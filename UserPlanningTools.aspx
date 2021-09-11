<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="UserPlanningTools.aspx.cs" Inherits="CitySeva.UserPlanningTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>My Planning Tools </h3>


    <asp:Repeater ID="PlanningRpt" runat="server">
        <HeaderTemplate>
            <table id="LocationRpttbl" class="table table-bordered">
                <thead>
                    <tr>
                        <th>sno </th>
                        <th>Tool Name</th>
                        <th>Tool Description</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>

                <td><%# Container.ItemIndex + 1%></td>

                <td><%#Eval("tool_name")%></td>
                <td><%#Eval("tool_description")%></td>

               
            </tr>




        </ItemTemplate>
        <FooterTemplate>
            </table>  

        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
