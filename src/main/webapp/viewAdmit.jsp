<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Admit Details</title>
    <style type="text/css">
    /* Styles for the entire page with a background image */
body {
    background-image: url('images/bbg.jpg'); /* Replace with the path to your image */
    background-size: cover; /* Scales the image to cover the entire viewport */
    background-position: center; /* Centers the image horizontally and vertically */
    background-attachment: fixed; /* Keeps the background fixed while scrolling */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    
    font-family: Arial, sans-serif; /* Font style for the content */
}

/* Add additional styles for your content here, such as text, links, etc. */
    
    
    /* Styles for the table container */
.table-container {
    background-color: #f2f2f2;
    padding: 20px;
    margin-bottom: 400px; /* Add space between table and footer */
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    animation: fadeIn 1s ease-in-out; /* Fade-in animation */
    width:70%;
    margin-left:200px;
    margin-top:50px;
    
}

/* Styles for the table */
.styled-table {
	
    width: 100%;
    border-collapse: collapse;
}

.styled-table th, .styled-table td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #e0e0e0;
}

/* Styles for table rows with hover effect */
.table-row {
    transition: background-color 0.3s ease;
}

.table-row:hover {
    background-color: #e0e0e0; /* Hover effect */
    animation: rowHighlight 0.5s alternate infinite; /* Highlight animation */
}

/* Styles for action links (Edit and Delete) */
.action-link {
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 4px;
    color: #fff;
    transition: background-color 0.3s ease;
    margin-right: 10px;
}

.edit-link {
    background-color: #3498db;
    animation: buttonPulse 0.5s alternate infinite; /* Button pulse animation */
}

.delete-link {
    background-color: #e74c3c;
    animation: buttonPulse 0.5s alternate infinite; /* Button pulse animation */
}

.edit-link:hover {
    background-color: #2980b9;
}

.delete-link:hover {
    background-color: #c0392b;
}

/* Styles for the footer */
.footer {
    padding: 20px; /* Add more space to the footer */
    background-color: #f2f2f2;
    text-align: center;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    animation: fadeIn 1s ease-in-out; /* Fade-in animation for the footer */
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

@keyframes rowHighlight {
    0% {
        background-color: #e0e0e0; /* Initial background color during animation */
    }
    100% {
        background-color: #e6e6e6; /* Highlighted row color */
    }
}

@keyframes buttonPulse {
    0% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.1);
    }
    100% {
        transform: scale(1);
    }
}

/* Styles for the h1 tag */
h1 {
	margin-top:50px:
    font-size: 36px;
    color: #3498db; /* Text color */
    text-align: center;
    animation: fadeIn 1s ease-in-out; /* Fade-in animation */
}

/* Animation keyframes */
@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(-20px); /* Start off-screen and move in */
    }
    100% {
        opacity: 1;
        transform: translateY(0); /* End position */
    }
}

/* Additional animation example: Text color change on hover */
h1:hover {
    color: #e74c3c; /* New text color on hover */
    animation: colorPulse 0.5s alternate infinite; /* Color pulse animation on hover */
}

@keyframes colorPulse {
    0% {
        color: #e74c3c; /* Initial color during animation */
    }
    100% {
        color: #3498db; /* Alternate color during animation */
    }
}

    
    </style>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    
    <h1>Patient Details</h1>

    <div class="table-container">
        <table class="styled-table">
            <tr>
                <th>Admit ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Mobile No</th>
                <th>Gender</th>
                <th>NIC</th>
                <th>Disease</th>
                <th>Blood Group</th>
                <th>Action</th>
            </tr>
            <c:forEach var="admit" items="${listAdmit}">
                <tr class="table-row">
                    <td><c:out value="${admit.id}" /></td>
                    <td><c:out value="${admit.name}" /></td>
                    <td><c:out value="${admit.age}" /></td>
                    <td><c:out value="${admit.mobile}" /></td>
                    <td><c:out value="${admit.gender}" /></td>
                    <td><c:out value="${admit.nic}" /></td>
                    <td><c:out value="${admit.disease}" /></td>
                    <td><c:out value="${admit.blood}" /></td>
                    <td>
                        <a href="patient_edit?id=<c:out value='${admit.id}' />" class="action-link edit-link">Edit</a>
                        <a href="patient_delete?id=<c:out value='${admit.id}' />" class="action-link delete-link">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
