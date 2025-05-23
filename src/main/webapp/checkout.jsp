<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products" %>
<%@ page import="java.util.Map" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	if (cart == null) {
		cart = new ShoppingCart();
		session.setAttribute("cart", cart);
	}
	ProductDAO dao = new ProductDAO();
	Map<Integer, Integer> items = cart.getCart();

	Map<Products, Integer> cartMap = new HashMap<>();
	for (Map.Entry<Integer, Integer> entry : items.entrySet()) {
		int productId = entry.getKey();
		int quantity = entry.getValue();
		Products product = dao.findById(String.valueOf(productId));
		if (product != null) {
			String imageUrl = dao.getFirstImage(productId);
			product.getListimg().add(imageUrl);
			cartMap.put(product, quantity);
		}
	}
	request.setAttribute("cartMap", cartMap);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
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
	<!-- Reuse header, menu, footer here -->
	<%@ include file="header2.jsp"%>
	<!-- content -->
	<div class="account-in">
		<div class="container">
			<div class="check_box">
				<div class="col-md-9 cart-items">
					<h1>My Shopping Bag (${cart.getSize()})</h1>
					<script>
						$(document).ready(function(c) {
							$('.close1').on('click', function(c) {
								$('.cart-header').fadeOut('slow', function(c) {
									$('.cart-header').remove();
								});
							});
						});
					</script>
					<c:forEach var="entry" items="${cartMap}">
						<c:set var="product" value="${entry.key}" />
						<c:set var="quantity" value="${entry.value}" />
						<c:set var="total" value="${product.priceSell * quantity}" />

						<div class="cart-header">
							<a class="close1" href="DeleteFromCart?productId=${product.productId}"></a>
							<div class="cart-sec simpleCart_shelfItem">
								<div class="cart-item cyc">
									<img src="${product.firstImage}" class="img-responsive" alt="" />
								</div>
								<div class="cart-item-info">
									<h3>
										<a href="#">${product.productName}</a><span>Model No:${product.productId}</span>
									</h3>
									<ul class="qty">
										<li><p>Size : 5</p></li>
										<li><p>Qty : ${quantity}</p></li>
									</ul>
									<div class="delivery">
										<c:choose>
											<c:when test="${tygia == null}">
												<p>Service Charges :${total} ${currency}</p>
											</c:when>
											<c:otherwise>
												<p>Service Charges :${total} ${currency}</p>
											</c:otherwise>
										</c:choose>
										<span>Delivered in 2-3 business days</span>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>

					</c:forEach>
				</div>
				<div class="col-md-3 cart-total">
					<a class="continue" href="men.jsp">Continue to basket</a>
					<div class="price-details">
						<h3>Price Details</h3>
						<span>Total</span> <span class="total1"> <c:choose>
								<c:when test="${tygia == null}">
									${total} ${currency}
											</c:when>
								<c:otherwise>
									${total} * ${tygia} ${currency}
											</c:otherwise>
							</c:choose>
						</span> <span>Discount</span>
						<div class="clearfix"></div>
					</div>
					<ul class="total_price">
						<li class="last_price">
							<h4>TOTAL</h4>
						</li>
						<li class="last_price"><span>

							<c:choose>
									<c:when test="${tygia == null}">
										${cart.getPrice()} ${currency}
											</c:when>
									<c:otherwise>
										${cart.getPrice() * tygia} ${currency}
											</c:otherwise>
								</c:choose></span></li>
						<div class="clearfix"></div>
					</ul>
					<div class="clearfix"></div>
					<a class="order" href="OrderServlet">Place Order</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978">
		</iframe>
	</div>
	<!--end content-->
	<%@ include file="footer.jsp"%>

</body>
</html>