<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact</title>
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
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="men">
		<div class="container">
			<div class="grid_1">
				<h1>Contact Info</h1>
				<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
					velit esse molestie consequat, vel illum dolore eu feugiat nulla
					facilisis at vero eros et accumsan et iusto odio dignissim qui
					blandit praesent luptatum zzril delenit augue duis dolore te
					feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend
					option congue nihil imperdiet doming id quod mazim placerat facer
					possim assum</p>
			</div>
			<div class="grid_4">
				<div class="grid_2 preffix_1">
					<ul class="iphone">
						<i class="phone"> </i>
						<li class="phone_desc">Phone : +1 800 245 2365</li>
						<div class="clearfix"></div>
					</ul>
					<ul class="iphone">
						<i class="flag"> </i>
						<li class="phone_desc">Website : <a
							href="mailto:mail@demolink.org">www.demolink.com</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="grid_3">
					<ul class="iphone">
						<i class="msg"> </i>
						<li class="phone_desc">Email : <a
							href="mailto:mail@demolink.org">mail(at)watches.com</a>
						</li>
						<div class="clearfix"></div>
					</ul>
					<ul class="iphone">
						<i class="home"> </i>
						<li class="phone_desc">Address : vel illum dolore eu feugiat
							nulla</li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="contact_form">
				<h2>Feedback</h2>
				<form>
					<div class="col-md-6 to">
						<input type="text" class="text" value="Name"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Name';}"> <input
							type="text" class="text" value="Email" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Email';}"> <input
							type="text" class="text" value="Subject"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Subject';}">
					</div>
					<div class="col-md-6 text">
						<textarea value="Message" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
					</div>
					<div class="clearfix"></div>
					<div class="but__center">
						<input type="submit" value="Send message &gt;&gt;">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>