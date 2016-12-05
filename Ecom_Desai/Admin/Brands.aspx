<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="Admin_Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <button type="button" class="btn btn-default" style="float:right" id="addnew">Add New (+)</button>
        <table id="brandtable" style="margin-left: 130px; margin-top: 80px;width:70%!important" class="w3-table w3-striped"">
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
                 <span id="namevalidation" style="color:red"></span>
            </div>
            <br />
            <div class="row margin">
                <input id="File1" type="file" class="attach-file"/>
                <span id="filevalidation" style="color:red"></span>
            </div>
            <input type="button" value="Save" id="save" class="btn btn-default" style="margin-top:18px!important" />
        </div>
       <%-- <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>--%>
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
                $("#brandtable").append("<thead><tr><th>Name</th><th>Edit</th><th>Delete</th></tr></thead>");
                (data.d).forEach(function (i) {
                    $("#brandtable").append("<tbody><tr><td>" + i.Name + "</td><td><img src='images/edit_Icon.png' id='brand_" + i.Id + "' onclick='EditBrand(this)' style='width:25px;'/></td><td><img src='images/1479430915_delete.png' onclick='DeleteBrand(" + i.Id + ")' style='width:25px'/></td></tr></tbody>");
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

            if (data.d.Name != null) {
                $("#Name").val(data.d.Name);
                $("#Id").val(data.d.Id);
                $('#BrandModal').modal('show');
            }
        }
        $("#save").click(function () {
            debugger;
            var name = $("#Name").val();
            var id = $("#Id").val();
            <%--if (id != "0")
            {
                $('input[type=file]')[0].files[0] = <%= Session["Image"].ToString()%>;
            }--%>
            if (name == "" || name == undefined) {

                $("#namevalidation").text('Please Enter Name');
                return false;
            }
            else {
                $("#namevalidation").text('');
            }
            if (id == "0") {

                if ($('input[type=file]')[0].files[0] == undefined) {
                    $("#filevalidation").append('Please Select File.');
                    return false;
                }
                else {
                    $("#filevalidation").text('');
                }
            }

            if (name != "") {//&& $('input[type=file]')[0].files[0] != undefined && id != "0"
                var imgname = null;
                if ($('input[type=file]')[0].files[0] != undefined) {
                    imgname = $('input[type=file]')[0].files[0].name;
                    var ext = $('#File1').val().split('.').pop().toLowerCase();
                    if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                        $("#filevalidation").append('invalid extension!');
                        return false;
                    }
                }
                $("#namevalidation").text('');
                $("#filevalidation").text('');
                var xmlRequest = [];
                if (id != "0") {
                    xmlRequest.push($.ajax(
                         {
                             type: "POST",
                             url: GlobalPath + "Brands.asmx/Edit",
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             data: JSON.stringify({ Name: name, Id: id, Image: imgname }),
                             async: true,
                             cache: false,
                             success: onsuccessSave,
                             error: function (xhr, ajaxOptions, thrownError) {
                                 //alert(xhr.responseText + "error");
                                 //alert(thrownError);
                             }
                         }));
                }
                else {
                    xmlRequest.push($.ajax(
                        {
                            type: "POST",
                            url: GlobalPath + "Brands.asmx/Add",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ Name: name, Image: imgname }),
                            async: true,
                            cache: false,
                            success: onsuccessSave,
                            error: function (xhr, ajaxOptions, thrownError) {
                                //alert(xhr.responseText + "error");
                                //alert(thrownError);
                            }
                        }));
                }
            }
        })
        function onsuccessSave(data) {
            debugger;
            $('#BrandModal').modal('hide');
            upload_Brand(data.d);
            GetAllBrands();
        }

        function upload_Brand(result) {
            debugger;
            var fileUpload = $("#File1").get(0);
            var files = fileUpload.files;
            var test = new FormData();
            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name , files[i]);
            }

            var url = "BrandImage.ashx?datTxt="+result
           
            $.ajax({
                url: GlobalPath + url,
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                success: function (result) {
                    alert(result);
                    $("#File1").val("");
                },
                error: function (err) {
                    alert(err.statusText);
                }
            });
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
        $("#addnew").click(function () {
            $("#Name").val('');
            $("#Id").val(0);
            $('#BrandModal').modal('show');
        })
    </script>
</asp:Content>

