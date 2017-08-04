<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>    
    
    <meta charset="UTF-8">
    <title>View</title>
     <jsp:include page="partials/_resources.jsp"></jsp:include>
  </head>
  <body>
  <div class="container">
  	<jsp:include page="partials/_title.jsp"></jsp:include>
	<jsp:include page="partials/_navProfile.jsp"></jsp:include>
  
  <div class="well">
  <div class="row">
  <div class="col-xs-6">
  
  <div class="panel panel-success">
  <div class="panel-heading">
    <h3 class="panel-title">Trip: ${trip.title}</h3>
  </div>
  <div class="panel-body">
    <p>Destination: ${trip.destination.name}</p>
  	<p>Description: ${trip.description}</p>
  	<p> Seats available: ${trip.numberSeats}</p>
  <%-- <p>${trip.extraCurr}</p> --%>
  	<p>Leaving from: ${trip.pointOfOrigin}</p>
  	<p>Return point: ${trip.pointOfReturn}</p>
  </div>
</div>
  
 
 
  	
  
  
   <c:choose>
   <c:when test="${user.id == trip.ownerId}">
  		<form action="editTripPage.do" method="GET">
    			<input type="submit" class="btn btn-warning" value="Edit this Trip!">
    			<input type="hidden" value="${trip.id}" name="tripId">
    			<input type="hidden" value="${user}" name="user">
  		</form>
  </c:when>
  
  <c:when test="${user.id != trip.ownerId && trip.numberSeats > 0 && !rider }">

   		<form action="addMeToTrip.do" method="POST">
    			<input type="submit" class="btn btn-primary btn-block" value="Add me to Trip!">
    			<input type="hidden" value="${user.id}" name="userId">
    			<input type="hidden" value="${trip.id}" name="tripId">
  		</form>
  	
  	</c:when>
  </c:choose>
  
  <c:if test="${user.id == trip.ownerId}">
  		
  		<form action="deleteTrip.do" method="POST">
    			<input type="submit" class="btn btn-danger" value="Delete this trip">
    			<input type="hidden" value="${trip.id}" name="tripId">
    			<input type="hidden" value="${user.id}" name="userId">
  		</form>
  		</c:if>
  		
  		 		
  		<h3>Current Passengers</h3>
  			<c:forEach items = "${trip.users}" var = "bros">
  			<form action="ViewUser.do" method="GET">
         		<input type="submit" class="btn btn-success btn-block" value="${bros.firstName} ${bros.lastName}">
    				<input type="hidden" value="${bro.id}" name="broId">
    			</form>
    				<br>
         </c:forEach>	
  		
  
  </div>
  <div class="col-xs-6">
  
  	<iframe
  		width="100%"
  		height="450px"
  		frameborder="0" style="border:0"
  		src="https://www.google.com/maps/embed/v1/place?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk
    		&q=${trip.destination.name}" allowfullscreen>
	</iframe>
  
  </div>
  </div>
  </div>
  
  </div>
  
 
  
  </body>
  
  </html>