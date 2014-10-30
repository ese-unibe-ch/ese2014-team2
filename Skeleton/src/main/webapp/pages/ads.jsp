<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />
<c:import url="template/filter.jsp"/>


<div class="main">
<c:forEach items="${ads}" var="ads">
	<div class="row">
        <div class="col-sm-6">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="adprofile?adId=${ads.id}">${ads.title}</a></h3>
            </div>
            <div class="panel-body">
            		<img src="getUserImage/ <c:out value="${ads.mainPic.id}"/>" width="200" height="200" >
              		<table>
              			<tr>
              				<td>Creator:</td>
              				<td>${ads.creator.firstName }</td>
              			</tr>
              			<tr>
              				<td>Rooms:</td>
              				<td>${ads.rooms}</td>
              			</tr>
              			<tr>
              				<td>Roomspace:</td>
              				<td>${ads.roomSpace}</td>
              			</tr>
              			<tr>
              				<td>City:</td>
              				<td>${ads.city}</td>
              			</tr>
              			<tr>
              				<td>Price:</td>
              				<td>${ads.roomPrice}</td>
              			</tr>
              		</table>
            </div>
          </div>
    </div><!-- /.col-sm-4 -->
</c:forEach>
</div>


	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
