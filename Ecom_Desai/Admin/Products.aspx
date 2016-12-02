<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Admin_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .modal {
            max-height: 280px !important;
        }

        input[type=text], input[type=password], input[type=email], input[type=url], input[type=time], input[type=date], input[type=datetime-local], input[type=tel], input[type=number], input[type=search], textarea.materialize-textarea {
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #9e9e9e;
            border-radius: 0;
            outline: none;
            height: 3rem;
            width: 100%;
            font-size: 1em !important;
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
            padding: 29px 6px !important;
            /* height: 52px; */
            width: 100%;
        }

        body {
            overflow: hidden !important;
        }

        #addnew {
            background-color: none !important;
            border-color: #46b8da !important;
            border-radius: 8%;
            margin-top: 2%;
        }

            #addnew:hover {
                background-color: #46b8da !important;
                border-radius: 8%;
                border-color: #46b8da !important;
                color: #fff;
            }

        th, td {
            border-bottom: 1px solid #ddd;
        }

        th {
            font-weight: 600;
        }

        td {
            padding: 8px 8px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="col-md-12">
        <button type="button" class="btn btn-default" style="float:right" id="addnew">Add New (+)</button>
        <table id="producttable" style="margin-left: 130px; margin-top: 80px;width:70%!important" class="w3-table w3-striped"">
        </table>
    </div>
     <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="productmodalbutton" style="visibility: hidden" data-target="#myModal">Open Modal</button>
    <div class="modal fade" id="ProductModal" role="dialog">
        <!-- Modal content-->
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Product</h4>
        </div>
        <div class="modal-body">
            <div class="row margin">
                <input type="hidden" id="Id" />
                <input type="text" class="input-field col s12" id="Name" />
                 <span id="namevalidation" style="color:red"></span>
            </div>
            <br />
            <div class="row margin">
                <select class="input-field col s12" id="branddropdown"></select>
                 <span id="ddlbrand" style="color:red"></span>
            </div>
            <br />
            <div class="row margin">
                <input id="File1" type="file" class="attach-file"/>
                <span id="filevalidation" style="color:red"></span>
            </div>
            <input type="button" value="Save" id="save" class="btn btn-default" />
        </div>
    </div>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        var GlobalPath = "<%= Application["path"] %>";
        $(document).ready(function () {
            $("#producttable").empty();
            GetAllProducts();
        });
        function GetAllProducts() {
            var xmlRequest = [];
            xmlRequest.push($.ajax(
                  {
                      type: "POST",
                      url: GlobalPath + "Product.asmx/GetAllProducts",
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
            $("#producttable").empty();
            if (data.d.length > 0) {
                $("#producttable").append("<thead><tr><th>Name</th><th>Edit</th><th>Delete</th></tr></thead>");
                (data.d).forEach(function (i) {
                    $("#producttable").append("<tbody><tr><td>" + i.Name + "</td><td><img src='images/edit_Icon.png' id='brand_" + i.Id + "' onclick='EditBrand(this)' style='width:25px;'/></td><td><img src='images/1479430915_delete.png' onclick='DeleteBrand(" + i.Id + ")' style='width:25px'/></td></tr></tbody>");
                });
            }
            else {
                $("#producttable").append("<tr><td>No record found.</td></tr>");
            }
        }
        function DeleteProduct(e) {
            var productid = e;
            var xmlRequest = [];
            if (confirm("Are You sure Delete Category!") == true) {
                xmlRequest.push($.ajax(
                    {
                        type: "POST",
                        url: GlobalPath + "Product.asmx/Delete",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Id: productid }),
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
            $('#ProductModal').modal('hide');
            GetAllProducts();
        }
        $("#addnew").click(function () {
            $("#Name").val('');
            $("#Id").val(0);
            $('#ProductModal').modal('show');
        })
    </script>
</asp:Content>

