<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Medicine Details</title>

    <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
    body {
		    background-image: url('images/bg11.jpg'); /* Replace with the path to your image */
		    background-size: cover; /* Scales the image to cover the entire viewport */
		    background-position: center; /* Centers the image horizontally and vertically */
		    background-attachment: fixed; /* Keeps the background fixed while scrolling */
		    background-repeat: no-repeat; /* Prevents the image from repeating */
		    
		    font-family: Arial, sans-serif; /* Font style for the content */
		}
		
		/* Styles for the medication table with animations */
/* Styles for the medication table with animations and a transparent background */
.table-container {
    background: rgba(245, 245, 245, 0.4); /* Transparent background with 80% opacity */
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px;
    animation: fadeIn 1s ease-in-out; /* Fade-in animation */
    width : 75%;
    margin-left :170px;
}


table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #e0e0e0;
    animation: fadeIn 1s ease-in-out; /* Fade-in animation */
}

th {
    background: #3498db;
    color: #fff;
}

tr:nth-child(even) {
    background: #f2f2f2;
    animation: slideIn 1s ease-in-out; /* Slide-in animation */
}

tr:nth-child(odd) {
    background: #e6e6e6;
    animation: slideIn 1s ease-in-out; /* Slide-in animation */
}

/* Style for action buttons with hover effect */
a.edit-button, a.delete-button {
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 5px;
    color: #fff;
    font-weight: bold;
    transition: background-color 0.3s ease, color 0.3s ease;
    animation: pulse 0.5s ease-in-out alternate infinite; /* Pulse animation on hover */
}

a.edit-button {
    background: #27ae60;
}

a.delete-button {
    background: #e74c3c;
}

a.edit-button:hover {
    background: #219651;
}

a.delete-button:hover {
    background: #d7382a;
}

/* Hover effect on table rows */
tr:hover {
    background: #3498db;
    color: #fff;
    cursor: pointer;
}

/* Additional spacing for the buttons */
a.edit-button {
    margin-right: 10px;
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

@keyframes pulse {
    0% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.05);
    }
    100% {
        transform: scale(1);
    }
}
/* Styles for the h1 tag with animations */
h1 {
    font-size: 36px; /* Adjust the font size as needed */
    font-weight: bold;
    color: #3498db; /* Change the text color as needed */
    text-align: center; /* Center align the text */
    margin: 0; /* Remove any default margin */
    padding: 20px; /* Add some padding for spacing */
    background-color: #f5f5f5; /* Background color for contrast */
    border-radius: 10px; /* Add rounded corners */
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
    animation: slideIn 2s ease-in-out; /* Add the fade-in animation */
    width: 75%;
    margin-left: 170px;
    
  }

  @keyframes slideIn {
    0% {
      opacity: 0;
      transform: translateY(-20px); /* Start with a slight upward shift */
    }
    100% {
      opacity: 1;
      transform: translateY(0); /* End at the original position */
    }
  }

		
    </style>

</head>

<body>
    <jsp:include page="header.jsp"></jsp:include> 
        
<h1>Medicine Details</h1>
        <div class="table-container">

            <table>
                <tr>
                    <th>Med ID</th>
                    <th>Name</th>
                    <th>Dosage</th>
                    <th>Quantity</th>
                    <th>Expiration Date</th>
                    <th>Type Of Medication</th>
                    <th>Notes</th>
                    <th>Action</th>
                    
                </tr>
				<c:forEach var = "med" items = "${listMed}">
				<tr> 
				
					<td><c:out value="${med.id}" /></td>
					<td><c:out value="${med.name}" /></td>
					<td><c:out value="${med.dosage}" /></td>
					<td><c:out value="${med.qty}" /></td>
					<td><c:out value="${med.expdate}" /></td>
					<td><c:out value="${med.type}" /></td>
					<td><c:out value="${med.notes}" /></td>
					<td><a href="med_edit?id=<c:out value='${med.id}' />" class = "edit-button">Edit</a> <br><br>  <a href="med_delete?id=<c:out value='${med.id}' />" class = "delete-button">Delete</a></td>
					
				
				</tr>
				</c:forEach>
            </table>

        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br>

        <jsp:include page="footer.jsp"></jsp:include> 
            
</body>

</html>