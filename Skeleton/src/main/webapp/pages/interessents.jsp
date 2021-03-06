<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />




<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h1>Interessenten von ${ad.title }</h1>
	</div>
	<div class="panel-body">

	<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>	

	<c:if test="${not empty dangerMessage}">
<div class="alert alert-danger" role="alert"><font color="CC0000" size="3"> ${dangerMessage}</font></div>
</c:if>	

<br>
			<br>
			<font size="6">Nachrichten Titel:</font>
			<br>
			
			<form action="setzeTeilBesichtigungstermin?adId=${ad.id }" method="POST">
	
		
			<c:if test="${empty interessents}">
		<div class="alert alert-warning" role="alert">
				<h4> Du hast noch keine Interessenten für dieses Insereat!</h4>
			</div>
		</c:if>
		
			<c:forEach items="${interessents}" var="interessent">
				
					<div class="row">
					<div class="col-md-1">
					<c:if test="${interessent.favored}">
						<span style="color:orange; margin-top:13px; margin-left:15px" class="glyphicon glyphicon-star"></span>
						</c:if>
					</div>
					<div class="col-md-5">
					<a href="interessentDetails?applicationId=${interessent.id}">
							<font size="5"> ${interessent.applicant.firstName},
								${interessent.applicant.lastName }</font> </a>
								</div>
							
					
				
					
					<div class="btn-toolbar">
  							
  					
  					
  					
  						<div class="btn-group">
							<label class="btn btn-default">
								<input type="checkbox" name="interessentsArr"  value="${interessent.id }"/>
								<b>Einladung schicken</b>
							</label>
										</div>		    
					
												    
							
							<div class="btn-group">
							  <a href="removeInteressent/applicationId${interessent.id}/adId${ad.id}">
								<button type="button" class="btn btn-danger">
									<b> Lehne den Bewerber ab </b>
								</button>
								</a>
								
								<c:choose>
							<c:when test="${interessent.favored}">
								<a href="unFavorApplicant/applicationId${interessent.id}/pageshowInteressents?adId=${ad.id}">
								<button type="button" class="btn btn-warning">
									<b>Nicht mehr favorisieren</b>
								</button>
							</a>
							</c:when>
							<c:otherwise>
								<a href="favorApplicant/applicationId${interessent.id}/pageshowInteressents?adId=${ad.id}">
								<button type="button" class="btn btn-success">
									<span color="orange" class="glyphicon glyphicon-star"></span> Favorisieren
								</button>
							</a>
							</c:otherwise>
						</c:choose>
							</div>
							  
							</div>
							</div>
							
			</c:forEach>
			
			<div class="form-actions">

			<button type="submit" class="btn btn-primary"  onclick="this.disabled=true;this.form.submit();">Setze Besichtigungstermin</button>
			
			</div>
		</form>

			

	</div>
</div>

<c:import url="template/footer.jsp" />

