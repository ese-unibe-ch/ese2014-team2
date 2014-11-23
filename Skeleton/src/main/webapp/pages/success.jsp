
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />



<c:if test="${param.adPlaceSuccess eq true}">
<h1>Dein Ad wurde erstellt!</h1>
<script type="text/javascript">
    function redirect() {
        location.href = "/Skeleton/";
    }
    window.setTimeout("redirect()", 3000);
</script>
</c:if>

<c:if test="${param.createdAppointment eq true}">
<h1>Dein Besichtigungstermin wurde an alle Interessenten verschickt!</h1>

<script type="text/javascript">
    function redirect() {
        location.href = "/Skeleton/myads";
    }
    window.setTimeout("redirect()", 3000);
</script>

</c:if>



<c:if test="${param.messageSent eq true}">
<h1>Deine Nachricht wurde verschickt!</h1>
<script type="text/javascript">
    function redirect() {
        location.href = "/Skeleton/myinbox";
    }
    window.setTimeout("redirect()", 3000);
</script>

</c:if>


<c:if test="${param.userRegistered eq true}">
<h1>Erfolgreich registriert!</h1>
<script type="text/javascript">
    function redirect() {
        location.href = "/Skeleton/";
    }
    window.setTimeout("redirect()", 2000);
</script>

</c:if>








<c:import url="template/footer.jsp" />
