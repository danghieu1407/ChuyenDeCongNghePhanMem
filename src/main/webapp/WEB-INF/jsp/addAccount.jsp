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
                    <link rel="stylesheet" href="/css/product.css">
                    <link rel="stylesheet" href="/css/productDetail.css">
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
                    <style>
                        *{
                            font-family: cursive;
                        }
                    </style>
    
    
           
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
                        <li><form action="/searchProduct" method="post">
                            <input type="text" name="search" id="search"placeholder="Search..">
                        </form></li>
                     
                        
               


                        

                        <li class="nav_name"><a id="namefromheader" href='#'><img src="/images/user.jpg"
                                    width="16" height="16">
                                <% String username=(String)session.getAttribute("tendangnhap");
                                    if(session!=null){ out.print(username); } %>
                            </a>
                            <ul>
                               
                            
                                    <% if(session.getAttribute("role").equals("3")){ %>
                                        <li><a href='/managementAccount'>Management Account</a></li>
                                        <li><a href='/managementProduct'>Management Product</a>
                                        </li>

                                        
                                    <% }%>

                                    <% if(session.getAttribute("role").equals("3") || session.getAttribute("role").equals("2")){ %>
                                        <li><a href='/managementReceipt'>Management Receipt</a></li>

                                        
                                    <% }%>


                             
                                    <% if(session.getAttribute("role").equals("3")){ %>
                                        <li><a href='/Statistical'>Statistical
                                        </a></li>

                                        
                                    <% }%>
                                <li><a href='/logout'>Logout</a> 
                            </ul>
                        </li>
                    </ul>


            </header>


                        <body id="addProduct">
                            <div id="formaddproduct" >

                            
                            <div id="addProductForm" class="row justify-content-center rounded">
                                <div class="justify-content-center ">


                                
                                <h1>Add Account</h1>
                                
                                
                         
                                <form action="/addAccountProcess" method="POST" modelAttribute="Account"
                                    enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="name"class="font-weight-bold" style="float:left;">Name</label>
                                        <input name="name" path="productID" type="text" class="form-control rounded"
                                            id="productID" placeholder="Enter your name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email"class="font-weight-bold" style="float:left;">Email</label>
                                        <input name="email" path="email" type="text" class="form-control rounded" id="Name"
                                            placeholder="Enter your Email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password"class="font-weight-bold" style="float:left;">Password</label>
                                        <input name="password" path="password" type="text" class="form-control rounded" id="Name"
                                            placeholder="Enter your password" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="Role"class="font-weight-bold" style="float:left;">Role</label>
                                        <select name="role" path="role" type="text" class="form-control rounded"
                                            id="role" placeholder="Role" required>
                                                <option value="1">User</option>
                                                <option value="2">Staff</option>
                                                <option value="3">Admin</option>
                                          
                                              </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone"class="font-weight-bold" style="float:left;">Phone</label>
                                        <input name="phone" path="phone" type="text" class="form-control rounded" id="Price"
                                            placeholder="Enter your phone number" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address"class="font-weight-bold" style="float:left;">Address</label>
                                        <input name="address" path="address" type="text" class="form-control rounded" id="address"
                                            placeholder="Enter your address" required>
                                    </div>
                                    
                                    <br>
                                    <br>
                                    <br>
                    

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
                                if (getIdDetails().message == "Success") {
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
                                        text: "Thêm ảnh thất bại",
                                        icon: "error",
                                        buttons: true,
                                        dangerMode: true,
                                    })
                                }

                            </script>
             </body>


                        <!-- section footer end -->
                        <footer>
                            <div id="footer"> Dang Hieu - Bao Thai - Hoai Bao </div>
                        </footer>



            </html>