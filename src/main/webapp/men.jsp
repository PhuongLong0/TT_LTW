<%@ page import="hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products" %>
<%@ page import="java.util.List" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.IProductDAO" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Watches an E-Commerce online Shopping Category Flat
	Bootstrap Responsive Website Template| Men :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/component.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Dorsa' rel='stylesheet'
	type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>

<script src="js/jquery.easydropdown.js"></script>
<script src="js/simpleCart.min.js"></script>
</head>
<body>

	<jsp:include page="header2.jsp"></jsp:include>
	<div class="men">
		<div class="container">

			<c:forEach var="products" items="${listProducts}">
				<li class="simpleCart_shelfItem"><a class="cbp-vm-image"
					href="${pageContext.request.contextPath}/ProductServlet?productId=${products.productId}">
					<div class="view view-first">
						<div class="inner_content clearfix">
							<div class="product_image">
								<div class="mask1">
									<img src="${products.getFirstImage()}" alt="Product Image" class="img-responsive zoom-img">
								</div>
								<div class="mask">
									<div class="info">Quick View</div>
								</div>
								<div class="product_container">
									<h4>${products.productName}</h4>
									<h4>${message}</h4>
									<p>Dresses</p>
									<div class="price mount item_price">
										<c:choose>
											<c:when test="${tygia == null}">
												${products.priceSell} ${currency}
											</c:when>
											<c:otherwise>
												${products.priceSell * tygia} ${currency}
											</c:otherwise>
										</c:choose>
									</div>
									<a class="button item_add cbp-vm-icon cbp-vm-add"
									   href="${pageContext.request.contextPath}/AddToCart?productid=${products.productId}">Add
										to cart</a>
								</div>
							</div>
						</div>
					</div>
				</a></li>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
