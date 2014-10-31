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
</div>

<c:if test="${param.showReceived eq true}">
			
<c:forEach items="${receivedMessages}" var="message">
   <a href="replyToMessage?messageId=${message.id}"><h1>${message.title}</h1></a>
  
	
   <a href="replyToMessage?messageId=${message.id}">
	<div class="btnpink">
		<span>Delete!</span>
	</div>
</a>
</c:forEach>
</c:if>


<c:if test="${param.showSent eq true}">
			
<c:forEach items="${sentMessages}" var="message">
   <a href="replyToMessage?messageId=${message.id}"><h1>${message.title}</h1></a>
  
	
   <a href="replyToMessage?messageId=${message.id}">
	<div class="btnpink">
		<span>Delete!</span>
	</div>
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
