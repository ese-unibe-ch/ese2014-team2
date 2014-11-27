<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<c:import url="template/header.jsp" />

<script type="text/javascript"
	src="assets/twitterbootstrap/js/bootstrap-tab.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

    activaTab("${show}");});

function activaTab(tab){
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};
</script>

<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>



<h1>${user.firstName }${user.lastName}'sInbox</h1>
<c:if test="${not empty infoMessage}">
	<div id="successMessage" class="alert alert-success" role="alert">
		<font color="006600" size="3"> ${infoMessage}</font>
	</div>
</c:if>

<ul class="nav nav-tabs" id="myTab">
	<li><a href="#showReceived" data-toggle="tab">Empfangene	Nachrichten</a></li>
	<li><a href="#showSent"data-toggle="tab">Gesendete nachrichten</a></li>
	<li><a href="#showInvitations" data-toggle="tab">Einladungen</a></li>
	<li><a href="#showNotifications" data-toggle="tab">Benachrichtigungen</a></li>

</ul>
<div class="tab-content">
	<div id="showReceived" class="tab-pane fade in active">
		<legend>Nachrichten Titel:</legend>

		<c:forEach items="${receivedMessages}" var="message">
			<div class="row">
				<div class="col-md-8">
					<a href="showMessage?messageId=${message.id}"><h4>${message.title}</h4></a>
				</div>


				<div class="col-md-4">
					<a href="deleteReceivedMsg?messageId=${message.id}">
						<button type="button" class="btn btn-danger">
							<b>Lösche die Nachricht</b>
						</button>
					</a>
				</div>
			</div>
		</c:forEach>

	</div>
	<div id="showSent" class="tab-pane fade">

		<legend>Nachrichten Titel:</legend>

		<c:forEach items="${sentMessages}" var="message">
			<div class="row">
				<div class="col-md-8">
					<a href="showMessage?messageId=${message.id}"><h4>${message.title}</h4></a>
				</div>


				<div class="col-md-4">
					<a href="deleteSentMsg?messageId=${message.id}">
						<button type="button" class="btn btn-danger">
							<b>Lösche die Nachricht</b>
						</button>
					</a>
				</div>
			</div>
		</c:forEach>


	</div>
	<div id="showInvitations" class="tab-pane fade">

		<legend>Nachrichten Titel:</legend>


		<c:forEach items="${invitations}" var="message">
			<div class="row">
				<div class="col-md-8">
					<a href="showInvitation?messageId=${message.id}"><h4>${message.title}</h4></a>
				</div>


				<div class="col-md-4">
					<a href="deleteInvitation?messageId=${message.id}">
						<button type="button" class="btn btn-danger">
							<b>Lösche die Einladung</b>
						</button>
					</a>
				</div>
			</div>
		</c:forEach>


	</div>
	<div id="showNotifications" class="tab-pane fade">



		<legend>Nachrichten Titel:</legend>


		<c:forEach items="${notifications}" var="message">
			<div class="row">
				<div class="col-md-8">
					<a href="showNotification?messageId=${message.id}"><h4>${message.title}</h4></a>
				</div>


				<div class="col-md-4">
					<a href="deleteNotification?messageId=${message.id}">
						<button type="button" class="btn btn-danger">
							<b>Lösche die Nachricht</b>
						</button>
					</a>
				</div>
			</div>
		</c:forEach>

	</div>

</div>















<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>

</div>
</div>
<c:import url="template/footer.jsp" />
