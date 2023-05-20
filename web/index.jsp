<%@ page errorPage="error.jsp" %> 
<%@ include file = "connection.jsp" %>
<html>
<head>
	<!-- https://www.w3schools.com/icons/icons_reference.asp
 -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <link rel="stylesheet" href="b.css">
          <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>  
<body>  
	   <nav id="Navbar">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">

		      <a class="navbar-brand" href="home.jsp"><i class="glyphicon glyphicon-home"></i>Asset Plus</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="home.jsp">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>
		      <li><a href="AgentLogin.jsp">Agent</a></li>
		      <li><a href="SellerLR.jsp">Seller</a></li>
		      <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->

		      <%
		      		if(session.getAttribute("buyerId")!=null || session.getAttribute("sellerId")!=null || session.getAttribute("employeeId")!=null || session.getAttribute("agentId")!=null )
		      		{
		      			%>
		      			<li><a href="Logout.jsp">Logout</a></li>
		      			<%
		      		}
		      %>

			 
		    </ul>
		  </div>
		</nav>
		</nav>
		<br><br><br>
		
		<section id="real">
		
<div class="w3-content w3-display-container">
  <img class="mySlides" src="https://www.rsiconcepts.com/blog/wp-content/uploads/2020/03/Property-Management-System-Dubai-UAE.jpeg" style="width:100%">
  <img class="mySlides" src="Images/banner2.jpg" style="width:100%">
  <img class="mySlides" src="https://gitsfiji.com/wp-content/uploads/2018/06/Asset Plus-Management-System-REMS.jpg" style="width:100%">


  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
	    </section>

		<footer>
			<div class="center" style="text-align: center;background: black;
			color: white;">
				Copyright &copy; All rights reserved!2023
			</div>
		</footer>
		      





	<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");
			

    %>

 
</body>  
</html>  