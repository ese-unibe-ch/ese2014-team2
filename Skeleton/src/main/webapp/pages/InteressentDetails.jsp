<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="panel panel-default">
  <div class="panel-body">
  
  	<legend>Bewerbung von ${application.applicant.firstName }  ${application.applicant.lastName } </legend>
  	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Bis wann möchte der Bewerber in der Wohnung leben?</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${application.timeLimitation }</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Titel:</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${application.title }</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Nachricht:</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${application.message }</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Raucht der Bewerber:</label>
		</div>
		<div class="col-sm-2 col-md-4">
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
		<a href="removeInteressent?applicationId=${application.id }">
								<button type="button" class="btn btn-default">
									<b> Lehne den Bewerber ab </b>
								</button>
								</a>
								
	</div>
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
