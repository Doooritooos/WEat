<%-- 
    Document   : workspaceTest
    Created on : 2014-4-11, 17:59:06
    Author     : Liu
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.pitt.utilities.*"%>
<%@page import="edu.pitt.domain.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Workspace myWorkspace;
    User user = null;

    int userID = 2;
    String groupID = "77ID-8JIE";
    myWorkspace = new Workspace(userID, groupID);
     out.println("My workspace: userID = " + myWorkspace.getUserID() + ", groupID = " + myWorkspace.getGroupID() + ", resultList = " + myWorkspace.getReultList() + "<br><br>");
 
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Workspace Page</title>
    </head>
    <body>
        
        <%  
           
            ArrayList<Result> results = new ArrayList(myWorkspace.getReultList().values());
            
            out.println("<h1>Workspace of group " + groupID + "</h1>");
            for (int i = 0; i < results.size(); i++) {
                out.println("<a href='http://www.yelp.com/biz/" + results.get(i).getResultID() + "'> " + results.get(i).getResultName() + " </a>");
                out.println("<br>liked by " + results.get(i).userListToString());
                out.println("<p>" + results.get(i).commenListToString() + "</p>");
                out.println("<p>--------------------------------------------------------</p>");
            }

        %> 

        
         <input type="text" name="txtComment" id="txtComment" value=""/>
        <input type="submit" name="btnAddComment" id="btnAddComment" value = "Add"><br>
    </form>
    <form name="search" action="search.jsp">   
        <input type="submit" value="Back to Search">
    </form>

</body>
</html>
 