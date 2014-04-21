<%-- 
    Document   : addGroup
    Created on : Mar 21, 2014, 4:54:28 PM
    Author     : huanwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="edu.pitt.domain.User" %>
<!DOCTYPE html>
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
                var groupname = document.form.groupname.value;

                if (groupname == "") {
                    alert("Please Enter Group's Name!");
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body class="homepage">


        <section id="addGroup">
            <div id="footer-wrapper">
                <div id="footer" class="container">
                    <header class="major">
                        <h2>Add New Group</h2>
                        <!--                        <span>Add New Buddy</span>-->
                    </header>
                    <div class="row">

                        <section class="12u">

                            <form name="form" action="AddGroup" method ="POST" onsubmit="javascript:return validate();" target="left">
                                <% User currentUser = ((User) (session.getAttribute("currentSessionUser")));%>
                                <div class="row half">

                                    <input type="hidden" name="userName" value="<%=currentUser.getUserName()%>">
                                    <input type="hidden" name="userID" value="<%=currentUser.getUserID()%>"/>
                                    <div class="12u">
                                        <input type="text" class="text" name="groupname" placeholder="Group Name" required />
                                    </div>

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

            </div>
        </section>




    </body>

</html>
