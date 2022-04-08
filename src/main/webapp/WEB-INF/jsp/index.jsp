

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <!-- <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"> -->
    <title>Trang Chủ</title>
</head>

<body>
    <div class="container">
        <div class="content">
            <div class="top_nav">
                <a href="/" class="active_background">Home Page</a>
               
            </div>
            <div class="slideshow-container">
                <div class="mySlides">
                    <img src="/images/image6.jpg" style="width:100%" height="600px">
                </div>
                <div class="mySlides">
                    <img src="/images/image1.jpg" style="width:100%" height="600px">
                </div>
                <div class="mySlides">
                    <img src="/images/image2.jpg" style="width:100%" height="600px">

                </div>
                <div class="mySlides">
                    <img src="/images/image3.jpg" style="width:100%" height="600px">

                </div> <div class="mySlides">
                    <img src="/images/image4.jpg" style="width:100%" height="600px">

                </div> <div class="mySlides">
                    <img src="/images/image5.jpg" style="width:100%" height="600px">

                </div>
            </div>
            <div class="Go-Menu">
                <a href="/login"> Click for login or Sign up </a>
            </div>
            <div id="dot" style="text-align:center">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>
    </div>
<!-

 
</body>
<script>
    var slideIndex = 0;
    showSlides();
    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 2000);
    }


</script>

</html>