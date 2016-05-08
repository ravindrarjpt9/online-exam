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
     <link rel="stylesheet" type="text/css" href="http://www.trirand.com/blog/jqgrid/themes/redmond/jquery-ui-1.8.1.custom.css"/>
    <link rel="stylesheet" type="text/css" href="http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css"/>
    <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery-ui-1.8.1.custom.min.js"></script>

        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.layout.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/ui.multiselect.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.tablednd.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.contextmenu.js"></script>
    
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
function showDialog()
{
	$( "#dialog" ).dialog({
		height : 390,
		position : "center",
		
		width : '64%',
		draggable: false
		
	});	
	loadDate();
}
var returnPhoto = function(cellVal,options,rowObject) {
	
	if(cellVal != null && cellVal != 'null' && cellVal != '-1' && cellVal != '0')
	    return "<img src='"+cellVal+"' height='70' width='90' class = 'example1tooltip' style='cursor:pointer' alt='Photo' title = 'photo'>";  
		else
			return "";
	};
	
function loadDate(){
    $("#jqGrid1").jqGrid({
    	url : '/OnlineQuiz/registerXml.jsp',
		datatype : 'xml',
		mtype : 'GET',
		colNames : ['ID', 'User Name', 'email', 'Mobile','Address',
					 'Photo'],
			
            colModel: [
            { label: 'id', name: 'id', key: true, width: 40,hidden : false },
            { label: 'username', name: 'username', width: 150,hidden : true },
            { label: 'email', name: 'email', width: 220 },
            { label: 'mobile', name: 'mobile', width: 150 },
            { label: 'address', name: 'address', width: 150 },
            { label:'photo', name: 'photo', width: 150,formatter: returnPhoto }
        ],
		viewrecords: true,
        width: 780,
        height: 250,
        rowNum: 10,
        caption : "List of registerd users",
        pager: "#jqGridPager1",
       
    });
}
</script>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
   <!-- <li class='#'><a href='#'><span>Submit a Question</span></a></li> -->
    <li><a href='${pageContext.request.contextPath}/feedback'><span>Feedback</span></a></li>
   <!-- <li><a href='#'><span>Contribute</span></a></li> -->
   <li><a href='${pageContext.request.contextPath}/contact'><span>Contact us</span></a></li>
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
		<h1> Register </h1>
		
		<div id="dialog" title="List of Registerd Users" style="display: none;">
	<table id="jqGrid1"></table>
    <div id="jqGridPager1"></div>
</div>

		<a href="#" onclick="showDialog()"><h4>Check list of registerd users</h4></a>
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
		<br><br>	<input type="file" name="photo" id = "photo"/>
		<font color="red" size="1.5px;">*Height and Width must not exceed 100px.</font>
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
