<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Antwort an: ${recipient.firstName }  ${recipient.lastName } auf die Nachricht: ${message.title}</h1>

	<label class="control-label" for="field-title"><font size="10"> Nachricht von ${recipient.firstName }  ${recipient.lastName }: </font></label>
			<div class="controls">
				<font size="5">
					${message.messageText}
				</font>
			</div>	
	
	
	<form:form method="post" modelAttribute="messageForm" action="send"
		id="messageForm" cssClass="form-horizontal" autocomplete="off"
		enctype="multipart/form-data">
		<fieldset>
				
				
						<div class="controls">
							<form:hidden path="recipientId" id="field-Answer"
								tabindex="23" value="${recipient.id }" />
						</div>

				
				<label class="control-label" for="field-title"><font size="10">Titel:  </font></label>
			<div class="controls">
				<form:input path="title" id="field-title" tabindex="1"
					maxlength="1000" />
			</div>				
				
		
				<label class="control-label"
						for="field-Mesasge"><font size="10">Nachricht: </font></label>
						<div class="controls">
							<form:textarea rows="10" cols="90" path="message"
								id="field-Message" tabindex="24" />
						</div>



	<div class="btn-group btn-group-lg">
				
				  <button type="submit" class="btn btn-default">Senden</button>
				
				<a href="myinbox">
				  <button type="button" class="btn btn-default">Zurück</button>
				</a>
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

<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Send a Message to ${reciever.firstName }</h1>


	<form:form method="post" modelAttribute="messageForm" action="send" id="messageForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>

			<p>Empfänger:&nbsp;&nbsp; ${reciever.firstName}</p>
			<p>Absender:&nbsp;&nbsp; ${sender.firstName}</p>
			

			<form:hidden path="recipientId" id="field-reciever"tabindex="23" value="${reciever.id }" />
			
			<div class="row">
			<label class="col-md-4">Titel: </label>
				<div class="col-md-4">
					<form:input path="title" id="field-title" tabindex="1" maxlength="10" />
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

