<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="icon" href="images/bank.ico">
	<link rel="stylesheet" type="text/css" href="css/registration.css">
	<script type="text/javascript" src="javaScript/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="javaScript/jquery.easing.min.js"></script>
<body>
<!-- multistep form -->
<form action="${pageContext.request.contextPath}/Registration" method="POST" id="msform" >
	<input type="hidden" name="action" value="registration">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">Account Setup</li>
    <li>Personal Details</li>
    <li>More Details</li>
    <li>Security</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Create your account</h2>
    <h3 class="fs-subtitle">This is step 1</h3>
    <input type="text" name="first_name" placeholder="First Name" required="required" />
    <input type="text" name="last_name" placeholder="Last Name" required="required" />
    <input type="text" name="user_name" placeholder="User Name" required="required" />
    <input type="text" name="email" placeholder="Email" required="required" />
    <input type="password" name="password" placeholder="Password" required="required" />
    <input type="password" name="cpassword" placeholder="Confirm Password" required="required" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Personal Details</h2>
    <h3 class="fs-subtitle">This is step 2</h3>
    <input type="password" name="pin_number" placeholder="Pin Number" />
    <input type="text" name="mobile" placeholder="Mobile Number" required="required" />
    <input type="text" name="date_of_birth" placeholder="Date Of Birth" required="required" />
    <input type="text" name="marital_status" placeholder="Marital Status" required="required" />
    <input type="text" name="gender" placeholder="Gender" required="required" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">More Details</h2>
    <h3 class="fs-subtitle">This is step 3</h3>
      <input type="text" name="current_address" placeholder="Current Address" required="required" />
    <input type="text" name="parmanent_address" placeholder="Parmanent Address" required="required" />
    <input type="text" name="city" placeholder="City" required="required" />
    <input type="text" name="nationality" placeholder="Nationality" required="required" />
    <input type="text" name="profession" placeholder="Profession" required="required" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Security</h2>
    <h3 class="fs-subtitle">Final Step</h3>
    <input type="text" name="card_type" placeholder="Card Type" required="required" />
    <p>What is ur first pet name?</p>
    <input type="text" name="security_question1" placeholder="Security Question 1" required="required" />
    <p>Enter a secret code?</p>
    <input type="text" name="security_question2" placeholder="Security Question 2" required="required" />
    <input type="button" name="previous" class="previous action-button" value="Previous" required="required" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" required="required" />
  </fieldset>
</form>
<script type="text/javascript" src="javaScript/registration.js"></script>

</body>
</html>