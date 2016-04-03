	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
		<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <link rel="stylesheet"
	    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    
    <title>Contact us</title>
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
</head>
<body>
	  
	  
	  <div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
  <!--  <li class='#'><a href='#'><span>Submit a Question</span></a></li> -->
    <li><a href='${pageContext.request.contextPath}/feedback'><span>Feedback</span></a></li>
   <!-- <li><a href='#'><span>Contribute</span></a></li> -->
   <li><a href='${pageContext.request.contextPath}/contact'><span>Contact us</span></a></li>
</ul>
</div>


	    <section >
	      <div class="jumbotron" align="center" style="padding-bottom: 15px">
        <div class="container">
	          <h1>Contact us</h1>
	          	            <div class="thumbnail">
	            <a href="http://aith.ac.in/" target="_blank"> <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="image"  style = "width:200px;height: 200px;"/></a>
	          
	          <p><b>Address</b>: <a href="http://aith.ac.in/" target="_blank">Dr. Ambedkar Institute of technology for handicapped, Awadhpuri , Kanpur, Uttar Pradesh 208024</a></p>
	        </div>
	        </div>
	      </div>
	    </section>
	
	    <section class="container">
	    
	      <div class="row" align="center">
	        <%-- <c:forEach items="${products}" var="product"> --%>
	          <div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
	            <div class="thumbnail">
	             <img src="${pageContext.request.contextPath}/images/aman.jpg" alt="image"  style = "width:200px;height: 200px;"/>
	            
	              <div class="caption">
	                <h3>Aman Rajpoot</h3>
	                <p>Mobile : 9198307109</p>
	                <p><a href="mailto:rajpoot.aman22@gmail.com">rajpoot.aman22@gmail.com</a></p>
	                <a target="_blank" title="find us on Facebook" href="https://www.facebook.com/aman.rajpoot.946?fref=ts"><img alt="follow me on facebook" src="//login.create.net/images/icons/user/facebook_40x40.png" border=0></a>

	                
	              </div>
	            </div>
	          </div>
	           <div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
	            <div class="thumbnail">
	            	             <img src="${pageContext.request.contextPath}/images/krishnkant.jpg" alt="image"  style = "width:200px;height: 200px;"/>
	            
	              <div class="caption">
	                <h3>Krishnkant Nayak</h3>
	                <p>Mobile : 8115971910</p>
	                <p><a href="mailto:krishnkantnayak15@gmail.com">krishnkantnayak15@gmail.com</a></p>
	              </div>
	            </div>
	          </div>
	          
	           <div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
	            <div class="thumbnail">
	            	             <img src="${pageContext.request.contextPath}/images/munikesh.jpg" alt="image"  style = "width:200px;height: 200px;"/>
	            
	              <div class="caption">
	                <h3>Munikesh Verma</h3>
	                <p>Mobile : 9045529903</p>
	                <p><a href="mailto:munikeshsoni4444@gmail.com">munikeshsoni4444@gmail.com</a></p>
	              </div>
	            </div>
	          </div>
	          
	        <%-- </c:forEach> --%>
	      </div>
	    </section>
	  
	  <div style="margin: auto;width: 60%;border: 3px solid #73AD21;padding: 10px;">
<script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:440px;width:700px;'><div id='gmap_canvas' style='height:440px;width:700px;'></div><div><small><a href="http://embedgooglemaps.com">									embed google maps							</a></small></div><div><small><a href="http://freedirectorysubmissionsites.com/">link directories</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><script type='text/javascript'>function init_map(){var myOptions = {zoom:10,center:new google.maps.LatLng(26.50193769999999,80.33774402656269),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(26.50193769999999,80.33774402656269)});infowindow = new google.maps.InfoWindow({content:'<strong>Dr .Ambedkar Institute of technology for handicapped</strong><br>Awadhpuri, Behind Rama Dental Hospital, Lakhanpur, Khewra, Kanpur, Uttar Pradesh 208002<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script> 
</div>

 
  
 </body>
</html>
	