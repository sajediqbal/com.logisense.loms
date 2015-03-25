<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.Entity, com.google.appengine.api.datastore.QueryResultList, com.logisense.loms.data.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ page import="java.util.List" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<h1>Stations Management</h1>
 
	Function : <a href="add_station.jsp">Add Station</a> |  <a href="list_stations.jsp">Refresh</a>
	<hr />
 
	<h2>All Stations</h2>
	<table border="1">
		<thead>
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Distance</td>
				<td>Zone</td>
				<td>Region Code</td>
				<td>Type</td>
				<td>Action</td>
			</tr>
		</thead>
		<%
		DataStorePaginationTest testObject = new DataStorePaginationTest();
		testObject.test();
		
		String nextCursor = request.getParameter("nextCursor");
		String prevCursor = request.getParameter("prevCursor");
		String action = request.getParameter("action");
		QueryResultList <Entity> stations=null;
		
		if(action==null){
			action="next";
		}
		if(action.equalsIgnoreCase("next")){
			stations=StationIO.listStation(nextCursor);
		}
		else if(action.equalsIgnoreCase("prev")){
			prevCursor= request.getParameter("nextCursor");
			stations=StationIO.listStation(prevCursor);

		}
 		     
		    for(Entity e : stations){
 
		%>
			<tr>
			  <td><%=e.getProperty("stationID")%></td>
			  <td><%=e.getProperty("stationName") %></td>
			  <td><%=e.getProperty("distance") %></td>
			  <td><%=e.getProperty("stationZone") %></td>
			  <td><%=e.getProperty("regionCode") %></td>			  
			  <td><%=e.getProperty("isSpecial").toString().equals("true") ? "Special" : "-" %></td>
			  <td><a href="updatestation?stationID=<%=e.getProperty("stationID")%>">Update</a> 
                             | <a href="deletestation?stationID=<%=e.getProperty("stationID")%>" onClick="return confirm(
  'Are you sure you want to delete this Station?');">Delete</a></td>
			</tr>
		<%
			}
		    if(prevCursor==null & nextCursor==null){
		    	
		    	nextCursor = stations.getCursor().toWebSafeString();
		    	
			    	response.getWriter().println(
			    		      "<a href='/list_stations.jsp?nextCursor=" + nextCursor +"'>Next page</a>");
			    
		    }else
		    
		    if (prevCursor==null & nextCursor!=null){
	   			prevCursor=nextCursor;
	   			nextCursor=stations.getCursor().toWebSafeString();
	   			
		    	response.getWriter().println(
		    		      "<a href='/list_stations.jsp'>Previous page</a> | <a href='/list_stations.jsp?action=next&nextCursor=" + nextCursor +"&prevCursor="+ prevCursor + "'>Next page</a>");	
		   
		    	}else
		    	{
		    		prevCursor=nextCursor;
		    		nextCursor=stations.getCursor().toWebSafeString();
		   			
			    	response.getWriter().println(
			    		      "<a href='/list_stations.jsp?action=prev&nextCursor="  + prevCursor + "'>Previous page</a> | <a href='/list_stations.jsp?action=next&nextCursor=" + nextCursor +"&prevCursor="+ prevCursor + "'>Next page</a>");	
			    	response.getWriter().println(prevCursor);
		    	}
		  
		    	
		    	
		    	
		    

		    
		%>
		 
	</table>


</body>
</html>