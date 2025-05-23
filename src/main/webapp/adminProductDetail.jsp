<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML>
<html>
<head>
<title>Watches an E-Commerce online Shopping Category Flat
	Bootstrap Responsive Website Template| Single :: w3layouts</title>
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
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>
<script src="js/simpleCart.min.js">
	
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="men">
		<div class="container">
			<div class="col-md-9 single_top">
				<div class="single_left">
					<div class="labout span_1_of_a1">
						<div class="flexslider">
							<ul class="slides">
								<c:if test="${not empty products.getListimg()}">
									<c:forEach var="img" items="${products.getListimg()}">
										<li data-thumb="images/${img}"><img src="images/${img}" /></li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="cont1 span_2_of_a1 simpleCart_shelfItem">
						<h1>${products.name}</h1>
						<p class="availability">
							Availability: <span class="color">In stock</span>
						</p>
						<div class="price_single">
							<span class="reducedfrom"></span> <span
								class="amount item_price actual">$ ${products.cost}</span>
						</div>
						<h2 class="quick">Quick Overview:</h2>
						<p class="quick_desc">${products.detail}</p>
						<div class="wish-list">
							<ul>
								<li class="wish"><a href="#">Add to Wishlist</a></li>
								<li class="compare"><a href="#">Add to Compare</a></li>
							</ul>
						</div>
						<ul class="size">
							<h3>Length</h3>
							<li><a href="#">32</a></li>
							<li><a href="#">34</a></li>
						</ul>
						<div class="quantity_box">
							<ul class="products-qty">
								<span>Quantity:</span>
								<select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
								</select>
							</ul>
							<ul class="single_social">
								<li><a href="#"><i class="fb1"> </i> </a></li>
								<li><a href="#"><i class="tw1"> </i> </a></li>
								<li><a href="#"><i class="g1"> </i> </a></li>
								<li><a href="#"><i class="linked"> </i> </a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<a  href="${pageContext.request.contextPath}/AdminDelete?productid=${products.id}"
							class="btn btn-primary btn-normal btn-inline btn_form button item_add item_1"
							target="_self">Delete</a>
							<a href="${pageContext.request.contextPath}/AdminEdit?productid=${products.id}&action=edit"
							class="btn btn-primary btn-normal btn-inline btn_form button item_add item_1"
							target="_self">Edit</a>
					</div>
					<div class="clearfix"></div>
				</div>
				
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css"
		media="screen" />
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
</body>
</html>
