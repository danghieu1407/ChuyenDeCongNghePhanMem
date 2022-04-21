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
        <script src="jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css">
        <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




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
                </ul>


            </header>


            <body>


            <h1>${totalprice}</h1>




              <c:forEach var="product1" items="${Listcart}">
                <h1>${product1.email}</h1>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Product Name</th>
                      <th>Price</th>
                      <th>
                        Quantity

                      </th>
                      <th >
                        Action
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="product-image">
                            <img src="/images/${product1.image}">
                          </div>
                      </td>
                      <td style="float: left;">

                        ${product1.name}

                      </td>
                      <td>
                        <div class="product-price">  ${product1.price}</div>
                        
                      </td>
                      <td>
                        ${product1.amount}
                      </td>
                      <td>
                     
                          <button class="btn btn-danger">
                            Remove
                          </button>
                          <button class="btn btn-warning">
                            Change Quantity
                          </button>
                        </div>
                      </td>
                    
                    </tr>

                  </tbody>
                </table>









                <div class="totals">
                  <div class="totals-item">
                    <label>Subtotal</label>
                    <div class="totals-value" id="cart-subtotal">71.97</div>
                  </div>
                  <div class="totals-item">
                    <label>Tax (5%)</label>
                    <div class="totals-value" id="cart-tax">3.60</div>
                  </div>
                  <div class="totals-item">
                    <label>Shipping</label>
                    <div class="totals-value" id="cart-shipping">15.00</div>
                  </div>
                  <div class="totals-item totals-item-total">
                    <label>Grand Total</label>
                    <div class="totals-value" id="cart-total">90.57</div>
                  </div>
                </div>

                <button class="checkout">Checkout</button>

          </div>

          </c:forEach>

          



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
            if (getIdDetails().message == "Add to cart success") {
              swal({
                title: "SUCCESS",
                text: "Add to Cart Success",
                icon: "success",
                buttons: false,
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