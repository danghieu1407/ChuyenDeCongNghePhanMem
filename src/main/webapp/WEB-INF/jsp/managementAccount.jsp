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
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
          crossorigin="anonymous">
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

            <body>

              <div class="">

                <table class="rwd-table">
                  <tbody>
                    <tr>

                      <th >Name</th>
                      <th >Email</th>
                  
                      <th >Role</th>
                      <th >Phone</th>
                      <th >Address</th>
                      <th colspan="5" style="text-align: center;" >Action</th>



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
                          ${Account.role}
                  
                          

                        </td>
                        <td>
                          ${Account.phone}

                        </td>
                        <td>
                          ${Account.address}

                        </td>
                
                        <td>

                          <form action="/updateRoleToAdmin?email=${Account.email}" method="post">
                            <button type="submit" class="btn btn-warning">Update role to Admin</button>


                        </td>
                        <td>
                          </form>
                          <form action="/updateRoleToStaff?email=${Account.email}" method="post">
                            <button class="btn btn-primary " type="submit">Update role to Staff</button>

                          </form>
                        </td>
                        <td>
                        </form>
                        <form action="/updateRoleToUser?email=${Account.email}" method="post">
                          <button class="btn btn-info " type="submit">Update role to User</button>

                        </form>
                      </td>
                        <td>
                          </form>
                          <form action="/deleteAccount?email=${Account.email}" method="post">
                            <button class="btn btn-danger " type="submit">Delete</button>

                          </form>
                        </td>





                      </tr>

                    </c:forEach>

                    <tr>
                      <td colspan="9" style="text-align: center;">
                        <form action="/addAccount " method="post">
                          <button class="btn btn-success" type="submit">Add Account</button>
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
                      text: "Success Delete Account",
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

                  if (getIdDetails().message == "Update Success") {
                    swal({
                      title: "SUCCESS",
                      text: "Update Role Success",
                      icon: "success",
                      buttons: false,
                      dangerMode: false,
                    })
                  }

                  if (getIdDetails().message == "Email exist") {
                    swal({
                      title: "ERROR",
                      text: "Email exist",
                      icon: "error",
                      button: true,
                      dangerMode: false,
                    })
                  }

                  if (getIdDetails().message == "Add Account Success") {
                    swal({
                      title: "SUCCESS",
                      text: "Add account Success",
                      icon: "success",
                      button: true,
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