<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Doctors Details</title>

    <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
    body {
		    background-image: url('images/bd10.jpg'); /* Replace with the path to your image */
		    background-size: cover; /* Scales the image to cover the entire viewport */
		    background-position: center; /* Centers the image horizontally and vertically */
		    background-attachment: fixed; /* Keeps the background fixed while scrolling */
		    background-repeat: no-repeat; /* Prevents the image from repeating */
		    
		    font-family: Arial, sans-serif; /* Font style for the content */
		}
		
		/* Styles for the table with animations */
.table-container {
    margin: 20px;
    padding: 20px;
}

table {
    width: 90%;
    border-collapse: collapse;
    animation: fadeIn 1s ease-in-out; /* Fade-in animation */
    margin-left: 50px;
}

th, td {
    padding: 10px;
    text-align: left;
    animation: slideIn 0.5s ease-in-out; /* Slide-in animation */
}

th {
    background-color: #3498db;
    color: #fff;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:nth-child(odd) {
    background-color: #e6e6e6;
}

/* Add hover effect to rows for interactivity */
tr:hover {
    background-color: #00c6a9;
    color: #fff;
    cursor: pointer;
    animation: pulse 0.5s ease-in-out alternate infinite; /* Pulse animation on hover */
}

a {
    text-decoration: none;
    color: #3498db;
    margin-right: 10px;
}

a:hover {
    color: #e74c3c;
}

/* Animation keyframes */
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

@keyframes slideIn {
    0% {
        transform: translateX(-20px);
    }
    100% {
        transform: translateX(0);
    }
}


		
		/* Styles for edit and delete buttons */
a.edit-button, a.delete-button {
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 5px;
    color: #fff;
    font-weight: bold;
    transition: background-color 0.3s ease, color 0.3s ease;
}

a.edit-button {
    background-color: #27ae60;
}

a.delete-button {
    background-color: #e74c3c;
}

a.edit-button:hover {
    background-color: #219651;
}

a.delete-button:hover {
    background-color: #d7382a;
}

/* Additional spacing for the buttons */
a.edit-button {
    margin-right: 10px;
}

h1 {
  font-size: 36px;
  color: #3498db;
  text-align: center;
  background-color: #fff;
  padding: 10px;
  display: inline-block;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  animation: fadeIn 1s linear;
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
		
    </style>

</head>

<body>
    <jsp:include page="header.jsp"></jsp:include> 
    <h1>Doctors Details</h1>
        

        <div class="table-container">

            <table>
                <tr>
                    <th>Doctor ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile No</th>
                    <th>Date of Birth</th>
                    <th>NIC</th>
                    <th>Qualification</th>
                    <th>Specialization</th>
                    <th>Action</th>
                    
                </tr>
				<c:forEach var = "doctor" items = "${listDoctor}">
				<tr> 
				
					<td><c:out value="${doctor.id}" /></td>
					<td><c:out value="${doctor.name}" /></td>
					<td><c:out value="${doctor.email}" /></td>
					<td><c:out value="${doctor.mobile}" /></td>
					<td><c:out value="${doctor.dob}" /></td>
					<td><c:out value="${doctor.nic}" /></td>
					<td><c:out value="${doctor.qualification}" /></td>
					<td><c:out value="${doctor.specialization}" /></td>
					<td><a href="doc_edit?id=<c:out value='${doctor.id}' />" class="edit-button">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="doc_delete?id=<c:out value='${doctor.id}' />" class = "delete-button">Delete</a></td>
					
				
				</tr>
				</c:forEach>
            </table>

        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br>

        <jsp:include page="footer.jsp"></jsp:include> 
            
</body>

</html>