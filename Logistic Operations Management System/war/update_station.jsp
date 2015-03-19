<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.Entity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Update Station</title>
        <%
		Entity station = (Entity)request.getAttribute("station");
	%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        	<h1>Stations Management</h1>
 
	Function : <a href="list_stations.jsp">List Station</a>
	<hr />
 
	<h2>Update Stations</h2>
    <%
String message = (String)request.getAttribute("message");
if (message == null ){
message="";
}
%>
<%= message %>
        <form action="updatestation" method="post">
        <input type="hidden" name="originalID" id="originalID" 
			value="<%=station.getProperty("stationID") %>" /> 
        <input type="hidden" name="stationID" 
        	value="<%=station.getProperty("stationID") %>"/><br/>
            Station Name:<input type="text" name="stationName" value="<%=station.getProperty("stationName") %>"/><br/>
            Station Distance: <input type="text" name="distance" value="<%=station.getProperty("distance") %>"/><br/>
            Region Code: <input type="text" name="regionCode" value="<%=station.getProperty("regionCode") %>"/><br/>
            Zone: 
            <select name="stationZone">
                <option value="South" selected>South</option>
                <option value="Center">Center</option>
                <option value="North">North</option>
                <option value="Peshawar">Peshawar</option>
                <option value="Quetta">Quetta</option>
            </select><br/>
            Is Special:<input type="checkbox" name="isSpecial" value="On"><br/>
            
            <input type="submit" value="Sunmit">
            
        </form>
    </body>
</html>