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
  <a href="inboxShow/notifications">
    <button type="button" class="btn btn-default"><b>Benachrichtigungen</b></button>
    </a>
  </div>
</div>

<c:if test="${param.showReceived eq true}">
			
<c:forEach items="${receivedMessages}" var="message">
   <a href="showMessage?messageId=${message.id}"><h1>${message.title}</h1></a>
  
	
   <a href="deleteReceivedMsg?messageId=${message.id}">
	<button type="button" class="btn btn-default"><b>Lösche die Nachricht</b></button>
</a>
</c:forEach>
</c:if>


<c:if test="${param.showSent eq true}">
			
<c:forEach items="${sentMessages}" var="message">
   <a href="showMessage?messageId=${message.id}"><h1>${message.title}</h1></a>
  
	
    <a href="deleteSentMsg?messageId=${message.id}">
	<button type="button" class="btn btn-default"><b>Lösche die Nachricht</b></button>
</a>
</c:forEach>
</c:if>


<c:if test="${param.showNotifications eq true}">
			
<c:forEach items="${notifications}" var="notification">
   <a href="showMessage?messageId=${notification.id}"><h1>${notification.title}</h1></a>
  
	
   <a href="deleteNotification?messageId=${notification.id}">
	<button type="button" class="btn btn-default"><b>Lösche die Nachricht</b></button>
</a>
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
