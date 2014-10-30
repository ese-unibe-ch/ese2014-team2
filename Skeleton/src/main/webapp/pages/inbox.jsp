<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<h1>${user.firstName } ${user.lastName}'s  Inbox</h1>



<c:forEach items="${receivedMessages}" var="message">
   <a href="replyToMessage?messageId=${message.id}"><h1>${message.title}</h1></a>
  
	
   <a href="replyToMessage?messageId=${message.id}">
	<div class="btnpink">
		<span>Delete!</span>
	</div>
</a>
</c:forEach>






	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
