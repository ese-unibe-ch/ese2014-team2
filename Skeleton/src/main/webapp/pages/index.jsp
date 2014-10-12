<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

		<a href="/showads">
			<div class="main_button_left">	
					<h1>I'm looking for an appartement!</h1>
					<div id="mbl1"></div>
			</div>
		</a>
		
		<a href="placead">
        	<div class="main_button_right">	
				<h1>I want to place my Ad!</h1>
				<div id="mbr1"></div>
			</div>
		</a>	
			
		<a href="/showmates">
    		<div class="main_button_left">	
				<h1>I'm looking for roomies!</h1>
				<div id="mbl2"></div>
			</div>
		</a>	
		
		<a href="/placemate">	
			<div class="main_button_right">	
				<h1>I want to get roomed!</h1>
				<div id="mbr2"></div>
			</div>
		</a>
    		


<c:import url="template/footer.jsp" />
