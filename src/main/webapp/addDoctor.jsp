
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
 <%
	if(session.getAttribute("id") == null){
		response.sendRedirect("receptionistLogin.jsp");
	}

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor </title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    
<style type="text/css">
  /* General styles */
  body {
    background-image: url('images/bd10.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    background-repeat: no-repeat;
    font-family: Arial, sans-serif;
  }

  /* Styles for the form with animations */
  .book {
    background: rgba(245, 245, 245, 0.4);
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px;
    animation: fadeIn 1s ease-in-out;
  }

  .heading span {
    font-size: 36px;
    font-weight: bold;
    display: block;
    margin-bottom: 10px;
    color: #3498db;
  }

  .row {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    animation: slideIn 1s ease-in-out;
  }

  .image {
    flex: 1;
    text-align: center;
  }

  .image img {
    max-width: 100%;
    height: auto;
  }

  form {
    flex: 1;
    text-align: left;
  }

  label {
    display: inline-block;
    width: 150px;
    margin-right: 10px;
    font-weight: bold;
    font-size: 18px;
    color: #333;
  }

  .box {
    width: 75%;
    display: inline-block;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  form .box:focus {
    outline: none;
    border-color: #3498db;
  }

  .btn12 {
    background-color: #3498db;
    color: #fff;
    padding: 10px 20px;
    font-size: 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    transition: background-color 0.3s ease;
    animation: fadeIn 1s ease-in-out;
  }

  .btn12:hover {
    background-color: #2980b9;
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
      transform: translateX(-100px);
    }
    100% {
      transform: translateX(0);
    }
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
/* Style for the NIC input field */
input[name="nic"] {
  width: 75%;
  padding: 10px;
  font-size: 16px;
  margin: 5px 0;
  border: 2px solid #3498db; /* Blue border */
  border-radius: 5px;
  transition: border 0.3s; /* Smooth border transition */
}

/* Style for the validation message */
input[name="nic"]:invalid {
  border-color: #e74c3c; /* Red border for invalid input */
}

/* Style for the validation message */
input[name="nic"]:valid {
  border-color: #2ecc71; /* Green border for valid input */
}

/* Style for the title attribute (tooltip) */
input[name="nic"]:invalid::before {
  content: attr(title);
  color: #e74c3c; /* Red color for invalid message */
  font-size: 14px;
}

/* Style for the title attribute (tooltip) */
input[name="nic"]:valid::before {
  content: attr(title);
  color: #2ecc71; /* Green color for valid message */
  font-size: 14px;
}





</style>

    

</head>
<body>
    

<jsp:include page="header.jsp"></jsp:include> 
<!-- booking section starts   -->

  <div class="b1">
    <section class="book" id="book">

      <h1 class="heading"> 
		<c:if test="${doctor != null}">
            Edit Details
		</c:if>
		<c:if test="${doctor == null}">
			 Add Doctor
        </c:if>
	  </h1>



      <div class="row">
        <div class="image">
          <img src="images/2.svg" alt="">
        </div>

        <c:if test="${doctor != null}">
             <form action="doc_update" method="post" class="transparent-form" onsubmit="return validateMobileNumber(); "onsubmit="return validateBirhtDay(); ">
        </c:if>
        <c:if test="${doctor == null}">
			  <form action="doc_insert" method="post" class="transparent-form" onsubmit="return validateMobileNumber(); " onsubmit="return validateBirhtDay(); ">
		</c:if>
		
		
		<c:if test="${doctor != null}">
              <input type="hidden" name="id" value="<c:out value='${doctor.id}' />" />
        </c:if>
          <label for="name">Doctor Name :</label>
          <input type="text" class="box" name ="name" value="<c:out value='${doctor.name}' />" required>
          <br><br>

          <label for="name">Email :</label>
          <input type="email" class="box" align="right" name ="email" value="<c:out value='${doctor.email}' />" required>
          <br><br>

          <label for="name">Mobile no :</label>
          <input type="text" class="box" name ="mobile" value="<c:out value='${doctor.mobile}' />" required>
          <br><br>

          <label for="name">Date of Birth :</label>
          <input type="date" class="box" name ="dob" value="<c:out value='${doctor.dob}' />" max="<%= (new java.text.SimpleDateFormat("yyyy-MM-dd")).format(new java.util.Date()) %>"required>
          <br><br>
          
          <label for="name">NIC :</label>
          <input type="text" class="box" name ="nic" value="<c:out value='${doctor.nic}' />" pattern="[0-9]{12}" title="NIC should contain exactly 12 digits" required>
          <br><br>

          <label for="name">Qualification :</label>
          <input type="text" class="box" name ="quil" value="<c:out value='${doctor.qualification}' />" required>
          <br><br>

          <label for="name">Specialization :</label>
          <select class="box" name ="specil">
          
          <option selected>
              <c:if test="${doctor != null}">
                    <c:out value='${doctor.specialization}' />
			  </c:if>
              <c:if test="${doctor == null}">
                     Choose Specialization
              </c:if>
            </option>
            <option value="Internal medicine">Internal medicine</option>
            <option value="Family medicine">Surgeon</option>
            <option value="Psychiatry">Psychiatry</option>
            <option value="Psychiatry">Other</option>
          </select>
          <br>

          <input type="submit" <c:if test="${doctor != null}"> value = "Update Details" </c:if> <c:if test="${doctor == null}">value = "Add Now"</c:if> class="btn12">
        </form>

      </div>

    </section>
    <br><br><br>
  </div>
	<jsp:include page="footer.jsp"></jsp:include> 
	
	<script type="text/javascript">
  function validateMobileNumber() {
    var mobileInput = document.getElementsByName("mobile")[0]; 
    var mobileValue = mobileInput.value;

    
    var mobilePattern = /^0\d{9}$/;

    if (!mobilePattern.test(mobileValue)) {
      alert("Mobile number should have 10 digits and start with 0.");
      mobileInput.focus();
      return false;
    }

    return true;
  }
  
  function validateBirhtDay() {
	   
	    var expirationInput = document.getElementsByName("dob")[0];

	    // Validate Dosage (numeric value)

	    // Validate Expiration Date (not empty and after the current date)
	    var expirationValue = new Date(expirationInput.value);
	    var currentDate = new Date();

	    if (isNaN(expirationValue) || expirationValue > currentDate) {
	      alert("Date of Birth should be a past date.");
	      expirationInput.focus();
	      return false;
	    }

	    return true; // Form submission proceeds if all validations pass
	  }
  
  
 </script>
</body>
</html>