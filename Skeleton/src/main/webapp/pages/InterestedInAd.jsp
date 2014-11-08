<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Send a Message to ${reciever.firstName }</h1>


	<form:form method="post" modelAttribute="applicantForm" action="sendResume" id="applicantForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>

		

			<form:hidden path="adId" id="field-reciever" value="${adId }" />
			
			<div class="row">
			<label class="col-md-4">Titel: </label>
				<div class="col-md-4">
					<form:input path="title" id="field-title" tabindex="1" maxlength="10" />
				</div>
			</div>
			
			<div class="row">
			<label class="col-md-4">Bis wann möchtest du das Zimmer? (Falls unbegrenzt, einfach leerlassen): </label>
				<div class="col-md-4">
					<form:input path="bisWann" id="field-title" tabindex="1" maxlength="10" />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4">Erzähle etwas über dich:  </label>
			</div>
			<div class="row">
						<div class="textareabig">
							<form:textarea rows="10" cols="90" path="message" id="field-Message" tabindex="24" />
						</div>
			</div>
			
			<div class="row">
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="smoker" id="field-furnished" />Bist du Raucher?</label>
					</div>
	


			<div class="form-actions">
							<button type="submit" class="btn btn-primary" id="send">Send</button>
				<button type="button" class="btn btn-danger">Cancel</button>
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
