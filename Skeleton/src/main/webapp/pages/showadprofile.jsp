<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<h1>${newProfile.firstName }'s Profile</h1>



<table>
	<tr>
		<td>First Name:&nbsp;&nbsp;
		<td>${newProfile.firstName}
	</td>
	<tr>
		<td>Last Name:&nbsp;&nbsp;
		<td>${newProfile.lastName}
	</td>
	<tr>
		<td>Email:&nbsp;&nbsp;
		<td>${newProfile.email}
	</td>
	<tr>
		<td>Team:&nbsp;&nbsp;
		<td>${newProfile.team}
	</td>
	<tr>
		<td>
		<td>
	</td>
	
</table>

	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
