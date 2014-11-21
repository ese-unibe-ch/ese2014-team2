<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h1>Abgemachte termine für dein ad ${ad.title }</h1>
	</div>
	<div class="panel-body">

<c:forEach items="${appointments}" var="appointment">
<c:forEach items="${appointment.appointmentDate }"
						var="appDate">
						<font size="6">Termin am ${appDate.day} von
							${appDate.startHour} bis ${appDate.endHour}</font>
		<br>
		<br> <font size="4">Name des Interessenten:</font> <br>

		<br> <c:forEach items="${appointment.invitations }" var="invitation">
			<div class="row">
				<div class="col-md-6">
					<font size="4">${invitation.firstName}
							${invitation.lastName }</font>
				</div>
				<div class="col-md-2">
					<c:forEach items="${invitation.appointmentInvitations }" var="message">
						<c:if test="${ message.appointedAppointment eq appointment.id}"> 
							<c:if test="${ message.accepted eq true }"> Einladung wurde Angenommen </c:if>
							<c:if test="${ message.rejected eq true }"> Einladung wurde Abgelehnt </c:if>
							
						</c:if>
					</c:forEach>
				
				</div>


				<div class="col-md-4">
					<a href="sendMessageFromAd?userId=${invitation.id}">
									<button type="button" class="btn btn-default">
										<b>Nachricht </b>
									</button>
								</a>
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
