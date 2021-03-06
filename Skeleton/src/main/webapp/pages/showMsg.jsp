<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


	


	<form:form method="post" modelAttribute="messageForm" action="send" id="messageForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>

			<legend> Nachricht von ${recipient.firstName }  ${recipient.lastName }: </legend>
			<h3>${message.title }</h3>
			<p>${message.messageText}</p>
			
					
							<form:hidden path="recipientId" id="field-Answer"
								 value="${recipient.id }" />
					
			<legend>Antwort an: ${recipient.firstName }  ${recipient.lastName } auf die Nachricht: ${message.title}:&nbsp;&nbsp;</legend>
			<div class="row">
			<label class="col-md-4">Titel: AW: ${message.title} </label>
				<div class="col-md-4">
				<form:hidden path="title" id="field-title"  value="AW: ${message.title}" />
					
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4">Nachricht: </label>
			</div>
			<div class="row">
						<div class="textareabig">
							<form:textarea rows="10" cols="90" path="message" id="field-Message"  />
						</div>
			</div>
	


			<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="send">Send</button>
					<a href="#" onclick="history.go(-2)">	<button type="button" class="btn btn-danger">Cancel</button></a>
			</div>
		
					</fieldset>

	</form:form>




	


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
