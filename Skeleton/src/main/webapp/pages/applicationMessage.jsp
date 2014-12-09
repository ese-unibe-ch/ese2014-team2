<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Schicke eine Nachricht an: ${reciever.firstName }</h1>


	<form:form method="post" modelAttribute="messageForm" action="send" id="messageForm" cssClass="form-horizontal" autocomplete="off">
		<fieldset>

			<p>Empfänger:&nbsp;&nbsp; ${reciever.firstName}</p>
			<p>Absender:&nbsp;&nbsp; ${sender.firstName}</p>
			

			<form:hidden path="recipientId" id="field-reciever" value="${reciever.id }" />
		
			
			<div class="row">
			<label class="col-md-4">Titel: </label>
				<div class="col-md-4">
					<form:input path="title" id="field-title" tabindex="1" maxlength="30" />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4">Nachricht: </label>
			</div>
			<div class="row">
						<div class="textareabig">
							<form:textarea rows="10" cols="90" path="message" id="field-Message" tabindex="24" />
						</div>
			</div>
	


			<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="send">Senden</button>
				<a href="#" onclick="history.go(-2)">	<button type="button" class="btn btn-danger">Zurück</button></a>
			</div>
		
					</fieldset>

	</form:form>

</div>


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
