<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<legend class="h1_inline">Einladung zur Wohnungbesichtigung von ${sender.firstName }  ${sender.lastName } </legend>

	<h3> Nachricht: </h3>
			<div class="controls">
				<p>
					${message.messageText}
				</p>
			</div>	
			
			
		
	
	<c:choose>
				    <c:when test="${not empty appointment.whoAcceptedTheAppointment}">
				    
					       <c:forEach items="${appointment.whoAcceptedTheAppointment}" var="acceptOfApp">
					       		
								<c:if test="${acceptOfApp.user.id eq user.id }">
									<c:if test="${acceptOfApp.accepted eq false && acceptOfApp.rejected eq false }">
								<div class="separator"></div>
									<a href="acceptInvitation?appointmentId=${appointment.id}">
								    <button type="button" class="btn btn-success"><b>Nimm die Einladung an.</b></button>
								</a>
			    
							    <a href="rejectInvitation?appointmentId=${appointment.id}">
							    <button type="button" class="btn btn-danger"><b>Lehne die Einladung ab.</b></button>
							    </a>
							    	</c:if>
							    	<c:if test="${acceptOfApp.accepted eq true }">
							    	<div class="alert alert-success" role="alert"><font color="006600" size="3"> <p> Einladung wurde von dir angenommen. Falls du doch nicht kannst kontaktiere den Inseratensteller</p></font></div>
							    		
							    	</c:if>
							    	<c:if test="${acceptOfApp.rejected eq true }">
							    		<div class="alert alert-danger" role="alert"><font color="CC0000" size="3"> <p> Einladung wurde von dir abgelehnt. Falls du doch willst, kontaktiere den Inseratensteller</p></font></div>
							    	</c:if>
							    </c:if>
						
							    
					    </c:forEach>
				    </c:when>
				    <c:otherwise>
				       <div class="separator"></div>
							<a href="acceptInvitation?appointmentId=${appointment.id}">
						    <button type="button" class="btn btn-success"><b>Nimm die Einladung an.</b></button>
						</a>
	    
					    <a href="rejectInvitation?appointmentId=${appointment.id}">
					    <button type="button" class="btn btn-danger"><b>Lehne die Einladung ab.</b></button>
					    </a>
				    </c:otherwise>
				</c:choose>
				
				
	
    


</div>


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
