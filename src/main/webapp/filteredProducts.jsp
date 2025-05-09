<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
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
	<ul>
		<c:forEach var="products" items="${filter}">
			<li class="simpleCart_shelfItem"><a class="cbp-vm-image"
				href="${pageContext.request.contextPath}/ProductServlet?productid=${products.id}">
					<div class="view view-first">
						<div class="inner_content clearfix">
							<div class="product_image">
								<div class="mask1">
									<img src="images/${products.getFirstImage()}" alt="image"
										class="img-responsive zoom-img">
								</div>
								<div class="mask">
									<div class="info">Quick View</div>
								</div>
								<div class="product_container">
									<h4>${products.name}</h4>
									<div class="price mount item_price">
										<c:choose>
											<c:when test="${tygia == null}">
												${products.cost} ${currency}
											</c:when>
											<c:otherwise>
												${products.cost * tygia} ${currency}
											</c:otherwise>
										</c:choose>
									</div>
									<a class="button item_add cbp-vm-icon cbp-vm-add"
										href="${pageContext.request.contextPath}/AddToCart?productid=${products.id}">Add
										to cart</a>
								</div>
							</div>
						</div>
					</div>
			</a></li>
		</c:forEach>
	</ul>

</body>
</html>