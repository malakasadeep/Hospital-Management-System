
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Medication </title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    
    
    <style type="text/css">
  body {
    background-image: url('images/bg11.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    background-repeat: no-repeat;
    font-family: Arial, sans-serif;
  }

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
    font-size: 28px;
    font-weight: bold;
    display: block;
    margin-bottom: 10px;
    color: #fff;
    animation: slideIn 1s ease-in-out;
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

  img {
    max-width: 100%;
    height: auto;
  }

  form {
    flex: 1;
    text-align: left;
    animation: slideIn 1s ease-in-out;
  }

  label {
    display: inline-block;
    width: 200px;
    font-size: 18px;
    margin-top: 10px;
    color: #333;
    font-weight: bold;
  }

  .box,
  select.box,
  textarea#notes {
    width: 70%;
    padding: 10px;
    font-size: 16px;
    margin: 5px 0;
    border: none;
    border-radius: 5px;
    animation: fadeIn 1s ease-in-out;
    transition: background-color 0.3s ease;
  }

  .box:focus,
  select.box:focus,
  textarea#notes:focus {
    outline: none;
    border-color: #3498db;
    background-color: #f0f0f0;
  }

  select.box {
    color: #555;
    background-color: #f5f5f5;
  }

  .btn12 {
    background-color: #3498db;
    color: #fff;
    padding: 10px 20px;
    font-size: 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
    animation: pulse 0.5s ease-in-out alternate infinite;
  }

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
      opacity: 0;
      transform: translateY(-20px);
    }
    100% {
      opacity: 1;
      transform: translateY(0);
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
<!-- booking section starts   -->

  <div class="b1">
    <section class="book" id="book">

      <h1 class="heading"> 
		<c:if test="${med != null}">
            Edit Details
		</c:if>
		<c:if test="${med == null}">
			 Add Medication
        </c:if>
	  </h1>



      <div class="row">
        <div class="image">
          <img src="images/aa.png" alt="" width ="100%">
        </div>

        <c:if test="${med != null}">
             <form action="med_update" method="post" onsubmit="return validateMedicationForm();">
        </c:if>
        <c:if test="${med == null}">
			  <form action="med_insert" method="post" onsubmit="return validateMedicationForm();">
		</c:if>
		
		
		<c:if test="${med != null}">
              <input type="hidden" name="id" value="<c:out value='${med.id}' />" />
        </c:if>
          <label for="name">Medication Name :</label>
          <input type="text" class="box" name ="name" value="<c:out value='${med.name}' />" required>
          <br>

          <label for="name">Dosage :</label>
          <input type="number" class="box" align="right" name ="dosage" value="<c:out value='${med.dosage}' />" required>
          <br>

          <label for="name">Quantity :</label>
          <input type="number" class="box" name ="qty" value="<c:out value='${med.qty}' />" required>
          <br>

          <label for="name">Expiration Date :</label>
          <input type="date" class="box" name ="exd" value="<c:out value='${med.expdate}' />"  min="<%= (new java.text.SimpleDateFormat("yyyy-MM-dd")).format(new java.util.Date()) %>" required>
          <br>
          

          <label for="name">Type of Medication :</label>
          <select class="box" name ="type">
          
          <option selected>
              <c:if test="${med != null}">
                    <c:out value='${med.type}' />
			  </c:if>
              <c:if test="${med == null}">
                     Choose Type
              </c:if>
            </option>
            <option value="Liquid">Liquid</option>
            <option value="Tablet">Tablet</option>
            <option value="Capsules">Capsules</option>
            <option value="Other">Other</option>
          </select>
          <br><br><br>
          
          <label for="name">Additional Notes :</label>
          <textarea id="notes" class="box" name="notes" rows="4" cols="50"><c:out value='${med.notes}' /></textarea><br><br>

          <input type="submit" <c:if test="${med != null}"> value = "Update Details" </c:if> <c:if test="${med == null}">value = "Add Now"</c:if> class="btn12">
        </form>

      </div>

    </section>
    <br><br><br>
  </div>
	<jsp:include page="footer.jsp"></jsp:include> 
	
	<script type="text/javascript">
  function validateMedicationForm() {
    var dosageInput = document.getElementsByName("dosage")[0];
    var quantityInput = document.getElementsByName("qty")[0];
    var expirationInput = document.getElementsByName("exd")[0];

    // Validate Dosage (numeric value)
    var dosageValue = dosageInput.value;
    if (!/^\d+$/.test(dosageValue)) {
      alert("Dosage should be a numeric value.");
      dosageInput.focus();
      return false;
    }

    // Validate Quantity (numeric value)
    var quantityValue = quantityInput.value;
    if (!/^\d+$/.test(quantityValue)) {
      alert("Quantity should be a numeric value.");
      quantityInput.focus();
      return false;
    }

    // Validate Expiration Date (not empty and after the current date)
    var expirationValue = new Date(expirationInput.value);
    var currentDate = new Date();

    if (isNaN(expirationValue) || expirationValue <= currentDate) {
      alert("Expiration Date should be a future date.");
      expirationInput.focus();
      return false;
    }

    return true; // Form submission proceeds if all validations pass
  }
</script>
	

</body>
</html>