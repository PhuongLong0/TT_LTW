<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Watches an E-Commerce online Shopping Category Flat
	Bootstrap Responsive Website Template| Login :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Dorsa' rel='stylesheet'
	type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<script src="js/jquery.easydropdown.js"></script>
<script src="js/simpleCart.min.js">
	
</script>
</script>

</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="account-in">
		<div class="container">
			<form action="${pageContext.request.contextPath}/RegisterServlet"
				method="post" >

				<div class="register-top-grid">
					<h2>PERSONAL INFORMATION</h2>
					<div>
						<span>First Name<label>*</label></span>
						<input type="text" name="firstname" value="${param.firstname}">
							<p style="color: #dc3545;">${nameError}</p>  
					</div>
					<div>
						<span>Last Name<label>*</label></span>
						<input type="text" name="lastname" value="${param.lastname}">
							<p style="color: #dc3545;">${lastnameError}</p>  
					</div>

					<div>
						<span>User Name<label>*</label></span>
						<input type="text" name="username" value="${param.username}">
						<p style="color: #dc3545;">${usernameError}</p>
					</div>
					<div>
						<span>Email Address<label>*</label></span>
						<input type="email" name="email" value="${param.email}">
							<p style="color: #dc3545;">${emailError}</p>  
					</div>
					<div class="clearfix"></div>
					<a class="news-letter" href="#"> <label class="checkbox"><input
							type="checkbox" name="checkbox" checked=""><i> </i>Sign
							Up for Newsletter</label>
					</a>
				</div>
				<div class="register-bottom-grid">
					<h2>LOGIN INFORMATION</h2>
					<div>
						<span>Password<label>*</label></span>
						<input type="password" name="passwordUser" value="${param.passwordUser}">
							<p style="color: #dc3545;">${passError}</p>  
					</div>
					<div>
						<span>Confirm Password<label>*</label></span>
						<input type="password" name="confirmPassword" value="${param.confirmPassword}">
							<p style="color: #dc3545;">${passError}</p>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="clearfix"></div>
				<div class="register-but">
					<input type="submit" value="submit">
				</div>
			</form>
		</div>
	</div>
	<div class="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978">
		</iframe>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>