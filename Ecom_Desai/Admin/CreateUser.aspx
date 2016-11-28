<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#loder").hide();
        })
        function SetPermition() {
            debugger;
            $("#loder").show();
            var GlobalPath = "<%= Application["path"] %>";
            var name=$('#txtusername').val();
            var Password=$('#txtpwd').val();
            var createdby = $('#permition :selected').val();
            if(name!="" && Password!="" && createdby!="")
            {
                var setUser = {
                    username: name,
                    password: Password,
                    CreatedBy: createdby
                }
                var xmlRequest = [];
                xmlRequest.push($.ajax(
                      {
                          type: "POST",
                          url: GlobalPath + "SetUser.asmx/SetUserPermition",
                          contentType: "application/json; charset=utf-8",
                          data: JSON.stringify(
                          {
                              Users: setUser
                          }
                          ),
                          dataType: "json",
                          async: true,
                          cache: false,
                          success: OnSuccessCreateUser,
                          error: function (xhr, ajaxOptions, thrownError) {
                              //alert(xhr.responseText + "error");
                              //alert(thrownError);
                          }
                      }));
            
            }
            else {
                if (name == "") {

                }
                if (Password == "") {
                }
                if (createdby == "") {

                }
            }

            
        }
        function OnSuccessCreateUser(data) {
            $("#loder").hide();
            $("#lblmsg").append("User is created successfully");
            setTimeout(function () { document.getElementById("lblmsg").innerText = ""; }, 5000);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="basic-form" class="section">
        <div class="row" style="margin-left: 18%">
            <div class="col s12 m12 l6">
                <div class="card-panel">
                    <h4 class="header2">Create User</h4>
                    <div class="row">
                        <div class="col s12">
                            <div class="row">
                                <div class="input-field col s7">
                                    <label style="color: #000; font-size: 14px;">UserName </label>
                                    <input placeholder="User Name" id="txtusername" type="text" style="margin-top: 2px;" />
                                    <span id="lblcatname" style="color: red"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s7">
                                    <label style="color: #000; font-size: 14px;">Password</label>
                                    <input id="txtpwd" type="password" class="input-field" style="margin-top: 2px!important;" />
                                    <span id="filevalidation" style="color: red"></span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s7">
                                    <span style="color: #000!important">Select Permition</span>
                                    <select id="permition" style="margin-top: 2px;">
                                        <option value="0">Super Admin</option>
                                        <option value="1">Edit Permition</option>
                                        <option value="2">Delete Permition</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">

                                <div class="row">
                                    <div class="input-field col s12">
                                        <a href="javascript:void(0);" class="btn cyan " onclick="SetPermition()">Submit
                               
                                            <i class="mdi-content-send right"></i>
                                        </a>

                                    </div>
                                </div>
                                <div id="loder">
                              <img src="images/loader2.gif" />
                          </div>
                            </div>
                            <div class="row" style="padding-top: 2%">
                                <span id="lblmsg" style="color: green; margin-left: 4%;"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Form with placeholder -->

        </div>
    </div>
</asp:Content>

