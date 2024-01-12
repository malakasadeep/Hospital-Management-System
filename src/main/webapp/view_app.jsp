<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Mico</title>

    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <style>
    
    	
        body {
		    background-image: url('images/bg8.jpg'); /* Replace with the path to your image */
		    background-size: cover; /* Scales the image to cover the entire viewport */
		    background-position: center; /* Centers the image horizontally and vertically */
		    background-attachment: fixed; /* Keeps the background fixed while scrolling */
		    background-repeat: no-repeat; /* Prevents the image from repeating */
		    
		    font-family: Arial, sans-serif; /* Font style for the content */
		}
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #fff;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
            transform: scale(1.02);
            transition: transform 0.3s;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }
      
      /* Styles for the h1 tag on the other page */
h1 {
    font-size: 48px;
    color: #3498db; /* Text color */
    text-align: center;
    margin-top: 20px; /* Add spacing from the previous h1 tag */
    font-family: "Helvetica Neue", sans-serif; /* Custom font family */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Text shadow effect */
    letter-spacing: 2px; /* Adjust letter spacing */
    animation: rotateScale 1s ease-in-out alternate infinite; /* Rotate and scale animation */
}

/* Animation keyframes for rotation and scaling */
@keyframes rotateScale {
    0% {
        transform: scale(1) rotate(0deg);
    }
    50% {
        transform: scale(1.1) rotate(15deg); /* Rotate and scale up at 50% mark */
    }
    100% {
        transform: scale(1) rotate(0deg);
    }
}
      /* Styles for the h1 tag with background animation */
	h1 {
	    font-size: 48px;
	    color: #ffffff; /* Text color */
	    text-align: center;
	    margin-top: 20px; /* Add spacing from the previous h1 tag */
	    background: linear-gradient(45deg, #3498db, #e74c3c); /* Gradient background */
	    -webkit-background-clip: text; /* Clip text to the background */
	    background-clip: text; /* Clip text to the background */
	    -webkit-text-fill-color: transparent; /* Hide the text color */
	    animation: backgroundPulse 2s ease-in-out alternate infinite; /* Background pulse animation */
	}
	
	/* Animation keyframes for background pulse */
	@keyframes backgroundPulse {
	    0% {
	        background-size: 100% 100%; /* Initial background size */
	    }
	    50% {
	        background-size: 110% 110%; /* Slightly larger background at 50% */
	    }
	    100% {
	        background-size: 100% 100%; /* Return to the initial size */
	    }
	}
	      
    </style>






</head>

<body>
    <jsp:include page="header.jsp"></jsp:include> 
    
    <h1 class="animated-element"> My Appointments</h1>
        

        <div class="table-container">

            <table>
                <tr>
                    <th>Appointment ID</th>
                    <th>Department</th>
                    <th>Doctor Name</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Diseases</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Action</th>
                </tr>
				<c:forEach var = "appointment" items = "${listAppointment}">
				<tr> 
				
					<td><c:out value="${appointment.id}" /></td>
					<td><c:out value="${appointment.department}" /></td>
					<td><c:out value="${appointment.docName}" /></td>
					<td><c:out value="${appointment.name}" /></td>
					<td><c:out value="${appointment.email}" /></td>
					<td><c:out value="${appointment.age}" /></td>
					<td><c:out value="${appointment.diseases}" /></td>
					<td><c:out value="${appointment.date}" /></td>
					<td><c:out value="${appointment.time}" /></td>
					<td><a href="edit?id=<c:out value='${appointment.id}' />"><i class="fa-solid fa-pen-to-square  fa-2xl"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?id=<c:out value='${appointment.id}' />"><i class="fa-solid fa-trash fa-2xl" style="color: #f20707;"></i></a></td>
					
				
				</tr>
				</c:forEach>
            </table>

        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br>

        <jsp:include page="footer.jsp"></jsp:include> 
        
        <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
        	  const animatedElement = document.querySelector('.animated-element');
        	  animatedElement.classList.add('animate');
        	});


        </script>
            
</body>

</html>