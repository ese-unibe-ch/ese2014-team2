<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>




<c:import url="template/header.jsp" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

    activaTab("${show}");});

function activaTab(tab){
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};
</script>

<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>



	<script type="text/javascript">

	function noteFunct() {
        $('#setNote').dialog();
 

	}
</script> 
<script>
	function showDetails() {
		$('#invitationDetails').show();
	}
	
</script>

  

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h1>Übersicht über alle  abgemachten Termine </h1>
	</div>
	<div class="panel-body">
	
	<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>

<ul class="nav nav-tabs" id="myTab">
	<li class="active"><a href="#showInvitations" data-toggle="tab">Verschickte Einladungen</a></li>
	<li><a href="#showInvited"data-toggle="tab">Erhaltene Einladungen</a></li>

</ul>

	<div class="tab-content">
		<div id="showInvitations" class="tab-pane fade in active">
		<br>
			<c:forEach items="${usersAppointments}" var="appointment">
				<font size="4">Termin am ${appDate.day} von
						${appointment.appointmentDate.startHour} bis ${appointment.appointmentDate.endHour} für dein Ad : <a href="adprofile?adId=${appointment.ad.id}">${appointment.ad.title}</a> </font>
					<br>
					<br>
					<font size="4">Name des Interessenten:</font>
					<br>
	
					<br>
					<c:forEach items="${appointment.invitations }" var="invitation">
							<div class="row">
								<div class="col-md-6">
								<font size="4">${invitation.firstName}
									${invitation.lastName }</font>
							</div>
							<div class="col-md-2">
								<c:forEach items="${invitation.appointmentInvitations }"
									var="message">
									<c:if test="${ message.appointedAppointment eq appointment.id}">
										<c:if test="${ message.accepted eq true }"> Einladung wurde angenommen </c:if>
										<c:if test="${ message.rejected eq true }"> Einladung wurde abgelehnt </c:if>
										<c:if
											test="${message.rejected eq false and message.accepted eq false }"> Der Benutzer hat die Einladung noch nicht abgelehnt/angenommen </c:if>
	
									</c:if>
								</c:forEach>
	
							</div>
	
	
							<div class="col-md-4">
	
	
	
	
	
								<button type="button" class="btn btn-default" onclick="noteFunct()" >
									<b>Notiz </b>
								</button>
								
								
							<div id="setNote" title="Notiz" style="display:none">
							
							<form method="post" action="setNote" id="noteForm"  autocomplete="off" >
								
								<c:if test="${ not empty appointment.userNotes }">																				
								<c:forEach items="${appointment.userNotes }" var="note"> 
										<textarea rows="4" cols="20"  name ="noteText" id="noteText">"${note.text }"</textarea>
								
								</c:forEach>
								</c:if>
								<c:if test="${ empty appointment.userNotes }">	
								<textarea rows="4" cols="20"  name ="noteText" id="noteText"></textarea>
								</c:if>
								
								<input type="hidden" id="userId" name="userId" value="${invitation.id }" />
								<input type="hidden" id="appointmentId" name="appointmentId" value="${appointment.id }" />


									
								<button type="submit"  value="send" class="btn btn-default">
									<b>OK </b>
								</button>
										
							</form>
						</div>  
						
							
	
								<c:forEach items="${invitation.appointmentInvitations }"
									var="message">
									<c:if test="${ message.appointedAppointment eq appointment.id}">
										<a href="sendMessageFromAppointment?messageId=${message.id}">
											<button type="button" class="btn btn-default">
												<b>Nachricht </b>
											</button>
										</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</c:forEach>
			
		</div>
		
		<div id="showInvited" class="tab-pane fade">
		<br>
		
			<c:forEach items="${usersInvitations}" var="appointment">
			<div class="row">
				<div class="col-md-11">
				
					<font size="4">Termin am ${appointment.appointmentDate.day} von
						${appointment.appointmentDate.startHour} bis ${appointment.appointmentDate.endHour} für das Ad : <a href="adprofile?adId=${appointment.ad.id}">${appointment.ad.title}</a> </font>
					<br>
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
	</div>



		
	</div>
</div>




