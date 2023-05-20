<%@page import="java.text.SimpleDateFormat"%>
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
			String houseId = request.getParameter("houseId");
			// Boolean show = false;
			

			if(buyerId!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			else if(agentId!=null)
			{
				response.sendRedirect("AgentLogin.jsp");
			}
                        else if(sellerId==null)
			{
				response.sendRedirect("SellerHome.jsp");
			}


			
                        Connection conn= null;
							
                        conn = DriverManager.getConnection(url,user,pass);
                        

                        if (houseId!=null) {
                        String query1 = "delete from house where house_id = " + houseId ;
                        Statement stmt1 = conn.createStatement();
                        stmt1.executeUpdate(query1);
                        }
                        
String query2 = "select * from house where seller_id = " + sellerId;
                        Statement stmt2 = conn.createStatement();
                        ResultSet rset2 = stmt2.executeQuery(query2);
                       
			

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
		      <li><a href="AgentLogin.jsp">Agent</a></li>
		      <li  class="active"><a href="SellerLR.jsp">Seller</a></li>
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
	    				<h3><b>DELETE HOUSE</b></h3>
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
	    				
	    				<form action="DeleteHouse.jsp" method="post">
							 
							Delete House : 
	    					
                                                        <select name ="houseId">
                                                            <%while(rset2.next()) {%>
                                                                <option value="<%=rset2.getInt("house_id")%>"><%="house_id: "+rset2.getInt("house_id")%></option>
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

