<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="Admin_Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        $(document).ready(function () {
            debugger;
            GetAllBrands();
        });
        function GetAllBrands() {
            var GlobalPath = "<%= Application["path"] %>";
            var xmlRequest = [];
            xmlRequest.push($.ajax(
                  {
                      type: "POST",
                      url: GlobalPath + "Brands.asmx/GetAllBrands",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: true,
                      cache: false,
                      success: onsuccesscountry,
                      error: function (xhr, ajaxOptions, thrownError) {
                          //alert(xhr.responseText + "error");
                          //alert(thrownError);
                      }
                  }));


        }
        function onsuccesscountry(data) {
            debugger;
            alert("success");
        }
</script>
</asp:Content>

