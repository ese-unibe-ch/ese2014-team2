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
			
			
		
			
			
	<a href="acceptInvitation?appointmentId=${appointment.id}">
    <button type="button" class="btn btn-success"><b>Nimm die Einladung an.</b></button>
    </a>
    
    <a href="rejectInvitation?appointmentId=${appointment.id}">
    <button type="button" class="btn btn-danger"><b>Lehne die Einladung ab.</b></button>
    </a>
	
	
				
				
						

				
	




</div>


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
