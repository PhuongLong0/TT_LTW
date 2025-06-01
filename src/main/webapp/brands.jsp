<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brands</title>
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
<script>
	$(document).ready(function(){$(".megamenu").megamenu();});
</script>
<script src="js/jquery.easydropdown.js"></script>
<script src="js/simpleCart.min.js"> </script>
	<style>

	</style>

</head>
<body>
<!-- Reuse header and menu here -->
<%@ include file="header2.jsp" %>
   <div class="men">
   	<div class="container">
      <div class="col-md-9 single_top">
      	 <h1 class="page-heading products-listing">
			Brands
		    <span class="heading-counter">There are 4 brands</span>
         </h1>
         <div class="products-count">Showing 1 - 4 of 4 items</div>
          <div class="brand_box">
	         <div class="left-side col-xs-12 col-sm-3">
				 <img src="images/brand-omega.png" alt="omega"/>
			 </div>
			  <!-- brand OMEGA-->
		     <div class="middle-side col-xs-12 col-sm-5">
				 <h4><a href="#">Omega</a></h4>
		     	<p>Renowned for precision and elegance, Omega has been a leader in Swiss watchmaking since 1848.
					From accompanying astronauts on the moon to timing Olympic events, Omega watches are a symbol of innovation and excellence.
				</p>
			 </div>
			  <c:set var="brand" value="OMEGA" />
			 <div class="right-side col-xs-12 col-sm-4">
				 <c:set var="brandCount" value="${brandProductCount['OMEGA']}" />
				 <p><a href="#">${brandCount} Product<c:if test="${brandCount > 1}">s</c:if></a></p>
			    <a href="brand?brand=${brand}" class="btn btn1 btn-primary btn-normal btn-inline " target="_self">View Products</a>
			 </div>
			 <div class="clearfix"> </div>
		  </div>
		  <div class="brand_box">
	         <div class="left-side col-xs-12 col-sm-3">
				 <img src="images/brand-longines.png" alt="longines"/>
			 </div>
			  <!-- brand LONGINES-->
			  <c:set var="brand" value="LONGINES" />
		     <div class="middle-side col-xs-12 col-sm-5">
				 <h4><a href="#">Longines</a></h4>
		     	<p>With a legacy of craftsmanship dating back to 1832, Longines is known for its sophisticated designs and impeccable accuracy.
					Favored by watch enthusiasts worldwide, Longines blends tradition with modern elegance in every timepiece.
				</p>
			 </div>
			 <div class="right-side col-xs-12 col-sm-4">
				 <c:set var="brandCount" value="${brandProductCount['LONGINES']}" />
				 <p><a href="#">${brandCount} Product<c:if test="${brandCount > 1}">s</c:if></a></p>

				 <a href="brand?brand=${brand}" class="btn btn1 btn-primary btn-normal btn-inline " target="_self">View Products</a>
			 </div>
			 <div class="clearfix"> </div>
		  </div>
		  <div class="brand_box">
	         <div class="left-side col-xs-12 col-sm-3">
				 <img src="images/brand-g-shock.png" alt="g-shock"/>
			 </div>
			  <!-- brand G-SHOCK-->
			  <c:set var="brand" value="G-SHOCK" />
		     <div class="middle-side col-xs-12 col-sm-5">
		     	<h4><a href="#">G-SHOCK</a></h4>
		     	<p>Designed for durability and toughness, G-SHOCK by Casio has revolutionized the watch industry with its shock-resistant technology.
					Perfect for adventurers and athletes, G-SHOCK watches are built to withstand extreme conditions while maintaining a stylish edge.
				</p>
			 </div>
			 <div class="right-side col-xs-12 col-sm-4">
				 <c:set var="brandCount" value="${brandProductCount['G-SHOCK']}" />
				 <p><a href="#">${brandCount} Product<c:if test="${brandCount > 1}">s</c:if></a></p>

			    <a href="brand?brand=${brand}" class="btn btn1 btn-primary btn-normal btn-inline " target="_self">View Products</a>
			 </div>
			 <div class="clearfix"> </div>
		  </div>
		  <div class="brand_box">
	         <div class="left-side col-xs-12 col-sm-3">
				 <img src="images/brand-garmin.png" alt="garmin"/>
			 </div>
			  <!-- brand GARMIN-->
			  <c:set var="brand" value="Garmin" />
		     <div class="middle-side col-xs-12 col-sm-5">
		     	<h4><a href="#">Garmin</a></h4>
		     	<p>A pioneer in smartwatch technology, Garmin combines advanced GPS functionality with health and fitness tracking.
					Ideal for sports enthusiasts and professionals, Garmin watches empower users with cutting-edge innovation and performance insights.
				</p>
			 </div>
			 <div class="right-side col-xs-12 col-sm-4">
				 <c:set var="brandCount" value="${brandProductCount['Garmin']}" />
				 <p><a href="#">${brandCount} Product<c:if test="${brandCount > 1}">s</c:if></a></p>

			    <a href="brand?brand=${brand}" class="btn btn1 btn-primary btn-normal btn-inline " target="_self">View Products</a>
			 </div>
			 <div class="clearfix"> </div>
		  </div>
		</div>
		<div class="col-md-3 tabs">
	      <h3 class="m_1"> </h3>
	      <ul class="products">
	      	<li class="product_img"><img src="images/poster-omega.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h4><a href="brand?brand=OMEGA">OMEGA</a></h4>
	      		<p class="single_price">- The first watch on the Moon.</p>
	      		<p class="single_price">- Leading the trend</p>
	      	    <a href="brand?brand=OMEGA" class="link-cart">View</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	      <ul class="products">
	      	<li class="product_img"><img src="images/poster-longines.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h4><a href="brand?brand=LONGINES">Longines</a></h4>
	      		<p class="single_price">- Classic by design, Swiss by heart.</p>
	      		<p class="single_price">- A timeless trendsetter</p>
	      	    <a href="brand?brand=LONGINES" class="link-cart">View</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
        </div>
     <div class="clearfix"> </div>
	</div>
   </div>
<%@ include file="footer.jsp" %>

</body>
</html>