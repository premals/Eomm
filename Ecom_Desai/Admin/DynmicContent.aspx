<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="DynmicContent.aspx.cs" Inherits="Admin_DynmicContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#loder").hide();
        })
        function UpdateContent() {
            $("#loder").show();
            var GlobalPath = "<%= Application["path"] %>";
            var cont = CKEDITOR.instances.ck.getData();
            var id = $('#ddlselect :selected').val();
            if (id == "0") {
                $("#selectpage").text("")
                $("#selectpage").append("Please Select Page")
            }
            else {
                $("#selectpage").append("");
            }
            if (cont == "") {
                $("#contd").text("")
                $("#contd").append("Please insert Content")
            }
            else {
                $("#contd").text("")
            }
            if (id != "0" && cont != "") {
                var xmlRequest = [];
                xmlRequest.push($.ajax(
                      {
                          type: "POST",
                          url: GlobalPath + "ContentUpdate.asmx/InsertContent",
                          contentType: "application/json; charset=utf-8",
                          data: JSON.stringify(
                          {
                              Content: cont, Id: id
                          }
                          ),
                          dataType: "json",
                          async: true,
                          cache: false,
                          success: OnSuccess1,
                          error: function (xhr, ajaxOptions, thrownError) {
                              //alert(xhr.responseText + "error");
                              //alert(thrownError);
                          }
                      }));
            }

        }
        function OnSuccess1(data) {
            debugger;
            var result = data.d[0];
            if (result != "") {
                $("#loder").hide();
                $("#lblmsg").append("Content is Updated Successfully");
                setTimeout(function () { document.getElementById("lblmsg").innerText = ""; }, 5000);
               
                document.getElementById("ck").value = "";
            }
        }
       
    </script>
      <script type="text/javascript">
        function validate() {
            categoryId = $("#ddlselect").val();
            if (categoryId == "0") {
                $("#selectpage").text("");
                $("#selectpage").append("please Select Category")
            }
            else {
                $("#selectpage").text("");
            }
        }
      
        function validate1() {
        CKEDITOR.instances.on('change', function () { alert('value changed!!') });
        }
    </script>
    <script src="//cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="basic-form" class="section">
              <div class="row" style="margin-left:18%">
                <div class="col s12 m12 l6">
                   <div class="card-panel">
                    <h4 class="header2">Update Your Content</h4>
                    <div class="row">
                      <div class="col s12">
                          <div class="row">
                              <div class="input-field col s12">
                                  <select id="ddlselect" class="select-dropdown" style="color:#000!important" onchange="validate()">
                                      <option value="0" style="color:#000!important">--Select--</option>
                                      <option value="1" style="color:#000!important">About Us</option>
                                      <option value="2" style="color:#000!important">FAQ</option>
                                     
                                  </select>
                                  <span id="selectpage" style="color:red;"></span>
                              </div>
                          </div>
                        <div class="row">
                          <div class="input-field col s12">
                                        <lable>Content: </lable>
                         <textarea name="editor1" id="ck"  onchange="validate1();"></textarea>
                              <span id="contd" style="color:red"></span>
        <script>
            CKEDITOR.replace('editor1');
        </script>
	
      <%--  <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>
                    --%>
                           
                          </div>
                        </div>
                        
                        
                        <div class="row">
                          
                          <div class="row">
                            <div class="input-field col s12">
                              <a href="javascript:void(0);" class="btn cyan "   onclick="UpdateContent()">Submit
                                <i class="mdi-content-send right"></i>
                              </a>

                            </div>
                           
                          </div>
                        </div>
                          <div id="loder">
                              <img src="images/loader2.gif" />
                          </div>
                          <div class="row" style=";margin-top:2%">
                                 <span id="lblmsg" style="color:green;margin-left:4%"></span>
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Form with placeholder -->
                
              </div>
            </div>
</asp:Content>

