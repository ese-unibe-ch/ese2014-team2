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

<c:forEach items="${ads}" var="ads">
        <div class="col-sm-6">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="adprofile?adId=${ads.id}">${ads.title}</a></h2>
            </div>
            <div class="panel-body">
        <div class="col-md-6">
            <c:if test="${empty ads.mainPic}">
				<img src="img/default_image.png"> 
			</c:if>
			<c:if test="${not empty ads.mainPic}">
				<img src="getUserImage/ <c:out value="${ads.mainPic.id}"/>" width="200" height="200" >
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
			<p>${ads.creator.firstName }</p>
			<p>${ads.rooms}</p>
			<p>${ads.roomSpace}</p>
			<p>${ads.city}</p>
			<p>${ads.roomPrice}</p>
		</div>
            </div>
          </div>
    </div><!-- /.col-sm-4 -->
</c:forEach>

<a href="unfilteredAds"><button type="button" class="btn btn-danger">Zurücksetzen</button></a>

	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
