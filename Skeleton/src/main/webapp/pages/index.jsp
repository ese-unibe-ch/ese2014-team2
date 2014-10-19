
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<c:import url="template/header.jsp" />

		<sec:authorize access="hasRole('ROLE_USER')">

This content will only be visible to users who have
the "supervisor" authority in their list of <tt>GrantedAuthority</tt>s.

</sec:authorize>

		<a href="ads">
			<div class="main_button_left_big">	
					<h1>I'm looking for an appartement!</h1>
			</div>
		</a>
		
		
		<a href="">
        	<div class="main_button_right_big">	
				<h1>I'm looking for roomies!</h1>
			</div>
		</a>	
			
		<a href="placead">
    		<div class="main_button_left_small">	
				<h1>I want to place an Ad</h1>
			</div>
		</a>	
		
		<a href="/placemate">	
			<div class="main_button_right_small">	
				<h1>I want to get roomed!</h1>
			</div>
		</a>
		
		
    		


<c:import url="template/footer.jsp" />

