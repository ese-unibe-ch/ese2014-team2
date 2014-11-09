<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<p>Antwort an: ${recipient.firstName }  ${recipient.lastName } auf die Nachricht: ${message.title}:&nbsp;&nbsp;</p>



			<p> Nachricht von ${recipient.firstName }  ${recipient.lastName }: </p>
			<div class="controls">
				<font size="5">
					${message.messageText}
				</font>
			</div>
			
										
			
	
				<a href="deleteNotification?messageId=${message.id}">
	<button type="button" class="btn btn-default btn btn-block"><b>Lösche die Nachricht</b></button></a>
			
			
			<a href="myinbox">
				<button type="button" class="btn btn-danger">Zurück</button>
				</a>
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
