<%-- 
    Document   : addMember
    Created on : Apr 14, 2014, 2:14:30 AM
    Author     : Doris
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="edu.pitt.domain.User"
        import="edu.pitt.domain.Group"
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Home</title>
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

    <script>
        function validate() {
            var email = document.form.newEmail.value;
            var userID = document.form.newUserID.value;
            if (email == "") {
                alert("Please Enter Buddy's Email!");
                return false;
            }
            if (userID == "") {
                alert("Please Enter Buddy's User ID!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="homepage">

<section id="login">
    <div id="footer-wrapper">



        <% int userID = 0;
            String groupID = "";
            if (request.getParameter("userID") != null && request.getParameter("groupID") != null) {
                userID = Integer.parseInt(request.getParameter("userID"));
                groupID = request.getParameter("groupID");
//                System.out.println(groupID);
                Group curGroup = new Group(userID, groupID);

        %>

        <div id="footer" class="container">
            <header class="major">
                <h2>Group '<%=curGroup.getGroupName()%>'</h2>
                <span>Add New Buddy</span>
            </header>
            <div class="row">

                <section class="12u">
                    <form name="form" action="AddMember" method ="POST" onsubmit="javascript:return validate();">
                        <div class="row half">
                            <input type="hidden" name="groupID" value="<%=curGroup.getGroupID()%>"/>
                            <input type="hidden" name="groupName" value="<%=curGroup.getGroupName()%>"/>
                            <input type="hidden" name="userID" value="<%=userID%>"/>
                            <div class="6u"><input type="email" class="text" name="newEmail" placeholder="New Member's email" required /></div>
                            <div class="6u"><input type="text" class="text" name="newUserID" placeholder="New Member's userID" required /></div>
                        </div>


                        <div class="row half">
                            <div class="5u">
                                &nbsp
                            </div>
                            <div class="5u">

                                <input type="submit" class="button" value="Add">

                            </div>
                            <div class="2u">
                                &nbsp
                            </div>

                        </div>

                    </form>				
                </section>



            </div>
        </div>




        <%
            }


        %> 

    </div>
</section>


</body>

</html>
