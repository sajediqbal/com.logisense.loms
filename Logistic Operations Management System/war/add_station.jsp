<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Add New Station</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    	<h1>Stations Management</h1>
 
	Function : <a href="list_stations.jsp">List Station</a>
	<hr />
 
	<h2>Add New Stations</h2>
	
    <%
String message = (String)request.getAttribute("message");
if (message == null ){
message="";
}
%>
<%= message %>
        <form action="addstation" method="post">
            Station ID:<input type="number" name="stationID" required><br/>
            Station Name:<input type="text" name="stationName" required><br/>
            Station Distance: <input type="number" name="distance" required><br/>
            Region Code: <input type="number" name="regionCode" required><br/>
            Zone: 
            <select name="stationZone">
                <option value="South" selected>South</option>
                <option value="Center">Center</option>
                <option value="North">North</option>
                <option value="Peshawar">Peshawar</option>
                <option value="Quetta">Quetta</option>
            </select><br/>
            Mark as Special:<input type="checkbox" name="isSpecial" value="isSpecial"><br/>
            
            <input type="submit" value="Add Station">
            
        </form>
       
    </body>
</html>
