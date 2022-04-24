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
                <title>Product</title>
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
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <link rel="stylesheet" href="css/owl.theme.default.min.css">

                <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">

                <script src="/Js/dropdown.js"></script>



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


                        <body id="addProduct">
                            <div class="container justify-content-center" >

                            
                            <div id="addProductForm" class="row justify-content-center rounded">
                                <div class="justify-content-center ">


                                
                                <h1>Edit Product 1 ${Product.productID}</h1>
                       
                                <form method="POST" action="/uploadFromEdit?productid=${param.productid}" enctype="multipart/form-data">

                                    <input type="file" name="file" id="file" />
                                    <input class="btn btn-success rounded " type="submit" value="Submit" onclick="Upload()" />
                                </form>
                                <div>
                                    <h1>

                                        <% String message=(String)request.getAttribute("message"); if(message!=null){
                                            out.print(message); } %>
                                    </h1>
                                </div>
                              
                                <form action="/editProductProcess?id=${Product.productID}" method="post" modelAttribute="Product1">
                                    <div class="form-group">
                                    
                                      <input name="productID" type="text" class="form-control" value="${param.productid}" hidden>
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Name</label>
                                      <input name="name" type="text" class="form-control"  placeholder="  ${Product.name}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="Category"class="font-weight-bold">Category</label>
                                        <select name="Category" path="category" type="text" class="form-control rounded"
                                            id="Category" placeholder="Category" required>
                                                <option value="Tubers">Tubers</option>
                                                <option value="Leaves">Leaves</option>
                                                <option value="Seed">Seed</option>
                                                <option value="Fruit">Fruit</option>
                                                <option value="Mushroom">Mushroom</option>
                                                <option value="Spice">Spice</option>
                                                <option value="Other">Other</option>
                                              </select>
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Price</label>
                                      <input name="price" type="number" class="form-control"  placeholder=" ${Product.price}" required>
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Amount</label>
                                      <input name="amount" type="number" class="form-control"  placeholder=" ${Product.amount}" required>
                                    </div>
                                    <div class="form-group">
                                      <!-- <label for="recipient-name" class="col-form-label">Image</label> -->
                                      <input name="image" type="text" class="form-control"  value="${param.imagenameforedit}" hidden >
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Detail</label>
                                      <input name="detail" type="text" class="form-control"  placeholder="${Product.detail}">
                                    </div>
                          

                                  
                                    <button type="submit" class="btn btn-success rounded">Submit</button>
                                </form>

                            </div>
                        </div>
                            </div>

                           
                            <script type="text/javascript">
                                var uploadField = document.getElementById("file");

                                uploadField.onchange = function() {
                                    if(this.files[0].size > 1048574){
                                        swal({
                                        title: "FAIL",
                                        text: "Image too big",
                                        icon: "error",
                                        buttons: false,
                                        dangerMode: true,
                                    })
                                    this.value = "";
                                    };
                                };
                                function getIdDetails() {
                                    var urlParams;
                                    (window.onpopstate = function () {
                                        var match,
                                            pl = /\+/g, // Regex for replacing addition symbol with a space
                                            search = /([^&=]+)=?([^&]*)/g,
                                            decode = function (s) {
                                                return decodeURIComponent(s.replace(pl, " "));
                                            },
                                            query = window.location.search.substring(1);

                                        urlParams = {};
                                        while ((match = search.exec(query)))
                                            urlParams[decode(match[1])] = decode(match[2]);
                                    })();
                                    return urlParams;
                                }
                                if (getIdDetails().message == "SuccesUploadImage") {
                                    swal({
                                        title: "SUCCESS",
                                        text: "Thêm ảnh thành công",
                                        icon: "success",
                                        buttons: true,
                                        dangerMode: true,
                                    })
                                }
                                else if(getIdDetails().message == "File was empty or not found"){
                                    swal({
                                        title: "ERROR",
                                        text: "Empty Image, Please try again",
                                        icon: "error",
                                        buttons: true,
                                        dangerMode: true,
                                    })
                                }

                            </script>
             </body>


                        <!-- section footer end -->
                        <footer>
                            <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>
                        </footer>



            </html>