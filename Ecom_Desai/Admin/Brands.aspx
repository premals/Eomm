<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="Admin_Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <table id="brandtable" style="padding-left: 300px;">
        </table>
    </div>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script>
        var GlobalPath = "<%= Application["path"] %>";
        $(document).ready(function () {
            debugger;
            GetAllBrands();
        });
        function GetAllBrands() {

            var xmlRequest = [];
            xmlRequest.push($.ajax(
                  {
                      type: "POST",
                      url: GlobalPath + "Brands.asmx/GetAllBrands",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: true,
                      cache: false,
                      success: onsuccess,
                      error: function (xhr, ajaxOptions, thrownError) {
                          //alert(xhr.responseText + "error");
                          //alert(thrownError);
                      }
                  }));
        }
        function onsuccess(data) {
            debugger;
            alert(data.d.length + "" + data.d[0].Name);
            if (data.d.length > 0) {
                $("#brandtable").append("<thead><tr><td>Name</td><td>Edit</td><td>Delete</td></tr></thead>");
                (data.d).forEach(function (i) {
                    $("#brandtable").append("<tbody><tr><td id='brand_'" + i.Id + ">" + i.Name + "</td><td><img src='images/Edit.png' onclick='EditBrand(this)' /></td><td><img src='images/Delete.png' onclick='DeleteBrand(this)'/></td></tr></tbody>");
                });
            }
        }
        function EditBrand(e) {
            var xmlRequest = [];
            xmlRequest.push($.ajax(
                  {
                      type: "POST",
                      url: GlobalPath + "Brands.asmx/GetById",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      data:{id : e.Id},
                      async: true,
                      cache: false,
                      success: onsuccessEdit,
                      error: function (xhr, ajaxOptions, thrownError) {
                          //alert(xhr.responseText + "error");
                          //alert(thrownError);
                      }
                  }));
        }
        function onsuccessEdit(data) {
            debugger;
            alert(data.d.length + "" + data.d[0].Name);
            if (data.d.length > 0) {
                window.location.href = "Admin/Dashboard.aspx"
            }
        }
        function DeleteBrand(e) {

        }
    </script>
</asp:Content>

