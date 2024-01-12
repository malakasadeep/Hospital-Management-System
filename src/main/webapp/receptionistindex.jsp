<%
	if(session.getAttribute("id") == null){
		response.sendRedirect("receptionistLogin.jsp");
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
        integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />
    <!-- datepicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />
    <style type="text/css">
    body {
		    background-image: url('images/bbb.jpg'); /* Replace with the path to your image */
		    background-size: cover; /* Scales the image to cover the entire viewport */
		    background-position: center; /* Centers the image horizontally and vertically */
		    background-attachment: fixed; /* Keeps the background fixed while scrolling */
		    background-repeat: no-repeat; /* Prevents the image from repeating */
		    
		    font-family: Arial, sans-serif; /* Font style for the content */
		}
    </style>

</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="menu-container">

        <div class="content">
            <a href="<%=request.getContextPath()%>/patient_new">
                <img src="images/temp/admit patient.gif" alt="">
                <h3>Admit a Patient</h3>
                <p><!--Little description--></p>

                <button class="buy-1">Click Here</button>
            </a>
        </div>

        <div class="content">
            <a href="<%=request.getContextPath()%>/patient_list">
                <img src="images/temp/admited patient.gif" alt="">
                <h3>Admited Patient List</h3>

                <button class="buy-2">Click Here</button>
            </a>
        </div>

        <div class="content">
            <a href="<%=request.getContextPath()%>/doc_new">
                <img src="images/temp/add Doctor.gif" alt="">
                <h3>Add a Doctor</h3>
                <p><!--Little description--></p>

                <button class="buy-3">Click Here</button>
            </a>
        </div>


        <div class="content">
            <a href="<%=request.getContextPath()%>/doc_list">
                <img src="images/temp/doctors list.gif" alt="">
                <h3>View Doctors Details</h3>
                <p><!--Little description--></p>

                <button class="buy-4">Click Here</button>
            </a>
        </div>

        <div class="content">
            <a href="<%=request.getContextPath()%>/med_new">
                <img src="images/temp/addMedicine.gif" alt="">
                <h3>Add Medicine</h3>
                <p><!--Little description--></p>

                <button class="buy-1">Click Here</button>
            </a>
        </div>

        <div class="content">
            <a href="<%=request.getContextPath()%>/med_list">
                <img src="images/temp/Medicine list.gif" alt="">
                <h3>Medicine Stock</h3>
                <p><!--Little description--></p>

                <button class="buy-2">Click Here</button>
            </a>
        </div>

        <div class="content">
            <a href="#">
                <img src="images/temp/view-app.gif" alt="">
                <h3>View Appointments</h3>
                <p><!--Little description--></p>

                <button class="buy-3">Click Here</button>
            </a>
        </div>

        <div class="content">
            <a href="#">
                <img src="images/temp/Feedback .gif" alt="">
                <h3>View User Feedback</h3>
                <p><!--Little description--></p>

                <button class="buy-4">Click Here</button>
            </a>
        </div>


    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>