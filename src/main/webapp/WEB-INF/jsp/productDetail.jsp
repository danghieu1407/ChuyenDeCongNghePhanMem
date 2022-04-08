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
   
</head>
<!-- body -->

<body class="main-layout">
    <!-- header section start -->
    <div class="header_section header_main">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo"><a href="#"><img src="images/logo.png"></a></div>
                </div>
                <div class="col-sm-9">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                             <% String username = (String)session.getAttribute("tendangnhap");
                             if(session!= null){
                                 out.print(username);
                             }
                             %>
                                <a class="nav-item nav-link" href="index.html">Home</a>
                                <a class="nav-item nav-link" href="collection.html">Collection</a>
                                <a class="nav-item nav-link" href="shoes.html">Shoes</a>
                                <a class="nav-item nav-link" href="racing boots.html">Racing Boots</a>
                                <a class="nav-item nav-link" href="contact.html">Contact</a>
                                <a class="nav-item nav-link last" href="#"><img src="images/search_icon.png"></a>
                                <a class="nav-item nav-link last" href="contact.html"><img
                                        src="images/shop_icon.png"></a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- New Arrivals section start -->
    <!-- <div class="collection_text">Shoes</div>
    <div class="collection_section layout_padding">
        <div class="container">
            <h1 class="new_text"><strong>New Arrivals Products</strong></h1>
            <p class="consectetur_text">consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
        </div>
    </div> -->
    <div class="layout_padding gallery_section">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="best_shoes">
                        <p class="best_text">Best Shoes </p>
                        <div class="shoes_icon"><img src="images/shoes-img4.png"></div>
                        <div class="star_text">
                            <div class="left_part">
                                <ul>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">60</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="best_shoes">
                        <p class="best_text">Best Shoes </p>
                        <div class="shoes_icon"><img src="images/shoes-img5.png"></div>
                        <div class="star_text">
                            <div class="left_part">
                                <ul>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">400</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="best_shoes">
                        <p class="best_text">Best Shoes </p>
                        <div class="shoes_icon"><img src="images/shoes-img6.png"></div>
                        <div class="star_text">
                            <div class="left_part">
                                <ul>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">50</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="best_shoes">
                        <p class="best_text">Sports Shoes</p>
                        <div class="shoes_icon"><img src="images/shoes-img7.png"></div>
                        <div class="star_text">
                            <div class="left_part">
                                <ul>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">70</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="best_shoes">
                        <p class="best_text">Sports Shoes</p>
                        <div class="shoes_icon"><img src="images/shoes-img8.png"></div>
                        <div class="star_text">
                            <div class="left_part">
                                <ul>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">100</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="best_shoes">
                        <p class="best_text">Sports Shoes</p>
                        <div class="shoes_icon"><img src="images/shoes-img9.png"></div>
                        <div class="star_text">
                            <div class="left_part">
                                <ul>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                    <li><a href="#"><img src="images/star-icon.png"></a></li>
                                </ul>
                            </div>
                            <div class="right_part">
                                <div class="shoes_price">$ <span style="color: #ff4e5b;">90</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="buy_now_bt">
                <button class="buy_text">Buy Now</button>
            </div>
        </div>
    </div>
    
    <!-- section footer end -->
    <div class="copyright"> Dang Hieu - Bao Thai - Hoai Bao </div>


    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- javascript -->
    <script src="js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: "none",
                closeEffect: "none"
            });


            $('#myCarousel').carousel({
                interval: false
            });

            //scroll slides on swipe for touch enabled devices

            $("#myCarousel").on("touchstart", function (event) {

                var yClick = event.originalEvent.touches[0].pageY;
                $(this).one("touchmove", function (event) {

                    var yMove = event.originalEvent.touches[0].pageY;
                    if (Math.floor(yClick - yMove) > 1) {
                        $(".carousel").carousel('next');
                    }
                    else if (Math.floor(yClick - yMove) < -1) {
                        $(".carousel").carousel('prev');
                    }
                });
                $(".carousel").on("touchend", function () {
                    $(this).off("touchmove");
                });
            });
        });
    </script>
</body>

</html>