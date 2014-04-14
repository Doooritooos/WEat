<%-- 
    Document   : addGroup
    Created on : Mar 21, 2014, 4:54:28 PM
    Author     : huanwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="edu.pitt.domain.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Group</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">

                <div class="header">
                <center>
                <h3 class="text-muted">WEat</h3>
                </center>
                </div>
            
            <div>
		<form class="form-login" action="AddGroup" method ="POST">

                    <center>
                    <h2 class="form-login-heading">Add Group</h2>
                    </center>
                    <% User currentUser = ((User) (session.getAttribute("currentSessionUser")));%>
                    <input type="text" name="userName" class="form-control" value="<%=currentUser.getUserName()%>">
                    <input type="hidden" name="userID" value="<%=currentUser.getUserID()%>"/>
                    <input type="text" name="groupname" class="form-control" placeholder="Group Name" required autofocus>
                     
<!--                    <input type="text" name="userID" class="form-control" placeholder="userID" required autofocus>-->
                    <button class="btn btn-lg btn-primary btn-block" type="submit" value="submit">Submit</button>
                    <a href="group.jsp" class="btn btn-lg btn-primary btn-block active" role="button">Cancel</a>
		</form>
                </div>
                
            </div>
        
        
    </body>
    
    <script src="js/transition.js" type="text/javascript"></script>
</html>
