<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Schicke eine Nachricht an ${reciever.firstName }</h1>


	<form:form method="post" modelAttribute="applicantForm" action="sendResume" id="applicantForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>

		

			<form:hidden path="adId" id="field-reciever" value="${adId }" />
			
						
			<div class="row">
				<label class="col-md-4" for="field-von">Ab wann möchtest du einziehen? </label>
				<div class="col-md-4">
					<form:input path="bisWann" type="field-bisWann" id="datepicker" tabindex="2" />
					
				</div>
			</div>
			<p>Leer lassen, wenn du sofort einziehen möchtest.</p>
			
			
			<div class="row">
				<label class="col-md-4">Erzähle etwas über dich:  </label>
			</div>
			<div class="row">
						<div class="textareabig">
							<form:textarea rows="10" cols="90" path="message" id="field-Message" placeholder="Wer bist du... Was machst du... Warum willst du das Zimmer" />
						</div>
			</div>
			
			
	


			<div class="form-actions">
				<a href="#" onclick="history.go(-2)">	<button type="button" class="btn btn-danger">Zurück</button></a>
							<button type="submit" class="btn btn-primary" id="send">Absenden</button>
			
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
