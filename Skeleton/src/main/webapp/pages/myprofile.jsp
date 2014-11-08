<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<h1>${newProfile.firstName }'s Profile</h1>



<table>
	<tr>
		<td>First Name:&nbsp;&nbsp;
		<td>${user.firstName}
	</td>
	<tr>
		<td>Last Name:&nbsp;&nbsp;
		<td>${user.lastName}
	</td>
	<tr>
		<td>Email:&nbsp;&nbsp;
		<td>${user.email}
	</td>

	<tr>
		<td>The ads of the user: &nbsp;&nbsp;
		<td>
		<c:forEach items="${user.advertisements}" var="ad">
  		<a href="adprofile?adId=${ad.id}">
  		 <h1>${ad.title}</h1>
  		 </a>
</c:forEach>
	</td>
	
	 <a href="setInformFilter">
				<button type="submit" class="btn btn-primary btn-lg">Erstelle einen Benachrichtigungs Filter!</button>
			 </a>
			 
</table>

	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>
    
    


<c:import url="template/footer.jsp" />
