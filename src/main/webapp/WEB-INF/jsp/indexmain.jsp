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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        

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
                        <br>
                        <br>

             
                            
                    
                        <div id="row"  class="row">
                            
                            <div class="col-lg-2">
                                <div id="listgroup" class="list-group">
                                    <h1 style="font-family: cursive;">Category</h1>
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
                                    <br>
                                    <br>
                                    <!-- <img src="https://media.giphy.com/media/WAQiH273h7nTChAbHu/giphy.gif" alt=""> -->
                                 
                                    <br>
                                        <a  id="cartsticker"class="list-group-item font-weight-bold" id="listitem"
                                        href="/cart?name=${tendangnhap}">    <img id="imgpanda" src="https://media.giphy.com/media/875phkG4DRgNdskUXL/giphy.gif" alt="">CART</a>
                                      
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
                                            <form action="/productDetail?category=${product1.category}&id=${product1.productID}" method="post">

                                                <div id="imageIndexMain" class="product-item ">
                                                    <div class="product-item-image">
                                                        <img id="imageIndex" src="/images/${product1.image}" alt="">
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

                            <!-- <nav aria-label="...">
                                <ul class="pagination pagination-lg">
                                  <li class="page-item active" aria-current="page">
                                    <span class="page-link">1</span>
                                  </li>
                                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                                </ul>
                              </nav> -->
                              <script>
                            
                    
                         
                                    


                                //   [] toongr, itemperpage: 3, số trang = tổng / itemperpage
                                //   console.log(Listproduct);
                                //   trang 1: start = 0, end: 3, start = 4 = (start + end ) * (trangsau - 1trang truoc)  +1 ; end = start + itemperpage 
                                    

                                   
                                   
                                    //get data from Listproduct 

                                  const arr = [{name: "0"},{name: "1"}, {name: "2"}, {name: "3"}, {name: "4"}, {name: "5"}, {name: "6"},{name: "7"}, {name: "8"},  {name: "9"}, {name: "10"} ]

                                    const itemperpage = 5

                                    const renderPage = (start, end) => {
                                        let newArr = []
                                        for (let i = start - 1; i <= end - 1; i++) {
                                            newArr.push(arr[i])
                                        }
                                        return newArr;
                                    }

                                    // oldend = 3, oldstart = 1; prew = 1, next = 3, start = 7, end = 9 item = 3

                                    const countStartEnd = (oldStart, oldEnd, nextPage) => {
                                        const newStart = (oldStart + itemperpage - 1) * (nextPage - 1) + 1;
                                        const newEnd = newStart + itemperpage - 1;

                                        return {
                                            newStart,
                                            newEnd
                                        }
                                    }

                                    const { newStart, newEnd } = countStartEnd(1, 3, 2);
                                    const newArr = renderPage(newStart, newEnd);
                                    console.log(arr)
                                    console.log(newArr)

                                  </script>

                        </div>

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