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
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
            
              <div id="row"  class="row">
                            
                <div class="col-lg-2" style="z-index: 20;">
                    <div id="listgroup" class="list-group">
                        <h1></h1>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=1">Janury</a>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=2">February</a>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=3">March</a>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=4">April</a>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=5">May</a>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=6">June</a>
                        <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=7">July</a>
                            
                            <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=8">August</a>
                            
                            <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=9">September</a>
                            <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=10">October</a>
                            <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=11">November</a>
                            <a class="list-group-item font-weight-bold" id="listitem"
                            href="/StatisticalByMonth?month=12">December</a>
                       
                     
                     
                       
                          
                    </div>
                
                </div>

                <div id="tableStatistical" class="col-lg-10" style="position: absolute; float: right;">
        
          
                <table class="rwd-table" >
                  
                    <tr>
                    <th style="align-items: center; text-align: center;" >Date</th>

                      <th >Name</th>
                      <th >Phone Number</th>
                  
                      <th >Address</th>
                      <th >Detail (Name, Price, Amount)</th>
                      <th >Total Price</th>

                  



                    </tr>
                    <c:forEach var="list" items="${ListStatiscal}">
                      <tr>
                        <td>
                            
                            <span id="labelstatus" class="label label-info" style="width:100px ; align-items: center; margin: auto;" >${list.status}</span>

                          </td>
                        <td>
                          ${list.name}
                        </td>
                        <td>
                          ${list.phone}

                        </td>
                  
                        <td>
                          ${list.address}

                        </td>
                        <td>
                          ${list.detail}

                        </td>
                        <td>
                          ${list.price}

                        </td>

                    
        
              





                      </tr>

                    </c:forEach>

                
                  </div>

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

                  if (getIdDetails().message == "Update fail") {
                    swal({
                      title: "FAIL",
                      text: "Something wrong, Please try again",
                      icon: "error",
                      buttons: false,
                      dangerMode: false,
                    })
                  }

                  
                  if (getIdDetails().message == "change status to shipped") {
                    swal({
                      title: "SUCCESS",
                      text: "Change Status to Shipped Success",
                      icon: "success",
                      buttons: false,
                      dangerMode: false,
                    })
                  }

                   
                  if (getIdDetails().message == "change status to shipped") {
                    swal({
                      title: "SUCCESS",
                      text: "Change Status to Shipped Success",
                      icon: "success",
                      buttons: false,
                      dangerMode: false,
                    })
                  }

                  if (getIdDetails().message == "change status to done") {
                    swal({
                      title: "SUCCESS",
                      text: "Change Status to Done Success",
                      icon: "success",
                      buttons: false,
                      dangerMode: false,
                    })
                  }



                </script>

            </body>



            <!-- section footer end -->
            <footer>
              <div class="copyright" style="left: 0;"> Dang Hieu - Bao Thai - Hoai Bao </div>
            </footer>


      </html>