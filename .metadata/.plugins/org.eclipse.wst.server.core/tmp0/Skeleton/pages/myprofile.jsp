<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><h1>${user.firstName }'s Profile</h1></div>
			  <div class="panel-body">
			  <table>
			  	<tr>
			  		<td> <font size="5">Vorname:&nbsp;&nbsp;   </font>	</td>
			  		<td> <font size="5">${user.firstName}</font></td>
			  	</tr>
			  	<tr>
			  		<td> <font size="5">Nachname:&nbsp;&nbsp;   </font>	</td>
			  		<td> <font size="5">${user.lastName}</font></td>
			  	</tr>
			  	<tr>
			  		<td> <font size="5">Email:&nbsp;&nbsp;   </font>	</td>
			  		<td> <font size="5">${user.email}</font></td>
			  	</tr>
			  
			  </table>
			  
			  
			 <a href="setInformFilter">
				<button type="submit" class="btn btn-primary btn-lg">Erstelle einen Benachrichtigungs Filter!</button>
			 </a>
		
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
