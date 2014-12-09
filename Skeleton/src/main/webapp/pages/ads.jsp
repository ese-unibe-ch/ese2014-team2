<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />
<c:import url="template/filter.jsp"/>
<div class="push"></div>
<style>
	.col-md-2 p {
			margin-bottom:5;
		}
</style>

<c:if test="${empty ads}">
		<div class="alert alert-warning" role="alert">
				<h4> Deine Suche hat keine Resultate ergeben</h4>
			</div>
		</c:if>
		
		
<c:forEach items="${ads}" var="ads">
        <div class="col-sm-6">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="adprofile?adId=${ads.id}">${ads.title}</a></h2>
            </div>
            <div class="panel-body">
        <div class="col-md-6">
            <c:if test="${empty ads.mainPic}">
				<img src="img/default_image.png" style="width:250px;height:250px"> 
			</c:if>
			<c:if test="${not empty ads.mainPic}">
				<img src="getUserImage/ <c:out value="${ads.mainPic.id}"/>" style="width:250px;height: 250px" >
			</c:if>
		</div>
		<div class="col-md-2">
			<label>Ersteller:</label>
			<label>Zimmer:</label>
			<label>Grösse:</label>
			<label>Stadt:</label>
			<label>Preis:</label>
		</div>
		<div class="col-md-2">
			<label>${ads.creator.firstName }</label><br>
			<label>${ads.rooms}</label><br>
			<label>${ads.roomSpace}</label><br>
			<label>${ads.city}</label><br>
			<label>${ads.roomPrice}</label>
		</div>
            </div>
          </div>
    </div><!-- /.col-sm-4 -->
</c:forEach>



	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
