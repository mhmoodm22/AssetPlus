 <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
<%@ page import="java.util.*" %>

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
			}else if(agentId==null)
			{
				response.sendRedirect("AgentLogin.jsp");
			}


			

			

 %>
 <%
	    	           
	    	        	
	    	        	{

				            
							Connection conn= null;
							//try
							//{
								conn = DriverManager.getConnection(url,user,pass);
								String houseId = request.getParameter("houseId");
								buyerId = request.getParameter("buyerId");
								String type = request.getParameter("type");

								String query,insertpurchase ;
								
								ResultSet rset ;
								PreparedStatement stmt,stmt2;

								conn.setAutoCommit(false);

								if(type.equals("sale"))
								{
									query = "update house set sale_status = \'Y\' where house_id = ?";

									insertpurchase = "insert into purchase (buyer_id, house_id,date,type) values(?,?,?,?)";

									stmt = conn.prepareStatement(query);
									stmt2 = conn.prepareStatement(insertpurchase);

									stmt.setString(1,houseId);

									stmt2.setString(1,buyerId);
									stmt2.setString(2,houseId);
									
									stmt2.setString(3,date);
									stmt2.setString(4,type);
									


								}
								else
								{
									query = "update house set rent_status = \'Y\' where house_id = ?";

									insertpurchase = "insert into purchase (buyer_id, house_id,date,type) values(?,?,?,?)";

									stmt = conn.prepareStatement(query);
									stmt2 = conn.prepareStatement(insertpurchase);

									String p = null;

									stmt.setString(1,houseId);
                                                                    
									stmt2.setString(1,buyerId);
									stmt2.setString(2,houseId);
									stmt2.setString(3,date);
									stmt2.setString(4,type);

									

									
									
								}

								
							    int rowsAffected1 = stmt.executeUpdate();

							    
							    int rowsAffected2 = stmt2.executeUpdate();

							    if( rowsAffected2 == 0 || rowsAffected1 == 0)
							    {
							    	conn.rollback();
									//out.println("hi");
							    	session.setAttribute("transactionFailed","true");
							    	response.sendRedirect("UpdateHouseStatus.jsp");
							    	return;

							    }


							    conn.commit();

							    	conn.close();
									stmt.close();
									stmt2.close();

							    
							    
							    	
							    
							    //session.setAttribute("transactionFailed","false");
							   response.sendRedirect("UpdateHouseStatus.jsp");
							   	return;

							    
							    



				               





							}
							/*catch(Exception e)
							{
								session.setAttribute("transactionFailed","true");
								conn.rollback();
							    response.sendRedirect("UpdateHouseStatus.jsp");
							    out.println(e);
							    return;

								
							}*/
					
	    	        	
	    	        %>