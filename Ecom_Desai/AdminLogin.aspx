<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Login  | Xqfotos</title>

    <!-- Favicons-->
    <link rel="icon" href="Admin/images/favicon/favicon-32x32.png" sizes="32x32">
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="Admin/images/favicon/apple-touch-icon-152x152.png">
    <link href="Admin/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="Admin/css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <!-- Custome CSS-->
    <link href="Admin/css/custom/custom-style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="Admin/css/layouts/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="Admin/js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="Admin/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
    <script type="text/javascript">
        function Login() {
            var GlobalPath = "<%= Application["path"] %>";
            var xmlRequest = [];
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if (username != "" && password != "") {
                xmlRequest.push($.ajax(
     {
         type: "POST",
         url: GlobalPath + "AdminLogin.aspx/CheckLogin",
         contentType: "application/json; charset=utf-8",
         data: JSON.stringify(
         {
             UserName: username, Password: password
         }
         ),
         dataType: "json",
         async: true,
         cache: false,
         success: OnSuccess,
         error: function (xhr, ajaxOptions, thrownError) {
             //alert(xhr.responseText + "error");
             //alert(thrownError);
         }
     }
     ));
            }
            else {
                $("#uname").text("");
                $("#pwd").text("");
                $("#uname").append("*");
                $("#pwd").append("*");
            }
        }
        function OnSuccess(data) {
            var result = data.d[0];
            if (result == "1") {
                window.location.href = "Admin/DisplayCategory.aspx"
            }
            else {
                $("#msg").text("");
                $("#msg").append("Invalid UserName And Password");
            }
        }
    </script>
</head>
<body class="cyan">
    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <form id="form1" runat="server">

        <div id="login-page" class="row">
            <div class="col s12 z-depth-4 card-panel">
                <div class="login-form">
                    <div class="row">
                        <div class="input-field col s12 center">
                            <img src="Admin/images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login" />
                            <p class="center login-form-text">Desai</p>
                        </div>
                    </div>
                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-social-person-outline prefix"></i>
                            <input id="username" type="text">
                            <label for="username" class="center-align">Username</label><span style="color: red" id="uname"></span>
                        </div>
                    </div>
                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input id="password" type="password" /><span style="color: red" id="pwd"></span>
                            <label for="password">Password</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <a href="javascript:void(0)" class="btn waves-effect waves-light col s12" onclick="Login()">Login</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col 12">
                            <span id="msg" style="color: red;"></span>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="Admin/js/plugins/jquery-1.11.2.min.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="Admin/js/materialize.min.js"></script>
    <!--prism-->
    <script type="text/javascript" src="Admin/js/plugins/prism/prism.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="Admin/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="Admin/js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="Admin/js/custom-script.js"></script>
</body>
</html>
