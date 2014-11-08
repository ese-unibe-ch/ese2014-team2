<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="panel panel-default">
  <div class="panel-body">
  
  
	<p>Bewerbung von ${application.applicant.firstName }  ${application.applicant.lastName } </p>
	
	<p> Bis wann möchte der bewerber in der Wohnung leben?</p>
	<p> ${application.timeLimitation } </p>
	<br><br>
	<p> Titel: </p>
	<p> ${application.title }	 </p>
	<p> Nachricht:  </p>
	<p> ${application.message } </p>
	
	<br><br>
	<p> raucht der Bewerber? </p>
		<p>
			<c:choose>
					<c:when test="${application.smoker}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>	
		</p>
	

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
