<!-- Muốn chạy được dòng for thì phải xài taglib với page này  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page import="java.io.*,java.util.*" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Shoes</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="/css/dropdown.css">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/productDetail.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- owl stylesheets -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css">
        <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">




      </head>
      <!-- body -->

      <body class="main-layout">
        <!-- header reponsive -->

        <% if(session.getAttribute("tendangnhap")==null || session==null) { response.sendRedirect("/login"); } %>
          <div>
            <header>
              <nav id='cssmenu'>

                <ul style="height:15px">

                  <li class='active'><a href='/indexmain'>HOME</a></li>
                  <li><a href='#'>ABOUT</a></li>
                  <li><a href='#'>PRODUCTS</a>
                    <ul>
                      <li><a href='#'>Product 1</a>
                        <ul>
                          <li><a href='#'>Sub Product</a></li>
                          <li><a href='#'>Sub Product</a></li>
                        </ul>
                      </li>
                      <li><a href='#'>Product 2</a>
                        <ul>
                          <li><a href='#'>Sub Product</a></li>
                          <li><a href='#'>Sub Product</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li><a href='#'>BIO</a></li>
                  <li><a href='#'>VIDEO</a></li>
                  <li><a href='#'>GALLERY</a></li>
                  <li><a href='#'>CONTACT</a></li>





                  <li class="nav_name"><a id="namefromheader" href='#'><img src="/images/user.jpg" width="16"
                        height="16">
                      <% String username=(String)session.getAttribute("tendangnhap"); if(session!=null){
                        out.print(username); } %>
                    </a>
                    <ul>
                      <li><a href='/managementProduct'>Quản lí sản phẩm</a>
                      </li>
                      <li><a href='#'>Product 2</a>
                        <ul>
                          <li><a href='#'>Sub Product</a></li>
                          <li><a href='#'>Sub Product</a></li>
                        </ul>
                      </li>
                      <li><a href='/logout'>Đăng xuất</a>
                    </ul>
                  </li>

            </header>
            <form action="/addToCart?id=${ProductDetail.productID}&email=${tendangnhap}" method="post">
              <!-- chi tiet san pham  o day ne -->

              <body class="main-layout">
                <!-- <h1>Chi tiết sản phẩm</h1>  -->
                <div class="card-wrapper">
                  <div class="card">
                    <!-- card left -->
                    <div class="product-imgs">
                      <div class="img-display">
                        <div class="img-showcase">
                          <img src="/images/${ProductDetail.image}" alt="shoe image">

                        </div>
                      </div>

                    </div>
                    <!-- card right -->
                    <div class="product-content">
                      <h2 class="product-title">${ProductDetail.name}</h2>



                      <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>4.7(21)</span>
                      </div>

                      <div class="product-price">

                        <p class="new-price">Price: <span>${ProductDetail.price} $</span></p>
                      </div>

                      <div class="product-detail">
                        <h2>about this item: </h2>
                        <p>${ProductDetail.detail} </p>

                        <!-- <ul>
                                        <li>Color: <span>Black</span></li>
                                        <li>Available: <span>in stock</span></li>
                                        <li>Category: <span>Shoes</span></li>
                                        <li>Shipping Area: <span>All over the world</span></li>
                                        <li>Shipping Fee: <span>Free</span></li>
                                      </ul> -->
                      </div>
                   

             
                  <input type="text" name="name" value="${ProductDetail.name}" hidden>
                      <input type="text" name="image" value="${ProductDetail.image}" hidden>
                      <input type="text" name="price" value="${ProductDetail.price}" hidden>
                      <input type="text" name="productID" value="${ProductDetail.productID}" hidden>





                      <div class="purchase-info">
                        <input name="amount" type="number" min="0" value="1">
                        <button type="submit" class="add-cart btn">
                          Add to Cart <i class="fas fa-shopping-cart"></i>
                        </button>
                      </div>
            </form>

          </div>
          </div>
          </div>

          <div class="same-product">
            <c:forEach var="product1"
              items="${productrelative}">
              <div class="product-box" id="productbox">
                <form
                  action="/productDetail?id=${product1.productID}"
                  method="post">

                  <div id="imageIndexMain"
                    class="product-item">
                    <div class="product-item-image">
                      <img id="imageIndex"
                        src="/images/${product1.image}"
                        alt="">
                      <div class="product-item-image-hover">
                      </div>
                    </div>
                    <div class="product-item-content">

                      <div class="product-item-title">
                        ${product1.name}
                      </div>
                      <div class="product-item-price">
                        ${product1.price} $
                      </div>
                      <button type="submit"
                        class="button-pill">
                        <span>Shop Now</span>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </c:forEach>
          </div>
      </body>

      </div>

      </div>

      <!-- section footer end -->
      <footer>
        <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>
      </footer>



      </html>