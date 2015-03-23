<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.Entity" %>

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
    
    Entity station= (Entity)request.getAttribute("station");
    String message = (String)request.getAttribute("message");
	int stationID = 0;
	String stationName="";
	int distance=0;
	int regionCode=0;
	String stationZone="";
	String isSpecial="";

if (message == null ){
message="";
}

if (station!=null){
	stationID=Integer.parseInt(station.getProperty("stationID").toString());
	stationName=station.getProperty("stationName").toString();
	distance=Integer.parseInt(station.getProperty("distance").toString());
	regionCode=Integer.parseInt(station.getProperty("regionCode").toString());
	stationZone=station.getProperty("stationZone").toString();
	isSpecial=station.getProperty("isSpecial").toString();
}
%>
<%= message %>
        <form action="addstation" method="post">
            Station ID:<input type="number" name="stationID" value="<%=stationID%>" required><br/>
            Station Name:<input type="text" name="stationName" value="<%=stationName%>" required><br/>
            Station Distance: <input type="number" name="distance" value="<%=distance%>"required><br/>
            Region Code: <input type="number" name="regionCode" value="<%=regionCode%>" required><br/>
            Zone: 
            <select name="stationZone">
                <option value="South" <%=stationZone.equals("South") ? "selected" : "" %>>South</option>
                <option value="Center" <%=stationZone.equals("Center") ? "selected" : "" %>>Center</option>
                <option value="North" <%=stationZone.equals("North") ? "selected" : "" %>>North</option>
                <option value="Peshawar" <%=stationZone.equals("Peshawar") ? "selected" : "" %>>Peshawar</option>
                <option value="Quetta" <%=stationZone.equals("Quetta") ? "selected" : "" %>>Quetta</option>
            </select><br/>
            Mark as Special:<input type="checkbox" name="isSpecial" value="isSpecial" <%=isSpecial.equals("true") ? "checked='checked'" : "" %>><br/>
            
            <input type="submit" value="Add"> 
            <input type="button" value="Cancel" onClick="YNconfirm()">
            
        </form>
       <script type="text/javascript">   
function YNconfirm() { 
     if (window.confirm('Do you really want to leave this page?')){
         //alert("You agree") 
         //REDIRECT
         window.location.href = ('list_stations.jsp');
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
