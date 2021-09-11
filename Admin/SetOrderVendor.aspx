<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SetOrderVendor.aspx.cs" Inherits="CitySeva.Admin.SetOrderVendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>

        $(document).ready(function () {
            
            $("#btnSubmit").click(function () {
                SaveOrderData();
            });


        });


        function SaveOrderData() {

            var selectVal = "";
            $("#lstCatLoc option[value='']").remove();
            $("#lstCatLoc option").each(function () {
                selectVal = selectVal + $(this).val() + "^" + (parseInt($(this).index()) + 1) + ",";
            });
            selectVal = selectVal.substring(0, selectVal.length - 1)

            
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "adminservice.aspx/VenderregistrationSetOrder",
                data: "{'order':'" + selectVal + "'}",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = data.d;
                    if (result == 1) {

                        alert("Updated order successfully");


                    }

                    else {
                        alert(" order not updated");
                    }



                },
                error: OnErrorCall
            });

        }



        //order chnage 

        function MoveDown() {
            listbox_move('lstCatLoc', 'down');
        }

        function MoveUp() {

            listbox_move('lstCatLoc', 'up');
        }
        function listbox_move(listID, direction) {

            var listbox = document.getElementById(listID);
            var selIndex = listbox.selectedIndex;

            if (-1 == selIndex) {
                alert("Please select an option to move.");
                return;
            }

            var increment = -1;
            if (direction == 'up')
                increment = -1;
            else
                increment = 1;

            if ((selIndex + increment) < 0 ||
                (selIndex + increment) > (listbox.options.length - 1)) {
                return;
            }

            var selValue = listbox.options[selIndex].value;
            var selText = listbox.options[selIndex].text;
            listbox.options[selIndex].value = listbox.options[selIndex + increment].value
            listbox.options[selIndex].text = listbox.options[selIndex + increment].text

            listbox.options[selIndex + increment].value = selValue;
            listbox.options[selIndex + increment].text = selText;

            listbox.selectedIndex = selIndex + increment;
        }
        function OnErrorCall(response) {
            alert(response.status + " " + response.statusText);


            return false;
        }



    </script>



    <table class="table table-bordered">
       <tr>

           <td>
               <asp:Label ID="lblcatName" runat="server" Text="Select Categiry"></asp:Label><br />
               <asp:DropDownList ID="ddlCategoryList" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryList_SelectedIndexChanged" runat="server">

               </asp:DropDownList>

           </td>
       </tr>
        <tr>
            <td>
                <asp:ListBox ID="lstCatLoc" ClientIDMode="Static" CausesValidation="false" Font-Size="18px" CssClass="form-control listbox" Style="min-height: 340px;" runat="server"></asp:ListBox>
                <input type="button" class="btnclear text-red w-100" onclick="MoveUp()" value="UP" />
                <input type="button" value="down" onclick="MoveDown()" class="btnclear text-red w-100" />
            </td>

        </tr>
        <tr>
            <td>
                <input type="button" id="btnSubmit" value="Submit" class="btn btn-primary" />
               <%-- <asp:Button ID="btnSubmit" ClientIDMode="Static" Text="Submit"  CssClass="btn btn-primary" runat="server" />--%>
            </td>
        </tr>

    </table>

</asp:Content>
