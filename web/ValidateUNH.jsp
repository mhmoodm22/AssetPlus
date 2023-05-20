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
			String employeeId = (String)session.getAttribute("employeeId");
			// Boolean show = false;
			

			
			if(sellerId==null)
			{
				response.sendRedirect("sellerHome.jsp");
			}


			

			

 %>
 <%
	    	           
	    	        	
	    	        	{

				           
							Connection conn= null;
							//try
							//{
								conn = DriverManager.getConnection(url,user,pass);



								Statement stmt1 = conn.createStatement();

								ResultSet rset1 = stmt1.executeQuery("select agent_id from agents");

								 ArrayList<Integer> agentIds = new ArrayList<>();

								while(rset1.next())
								{
									agentIds.add(rset1.getInt(1));
								}

								Random rand = new Random();


								int randIndex = rand.nextInt(agentIds.size());

								int randomAgentId = agentIds.get(randIndex);

								out.println(randomAgentId);










								String city = request.getParameter("city");
								String street_name  = request.getParameter("street");
								String apt_no = request.getParameter("houseNumber");
								String sale_price = request.getParameter("salePrice");
								String rent_price = request.getParameter("rentPrice");
								String specificatons = request.getParameter("specifications");
								String no_bedrooms = request.getParameter("numBedrooms");
								String type = request.getParameter("type");

								// to be changed whole below.........

								String query ;
								
								ResultSet rset ;
								PreparedStatement stmt;

								conn.setAutoCommit(false);

								query = "insert into house"
                                                                + " (type, agent_id, seller_id, city, street_name, apt_no,"
                                                                + " sale_price, rent_price, sale_status, rent_status, no_bedrooms, specifications)"
                                                                + " values(?,?,?,?,?,?,?,?,?,?,?,?)";

								

								stmt = conn.prepareStatement(query);

								String p = null;

								stmt.setString(1,type);
								stmt.setInt(2,randomAgentId);
								stmt.setString(3,sellerId);
								stmt.setString(4,city);
								stmt.setString(5,street_name);
								stmt.setString(6,apt_no);
								
								
								//stmt.setString(8,sale_status);
								//stmt.setString(9,rent_status);
								stmt.setString(11,no_bedrooms);
								stmt.setString(12,specificatons);



								

								if(type.equals("sale"))
								{
									stmt.setString(7,sale_price);
									
									stmt.setString(8,p);

									stmt.setString(9,"N");

									stmt.setString(10,p);


								}
								else if(type.equals("rent"))
								{
									stmt.setString(7,p);
									
									stmt.setString(8,rent_price);

									stmt.setString(9,p);

									stmt.setString(10,"N");
									
								}
								else
								{
									stmt.setString(7,sale_price);

									stmt.setString(8,rent_price);
									
									stmt.setString(9,"N");
									
									stmt.setString(10,"N");
								}

								
							    int rowsAffected = stmt.executeUpdate();


							    out.println(randomAgentId);

							   conn.commit();

							   		//conn.close();
									stmt.close();
									//rset.close();

									//conn1.close();
									stmt1.close();
									rset1.close();
							   

							    

							    if(rowsAffected==0)
							    {
							    	//conn.rollback();
							    	session.setAttribute("transactionFailed","true");
							    	//response.sendRedirect("UploadNewHouse.jsp");
							    	return;
							    }
							    else
							    {
							    	
							       
							    	session.setAttribute("transactionFailed","false");
							    	response.sendRedirect("UploadNewHouse.jsp");
									//conn.commit();
							    	return;
							    
							    }


							/*}
							catch(Exception e)
							{
								conn.rollback();
								session.setAttribute("transactionFailed","true");
								
							    //response.sendRedirect("UploadNewHouse.jsp");

								out.println(e);

								return;
							}*/
							//conn.commit();
					
	    	        	}
	    	        %>