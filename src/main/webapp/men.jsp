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
	<script type="application/x-javascript">






		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }






	</script>
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
	<script>
		$(document).ready(function() {
			$(".megamenu").megamenu();

			// Khi người dùng chọn thể loại từ danh sách
			$('a[href^="FilterServlet"]').click(function(e) {
				e.preventDefault(); // Ngừng hành động mặc định (chuyển hướng)
				var category = $(this).text(); // Lấy thể loại từ href
				var page = $(this).attr('href').split('page=')[1]; // Lấy trang

				// Gửi yêu cầu AJAX đến FilterServlet
				$.ajax({
					url : 'FilterServlet',
					type : 'GET',
					data : {
						category : category,
						page : page
					}, // Gửi dữ liệu thể loại và trang
					success : function(response) {
						// Thay thế nội dung trong phần sản phẩm với dữ liệu mới
						$('#cbp-vm').html(response);
					},
					error : function(xhr, status, error) {
						console.error('Có lỗi khi gửi yêu cầu: ', error);
					}
				});
			});
		});
	</script>
	<script src="js/jquery.easydropdown.js"></script>
	<script src="js/simpleCart.min.js"></script>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<div class="men">
	<div class="container">
		<div class="col-md-4 sidebar_men">
			<h3>Categories</h3>
			<ul class="product-categories color">
				<c:forEach var="categories" items="${categories}">
					<li class="cat-item cat-item-42">
						<a href="filter?category=${categories.categoryName}">${categories.categoryName}</a>
<%--						<span class="count">${category.num}</span></li>--%>
				</c:forEach>
			</ul>
		</div>
		<div class="col-md-8 mens_right">
			<div class="dreamcrub">
				<ul class="breadcrumbs">
					<li class="home"><a href="index.html" title="Go to Home Page">Home</a>&nbsp;<span>&gt;</span></li>
					<li class="home">&nbsp; Sale &nbsp;</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="mens-toolbar">
				<ul class="women_pagenation dc_paginationA dc_paginationA06">
					<li><a href="#" class="previous">Page : </a></li>
					<c:forEach var="i" begin="1" end="${totalPages}">
						<li><a href="FilterServlet?page=${i}">${i}</a></li>
					</c:forEach>

				</ul>
				<div class="clearfix"></div>
			</div>
			<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
				<div class="cbp-vm-options">
					<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected"
					   data-view="cbp-vm-view-grid" title="grid">Grid View</a> <a
						href="#" class="cbp-vm-icon cbp-vm-list"
						data-view="cbp-vm-view-list" title="list">List View</a>
				</div>
				<div class="clearfix"></div>

				<!-- content load từ database -->
				<ul>
					<c:if test="${empty filterProducts}">
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
												   href="${pageContext.request.contextPath}/AddToCart?productId=${products.productId}">Add
													to cart</a>
											</div>
										</div>
									</div>
								</div>
							</a></li>
						</c:forEach>
					</c:if>

					<c:if test="${not empty filterProducts}">
						<c:forEach var="products" items="${filterProducts}">
							<li class="simpleCart_shelfItem"><a class="cbp-vm-image"
								href="${pageContext.request.contextPath}/ProductServlet?productId=${products.productId}">
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
												<h4>${products.productName}</h4>
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
												   href="${pageContext.request.contextPath}/AddToCart?productId=${products.productId}">Add
													to cart</a>
											</div>
										</div>
									</div>
								</div>
							</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<script src="js/cbpViewModeSwitch.js" type="text/javascript"></script>
			<script src="js/classie.js" type="text/javascript"></script>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
