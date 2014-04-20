<%-- 
    Document   : memberList
    Created on : Apr 20, 2014, 3:07:30 PM
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Group</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <link href="css/theme.css" rel="stylesheet">
<!--        
        <script type="text/javascript">  
        function search() {  
            document.getElementById("form1").action="search.jsp";
            document.getElementById("form1").submit();  
        }  
        function addMember() {  
            document.getElementById("form1").action="addMember.jsp";
            document.getElementById("form1").submit(); 
        }       
        
        </script>  -->
        
        
    </head>
    

    <body role="document">
        <div class="container theme-showcase" role="main">
            
            <div>
                <a href="group.jsp" class="btn btn-lg btn-primary btn-block active" role="button">Back to Group</a>
            </div>

            
            <!-- <div class="row"> -->
            <div class="col-sm-4" align="center">
                <ul class="list-group">
                    <% 
//                        int userID = 0;
//                        String groupID = "";
                        if (request.getParameter("userID") != null && request.getParameter("groupID") != null) {
                        int userID = Integer.parseInt(request.getParameter("userID"));
                        String groupID = request.getParameter("groupID");
                        Group curGroup= new Group(userID,groupID);
                        String curGroupName= curGroup.getGroupName();
                        User member =  new User(groupID);
                        ArrayList<User> memberList = member.getUserList();
                        
                    %>
                    
                    <div class="page-header">
                        <h1><%=curGroupName%>'s<small>&nbsp Group Members</small></h1>
                        
                    </div>
<!--                    <form class="form-login" action="" method ="POST" id="form2">   -->
                    <%   
                        if (memberList.size() > 0) {
                            for (int i = 0; i < memberList.size(); i++) {
                                User u = memberList.get(i);
                                System.out.println(u.getUserName());
                    %>

                    <br>
                    
                   
                        <li class="list-group-item"><%=u.getUserName()%></li>
                        <input type="hidden" name="curUser" value="<%=userID%>"/>
                        <%
                        System.out.println(u.getUserName());
                        %>
<!--                        <input type="hidden" name="getUserID" value=""/>-->
<!--                        <button class="btn btn-lg btn-primary btn-block" type="submit" value="search.jsp">Search</button>
-->                       
                        
                    <!--</form>-->
                    <%
                     
                            }
                    } else {
                    %>
                   
               
                     <span class="label label-primary">There's no member yet,please add a more members</span>
                    
                    <%
                        }
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

