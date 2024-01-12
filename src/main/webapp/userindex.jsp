<%
	if(session.getAttribute("name") == null){
		response.sendRedirect("login.jsp");
	}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Mico</title>


    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  
    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  
    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  
    <!-- font awesome style -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- nice select -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
      integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />
    <!-- datepicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />
    
     <style type="text/css">
     body {
		    background-image: url('images/bbg.jpg'); /* Replace with the path to your image */
		    background-size: cover; /* Scales the image to cover the entire viewport */
		    background-position: center; /* Centers the image horizontally and vertically */
		    background-attachment: fixed; /* Keeps the background fixed while scrolling */
		    background-repeat: no-repeat; /* Prevents the image from repeating */
		    
		    font-family: Arial, sans-serif; /* Font style for the content */
		}
		
		/* Stylish welcome h1 with animations */
	h1 {
	    font-size: 48px;
	    color: #2ecc71; /* Text color */
	    text-align: center;
	    margin-top: 20px; /* Add spacing from the previous h1 tag */
	    font-family: "Pacifico", cursive; /* Unique font family */
	    text-transform: uppercase; /* Uppercase text */
	    letter-spacing: 4px; /* Adjust letter spacing */
	    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Text shadow effect */
		animation: fadeIn 1s ease-in-out; /* Fade-in animation */
	}
	
	/* Animation keyframes for fade-in */
	@keyframes fadeIn {
	    0% {
	        opacity: 0;
	        transform: translateY(-10px); /* Start slightly above its position */
	    }
	    100% {
	        opacity: 1;
	        transform: translateY(0); /* End position */
	    }
	}
	}
		
    </style>
  
  </head>

  <body>
    <!-- header section strats -->
    <header class="header_section">
        <div class="header_top">
          <div class="container">
            <div class="contact_nav">
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call : +01 123455678990
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  Email : demo@gmail.com
                </span>
              </a>
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="header_bottom">
          <div class="container-fluid">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
              <a class="navbar-brand" href="index.html">
                <img src="images/logo.png" alt="">
              </a>
  
  
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""> </span>
              </button>
  
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="d-flex mr-auto flex-column flex-lg-row align-items-center">
                  <ul class="navbar-nav  ">
                    <li class="nav-item active">
                      <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="about.html"> About</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="treatment.html">Treatment</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="doctor.html">Doctors</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="testimonial.html">Testimonial</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="contact.html">Contact Us</a>
                    </li>
                  </ul>
                </div>
                <div class="quote_btn-container">
                  <a href="out">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <span>
                      Log Out
                    </span>
                  </a>

                  
                  <form class="form-inline">
                    <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                      <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                  </form>
                </div>
              </div>
            </nav>
          </div>
        </div>
      </header>
<h1>Hello <%=session.getAttribute("name") %> !!</h1>
<div class="menu-container">

    <div class="content">
        <a href="<%=request.getContextPath()%>/new">
        <img src="images/temp/add-app.gif" alt="">
        <h3>Add Appointment</h3>
        <p><!--Little description--></p>
      
        <button class="buy-1">Click Here</button></a>
    </div>
    
    <div class="content">
			<a href="<%=request.getContextPath()%>/list"> <img
				src="images/temp/view-app.gif" alt="">
				<h3>My Appointment</h3>

				<button class="buy-2">Click Here</button></a>
		</div>
    
    <div class="content">
        <a href="#">
        <img src="images/temp/profile.gif" alt="">
        <h3>My Profile</h3>
        <p><!--Little description--></p>
       
        <button class="buy-3">Click Here</button></a>
    </div>
    
    
    <div class="content">
        <a href="#">
        <img src="images/temp/contact.gif" alt="">
        <h3>Contact Us</h3>
        <p><!--Little description--></p>
       
        <button class="buy-4">Click Here</button></a>
    </div>
    

</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

      <section class="info_section ">
        <div class="container">
          <div class="info_top">
            <div class="info_logo">
              <a href="">
                <img src="images/logo.png" alt="">
              </a>
            </div>
            <div class="info_form">
              <form action="">
                <input type="email" placeholder="Your email">
                <button>
                  Subscribe
                </button>
              </form>
            </div>
          </div>
          <div class="info_bottom layout_padding2">
            <div class="row info_main_row">
              <div class="col-md-6 col-lg-3">
                <h5>
                  Address
                </h5>
                <div class="info_contact">
                  <a href="">
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                    <span>
                      Location
                    </span>
                  </a>
                  <a href="">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                    <span>
                      Call +01 1234567890
                    </span>
                  </a>
                  <a href="">
                    <i class="fa fa-envelope"></i>
                    <span>
                      demo@gmail.com
                    </span>
                  </a>
                </div>
                <div class="social_box">
                  <a href="">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                  </a>
                  <a href="">
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                  </a>
                  <a href="">
                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                  </a>
                  <a href="">
                    <i class="fa fa-instagram" aria-hidden="true"></i>
                  </a>
                </div>
              </div>
              <div class="col-md-6 col-lg-3">
                <div class="info_links">
                  <h5>
                    Useful link
                  </h5>
                  <div class="info_links_menu">
                    <a class="active" href="index.html">
                      Home
                    </a>
                    <a href="about.html">
                      About
                    </a>
                    <a href="treatment.html">
                      Treatment
                    </a>
                    <a href="doctor.html">
                      Doctors
                    </a>
                    <a href="testimonial.html">
                      Testimonial
                    </a>
                    <a href="contact.html">
                      Contact us
                    </a>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3">
                <div class="info_post">
                  <h5>
                    LATEST POSTS
                  </h5>
                  <div class="post_box">
                    <div class="img-box">
                      <img src="images/post1.jpg" alt="">
                    </div>
                    <p>
                      Normal
                      distribution
                    </p>
                  </div>
                  <div class="post_box">
                    <div class="img-box">
                      <img src="images/post2.jpg" alt="">
                    </div>
                    <p>
                      Normal
                      distribution
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3">
                <div class="info_post">
                  <h5>
                    News
                  </h5>
                  <div class="post_box">
                    <div class="img-box">
                      <img src="images/post3.jpg" alt="">
                    </div>
                    <p>
                      Normal
                      distribution
                    </p>
                  </div>
                  <div class="post_box">
                    <div class="img-box">
                      <img src="images/post4.png" alt="">
                    </div>
                    <p>
                      Normal
                      distribution
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- end info_section -->
    
    
      <!-- footer section -->
      <footer class="footer_section">
        <div class="container">
          <p>
            &copy; <span id="displayYear"></span> All Rights Reserved By
            <a href="https://html.design/">Free Html Templates</a>
          </p>
        </div>
      </footer>
  </body>
</html>