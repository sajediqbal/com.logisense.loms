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
 
	Function : <a href="liststations">List Station</a>
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
			<input type="hidden" name="page" id="page" 
			value="<%=(String)request.getAttribute("page")%>" />
        Station ID:<input type="number" name="stationID" 
        	value="<%=station.getProperty("stationID") %>" readonly/><br/>
            Station Name:<input type="text" name="stationName" value="<%=station.getProperty("stationName") %>" required/><br/>
            Station Distance: <input type="number" name="distance" value="<%=station.getProperty("distance") %>" required/><br/>
            Region Code: <input type="number" name="regionCode" value="<%=station.getProperty("regionCode") %>" required/><br/>
            Zone: 
            <select name="stationZone">
                <option value="South" <%=station.getProperty("stationZone").equals("South") ? "selected" : "" %>>South</option>
                <option value="Center" <%=station.getProperty("stationZone").equals("Center") ? "selected" : "" %>>Center</option>
                <option value="North" <%=station.getProperty("stationZone").equals("North") ? "selected" : "" %>>North</option>
                <option value="Peshawar" <%=station.getProperty("stationZone").equals("Peshawar") ? "selected" : "" %>>Peshawar</option>
                <option value="Quetta" <%=station.getProperty("stationZone").equals("Quetta") ? "selected" : "" %>>Quetta</option>
            </select><br/>
            Mark as Special:<input type="checkbox" name="isSpecial" <%=station.getProperty("isSpecial").toString().equals("true") ? "checked='checked'" : "" %>><br/>
            
            <input type="submit" value="Update">
            <input type="button" value="Cancel" onClick="YNconfirm()">
        </form>
         <script type="text/javascript">   
function YNconfirm() { 
     if (window.confirm('Do you really want to leave this page?')){
         //alert("You agree") 
         //REDIRECT
         window.location.href = ('liststations?page='+<%=(String)request.getAttribute("page")%>);
     }
     else{
        //DO NOTHING AND STAY IN THE SAME PAGE
        //OR SOMETHING ELSE THAT YOU WANT

        return false;
     }
};
</script>
    </body>
</html>