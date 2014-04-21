<%-- 
    Document   : viewGroup
    Created on : Apr 21, 2014, 1:36:38 AM
    Author     : Doris
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="edu.pitt.domain.User"
        import="edu.pitt.domain.Group"
        %>
<!DOCTYPE HTML>
<!--
	Telephasic 1.1 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>View Group</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,600" rel="stylesheet" type="text/css" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-n1.css" />
		</noscript>
	</head>
        
       
        <frameset rows="14.3%,*" frameborder="0">
            
            <frame src="groupHead.jsp" name="head"></frame>

            
       	<frameset cols="28%,*">
	    	<frame src="group.jsp" name="left"></frame>
	    	<frame src="freshMember.jsp" name="body"></frame>
    	</frameset>
            
      
</html>
