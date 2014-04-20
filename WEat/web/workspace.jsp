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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Workspace Page</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">

<%

    Workspace myWorkspace;
    int userID = 0;
    User user = null;
    Group group = null;
    String groupID = null;

//    userID = 2;
//    groupID = "d9cb3258-df24-4eaa-ad51-e73c23765872";    
    
    //check if user is valid
    if (request.getParameter("userID") == null) {
        response.sendRedirect("login.jsp?error=Invalid user!");
    } else {
        userID = Integer.parseInt((String) request.getParameter("userID"));
        user = new User(userID);
        if (user.isValid() == false) {
            response.sendRedirect("login.jsp?error=Invalid user!");
        }
    }

    groupID = (String) request.getParameter("groupID");


    group = new Group(userID, groupID);
    myWorkspace = new Workspace(userID, groupID);
    out.println("My workspace: userID = " + myWorkspace.getUserID() + ", groupID = " + myWorkspace.getGroupID() + ", resultList = " + myWorkspace.getReultList() + "<br><br>");

    if (myWorkspace.getReultList().size() != 0) {
    //if Button addComment  is clicked
    if (request.getParameter("btnAddComment") != null && request.getParameter("txtComment") != null && request.getParameter("selectedResultID") != null) {
        String txtComment = request.getParameter("txtComment");
        String selectedResultID = request.getParameter("selectedResultID");
        System.out.println("*_*_*_*_*_*_*_*selectedResultID = " + selectedResultID + "txtComment = " + txtComment);
        //insert the new commnet into database WEat.Comment
        Comment newComment = new Comment(selectedResultID, userID, groupID, txtComment);
        //update the commentList of the result by reloading from databse table  WEat.Comment 
        Result updateResult = new Result(selectedResultID, groupID);
        myWorkspace.getReultList().put(selectedResultID, updateResult);
    }
%>

            <%            //sort resultList based on the number of user likes
                //more users like a result, the higher a result ranks
                ArrayList<Result> results = new ArrayList(myWorkspace.getReultList().values());

                class resultComparator implements Comparator<Result> {

                    @Override
                    public int compare(Result a, Result b) {
                        return a.getUserList().size() > b.getUserList().size() ? -1 : a.getUserList().size() == b.getUserList().size() ? 0 : 1;
                    }
                }

                Collections.sort(results, new resultComparator());

                out.println("<h1>Workspace of  " + group.getGroupName() + "</h1>");
                for (int i = 0; i < results.size(); i++) {
                    %>
                    <div class="panel panel-primary">
                    <div class="panel-heading">                   
                    <%
                    out.println("<h3 class='panel-title'><a href='http://www.yelp.com/biz/" + results.get(i).getResultID() + "'> " + results.get(i).getResultName() + " </a></h3>");
                    out.println("</div>");
                    out.println("<div class='panel-body'>");
                    out.println("<br>liked by " + results.get(i).userListToString());
                    out.println("<p>" + results.get(i).commenListToString() + "</p>");

                    String resultID = results.get(i).getResultID();
            %>
            <form id="formComment" name= "formComment" method="post" action="workspace.jsp">
                 <input type="text" name="txtComment" id="txtComment"  placeholder="Add comment..." required autofocus value=""/>
                <button type="submit" class="btn btn-primary" name="btnAddComment" id="btnAddComment" value = "Add">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
                
                <input type="hidden" name="selectedResultID" id="selectedResultID" value="<%=resultID%>">
                <input type="hidden" name="userID" value="<%=userID%>">
                <input type="hidden" name="groupID" value="<%=groupID%>">
            </form>
            </div>
          </div>

            <%
                }
            }else
    {
        %>
        <h1>Workspace of <%=group.getGroupName() %></h1>
        This group have not share anything yet.
        
        <%
    }
            %> 


            <form name="search" action="search.jsp">   
                <input type="hidden" name="userID" value="<%=userID%>">
                <input type="hidden" name="groupID" value="<%=groupID%>">
                <input type="submit" name="btnSearch" value="Back to Search">
            </form>
        </div>
    </body>
</html>
