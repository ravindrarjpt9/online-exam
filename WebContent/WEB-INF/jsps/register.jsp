<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
    <title>
        Registeration
    </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
.user-icon {
	top:153px; /* Positioning fix for slide-in, got lazy to think up of simpler method. */
	background: rgba(65,72,72,0.75) url('${pageContext.request.contextPath}/images/user-icon.png') no-repeat center;	
}

.pass-icon {
	top:201px;
	background: rgba(65,72,72,0.75) url('${pageContext.request.contextPath}/images/pass-icon.png') no-repeat center;
}


</style>
<script type="text/javascript">
function formValidation()
{
	
	if(document.getElementById("username").value==null || document.getElementById("username").value.trim()=='')
		{
		alert("username should not be blank");
		return false;
		}
	else if(document.getElementById("password").value==null || document.getElementById("password").value.trim()=='')
		{
		alert("password should not be blank");
		return false;
		}
	else if(document.getElementById("email").value==null || document.getElementById("email").value.trim()=='')
	{
	alert("email should not be blank");
	return false;
	}
	else if(document.getElementById("mobile").value==null || document.getElementById("mobile").value.trim()=='')
	{
	alert("mobile should not be blank");
	return false;
	}
	else if(document.getElementById("address").value==null || document.getElementById("address").value.trim()=='')
	{
	alert("address should not be blank");
	return false;
	}
	return true;
}
</script>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
   <li class='#'><a href='#'><span>Submit a Question</span></a></li>
    <li><a href='${pageContext.request.contextPath}/feedback'><span>Feedback</span></a></li>
   <li><a href='#'><span>Contribute</span></a></li>
   <li><a href='#'><span>Contact us</span></a></li>
</ul>
</div>

<div id="wrapper">

	<form name="login-form" class="login-form" action="checkRegister" method="post" enctype="multipart/form-data" onSubmit="return formValidation();">
	
		<div class="header">
		<% Object s = request.getAttribute("err");
		if(s != null)
		{
			%>
			<font size="2" color="red">*<%=(String)s%></font>
			<%
		}
		%>
		<h1>Register </h1>
		
		</div>
	
		<div class="content">
		<input name="username" type="text" class="input username" placeholder="Username" id = "username"/>
		<div class="user-icon"></div><br><br>
		<input name="email" type="text" class="input username" placeholder="Email" id = "email"/>
		<div class="user-icon"></div>
		<input name="password" type="password" class="input password" placeholder="Password" id="password" />
		<div class="pass-icon"></div>		
		<br><br>
		<input name="mobile" type="text" class="input mobile" placeholder="Mobile No" id="mobile"/>
		<div class="pass-icon"></div>
		<br><br>
		<input name="City" type="text" class="input City" placeholder="City" id="city"/>
		<div class="pass-icon"></div>	
		<br><br>	<input type="file" name="photo" />
		</div>

		<div class="footer">	
			
		&nbsp;&nbsp;&nbsp;<input type="submit" class="button" name="submit" value="Register" class="register" />
		&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="Reset" name="reset">&nbsp;&nbsp;&nbsp;
		</div>
	
	</form>

</div>
<div class="gradient"></div>


</body>
</html>
