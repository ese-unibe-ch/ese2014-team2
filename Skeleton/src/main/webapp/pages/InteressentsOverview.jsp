<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />




<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h1>Übersicht über alle Interessenten für deine Ads</h1>
	</div>
	<div class="panel-body">

	<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>	

	<c:if test="${not empty dangerMessage}">
<div class="alert alert-danger" role="alert"><font color="CC0000" size="3"> ${dangerMessage}</font></div>
</c:if>	

<br>
			
			
		
	<c:forEach items="${ads}" var="ad">
			<br>
			<legend>Interessenten für ${ad.title}</legend>

			<c:forEach items="${ad.applications}" var="interessent">
				
					<div class="row">
					
					<div class="col-md-1">
					<c:if test="${interessent.favored}">
						<span style="color:orange; margin-top:13px; margin-left:15px" class="glyphicon glyphicon-star"></span>
						</c:if>
					</div>
					<div class="col-md-7">
					<a href="interessentDetails?applicationId=${interessent.id}">
							<h4><b> ${interessent.applicant.firstName},
								${interessent.applicant.lastName }</b></h4> </a>
								</div>
							
					
				
					
					<div class="btn-toolbar">
  							
  					
  					
												    
							
							<div class="btn-group">
							  <a href="removeInteressent/applicationId${interessent.id}/adId${ad.id}">
								<button type="button" class="btn btn-danger">
									<b> Lehne den Bewerber ab </b>
								</button>
								</a>
								
								<c:choose>
							<c:when test="${interessent.favored}">
								<a href="unFavorApplicant/applicationId${interessent.id}/pageshowInteressentsOverview">
								<button type="button" class="btn btn-warning">
									<b>Nicht mehr favorisieren</b>
								</button>
							</a>
							</c:when>
							<c:otherwise>
								<a href="favorApplicant/applicationId${interessent.id}/pageshowInteressentsOverview">
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
			
			</c:forEach>
		
	
			

	</div>
</div>

<c:import url="template/footer.jsp" />

