<%-- 
    Document   : group
    Created on : Mar 21, 2014, 4:53:54 PM
    Author     : huanwang
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
        
        <script type="text/javascript">  
        function search() {  
            document.getElementById("form1").action="search.jsp";
            document.getElementById("form1").submit();  
        }  
        function addMember() {  
            document.getElementById("form1").action="addMember.jsp";
            document.getElementById("form1").submit(); 
//            form1.submit; 
        }  
        
        function memberList() {  
            document.getElementById("form1").action="memberList.jsp";
            document.getElementById("form1").submit(); 
//            form1.submit; 
        }  
        
        </script>  
        
        
    </head>
    

    <body role="document">
        <div class="container theme-showcase" role="main">

            <div>
                <a href="addGroup.jsp" class="btn btn-lg btn-primary btn-block active" role="button">Add Group</a>
            </div>
            

            
            <!-- <div class="row"> -->
            <div class="col-sm-4" align="center">
                <ul class="list-group">
                    <% 
                      if(session.getAttribute("currentSessionUser")!=null){
                        User currentUser = ((User) (session.getAttribute("currentSessionUser")));
                        session.setAttribute("currentSessionUser", currentUser);
                        int currentUserID = currentUser.getUserID();
                        User curUser = new User(currentUserID);
                        String curUserName = curUser.getUserName();
                        Group existGroup =  new Group(currentUserID);

                        ArrayList<Group> groupList = existGroup.getGroupList();
                    %>
                    
                    <div class="page-header">
                        <h1><%=curUserName%>,<small>&nbsp Your Groups</small></h1>
                        
                    </div>
                   
                    <%   
                        if (groupList.size() > 0) {
                            for (int i = 0; i < groupList.size(); i++) {
                                Group g = groupList.get(i);
                                System.out.println(g.getGroupName());
                    %>

                    <br>
                    
                        
                        <li class="list-group-item"><%=g.getGroupName()%></li>
                       
                        <form class="form-login" action="search.jsp" method ="POST"> 
                        <input type="hidden" name="groupID" value="<%=g.getGroupID()%>"/>    
                        <input type="hidden" name="userID" value="<%=currentUserID%>"/>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Search</button>
                        </form>
                        
                        <form class="form-login" action="addMember.jsp" method ="POST"> 
                        <input type="hidden" name="groupID" value="<%=g.getGroupID()%>"/>    
                        <input type="hidden" name="userID" value="<%=currentUserID%>"/>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Add Member</button>
                        </form>
                        
                        <form class="form-login" action="memberList.jsp" method ="POST"> 
                        <input type="hidden" name="groupID" value="<%=g.getGroupID()%>"/>    
                        <input type="hidden" name="userID" value="<%=currentUserID%>"/>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Member List</button>
                        </form>
                        
                        
                      
                        
<!--                        <input class="btn btn-lg btn-primary btn-block" name="bt1" type="button" value="Search" onclick="search()"/>
                        <input class="btn btn-lg btn-primary btn-block" name="bt2" type="button" value="Add Member" onclick="addMember()" />
                        <input class="btn btn-lg btn-primary btn-block" name="bt3" type="button" value="Member List" onclick="memberList()" />
                        </form>-->
                    
                    <%
                       System.out.println(g.getGroupName());
                            }
                    } else {
                    %>
                   
               
                     <span class="label label-primary">There's no group yet,please add a group</span>
                    
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
