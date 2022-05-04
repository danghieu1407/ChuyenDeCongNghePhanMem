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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
          integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
          crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
          integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
          crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
          integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
          crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script src="/Js/dropdown.js"></script>



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
                  <li>
                    <form action="/searchProduct" method="post">
                      <input type="text" name="search" id="search" placeholder="Search.." style="height: 30px;
                                margin: 6px;">
                    </form>
                  </li>







                  <li class="nav_name"><a id="namefromheader" href='#'><img src="/images/user.jpg" width="16"
                        height="16">
                      <% String username=(String)session.getAttribute("tendangnhap"); if(session!=null){
                        out.print(username); } %>
                    </a>
                    <ul>
                      <li><a href='/managementProduct'>Management Product</a>
                      </li>

                      <% if(session.getAttribute("role").equals("3")){ %>
                        <li><a href='/managementAccount'>Management Account</a></li>


                        <% }%>



                          <li><a href='#'>Product 2</a>
                            <ul>
                              <li><a href='#'>Sub Product</a></li>
                              <li><a href='#'>Sub Product</a></li>
                            </ul>
                          </li>
                          <li><a href='/logout'>Logout</a>
                    </ul>
                  </li>
                </ul>


            </header>


            <body>




              <table class="table" style="width: 900px;">
                <tbody>
                  <tr>
                    <th></th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>
                      Quantity

                    </th>
                    <th>
                      Action
                    </th>
                  </tr>
                  <c:forEach var="product1" items="${Listcart}">


                    <tr>
                      <td>
                        <div class="product">

                          <img src="/images/${product1.image}" style="width: 100px; height: 100px;">
                        </div>
                      </td>
                      <td>

                        <div name="phone" class="product-price" style="font-size: 15px;"> ${product1.name}</div>

                      </td>
                      <td>
                        <div class="product-price" style="font-size: 15px;"> $${product1.price}</div>

                      </td>
                      <td>
                        <div class="product-price" style="font-size: 15px;"> ${product1.amount}</div>
                      </td>
                      <td>
                        <button class="btn btn-warning" data-toggle="modal" data-target="#${product1.productID}"
                          data-whatever="@mdo" style="width: 150px; height: 38px;">
                          Change Quantity
                        </button>
                        <form action="/deleteCart?productID=${product1.productID}&name=${tendangnhap}" method="post">
                          <button class="btn btn-danger" style="width: 150px; height: 38px;">
                            Remove
                          </button>
                        </form>



                      </td>

                    </tr>
                  </c:forEach>

                </tbody>
              </table>
              <!-- Modal -->
              <c:forEach var="product1" items="${Listcart}">

                <form action="/updateCart?productID=${product1.productID}&quantity=&name=${tendangnhap}" method="post"
                  modelAttribute="quantity">

                  <div class="modal fade" id="${product1.productID}" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Change Quantity</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <input type="number" id="quantity" name="amount" min="1" max="100" value="1">

                        </div>
                        <div class="modal-footer">

                          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>

                          <button type="submit" class="btn btn-success">Save changes</button>
                </form>

          </div>
          </div>
          </div>
          </div>
          </c:forEach>







          <!-- DATE TIME -->

          <div id="totals">

            <div id="totaildiv" class="product-price" style="font-size: 15px;">
          <div id="current-time"> </div>

              <label>Grand Total</label>
              <div  class="totals-value" id="cart-total">${totalprice}</div>
              <form action="/order?name=${tendangnhap}" method="post" modelAttribute="Receipt">
                <c:forEach var="product1" items="${Listcart}">
                <input name="image" type="text" value="${product1.image}" style="width: 100px;" hidden> 
               
                <input name="detail" type="text" value="${product1.name} $${product1.price} ------ ${product1.amount} " style="width: 100px;" hidden>
            
             
            
                </c:forEach>
                <input name="price" type="text" value="${totalprice}" style="width: 100px;" hidden>
                <input name="status" type="text" value="Waiting" style="width: 100px;" hidden>
                
                <label for="phonenumber">Phone Number</label>
                <input name ="phone" id="phonenumber" type="text"  style="width: 100px;">
                <label for="Address">Address</label>
                <input name="address" id="Address" type="text"  style="width: 100px;">
                <button type="submit" class="btn btn-success">Order</button>
              </form>
            </div>

          </div>







          </div>






          <script>

            var today = new Date();
            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + ' ' + time;

            // Gán vào thẻ HTML
            document.getElementById('current-time').innerHTML = dateTime;
          </script>

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
            else if (getIdDetails().message == "Delete Success") {
              swal({
                title: "SUCCESS",
                text: "Delete Success",
                icon: "success",
                buttons: false,
                dangerMode: true,
              })
            }
            else if (getIdDetails().message == "Update Success") {
              swal({
                title: "SUCCESS",
                text: "Update Success",
                icon: "success",
                buttons: false,
                dangerMode: true,
              })
            }
            else if(getIdDetails().message == "Pending Order Staff will contact you soon"){
                                    swal({
                                        title: "SUCCESS",
                                        text: "Staff will contact you soon",
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