<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<h1>${user.firstName } ${user.lastName}'s  Inbox</h1>

<div class="panel panel-default">
  <div class="panel-body">
  
<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <a href="inboxShow/showReceived">
    <button type="button" class="btn btn-default"><b>meine Nachrichten</b></button>
    </a>
  </div>
  <div class="btn-group">
  <a href="inboxShow/showSent">
    <button type="button" class="btn btn-default"><b>meine gesendeten Nachrichten</b></button>
    </a>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-default"><b>öffentliche Fragen zu einem ad</b></button>
  </div>
  <div class="btn-group">
  <a href="inboxShow/invitations">
    <button type="button" class="btn btn-default"><b>Zeige Besichtigungseinladungen</b></button>
    </a>
  </div>
  <div class="btn-group">
  <a href="inboxShow/notifications">
    <button type="button" class="btn btn-default"><b>Benachrichtigungen</b></button>
    </a>
  </div>
</div>

<c:if test="${param.showReceived eq true}">
			
	
<br><br>
<font size="6">Nachrichten Titel:</font>
<br>

<c:forEach items="${receivedMessages}" var="message">
<div class="row">
  <div class="col-md-8"> <font size="6"><a href="showMessage?messageId=${message.id}">${message.title}</a></font></div>
  
	
  <div class="col-md-4"> <a href="deleteReceivedMsg?messageId=${message.id}">
	<button type="button" class="btn btn-default btn btn-block"><b>Lösche die Nachricht</b></button></a></div>
</div>
</c:forEach>

</c:if>


<c:if test="${param.showSent eq true}">

<br><br>
<font size="6">Nachrichten Titel:</font>
<br>

<c:forEach items="${sentMessages}" var="message">
<div class="row">
  <div class="col-md-8"> <font size="6"><a href="showMessage?messageId=${message.id}">${message.title}</a></font></div>
  
	
  <div class="col-md-4"> <a href="deleteSentMsg?messageId=${message.id}">
	<button type="button" class="btn btn-default btn btn-block"><b>Lösche die Nachricht</b></button></a></div>
</div>
</c:forEach>

		
</c:if>



<c:if test="${param.showInvitations eq true}">

<br><br>
<font size="6">Nachrichten Titel:</font>
<br>

<c:forEach items="${invitations}" var="message">
<div class="row">
  <div class="col-md-8"> <font size="6"><a href="showInvitation?messageId=${message.id}">${message.title}</a></font></div>
  
	
  <div class="col-md-4"> <a href="deleteNotification?messageId=${message.id}">
	<button type="button" class="btn btn-default btn btn-block"><b>Lösche die Einladung</b></button></a></div>
</div>
</c:forEach>


</c:if>


<c:if test="${param.showNotifications eq true}">

<br><br>
<font size="6">Nachrichten Titel:</font>
<br>

<c:forEach items="${notifications}" var="message">
<div class="row">
  <div class="col-md-8"> <font size="6"><a href="showNotification?messageId=${message.id}">${message.title}</a></font></div>
  
	
  <div class="col-md-4"> <a href="deleteNotification?messageId=${message.id}">
	<button type="button" class="btn btn-default btn btn-block"><b>Lösche die Nachricht</b></button></a></div>
</div>
</c:forEach>

</c:if>


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
