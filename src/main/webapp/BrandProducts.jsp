
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

        function toggleBrand(brandName) {
           // $(".product-list").hide(); // Ẩn tất cả
            //$("#brand-" + brandName).show(); // Hiện brand được chọn
            $(".product-list").slideUp();
            $("#brand-" + brandName).slideDown();
        }

        $(document).ready(function () {
            var selectedBrand = "${param.brand}";
            if (selectedBrand && $("#brand-" + selectedBrand).length) {
                toggleBrand(selectedBrand);
            } else {
                toggleBrand("OMEGA"); // Nếu không có brand nào, mặc định hiển thị OMEGA
            }
        });
    </script>
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/simpleCart.min.js"> </script>
    <style>
        .product-list { display: none; margin-top: 10px; }
        .product-card { margin-bottom: 10px; }

         .product-card {
             min-height: 400px; /* chiều cao cố định cho mỗi sản phẩm */
             margin-bottom: 20px;
             box-sizing: border-box;
         }
        .product-list {
            display: flex;
            flex-wrap: wrap;
        }

        .product-list .product-card {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .product_image img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .product_container {
            text-align: center;
            padding-top: 10px;
        }

        .brand-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-end;
            height: 100%;
            text-align: right;
        }

    </style>
</head>
<body>
<!-- Reuse header and menu here -->
<%@ include file="header2.jsp" %>
<div class="men">
    <div class="container">
        <div class="col-md-12 single_top">
            <h1 class="page-heading products-listing">
                Brands
                <span class="heading-counter">There are 4 brands</span>
            </h1>
            <div class="products-count">Showing 1 - 4 of 4 items</div>

            <div class="brand_box">
                <c:set var="selectedBrand" value="${param.brand}" />
                <c:forEach var="brand" items="${brandProducts.keySet()}">
                    <c:set var="count" value="${fn:length(brandProducts[brand])}" />
                <div class="brand_box row" style="margin-bottom: 20px; padding: 10px; border: 1px solid #ccc;">
                    <div class="col-sm-3">
                        <img src="images/brand-${brand.toLowerCase()}.png" alt="${brand}" class="img-responsive" />
                    </div>
                    <div class="col-sm-6">
                        <div class="brand-info">
                        <h4>${brand} -
                            <c:set var="count" value="${fn:length(brandProducts[brand])}" />
                                ${count} product<c:if test="${count > 1}">s</c:if>
                        </h4>
                        <c:choose>
                            <c:when test="${selectedBrand == brand}">
                                <span class="label label-success">Currently Viewing</span>
                            </c:when>
                            <c:otherwise>
                                <a href="brand?brand=${brand}" class="btn btn-primary">View Products</a>
                            </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                </div>

                <!-- Danh sách sản phẩm của brand -->
                <c:if test="${selectedBrand == brand}">
                <div id="brand-${brand}" class="product-list row">
                    <c:forEach var="product" items="${products}">
                        <div class="col-sm-3 product-card">
                            <a class="cbp-vm-image" href="productServlet?productId=${product.productId}">
                                <div class="view view-first">
                                    <div class="inner_content clearfix">
                                <div class="product_image">
                                <div class="mask1">
                                <img src="${product.listimg[0]}" class="img-responsive zoom-img" alt="${product.productName}" />
                                </div>
                                    <div class="mask">
                                        <div class="info">Quick View</div>
                                    </div>
                                    <div class="product_container">
                                    <h4>${product.productName}</h4>
                                        <p>Dresses</p>
                                        <div class="price mount item_price">
                                    ${product.priceSell} VNĐ
                                        </div>
                                    <a href="AddToCart?productId=${product.productId}" class="btn btn-success btn-sm">Add to cart</a>
                                    </div>
                                    </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                </c:if>
            </c:forEach>
        </div>
<%@ include file="footer.jsp" %>
    </div>
</div>
</div>
</body>
</html>
