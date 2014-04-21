<%-- 
    Document   : logout
    Created on : Apr 21, 2014, 9:48:42 AM
    Author     : Doris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><body>
        <%
            session.invalidate();
        %>
<!--        <h1><font color="Red">You are Sucessfully logged out...</font></h1>-->
        <a href="index.jsp"></a>
    </body>
</html>
