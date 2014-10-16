<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<c:forEach items="${ads}" var="ads">
    <div class="main">
    	<p class="pubimp">${ads.creationDate}</p>
    	<h1 class="newstext">${ads.title}</h1>
    	<table class="smalltable">
    		<tr>
    			<td>Creator:&nbsp;&nbsp;
    			<td>${ads.creator}
    		</tr>
    		<tr>
    			<td>Limited:&nbsp;&nbsp;
    			<td>${ads.isLimited}
    		</tr>
    		<tr>
    			<td>Rooms:&nbsp;&nbsp;
    			<td>${ads.rooms}
    		</tr>
    		<tr>
    			<td>Space:&nbsp;&nbsp;
    			<td>${ads.space}
    		</tr>
    		<tr>
    			<td>Description:&nbsp;&nbsp;
    			<td>${ads.description}
    		</tr>
    		<tr>
		<td><a href="../">Back</a>
		<td><a href="adprofile?adId=${ads.id}">Details</a>
	</td>
    	</table>
    </div>	
</c:forEach>



	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
