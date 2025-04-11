<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Watches an E-Commerce online Shopping Category Flat Bootstrap Responsive Website Template| Login :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <!--webfont-->
    <link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Dorsa' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/simpleCart.min.js"> </script>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>

<div class="account-in">
    <div class="container">
        <h3>FORGET PASSWORD</h3>
        <div class="col-md-7 account-top">

            <!-- Step 1: Nhập Email + Captcha -->
            <c:if test="${empty step or step == 1}">
                <form method="post" action="ForgetPasswordServlet">
                    <input type="hidden" name="action" value="verifyEmailCaptcha">
                    <div>
                        <label>Email*</label>
                        <input type="text" name="email" required>
                    </div>
                    <div>
                        <label>Captcha*</label>
                        <input type="text" name="captcha" required>
                        <img src="CaptchaServlet" alt="Captcha">
                    </div>
                    <input type="submit" value="Xác nhận">
                    <a href="login.jsp" class="create">Back to Login</a>
                </form>
            </c:if>
            <!-- Step 2: Nhập OTP -->
            <c:if test="${step == 2}">
                <form method="post" action="ForgetPasswordServlet">
                    <input type="hidden" name="action" value="verifyOtp">
                    <div>
                        <label>OTP đã gửi về email:</label>
                        <input type="text" name="otp" required>
                    </div>
                    <button type="submit">Xác minh OTP</button>
                </form>
            </c:if>

            <!-- Step 3: Đặt lại mật khẩu -->
            <c:if test="${step == 3}">
                <form method="post" action="ForgetPasswordServlet">
                    <input type="hidden" name="action" value="resetPassword">
                    <div>
                        <label>Mật khẩu mới:</label>
                        <input type="password" name="password1" required>
                    </div>
                    <div>
                        <label>Nhập lại mật khẩu:</label>
                        <input type="password" name="password2" required>
                    </div>
                    <button type="submit">Đặt lại mật khẩu</button>
                </form>
            </c:if>
            <!-- form dang nhap jsp  -->
           <!-- <form action="${pageContext.request.contextPath}/forgetPasswordServlet" method="post">

               <div>
                    <span>Email*</span>
                    <input type="text" name = "email" placeholder="Enter your email" required>
                </div>

                <input type="text" name="captcha" placeholder="Enter captcha" required>
                <img src="CaptchaServlet" alt="Captcha Image">
                <div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>

                <input type="submit" value="Send OTP">
                <a href="login.jsp" class="create">Back to Login</a>
            </form>-->
            <p style="color: #dc3545;">${errorMessage}</p>
            <p style="color: green">${successMessage}</p>


        </div>
        <div class="col-md-5 left-account ">
            <a href="single.html"><img class="img-responsive " src="images/watch_forgetPassword.jpg" alt=""/></a>
            <div class="five-in">
                <h1>15% </h1><span>discount</span>
            </div>

            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<div class="map">
    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>