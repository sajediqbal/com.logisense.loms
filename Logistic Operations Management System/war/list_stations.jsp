<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.Entity, com.logisense.loms.data.StationIO" %>

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
				<td>Is Special?</td>
				<td>Action</td>
			</tr>
		</thead>
		<%
 
		    List<Entity> stations = StationIO.listStation();
		    for(Entity e : stations){
 
		%>
			<tr>
			  <td><%=e.getKey()%></td>
			  <td><%=e.getProperty("stationName") %></td>
			  <td><%=e.getProperty("distance") %></td>
			  <td><%=e.getProperty("stationZone") %></td>
			  <td><%=e.getProperty("regionCode") %></td>			  
			  <td><%=e.getProperty("isSpecial") %></td>
			  <td><a href="updatestation?stationID=<%=e.getProperty("stationID")%>">Update</a> 
                             | <a href="deletestation?stationID=<%=e.getProperty("stationID")%>">Delete</a></td>
			</tr>
		<%
			}
		%>
	</table>
 
</body>
</html>