<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />





			<legend> Benachrichtigung von ${recipient.firstName }  ${recipient.lastName }: </legend>
			<h3>${message.title }</h3>
			<p>${message.messageText}</p>
			
			
										
			
			
			<a href="myinbox">
				<button type="button" class="btn btn-primary">Zurück</button>
				</a>
	
				<a href="deleteNotification?messageId=${message.id}">
	<button type="button" class="btn btn-danger"><b>Lösche die Nachricht</b></button></a>
			
			
		
		
	




	


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
