<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><h1>Interessenten von ${ad.title }</h1></div>
			  <div class="panel-body">
			  
			
			  <!-- Table -->
			  <table class="table">
			      
			      
			     
			      <c:forEach items="${interessents}" var="interessent">
  					<tr>
  						
  						<td>
  							
  							<font size="5"> ${interessent.firstName}, ${interessent.lastName }</font> 
  						
  						</td>
  					</tr>
					</c:forEach>
			    
			  </table>
			</div>
			</div>
			
<c:import url="template/footer.jsp" />

