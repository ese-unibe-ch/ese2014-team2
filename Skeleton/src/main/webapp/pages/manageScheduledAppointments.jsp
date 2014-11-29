<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>




<c:import url="template/header.jsp" />


	<script type="text/javascript">

	function noteFunct() {
        $('#note').dialog();
 

	}
</script> 
  
  

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h1>Abgemachte Termine für Dein Ad ${ad.title }</h1>
	</div>
	<div class="panel-body">
	
	<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>

		<c:forEach items="${appointments}" var="appointment">
			<c:forEach items="${appointment.appointmentDate }" var="appDate">
				<font size="6">Termin am ${appDate.day} von
					${appDate.startHour} bis ${appDate.endHour}</font>
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
							
							
						<div id="note" title="Notiz" style="display:none">
							
							<form method="post" action="setNote" id="noteForm"  autocomplete="off" >
								<c:forEach items="${appointment.userNotes }" var="note"> 
									<c:if test="${note.applicant.id eq invitation.id }"> 
										<textarea rows="4" cols="20"  name ="noteText" id="noteText">"${note.text }"</textarea>
								<input type="hidden" id="userId" name="userId" value="${invitation.id }" />
								<input type="hidden" id="appointmentId" name="appointmentId" value="${appointment.id }" />
									</c:if>
								
								</c:forEach>
																							
								

									
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
		</c:forEach>




		
	</div>
</div>










<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
