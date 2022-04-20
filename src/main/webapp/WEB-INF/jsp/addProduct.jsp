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

                
                <link rel="stylesheet" href="/css/table.css">

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

                                    <li class='active'><a href='#'>HOME</a></li>
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
                                    <li><a href='#' hidden>CONTACT</a></li>
                                    <li><a href='#' hidden>CONTACT</a></li>




                                    <li><a id="namefromheader" href='#'><img src="/images/user.jpg" width="16"
                                                height="16">
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


                        <body>
                            <div id="addProductForm"  class="row">
                                <h1>Add Product</h1>

                                <form method="POST" action="/upload" enctype="multipart/form-data" >
                                    <input type="file" name="file" />
                                     <input type="submit" value="Submit" />
                                </form>
                                <div>
                                    <h1>

                                        <% String message=(String)request.getAttribute("message");
                                            if(message!=null){ out.print(message); } %>
                                    </h1>
                                </div>
                            <form action="/addProductProcess" method="POST" modelAttribute="Product" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="productID">Product ID</label>
                                    <input name="productID" path="productID" type="text" class="form-control" id="productID" placeholder="Product ID" required>
                                  </div>
                                <div class="form-group">
                                  <label for="Name">Name</label>
                                  <input name="Name" path="name" type="text" class="form-control" id="Name" placeholder="Name" required>
                                </div>

                                <div class="form-group">
                                    <label for="Category">Category</label>
                                    <input name="Category" path="category" type="text" class="form-control" id="Category" placeholder="Category" required>
                                  </div>
                                  <div class="form-group">
                                    <label for="Price">Price</label>
                                    <input name="Price" path="price" type="text" class="form-control" id="Price" placeholder="Price" required>
                                  </div>
                                  <div class="form-group">
                                    <label for="Amount">Amount</label>
                                    <input name="Amount" path="amount" type="text" class="form-control" id="Amount" placeholder="Amount" required>
                                  </div>
                                  <div class="form-group">
                                    <!-- //get getAttribute for imagename from controller -->

                                    

                                    <label for="Image">Image</label>
                                    <input name="image" path="image" type="text" class="form-control" id="Image" placeholder=""  value="${param.imagename}" hidden>
                                  </div>

                             
                                  <div class="form-group">
                                    <label for="Detail">Detail</label>
                                    <input name="detail" path="detail" type="text" class="form-control" id="Detail" placeholder="Detail">
                                  </div>
                             
                                <button type="submit" class="btn btn-success">Submit</button>
                              </form>

                             
                            </div>
                        </body>
                        
                      
                        <!-- section footer end -->
                        <footer>
                            <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>
                        </footer>



            </html>