<!DOCTYPE html>
<html lang="en">
<head>
	
    	<meta charset="utf-8">

    	<title>About Princesses and Castles</title>

    	<link rel="stylesheet" type="text/css" href="css/stylesheet.css" media="all"/>
    	<script type="text/javascript"  src="dn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    	<script src="js/login.js"></script>
    	<script src="js/slider.js"></script>
    	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    	<!--[if lt IE 9]>
    	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    	<![endif]-->
<!--   WASTE!
    	<style>
        	body {
         	   padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        	}
    	</style>
    -->
    
   

</head>
<body>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

    	  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>  
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>  
      <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>  
        
      <script>  
      $(document).ready(function() {  
        $("#datepicker").datepicker();  
      });  
      </script>
      
       <script>  
      $(document).ready(function() {  
        $("#datepicker2").datepicker();  
      });  
      </script>


<div id="bar">
        <div id="container">
            <!-- Login Starts Here -->
            <div id="loginContainer">
                <a href="#" id="loginButton"><span>Login</span><em></em></a>
                <div style="clear:both"></div>
                <div id="loginBox">                
                    <form id="loginForm" name="loginForm" action="<c:url value='j_spring_security_check' />" method="POST">
                        <fieldset id="body">
                            <fieldset>
                                <label for="email">Email Address</label> 
                                <input type="text" name="j_username" id="email" placeholder="Email" />
                            </fieldset>
                            <fieldset>
                                <label for="password">Password</label>
                                <input type="password" name="j_password" id="password" placeholder="Password" />
                            </fieldset>
                            <input type="submit" id="login" value="Sign in" />
                            <label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
                        </fieldset>
                        <span><a href="#">Forgot your password?</a></span>
                    </form>
                </div>
            </div>
            <!-- Login Ends Here -->
            <!-- Register Starts Here -->
            <div id="registerContainer">
            	<a href="register"><div id="registerButton"><span>Regsiter</span><em></em></div></a>
            </div>
            <!-- Register Ends Here -->
             <!-- MyProfile Starts Here -->
            <div id="myprofileContainer">
            	<a href="myprofile"><div id="registerButton"><span>MyProfile</span><em></em></div></a>
            </div>
            <!-- MyProfile Ends here -->
        </div>
    </div>
	
	
	
		
</div>
<a href="/Skeleton/">
<div id="header">
	<div id="header_wrapper">
		<title>About Princesses and Castles</title>
		<h1>About Princesses and Castles</h1>
    	<p>Brought to you by Carl, Peda, Foesu and Raff</p>	
    </div>
</div>	<!--  END OF #header -->
</a>


<div id="container_background">
	<div class="container">