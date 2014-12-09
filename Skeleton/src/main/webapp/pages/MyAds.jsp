<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h1>Übersicht über deine Ads</h1>
	</div>
	<div class="panel-body">

		<c:if test="${not empty infoMessage}">
			<div class="alert alert-success" role="alert">
				<font color="006600" size="3"> ${infoMessage}</font>
			</div>
		</c:if>
		<!-- Table -->
		<table class="table">
		
		<c:if test="${empty user.advertisements}">
		<div class="alert alert-warning" role="alert">
				<h4> Du hast keine Inserate aufgeschaltet!</h4>
			</div>
		</c:if>
			
			<c:forEach items="${user.advertisements}" var="ad">
				<tr>
					<td>
					<a href="adprofile?adId=${ad.id}">
					<h4> ${ad.title}</h4>
					</a>
					</td>
					
					<td>
						<div class="btn-group btn-group-lg">

							<a href="deleteAd?adId=${ad.id}">
								<button type="button" class="btn btn-danger">
									<b> Löschen </b>
								</button>
							</a>
							<a href="showInteressents?adId=${ad.id}">
								<button type="button" class="btn btn-default">
									<b>Interessenten </b>
								</button>
							</a> <a href="zeigeBesichtigungstermine?adId=${ad.id}">
								<button type="button" class="btn btn-default">
									<b>Zeige Besichtigungstermine </b>
								</button>
							</a> <a href="editAd?adId=${ad.id}">
								<button type="button" class="btn btn-default">
									<b>Bearbeiten </b>
								</button>
							</a> 


						</div>
					</td>
				</tr>
			</c:forEach>

		</table>
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
