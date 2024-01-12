<%
	if(session.getAttribute("name") == null){
		response.sendRedirect("login.jsp");
	}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Mico</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

     <!-- Custom styles for this template -->
     <link href="appointment/css/style.css" rel="stylesheet" />
     <!-- responsive style -->
     <link href="appointment/css/responsive.css" rel="stylesheet" />

      <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="appointment/css/bootstrap.css" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="appointment/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="appointment/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="appointment/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="appointment/css/style3.css" rel="stylesheet">
    
    <style type="text/css">
     body {
		    background-image: url('images/bg8.jpg'); /* Replace with the path to your image */
		    background-size: cover; /* Scales the image to cover the entire viewport */
		    background-position: center; /* Centers the image horizontally and vertically */
		    background-attachment: fixed; /* Keeps the background fixed while scrolling */
		    background-repeat: no-repeat; /* Prevents the image from repeating */
		    
		    font-family: Arial, sans-serif; /* Font style for the content */
		}
    </style>

    
</head>

<body>
    <!-- Topbar Start -->
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
                      <a class="nav-link" href="userindex.jsp">Home <span class="sr-only">(current)</span></a>
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


    <!-- Appointment Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h6 class="d-inline-block text-primary text-uppercase border-bottom border-5">Appointment</h6>
                        <h1 class="display-4">Make An Appointment For Your Family</h1>
                    </div>
                    <p class="mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 me-3" href="">Find Doctor</a>
                    <a class="btn btn-outline-primary rounded-pill py-3 px-5" href="">Read More</a>
                </div>
                <div class="col-lg-6">
                    <div class="bg-light text-center rounded p-5">
                        <h1 class="mb-4">
                        <c:if test="${appointment != null}">
                              Edit Appointment
                        </c:if>
                        <c:if test="${appointment == null}">
                              Book An Appointment
                        </c:if>
                        </h1>
                        
                        <c:if test="${appointment != null}">
                            <form action="update" method="post" onsubmit="return validateMedicationForm();">
                        </c:if>
                        <c:if test="${appointment == null}">
                            <form action="insert" method="post" onsubmit="return validateMedicationForm();">
                        </c:if>
                            <div class="row g-3">
                            
                        <c:if test="${appointment != null}">
                            <input type="hidden" name="id" value="<c:out value='${appointment.id}' />" />
                        </c:if>
                                <div class="col-12 col-sm-6">
                                    <select class="form-select bg-white border-0" style="height: 55px;"   name ="dept">
                                        <option selected>
                                        	<c:if test="${appointment != null}">
                                                      <c:out value='${appointment.department}' />
                                            </c:if>
                                            <c:if test="${appointment == null}">
                                                       Choose Department
                                            </c:if>
                                        </option>
                                        <option value="Internal medicine">Internal medicine</option>
                                        <option value="Family medicine">Family medicine</option>
                                        <option value="Psychiatry">Psychiatry</option>
                                    </select>
                                </div>
                                <div class="col-12 col-sm-6">
								<select class="form-select bg-white border-0"
									style="height: 55px;" name="doctor">
									<option selected>
										<c:if test="${appointment != null}">
											<c:out value='${appointment.docName}' />
										</c:if>
										<c:if test="${appointment == null}">
                                             Choose Doctor
                                        </c:if>
									</option>
									<option value="Dr Michael">Dr Michael</option>
									<option value="Dr William">Dr William</option>
									<option value="Dr Jennifer">Dr Jennifer</option>
								</select>
							</div>
                               
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control bg-white border-0" placeholder="Your Name" style="height: 55px;" value="<c:out value='${appointment.name}' />" name ="name" required >
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="email" class="form-control bg-white border-0" placeholder="Your Email" style="height: 55px;" value="<c:out value='${appointment.email}' />" name ="email" required>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input type="number" class="form-control bg-white border-0" placeholder="Your Age" style="height: 55px;" value="<c:out value='${appointment.age}' />" name ="age" required>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control bg-white border-0" placeholder="Diseases" style="height: 55px;" value="<c:out value='${appointment.diseases}' />" name ="diseases" required>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="date" id="date" data-target-input="nearest">
                                        <input type="text"
                                            class="form-control bg-white border-0 datetimepicker-input"
                                            placeholder="Date" data-target="#date" data-toggle="datetimepicker" style="height: 55px;" value="<c:out value='${appointment.date}' />" name ="date" min="<%= (new java.text.SimpleDateFormat("yyyy-MM-dd")).format(new java.util.Date()) %>"required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="time" id="time" data-target-input="nearest">
                                        <input type="text"
                                            class="form-control bg-white border-0 datetimepicker-input"
                                            placeholder="Time" data-target="#time" data-toggle="datetimepicker" style="height: 55px;" value="<c:out value='${appointment.time}' />" name ="time" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <input class="btn btn-primary w-100 py-3" type="submit" name ="submit" value = "Make An Appointment">
                                </div>
                            </div>
                        </form>
                        
                        <script type="text/javascript">
							  function validateMedicationForm() {
							
							    var expirationInput = document.getElementsByName("date")[0];
							
							 
							
								    // Validate Expiration Date (not empty and after the current date)
								    var expirationValue = new Date(expirationInput.value);
								    var currentDate = new Date();
								
								    if (isNaN(expirationValue) || expirationValue <= currentDate) {
								      alert("Appointment Date should be a future date.");
								      expirationInput.focus();
								      return false;
								    }
								
								    return true; // Form submission proceeds if all validations pass
							  }
						</script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Appointment End -->


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


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="appointment/lib/easing/easing.min.js"></script>
    <script src="appointment/lib/waypoints/waypoints.min.js"></script>
    <script src="appointment/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="appointment/lib/tempusdominus/js/moment.min.js"></script>
    <script src="appointment/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="appointment/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="appointment/js/main.js"></script>
</body>

</html>