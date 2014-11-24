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



<br>
			<br>
			<font size="6">Nachrichten Titel:</font>
			<br>
			
			<form action="setzeTeilBesichtigungstermin" method="POST">

			<c:forEach items="${interessents}" var="interessent">
				
					<div class="row">
					<div class="col-md-7">
					<a href="interessentDetails?applicationId=${interessent.id}">
							<font size="5"> ${interessent.applicant.firstName},
								${interessent.applicant.lastName }</font> </a>
								</div>
							
					
				
					
					<div class="btn-toolbar">
  							
  					
  						<div class="btn-group">
							<label class="btn btn-default btn-lg">
								<input type="checkbox" name="interessentsArr"  value="${interessent.id }"/>
								<b>Einladung schicken</b>
							</label>
										</div>		    
					
												    
							
							<div class="btn-group">
							  <a href="removeInteressent?applicationId=${interessent.id}">
								<button type="button" class="btn btn-default">
									<b> Lehne den Bewerber ab </b>
								</button>
								</a>
							</div>
							  
							</div>
							</div>
							
			</c:forEach>
			
			<button type="submit" class="btn btn-primary"  onclick="this.disabled=true;this.form.submit();">Setze Besichtigungstermin</button>
			<a href="/Skeleton/ads"><button class="btn btn-danger">Zurück</button></a>
		</form>

			

	</div>
</div>

<c:import url="template/footer.jsp" />

