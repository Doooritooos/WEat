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
        <title>Group List</title>
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
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap theme -->
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/theme.css" rel="stylesheet">
        </noscript>
    </head>


    <body class="no-sidebar">


        <div class="wrapper">
            <div class="container">
                <div class="row" id="main">
                    <div class="12u">

                        <!-- Content -->
                        <article id="content">
                            <header>
                                <%
                                    if (session.getAttribute("currentSessionUser") != null) {
                                        User currentUser = ((User) (session.getAttribute("currentSessionUser")));
                                        session.setAttribute("currentSessionUser", currentUser);
                                        int currentUserID = currentUser.getUserID();
                                        User curUser = new User(currentUserID);
                                        String curUserName = curUser.getUserName();
                                        Group existGroup = new Group(currentUserID);

                                        ArrayList<Group> groupList = existGroup.getGroupList();
                                %>
                                <span>Your Group List</span>
                                <div class="row">
                                    <div class="3u">
                                        <h2>Hello, <%=curUserName%> (User ID:<%=currentUserID%>)</h2>
                                    </div>
                                    <div class="6u">
                                        <a href="addGroup.jsp" class="button" type="submit" target="body">Group + +</a>
                                    </div>
                                </div>
                            </header>


                            <section class="12u">
                                <div class="row no-collapse-1">
                                    <!--			<ul class="divided icons 6u">
                                                                <li class="fa fa-twitter"><a href="#"><span class="extra">twitter.com/</span>untitled</a></li>
                                                                <li class="fa fa-facebook"><a href="#"><span class="extra">facebook.com/</span>untitled</a></li>
                                                                <li class="fa fa-dribbble"><a href="#"><span class="extra">dribbble.com/</span>untitled</a></li>
                                    -->




                                    <%
                                        if (groupList.size() > 0) {
                                            for (int i = 0; i < groupList.size(); i++) {
                                                Group g = groupList.get(i);

                                    %>


                                    <ul class="divided icons 12u">

                                        <li class="fa fa-dribbble"><%=g.getGroupName()%></li>


                                        <form class="form-login" action="search.jsp" method ="POST" target="_top"> 
                                            <input type="hidden" name="groupID" value="<%=g.getGroupID()%>"/>    
                                            <input type="hidden" name="userID" value="<%=currentUserID%>"/>

                                            <input class="button" type="submit" value="Search">
                                        </form>


                                        <form class="form-login" action="memberList.jsp" method ="POST" target="body"> 
                                            <input type="hidden" name="groupID" value="<%=g.getGroupID()%>"/>    
                                            <input type="hidden" name="userID" value="<%=currentUserID%>"/>
                                            <input class="button" type="submit" value="Group Member">
                                        </form>
                                        <br>
                                        <hr> 
                                        <br>

                                        <%

                                            }

                                        %>
                                    </ul>

                                </div>
                                <%                    } else {
                                %>


                                <span>There's no group yet, please add a group</span>

                                <%
                                        }
                                    }


                                %>
                            </section>

                        </article>

                    </div>
                </div>

            </div>
                <div id="footer-wrapper" >

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
<!--        <div id="footer-wrapper">
          
        </div>-->

    </body>
</html>
