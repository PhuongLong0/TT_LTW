<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="men_banner">
		<div class="container">
			<div class="header_top">
				<div class="header_top_left">
					<div class="box_11">
						<a href="checkout.jsp">
							<h4>
								<p>Cart:<c:choose>
											<c:when test="${tygia == null}">
												${cart.getPrice()} ${currency}
											</c:when>
											<c:otherwise>
												${cart.getPrice() * tygia} ${currency}
											</c:otherwise>
										</c:choose> (${cart.getSize()} items)</p>
								<img src="images/bag.png" alt="" />
								<div class="clearfix"></div>
							</h4>
						</a>
					</div>
					<p class="empty">
						<a href="javascript:;" class="simpleCart_empty">Empty Cart</a>
					</p>
					<div class="clearfix"></div>
				</div>
				<div class="header_top_right">
					<form id="currencyForm" action="updateCurrency" method="post">
						<div class="lang_list">
							<select name="currency" tabindex="4" class="dropdown"
								onchange="this.form.submit()">
								<option value="" class="label">Currency</option>
								<option value="USD">Dollar (USD)</option>
								<option value="EUR">Euro (EUR)</option>
								<option value="VND">Vietnam Dong (VND)</option>
							</select>
						</div>
					</form>
					<ul class="header_user_info">
						<a class="login" href="login.jsp"> <i class="user"> </i>
							<li class="user_desc"><c:choose>
									<c:when test="${not empty sessionScope.user}">
									${sessionScope.user.userName}

								</c:when>
									<c:otherwise>
									My account
								</c:otherwise>
								</c:choose></li>
						</a>
						<c:choose>
							<c:when test="${not empty sessionScope.user}">
								<a class="user_desc" href="LogoutServlet"
									style="text-decoration: underline; font-size: smaller;">Logout</a>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
						<div class="clearfix"></div>
					</ul>
					<!-- start search-->
					<div class="search-box">
						<div id="sb-search" class="sb-search">
							<form action="SearchServlet?index=1" method="post">
								<!-- Input field for the search term -->
								<input class="sb-search-input"
									placeholder="Enter your search term..." type="search"
									name="query" id="search" required>

								<!-- Hidden submit button to allow form submission -->
								<input class="sb-search-submit" type="submit" value="">

								<!-- Search Icon -->
								<span class="sb-icon-search"> </span>
							</form>
						</div>
					</div>
					<!----search-scripts---->
					<script src="js/classie1.js"></script>
					<script src="js/uisearch.js"></script>
					<script>
						new UISearch(document.getElementById('sb-search'));
					</script>
					<!----//search-scripts---->
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="header_bottom">
				<div class="logo">
					<h1>
						<a href="index.jsp"><span class="m_1">W</span>atches</a>
					</h1>
				</div>
				<div class="menu">
					<ul class="megamenu skyblue">
						<li><a class="color2" href="index.jsp">Home</a></li>
						<li><a class="color10" href="brands.jsp">Brands</a></li>
						<li><a class="color3" href="${pageContext.request.contextPath}/index">Sale</a></li>
						<li><a class="color7" href="${pageContext.request.contextPath}/newProduct">News</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>