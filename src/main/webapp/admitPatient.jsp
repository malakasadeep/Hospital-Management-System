
    
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
    <title>Admit Patient </title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style4.css">
    <style type="text/css">
    body {
    background-image: url('images/bbg.jpg'); /* Replace with the path to your image */
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
<!-- booking section starts   -->

  <div class="b1">
    <section class="book" id="book">

      <h1 class="heading"> 
		<c:if test="${admit != null}">
            <span>Edit</span> Details
		</c:if>
		<c:if test="${admit == null}">
			 <span>Admit</span> Patient
        </c:if>
	  </h1>



      <div class="row">
        <div class="image">
          <img src="images/admit.png" alt="" >
        </div>

        <c:if test="${admit != null}">
             <form action="patient_update" method="post"  onsubmit="return validateMobileNumber(); " >
        </c:if>
        <c:if test="${admit == null}">
			  <form action="patient_insert" method="post" onsubmit="return validateMobileNumber(); " >
		</c:if>
		
		
		<c:if test="${admit != null}">
              <input type="hidden" name="id" value="<c:out value='${admit.id}' />" />
        </c:if>
          <label for="name">Patient Name :</label>
          <input type="text" class="box" name ="name" value="<c:out value='${admit.name}' />" required>
          <br>

          <label for="name">Age :</label>
          <input type="number" class="box" align="right" name ="age" value="<c:out value='${admit.age}' />" id = "mobile" required>
          <br>

          <label for="name">Mobile no :</label>
          <input type="number" class="box" name ="mobile" value="<c:out value='${admit.mobile}' />" required>
          <br>

          <label for="name">Gender :</label>
          <select class="box" name ="gender">
          
          <option selected>
              <c:if test="${admit != null}">
                    <c:out value='${admit.gender}' />
			  </c:if>
              <c:if test="${admit == null}">
                     Choose Gender
              </c:if>
            </option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
          </select>
          <br>
          
          <label for="name">NIC :</label>
          <input type="text" class="box" id="nic" name="nic" pattern="[0-9]{12}" title="NIC should contain exactly 12 digits" value="<c:out value='${admit.nic}' />"required>
          <br>

          <label for="name">Disease :</label>
          <input type="text" class="box" name ="disease" value="<c:out value='${admit.disease}' />">
          <br>

          <label for="name">Blood Group :</label>
          <select class="box" name ="blood">
          
          <option selected>
              <c:if test="${admit != null}">
                    <c:out value='${admit.blood}' />
			  </c:if>
              <c:if test="${admit == null}">
                     Choose Blood Group
              </c:if>
            </option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
          </select>
          <br>

          <input type="submit" <c:if test="${admit != null}"> value = "update details" </c:if> <c:if test="${admit == null}">value = "admit"</c:if> class="btn12">
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
  
  
</script>


	
	

</body>
</html>