<%-- 
    Document   : group
    Created on : Mar 21, 2014, 4:53:54 PM
    Author     : huanwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="edu.pitt.domain.User"
        import="edu.pitt.domain.Group"
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Group</title>
         
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <link href="css/theme.css" rel="stylesheet">
    </head>
    <body role="document">
        <div class="container theme-showcase" role="main">

     
      <div>
      <a href="addGroup.jsp" class="btn btn-lg btn-primary btn-block active" role="button">Add Group</a>
      </div>
      
      <div class="page-header">
        <h1>Existing Groups</h1>
      </div>
      <!-- <div class="row"> -->
        <div class="col-sm-4" align="center">
          <ul class="list-group">
            <% User currentUser = ((User) (session.getAttribute("currentSessionUser")));
               int currentUserID =currentUser.getUserID();
               
               Group existGroup = new Group(currentUserID);
               if(existGroup!=null){
               
            %>
            
            <form class="form-login" action="GroupSearchServlet" method ="POST">
            <li class="list-group-item"><%=existGroup.getGroupID()%></li>
            <input type="hidden" name="getGroupID" value="<%=existGroup.getGroupID()%>"/>
            <input type="hidden" name="getUserID" value="<%=currentUserID%>"/>
            <button class="btn btn-lg btn-primary btn-block" type="submit" value="submit">Search</button>
            </form>
            
            <%
               }else{
                   System.out.println("There's no group yet,please add a group");
                   
            %>
            
            <h1>There's no group yet,please add a group</h1>
             <%
               } 
                   
            %>
          </ul>
        </div>
      </div>
        
  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/docs.min.js"></script>
    </body>
</html>
