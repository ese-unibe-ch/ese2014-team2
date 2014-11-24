<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<script>

$(document).ready(function(){
  $("#showReceived").click(function(){
    $("#received").toggle();
    $("#sent").hide();
    $("#invitations").hide();
    $("#notifications").hide();
    $("#successMessage").hide();
   
   
  });
});


</script>

<script>

$(document).ready(function(){
  $("#showSent").click(function(){
    $("#sent").toggle();
    $("#received").hide();
    $("#invitations").hide();
    $("#notifications").hide();
    $("#successMessage").hide();

  });
});


</script>

<script>

$(document).ready(function(){
  $("#showInvitations").click(function(){
    $("#invitations").toggle();
    $("#received").hide();
    $("#sent").hide();
    $("#notifications").hide();
    $("#successMessage").hide();

  });
});


</script>

<script>

$(document).ready(function(){
  $("#showNotifications").click(function(){
    $("#notifications").toggle();
    $("#received").hide();
    $("#sent").hide();
    $("#invitations").hide();
    $("#successMessage").hide();

  });
});


</script>



<h1>${user.firstName } ${user.lastName}'s  Inbox</h1>

<div class="panel panel-default">
  <div class="panel-body">
  
<div class="btn-group btn-group-justified">
  <div class="btn-group">

    <button id="showReceived" type="button" class="btn btn-default"><b>Empfangene Nachrichten</b></button>
 
  </div>
  <div class="btn-group">
    <button id="showSent" type="button" class="btn btn-default"><b>Gesendete Nachrichten</b></button>
  </div>
 
  <div class="btn-group">
 
    <button id="showInvitations" type="button" class="btn btn-default"><b>Einladungen</b></button>

  </div>
  <div class="btn-group">
 
    <button id="showNotifications" type="button" class="btn btn-default"><b>Benachrichtigungen</b></button>

  </div>
  
  
  
</div>

<c:if test="${not empty infoMessage}">
	<div id="successMessage" class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>


			
<div id="received" style="display:none">
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

</div>	


<div id="sent" style="display:none">

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

		
</div>



<div id="invitations" style="display:none">

<br><br>
<font size="6">Nachrichten Titel:</font>
<br>

<c:forEach items="${invitations}" var="message">
<div class="row">
  <div class="col-md-8"> <font size="6"><a href="showInvitation?messageId=${message.id}">${message.title}</a></font></div>
  
	
  <div class="col-md-4"> <a href="deleteInvitation?messageId=${message.id}">
	<button type="button" class="btn btn-default btn btn-block"><b>Lösche die Einladung</b></button></a></div>
</div>
</c:forEach>

</div>


<div id="notifications" style="display:none">

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
