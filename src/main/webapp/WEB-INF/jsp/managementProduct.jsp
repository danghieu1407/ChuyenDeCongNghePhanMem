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
                      <th>Product ID</th>
                      <th>Name</th>
                      <th>Category</th>
                      <th>Price</th>
                      <th>Amount</th>
                      <th>Image</th>
                      <th>Detail</th>
                      <th>Action</th>


                    </tr>
                    <c:forEach var="Product" items="${Listproduct}">
                      <tr>
                        <td>
                          ${Product.productID}
                        </td>
                        <td>
                          ${Product.name}

                        </td>
                        <td>
                          ${Product.category}

                        </td>
                        <td>
                          ${Product.price}

                        </td>
                        <td>
                          ${Product.amount}

                        </td>
                        <td>
                          ${Product.image}

                        </td>
                        <td>
                          ${Product.detail}

                        </td>
                        <td>
                        

                          <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Edit</button>
                          <!-- modal edit -->
                          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h3 class="modal-title" id="exampleModalLabel">Edit ${Product.productID}</h3>
                                
                                  </button>
                                </div>
                                <div class="modal-body">
                                  <form action="/editProductProcess?id=${Product.productID}" method="post" modelAttribute="Product1">
                                    <div class="form-group">
                                    
                                      <input name="productID" type="text" class="form-control"  placeholder=" ${Product.productID}" value="${Product.productID}" hidden>
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Name</label>
                                      <input name="name" type="text" class="form-control"  placeholder="  ${Product.name}">
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Category</label>
                                      <input name="category" type="text" class="form-control"  placeholder=" ${Product.category}">
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Price</label>
                                      <input name="price" type="text" class="form-control"  placeholder=" ${Product.price}">
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Amount</label>
                                      <input name="amount" type="text" class="form-control"  placeholder=" ${Product.amount}">
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Image</label>
                                      <input name="image" type="text" class="form-control"  placeholder=" ${Product.image}">
                                    </div>
                                    <div class="form-group">
                                      <label for="recipient-name" class="col-form-label">Detail</label>
                                      <input name="detail" type="text" class="form-control"  placeholder=" ${Product.detail}">
                                    </div>
                                   
                                   
                               
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                  
                                  <button class="btn btn-success" type="submit">Confirm</button>
                                  </form>
                                </div>
                                </div>
                              </div>
                            </div>
                          </div>



                            <!-- open modal delete -->
                            <button class="btn btn-danger" type="button" data-toggle="modal"
                              data-target="#myModal">Delete</button>
                              <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">
              
                                  <!-- Modal content-->
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button type="button" class="close" data-dismiss="modal"></button>
                                      <h4 class="modal-title">Delete</h4>
                                    </div>
                                    <div class="modal-body">
                                      <p>Are you sure to delete this product</p>
                                    </div>
                                    <div class="modal-footer">
                                   
                                    <form action="/deleteProduct?id=${Product.productID}" method="post">
                                      <button class="btn btn-success " type="submit">Confirm</button>
              
                                    </form>
                                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                  </div>
              
                                </div>
                              </div>
                         
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

                <!-- Modal -->
                
            </body>



            <!-- section footer end -->
            <footer>
              <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>
            </footer>


      </html>