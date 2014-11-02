<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><h1>Übersicht über deine Ads</h1></div>
			  <div class="panel-body">
			  
			
			  <!-- Table -->
			  <table class="table">
			      
			     
			      <c:forEach items="${user.advertisements}" var="ad">
  					<tr>
  						<td>
  							<font size="5"> ${ad.title}</font> 
  						</td>
  						<td>
  							<div class="btn-group btn-group-lg">
  							
  							<a href="showInteressents?adId=${ad.id}">
							    <button type="button" class="btn btn-default"><b>Zeige Interessenten </b></button>
							    </a>
							    
							    <a href="setzeBesichtigungstermin?adId=${ad.id}">
							    <button type="button" class="btn btn-default"><b>Besichtigungstermin setzen </b></button>
							    </a>
							  
							    <a href="adprofile?adId=${ad.id}">
							    <button type="button" class="btn btn-default"><b>Bearbeiten </b></button>
							    </a>
							
							 
							  <a href="deleteAd?adId=${ad.id}">
							    <button type="button" class="btn btn-default"><b> Löschen </b></button>
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
