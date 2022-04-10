

 <!-- Muốn chạy được dòng for thì phải xài taglib với page này  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
        media="screen">
        <script src="/js/DropDown.js"></script>
</head>
<!-- body -->

<body class="main-layout">
 <!-- header reponsive -->

    <header>
        <nav id='cssmenu'>
        <div class="logo"><a href="">Chăn Rao </a></div>
        <div id="head-mobile"></div>
        <div class="button"></div>
        <ul>
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
       

            <li><a id="namefromheader"  href='#'><img src="/images/user.jpg" width="16" height="16"> <% String username = (String)session.getAttribute("tendangnhap");
                if(session!= null){
                    out.print(username);
                }
                %></a>
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
        </ul>
        </nav>
        </header>
        
    <!-- Khúc này chạy vòng for yêu dấu nè -->
 
    <div class="layout_padding gallery_section">
        <div class="container">
    <c:forEach var="product1" items="${Listproduct}">

            <div class="row-sm-3s">
                <div class="col-sm-3s ">
                    <div class="best_shoes">
                        <h1>${product1.name}</h1>
                        <p class="best_text">${product1.productID} </p>
                        <div class="shoes_icon"><img src="/images/image1.jpg" width="250" height="250"></div>
                        <div class="star_text">
                            <div class="">
                                <ul>
                                    
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">${product1.price}</span></div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            
    
    
    <!-- section footer end -->
    <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>




</html>