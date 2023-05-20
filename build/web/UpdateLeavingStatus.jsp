<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
<%@ page import="java.util.*" %>

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String date = sdf.format(new Date());

%>


<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");




			String agentId = (String)session.getAttribute("agentId");
			String sellerId = (String)session.getAttribute("sellerId");
			String buyerId = (String)session.getAttribute("buyerId");
			//String employeeId = (String)session.getAttribute("employeeId");
			// Boolean show = false;
			

			if(buyerId!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			else if(sellerId!=null)
			{
				response.sendRedirect("SellerHome.jsp");
			}
			else if(agentId==null)
			{
				response.sendRedirect("AgentLogin.jsp");
			}


			
                        Connection conn= null;
							
                        conn = DriverManager.getConnection(url,user,pass);
                        

                        String query1 = "select * from house where agent_id = " + agentId + " and rent_status = 'Y'";
                        Statement stmt1 = conn.createStatement();
                        ResultSet rset1 = stmt1.executeQuery(query1);
                       
			

 %>

<html>
<head>
	

	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  <!-- <a class="navbar-brand" href=""><i class="glyphicon glyphicon-home"></i>  Asset Plus</a> -->

</head>  
<body>  


		

		
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <!-- <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script> -->
	  <a class="navbar-brand" href="index.jsp"><i class="glyphicon glyphicon-home"></i>  Asset Plus</a>

		    </div>
		    <ul class="nav navbar-nav">


		      <li ><a href="index.jsp">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>
		      <li  class="active" ><a href="AgentLogin.jsp">Agent</a></li>
		      <li><a href="SellerLR.jsp">Seller</a></li>
		      <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->
		      <li><a href="Logout.jsp">Logout</a></li>
		      

		      
		    </ul>
		  </div>
		</nav>
		<br><br>
		<br><br>

		<div class="container">

	    	<div class="d-flex justify-content-center align-items-center ">
	    		<div class="row">
	    			<div class="col-sm-4">
	    				<h3><b>UPDATE LEAVING DETAILS</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				<%
	    					if(session.getAttribute("transactionFailed")!=null)
	    					{
	    						String s =(String) session.getAttribute("transactionFailed");
	    						
	    						    session.removeAttribute("transactionFailed");

	    						    if(s.equals("true"))
	    						    {
	    						    	 %>
		    							<div class="alert alert-danger" role="alert">
										  Transaction Failed!!
										</div>
										<%
	    						    }
	    						    else
	    						    {
	    						    	%>
		    							<div class="alert alert-success" role="alert">
										  Transaction Successfull...
										</div>
										<%
	    						    }

	    					}
	    					
	    				%>
	    				
	    				<form action="ValidateULS.jsp" method="post">
							 
							Leave House : 
	    					
                                                        <select name ="houseId">
                                                            <%while(rset1.next()) {%>
                                                                <option value="<%=rset1.getInt("house_id")%>"><%="house_id: "+rset1.getInt("house_id")%></option>
                                                            <%}%>
                                                        </select>
                                                        <br><br>
							 
							 
							 
							<input type="submit" name="">
							<br><br><br>
				        </form>
	    			</div>
	    		
	    	    </div>
	    	       
	    	    
	    	</div>
    	
        </div>

       
		



	
 
</body>  
</html>  

