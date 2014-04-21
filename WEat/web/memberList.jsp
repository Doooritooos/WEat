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
        <title>Member List</title>
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
    <body class="homepage">
        <!--        <div class="container">-->



        <div class="wrapper">
            <div class="container">
                <!--		<div class="row" id="main">
                                    <div class="12u">-->


                <!-- Content -->
                <article id="content">
                    <header>

                        <% int userID = 0;
                            String groupID = "";
                            if (request.getParameter("userID") != null && request.getParameter("groupID") != null) {
                                userID = Integer.parseInt(request.getParameter("userID"));
                                groupID = request.getParameter("groupID");
                                Group curGroup = new Group(userID, groupID);
                                String curGroupName = curGroup.getGroupName();
                                System.out.println(groupID);
                                User member = new User(groupID);
                                ArrayList<User> memberList = member.getUserList();
                        %>
                        <span>Group '<%=curGroupName%>'</span>
                        <div class="row">
                            <div class="4u">

                                <h2>Buddies in Group</h2>
                            </div>
                            <div class="4u">
                                <form action="addMember.jsp" method="POST">
                                    <input type="hidden" name="userID" value="<%=userID%>"/>
                                    <input type="hidden" name="groupID" value="<%=groupID%>"/>
                                    <input class="button" type="submit" value="+">
                                </form>
                            </div>
                        </div>





                    </header>   


                    <br>
                    <div class="row">
                        <section class="3u">
                            &nbsp;
                        </section>


                        <section class="6u">

                            <div class="row no-collapse-1">

                                <%
                                    if (memberList.size() > 0) {
                                        for (int i = 0; i < memberList.size(); i++) {
                                            User u = memberList.get(i);

                                %>

                                <ul class="divided icons 12u"> 
                                    <li class="fa fa-twitter"><%=u.getUserName()%></li>
                                    <hr>
                                    <input type="hidden" name="groupID" value="<%=u.getUserName()%>"/>




                                    <%
                                        }

                                    %>  
                                </ul>
                            </div>

                        </section>


                    </div>
                </article>




                    <%                    } else {

                    %> 
                    <span>There's no member yet,please add a member</span>

                    <%                                }
                        }

                    %>
            </div>
            
             <div id="copyright" class="container">

                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>


            </div>
            
            
        </div>
                    


                    </body>

                    <script src="js/transition.js" type="text/javascript"></script>
                    </html>
