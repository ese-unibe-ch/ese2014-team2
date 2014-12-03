<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>




<c:import url="template/header.jsp" />



	 
<script>
	function showDetails() {
		$('#invitationDetails').show();
	}
	
</script>

  

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h3>Übersicht über alle  abgemachten Termine </h3>
	</div>
	<div class="panel-body">
	
	<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>


	
	<c:if test="${showTab eq 1 }">
	
		<ul class="nav nav-tabs" id="myTab">
	<li class="active"><a href="appointments?showTab=1" ><label>Verschickte Einladungen</label></a></li>
	<li><a href="appointments?showTab=2"><label>Erhaltene Einladungen</label></a></li>

</ul>

	<div class="tab-content">
	
		<br>
			<c:forEach items="${usersAppointments}" var="app">
	
			
				<legend>Termin am ${app.appointmentDate.day} von
					${app.appointmentDate.startHour} bis ${app.appointmentDate.endHour}</legend>
				
				
				<font size="4">Name des Interessenten:</font>
				<br>

				<br>
				<c:forEach items="${app.invitations}" var="user">
				


					<div class="row">
						<div class="col-md-6">
							<p><b>${user.firstName}
								${user.lastName }</b></p>
						</div>
						<div class="col-md-2">
							<c:forEach items="${user.appointmentInvitations }"
								var="message">
								<c:if test="${ message.appointedAppointment eq appointment.id}">
									<c:if test="${ message.accepted eq true }"> <p>Einladung wurde angenommen</p> </c:if>
									<c:if test="${ message.rejected eq true }"><p> Einladung wurde abgelehnt </p></c:if>
									<c:if
										test="${message.rejected eq false and message.accepted eq false }"><p>Der Benutzer hat die Einladung noch nicht abgelehnt/angenommen </p></c:if>

								</c:if>
							</c:forEach>

						</div>


						<div class="col-md-4">
							
							<c:forEach items="${user.appointmentInvitations }"
								var="message">
								<c:if test="${ message.appointedAppointment eq app.id}">
									<a href="sendMessageFromAppointment?messageId=${message.id}">
										<button type="button" class="btn btn-default">
											<b>Nachricht </b>
										</button>
									</a>
								</c:if>
							</c:forEach>
							
							<script >
$(function()
		{
		    var benefits = $('#test${user.id}');

		    // this is the show function
		    $('a[name=${user.id}]').click(function()
		    { 
		        benefits.dialog();
		    }); });

</script>

		
		
		<a href="#${user.id}" name="${user.id}" ><button type="button" class="btn btn-default" id="opener${user.id}"> <b>Notiz</b></button></a>
		
    	
    	
    	<div id="test${user.id}" title="Notiz" style="display:none">
							<form method="post" action="setNote" id="noteForm"  autocomplete="off" >
								
								<c:if test="${ not empty app.userNotes }">																				
								<c:forEach items="${app.userNotes }" var="note"> 
									<c:if test="${ note.applicant.id eq user.id}">	
										<textarea rows="4" cols="20"  name ="noteText" id="noteText">"${note.text }"</textarea>
									</c:if>
								</c:forEach>
						
								</c:if>
								<c:if test="${ empty app.userNotes }">
								<textarea rows="4" cols="20"  name ="noteText" id="noteText"></textarea>
								</c:if>
								
								<input type="hidden" id="userId" name="userId" value="${user.id }" />
								<input type="hidden" id="appointmentId" name="appointmentId" value="${app.id }" />


									
								<button type="submit"  value="send" class="btn btn-default">
									<b>OK </b>
								</button>
										
							</form>
						</div>  

							
						  
					
						

							
						</div>
					</div>
				</c:forEach>
			
		</c:forEach>
		</div>
			
	
	</c:if>	
	
	<c:if test="${showTab eq 2 }">
	
	<br>
	<ul class="nav nav-tabs" id="myTab">
	<li><a href="appointments?showTab=1" ><label>Verschickte Einladungen</label></a></li>
	<li class="active"><a href="appointments?showTab=2"><label>Erhaltene Einladungen</label></a></li>

</ul>

	<div class="tab-content">
	
		<br>
		
			<c:forEach items="${usersInvitations}" var="appointment">
			<div class="row">
				<div class="col-md-11">
				
					<font size="4">Termin am ${appointment.appointmentDate.day} von
						${appointment.appointmentDate.startHour} bis ${appointment.appointmentDate.endHour} für das Ad : <a href="adprofile?adId=${appointment.ad.id}">${appointment.ad.title}</a> </font>
					
					<div id="invitationDetails" style="display:none">
						${appointment.additionalInfosForTheVisitors}
					</div>
		
				
				</div>
				
				<div class="col-md-1">
				
					<button type="button" class="btn btn-primary" onclick="showDetails()" ><b>Zeige Details </b>
					</button>
					</div>
					
					
				</div>	
			</c:forEach>
		</div>
		</c:if>
	</div>



		
	</div>




