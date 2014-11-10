<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Einladung zur Wohnungbesichtigung von ${sender.firstName }  ${sender.lastName } </h1>

	<label class="control-label" for="field-title"><font size="10"> Nachricht: </font></label>
			<div class="controls">
				<font size="5">
					${message.messageText}
				</font>
			</div>	
			
			
		
			
			
	<a href="acceptInvitation?appointmentId=${appointment.id}">
    <button type="button" class="btn btn-default"><b>Nimm die Einladung an.</b></button>
    </a>
    
    <a href="deleteNotification?messageId=${message.id}">
    <button type="button" class="btn btn-default"><b>Lehne die Einladung ab.</b></button>
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
