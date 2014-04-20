<%-- 
    Document   : memberList
    Created on : Apr 20, 2014, 5:15:16 PM
    Author     : Doris
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="edu.pitt.domain.User"
        import="edu.pitt.domain.Group"
        %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Member</title>
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
		

                    <center>
                    <h2 class="form-login-heading">Member List</h2>
                    </center>
                   
                    <% int userID = 0;
                       String groupID = "";
                       if (request.getParameter("userID") != null && request.getParameter("groupID") != null) {
                           userID = Integer.parseInt(request.getParameter("userID"));
                           groupID = request.getParameter("groupID");
                           Group curGroup = new Group(userID,groupID);
                           String curGroupName=curGroup.getGroupName();
                           System.out.println(groupID);
                           User member= new User(groupID);
                           ArrayList<User> memberList = member.getUserList();
                    %>
                    
                     <div class="page-header">
                        <h1><%=curGroupName%>,<small>&nbsp Group Members</small></h1>
                        
                    </div>
                        
                        <%   
                        if (memberList.size() > 0) {
                            for (int i = 0; i < memberList.size(); i++) {
                                User u = memberList.get(i);
                               
                        %>
                        
                        <li class="list-group-item"><%=u.getUserName()%></li>
                        <input type="hidden" name="groupID" value="<%=u.getUserName()%>"/>
                                 
                    
                   
                    
                    <%
                          }
                        }else{
                            
                    %> 
                        <span class="label label-primary">There's no member yet,please add a member</span>
                        
                        <%
                        }
                       }
                            
                        %>
                        
                    <div>
                    <form class="form-login" action="" method ="POST">
                        <input type="hidden" name="curUserID" value="<%=userID%>"/>
                    <a href="group.jsp" class="btn btn-lg btn-primary btn-block active" role="button">Back Group</a>
                    
                    </form>
                    </div>
                        
                        
                    
                    
                    
                </div>
                
            </div>
        
        
    </body>
    
    <script src="js/transition.js" type="text/javascript"></script>
</html>
