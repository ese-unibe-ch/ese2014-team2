<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><h1>Übersicht über dine Favoriten Ads</h1></div>
			  <div class="panel-body">
			  
			
			  <!-- Table -->
			  <table class="table">
			      
			     
			      <c:forEach items="${bookmarks}" var="bookmark">
  					<tr>
  						<td>
  						  <a href="adprofile?adId=${bookmark.ad.id}">
  							<font size="5"> ${bookmark.ad.title}</font> 
  							</a>
  						</td>
  						<td>
  							<div class="btn-group btn-group-lg">
  							
							  
							    <a href="adprofile?adId=${bookmark.ad.id}">
							    <button type="button" class="btn btn-default"><b>Zeige Ad </b></button>
							    </a>
							
							 
							  <a href="unBookmarkAd?adId=${bookmark.ad.id}">
							    <button type="button" class="btn btn-default"><b> Enterne Favorit </b></button>
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
