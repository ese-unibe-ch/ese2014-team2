<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<c:import url="template/header.jsp" />


<c:if test="${not empty infoMessage}">
	<div class="alert alert-danger" role="alert"><font color="CC0000" size="5"> ${infoMessage}</font></div>
</c:if>
<c:if test="${empty infoMessage }">
<h1>Du versuchst gerade auf etwas zuzugreifen worauf du keinen Zugriff hast!  <br> </h1>
</c:if>
	<img src="img/Forbidden.gif">
	<h2><a href="/Skeleton"> Hier geht es zurück auf die Hauptseite</a></h2>
	
</body>
</html>