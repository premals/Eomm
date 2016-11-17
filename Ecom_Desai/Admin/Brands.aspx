<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="Admin_Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .modal {
            max-height:280px!important;
        }
        input[type=text], input[type=password], input[type=email], input[type=url], input[type=time], input[type=date], input[type=datetime-local], input[type=tel], input[type=number], input[type=search], textarea.materialize-textarea {
    background-color: transparent;
    border: none;
    border-bottom: 1px solid #9e9e9e;
    border-radius: 0;
    outline: none;
    height: 3rem;
    width: 100%;
    font-size: 1em!important;
    margin: 0 0 15px 0;
    padding: 0;
    box-shadow: none;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    transition: all .3s;
}
        .modal .modal-footer {
    border-radius: 0 0 2px 2px;
    background-color: #fafafa;
    padding: 29px 6px!important;
    /* height: 52px; */
    width: 100%;
}
        body{
            overflow:hidden!important;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <table id="brandtable" style="margin-left: 130px; margin-top: 20px;">
        </table>
    </div>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="brandmodalbutton" style="visibility: hidden" data-target="#myModal">Open Modal</button>
    <div class="modal fade" id="BrandModal" role="dialog">
        <!-- Modal content-->
        <%--<div class="modal-content">--%>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Brand</h4>
        </div>
        <div class="modal-body">
            <div class="row margin">
                <input type="hidden" id="Id" />
                <input type="text" class="input-field col s12" id="Name" />
            </div>
            <input type="button" value="Save" id="save" class="btn btn-default" />
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        <%-- </div>--%>
    </div>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%-- <script src="js/jquery-1.11.1.min.js"></script>--%>
    <script>
        var GlobalPath = "<%= Application["path"] %>";
        $(document).ready(function () {
            $("#brandtable").empty();
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
            //debugger;
            // alert(data.d.length + "" + data.d[0].Name);
            $("#brandtable").empty();
            if (data.d.length > 0) {
                $("#brandtable").append("<thead><tr><td>Name</td><td>Edit</td><td>Delete</td></tr></thead>");
                (data.d).forEach(function (i) {
                    $("#brandtable").append("<tbody><tr><td>" + i.Name + "</td><td><img src='images/edit_Icon.png' id='brand_" + i.Id + "' onclick='EditBrand(this)' style='width:30px;'/></td><td><img src='images/1479430915_delete.png' onclick='DeleteBrand(" + i.Id + ")' style='width:30px'/></td></tr></tbody>");
                });
            }
            else {
                $("#brandtable").append("<tr><td>No record found.</td></tr>");
            }
        }
        function EditBrand(e) {
            var ids = (e.id).split('_');
            var brandid = ids[1];
            var xmlRequest = [];
            xmlRequest.push($.ajax(
                  {
                      type: "POST",
                      url: GlobalPath + "Brands.asmx/GetById",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      data: JSON.stringify({ id: brandid }),
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
            // debugger;
            // alert(data.d.Name);
            if (data.d.Name != null) {
                $("#Name").val(data.d.Name);
                $("#Id").val(data.d.Id);
                $('#BrandModal').modal('show');
            }
        }
        $("#save").click(function () {
            var name = $("#Name").val();
            var id = $("#Id").val();
            var xmlRequest = [];
            xmlRequest.push($.ajax(
                 {
                     type: "POST",
                     url: GlobalPath + "Brands.asmx/Edit",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: JSON.stringify({ Name: name, Id: id }),
                     async: true,
                     cache: false,
                     success: onsuccessSave,
                     error: function (xhr, ajaxOptions, thrownError) {
                         //alert(xhr.responseText + "error");
                         //alert(thrownError);
                     }
                 }));
        })
        function onsuccessSave(data) {
            $('#BrandModal').modal('hide');
            GetAllBrands();
        }
        function DeleteBrand(e) {
            var brandid = e;
            var xmlRequest = [];
            if (confirm("Are You sure Delete Category!") == true) {
                xmlRequest.push($.ajax(
                    {
                        type: "POST",
                        url: GlobalPath + "Brands.asmx/Delete",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Id: brandid }),
                        async: true,
                        cache: false,
                        success: onsuccessDelete,
                        error: function (xhr, ajaxOptions, thrownError) {
                            //alert(xhr.responseText + "error");
                            //alert(thrownError);
                        }
                    }));
            }
        }
        function onsuccessDelete(data) {
            $('#BrandModal').modal('hide');
            GetAllBrands();
        }
    </script>
</asp:Content>

