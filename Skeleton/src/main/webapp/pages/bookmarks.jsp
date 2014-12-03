<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />

<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">
		<h3>Übersicht über dine Favoriten Ads</h3>
	</div>
	<div class="panel-body">

		<c:if test="${not empty infoMessage}">
			<div class="alert alert-success" role="alert">
				<font color="006600" size="3"> ${infoMessage}</font>
			</div>
		</c:if>

		<!-- Table -->
		<table class="table">


			<c:forEach items="${bookmarks}" var="bookmark">
				<tr>
					<td><a href="adprofile?adId=${bookmark.ad.id}"> <h4>
							 ${bookmark.ad.title}</h4>
					</a></td>
					<td>
						<div class="btn-group btn-group-lg">


							<a href="adprofile?adId=${bookmark.ad.id}">
								<button type="button" class="btn btn-default">
									<b>Zeige Ad </b>
								</button>
							</a> <a href="unBookmarkAdFromBookmarks?adId=${bookmark.ad.id}">
								<button type="button" class="btn btn-danger">
									<b> Entferne Favorit </b>
								</button>
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
