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
        <title>Management Product</title>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="/Js/dropdown.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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


            <body>
           
              <div class="">

                <table class="rwd-table">
                  <tbody>
                    <tr>
                      
                      <th>Name</th>
                      <th>Email</th>
                      <th>Password</th>
                      <th>Role</th>
                      <th>Phone</th>
                      <th >Address</th>
                      


                    </tr>
                    <c:forEach var="Account" items="${Listaccount}">
                      <tr>
                        <td>
                          ${Account.name}
                        </td>
                        <td>
                          ${Account.email}

                        </td>
                        <td>
                          ${Account.password}

                        </td>
                        <td>
                          ${Account.role}

                        </td>
                        <td>
                          ${Account.phone}

                        </td>
                        <td>
                          ${Account.address}

                        </td>
                        <td>
                          

                        </td>
                        <td>
                        
                          <form action="/editProduct?productid=${Product.productID}" method="post">
                          <button type="submit" class="btn btn-warning" >Edit</button>
                        
                          
                        </td>
                        <td>
                        </form>
                        <form action="/deleteProduct?id=${Product.productID}&message=Delete Success" method="post">
                          <button class="btn btn-danger " type="submit">Delete</button>
  
                        </form>
                        </td>

                        

                      </tr>
                    
                    </c:forEach>

                    <tr>
                      <td colspan="8" style="text-align: center;">
                        <form action="/addProduct" method="post">
                          <button class="btn btn-success" type="submit">Add Product</button>
                        </form>
                      </td>
                    </tr>


                  </tbody>
                </table>

                <script type="text/javascript">
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
                  if (getIdDetails().message == "Add Success") {
                      swal({
                          title: "SUCCESS",
                          text: "Add Product Success",
                          icon: "success",
                          buttons: false,
                          dangerMode: false,
                      })
                  }
                  if (getIdDetails().message == "Delete Success") {
                      swal({
                          title: "SUCCESS",
                          text: "Success Delete Product",
                          icon: "success",
                          buttons: false,
                          dangerMode: false,
                      })
                  }
                  if (getIdDetails().message == "SuccesUploadImage") {
                      swal({
                          title: "SUCCESS",
                          text: "Upload Image Success, Please go to edit",
                          icon: "success",
                          buttons: false,
                          dangerMode: false,
                      })
                  }
                  

              </script>
                
            </body>



            <!-- section footer end -->
            <footer>
              <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>
            </footer>


      </html>