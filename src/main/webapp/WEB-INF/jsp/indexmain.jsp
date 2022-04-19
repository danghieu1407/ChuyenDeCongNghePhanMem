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
                <title>Index </title>
                <meta name="keywords" content="">
                <meta name="description" content="">
                <meta name="author" content="">
                <link rel="stylesheet" href="/css/dropdown.css">
                <!-- bootstrap css -->
                <link rel="stylesheet" href="css/bootstrap.min.css">
                <!-- style css -->
                <link rel="stylesheet" href="css/product.css">
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
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css">
                <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">

                <script src="/Js/dropdown.js"></script>
                <script>$(document).on("click", ".navbar-right .dropdown-menu", function (e) {
                        e.stopPropagation();
                    });</script>

            </head>
            <!-- body -->

            <body class="main-layout">
                <!-- header reponsive -->

                <% if(session.getAttribute("tendangnhap")==null || session==null) { response.sendRedirect("/login"); }
                    %>
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
                           




                                    <li class="nav_name"><a id="namefromheader" href='#'><img src="/images/user.jpg"
                                                width="16" height="16">
                                            <% String username=(String)session.getAttribute("tendangnhap");
                                                if(session!=null){ out.print(username); } %>
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
                        <div id="row"  class="row">
                            <div class="col-lg-2">
                                <div id="listgroup" class="list-group">
                                    <h1>Category</h1>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Tubers">Tubers</a>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Leaves">Leaves</a>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Seed">Seed</a>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Fruit">Fruit</a>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Mushroom">Mushroom</a>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Spice">Spice</a>
                                    <a class="list-group-item font-weight-bold" id="listitem"
                                        href="/category?category=Orther">Orther</a>

                                </div>
                            </div>


                            <div class="col-lg-10">
                                <div id="slideshow">
                                    <div class="slide-wrapper">
                                      <div class="slide"> <img class="slide-number" src="/images/image5.jpg"></div>
                                      <div class="slide"><img class="slide-number" src="/images/image2.jpg" alt=""></div>
                                      <div class="slide"><img class="slide-number" src="/images/image4.jpg" alt=""></div>
                                      
                             
                             
                                    </div>
                                  </div>
                                <div class="row">
                                    
                                    <c:forEach var="product1" items="${Listproduct}">
                                        <div class="product-box col-lg-2" id="productbox">
                                            <form action="/productDetail?id=${product1.productID}" method="post">

                                                <div id="imageIndexMain" class="product-item ">
                                                    <div class="product-item-image">
                                                        <img src="/images/${product1.image}" alt="">
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
                                                        <button type="submit" class="button-pill">
                                                            <span>Shop Now</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>


                
                    <!-- section footer end -->
                    <footer>
                        <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>
                    </footer>


                    <script>
                        let slideIndex = 1;
                        showSlides(slideIndex);
                        
                        function plusSlides(n) {
                          showSlides(slideIndex += n);
                        }
                        
                        function currentSlide(n) {
                          showSlides(slideIndex = n);
                        }
                        
                        function showSlides(n) {
                          let i;
                          let slides = document.getElementsByClassName("mySlides");
                          let dots = document.getElementsByClassName("dot");
                          if (n > slides.length) {slideIndex = 1}    
                          if (n < 1) {slideIndex = slides.length}
                          for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";  
                          }
                          for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active", "");
                          }
                          slides[slideIndex-1].style.display = "block";  
                          dots[slideIndex-1].className += " active";
                        }
                        </script>

            </html>