<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.Entity, com.google.appengine.api.datastore.QueryResultList, com.logisense.loms.data.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

		QueryResultList <Entity> stations=(QueryResultList <Entity>) request.getAttribute("stationList");

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
		%>
		
		    <%--For displaying Previous link except for the 1st page --%>
    <c:if test="${currentPage != 1}">
        <td><a href="liststations?page=${currentPage - 1}">Previous</a></td>
    </c:if>
 
    <%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
    <table border="1" cellpadding="5" cellspacing="5">
        <tr>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <td>${i}</td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="liststations?page=${i}">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tr>
    </table>
     
    <%--For displaying Next link --%>
    <c:if test="${currentPage lt noOfPages}">
        <td><a href="liststations?page=${currentPage + 1}">Next</a></td>
    </c:if>
		 
	</table>


</body>
</html>