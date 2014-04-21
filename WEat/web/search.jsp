<%-- 
    Document   : search
    Created on : Mar 21, 2014, 4:54:50 PM
    Author     : huanwang
--%>

<%@page import="java.util.Iterator"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.temboo.Library.Yelp.SearchByNeighborhood.SearchByNeighborhoodResultSet"%>
<%@page import="com.temboo.Library.Yelp.SearchByCity.SearchByCityResultSet"%>
<%@page import="com.temboo.Library.Yelp.SearchByCategory.SearchByCategoryResultSet"%>
<%@page import="com.temboo.Library.Yelp.SearchForBusiness.SearchForBusinessResultSet"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.temboo.Library.Yelp.SearchForBusiness"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (session.getAttribute("currentSessionUser") == null) {
        response.sendRedirect("index.jsp");
    }

    session.setAttribute("currentSessionUser", session.getAttribute("currentSessionUser"));
    if (request.getAttribute("share") != null) {
        out.println("<script language='javascript'>alert('" + request.getAttribute("share") + "')</script>");
    }

    String userID = null;
    String groupID = null;
    if (request.getParameter("userID") != null && request.getParameter("groupID") != null) {
        userID = request.getParameter("userID");
        groupID = request.getParameter("groupID");
    } else {
        userID = (String) request.getAttribute("userID");
        groupID = (String) request.getAttribute("groupID");
    }

%>
<html>
    <head>
        <title>Search</title>
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
        <script src="js/checkForm.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-n1.css" />
        </noscript>
    </head>
    <body class="no-sidebar">


        <!-- Header Wrapper -->
        <div id="header-wrapper">

            <!-- Header -->
            <div id="header" class="container">

                <!-- Logo -->
                <h1 id="logo"><a href="index.jsp">WEat</a></h1>

                <!-- Nav -->
                <nav id="nav">
                    <ul>

                        
                        <li><a href="group.jsp?userID=<%=userID%>">Back to Group</a></li>
                        <li class="break"><a href="workspace.jsp?userID=<%=userID%>&&groupID=<%=groupID%>">Workspace</a></li>
                    </ul>
                </nav>

            </div>

        </div>

        <div id="footer-wrapper">

            <!-- Footer -->
            <div id="footer" class="container">
                <header class="major">
                    <h2>Search for yourself</h2>
                    <span>Search here and share with you friends!</span>
                </header>
                <div class="row">
                    <section class="3u">&nbsp; </section>
                    <section class="6u">
                        <form id="frmSearch" method="get" action="SearchServlet" onsubmit="return validateForm()">
                            <div class="row half">
                                <div class="12u">
                                    <input name="txtBusinessName" placeholder="Business name or category name" type="text" class="text" />
                                </div>
                                <div class="12u">
                                    <input name="txtCity" placeholder="City or location" type="text" class="text" />
                                </div>
                            </div>
                            <div class="row half">    
                                <div class="12u">
                                    <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByBusinessName" checked>Search by business</br>
                                    <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByCategory">Search by category</br>
                                    <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByCity">Search by city</br>
                                    <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByNeighborhood">Search by neighborhood</br>
                                </div>
                            </div>
                            <div class="row half">
                                <input type="hidden" name="userID" value="<%=userID%>"/>
                                <input type="hidden" name="groupID" value="<%=groupID%>"/>
                            </div>
                            <div class="row half">
                                <div class="12u">                  
                                    <button class="button">Search</button>                                 
                                </div>
                            </div>
                        </form>
                    </section>
                    <section class="3u">&nbsp; </section>
                </div>
            </div>
        </div>
        <!-- Main Wrapper -->
        <div class="wrapper">

            <div class="container">

                <div class="row features">

                    <%  String result = null;
                        JSONObject jsonObj = null;
                        JSONParser parser = new JSONParser();
                        if (request.getAttribute("error") == null) {
                            if (request.getAttribute("resultObj") == null) {
                                System.out.println("woshinull");
                            }
                            if (request.getAttribute("resultObj") != null) {
                                System.out.println("I am here!!!" + request.getAttribute("resultObj"));

                                if (request.getAttribute("result").equals("business")) {
                                    SearchForBusinessResultSet resultObj = (SearchForBusinessResultSet) request.getAttribute("resultObj");
                                    result = resultObj.get_Response();
                                } else if (request.getAttribute("result").equals("category")) {
                                    System.out.println("nonononononono");
                                    SearchByCategoryResultSet resultObj = (SearchByCategoryResultSet) request.getAttribute("resultObj");
                                    result = resultObj.get_Response();
                                } else if (request.getAttribute("result").equals("city")) {
                                    SearchByCityResultSet resultObj = (SearchByCityResultSet) request.getAttribute("resultObj");
                                    result = resultObj.get_Response();
                                } else {
                                    SearchByNeighborhoodResultSet resultObj = (SearchByNeighborhoodResultSet) request.getAttribute("resultObj");
                                    result = resultObj.get_Response();
                                }
                                jsonObj = (JSONObject) parser.parse(result);
                                if (jsonObj.containsKey("businesses")) {
                                    JSONArray businesses = (JSONArray) jsonObj.get("businesses");
                                    Iterator<String> iterator = businesses.iterator();
                                    while (iterator.hasNext()) {
                                        JSONObject jsonObjBusinesses = (JSONObject) parser.parse(String.valueOf(iterator.next()));
                    %>


                    <section class="4u feature">
                        <div class="image-wrapper first">
                            <a href="<%=jsonObjBusinesses.get("url")%>" class="image full"><img src="<%=jsonObjBusinesses.get("image_url")%>" alt="<%=jsonObjBusinesses.get("name")%>" /></a>
                        </div>
                        <header>
                            <h4><a href="<%=jsonObjBusinesses.get("url")%>"><em><%=jsonObjBusinesses.get("name")%></em></a></h4>
                        </header>
                        <%
                            JSONObject location = (JSONObject) parser.parse(String.valueOf(jsonObjBusinesses.get("location")));
                            JSONArray displayAddress = (JSONArray) location.get("display_address");
                            String address = (String) displayAddress.get(0);
                        %>
                        <p><%=address%></p>
                        <p><%=location.get("city")%>, <%=location.get("state_code")%> <%=location.get("postal_code")%></p> 
                        <p><%=jsonObjBusinesses.get("display_phone")%></p>
                        <img src='<%=jsonObjBusinesses.get("rating_img_url")%>'/>

                        <form id="frmShare" method="post" action="ShareServlet">
                            <input type="hidden" name="resultId" value="<%=jsonObjBusinesses.get("id")%>">   
                            <input type="hidden" name="resultName" value="<%=jsonObjBusinesses.get("name")%>">
                            <input type="hidden" name="userID" value="<%=request.getAttribute("userID")%>"/>
                            <input type="hidden" name="groupID" value="<%=request.getAttribute("groupID")%>"/>
                            <input type="hidden" name="result" value="<%=request.getAttribute("result")%>">
                            <%
                                session.setAttribute("resultObj", request.getAttribute("resultObj"));
                            %>
<!--                            <input type="hidden" name="resultObj" value="<%=request.getAttribute("resultObj")%>"/>-->

                            <ul class="actions">   
                                <li><button class="button">Share</button></li>
                            </ul>
                        </form>
                    </section>
                    <%
                        }
                    } else {
                    %>

                    <section class="4u feature">
                        <div class="image-wrapper first">
                            <a href="<%=jsonObj.get("url")%>" class="image full"><img src="<%=jsonObj.get("image_url")%>" alt="<%=jsonObj.get("name")%>" /></a>
                        </div>
                        <header>
                            <h4><a href="<%=jsonObj.get("url")%>"><em><%=jsonObj.get("name")%></em></a></h4>
                        </header>
                        <%
                            JSONObject location = (JSONObject) parser.parse(String.valueOf(jsonObj.get("location")));
                            JSONArray displayAddress = (JSONArray) location.get("display_address");
                            String address = (String) displayAddress.get(0);
                            System.out.println(userID);
                        %>
                        <p><%=address%></p>
                        <p><%=location.get("city")%>, <%=location.get("state_code")%> <%=location.get("postal_code")%></p>  
                        <p><%=jsonObj.get("display_phone")%></p>
                        <img src='<%=jsonObj.get("rating_img_url")%>'/>

                        <form id="frmShare" method="post" action="ShareServlet">
                            <input type="hidden" name="resultId" value="<%=jsonObj.get("id")%>">   
                            <input type="hidden" name="resultName" value="<%=jsonObj.get("name")%>">
                            <input type="hidden" name="userID" value="<%=request.getAttribute("userID")%>"/>
                            <input type="hidden" name="groupID" value="<%=request.getAttribute("groupID")%>"/>
                            <input type="hidden" name="result" value="<%=request.getAttribute("result")%>">
<!--                            <input type="hidden" name="resultObj" value="<%=request.getAttribute("resultObj")%>"/>-->
                            <%
                                session.setAttribute("resultObj", request.getAttribute("resultObj"));
                            %>
                            <ul class="actions">   
                                <li><button class="button">Share</button></li>
                            </ul>
                        </form>
                    </section>
                    <%
                            }
                        }
                    } else {
                        if (request.getAttribute("error").equals("noresult")) {
                    %>
                    <div>
                        <p>No result. Please refine your search.</p>
                    </div>

                    <%
                            }
                        }
                    %>


                </div>
            </div>
        </div>


        <!-- Footer Wrapper -->
        <!-- Copyright -->
        <div id="copyright" class="container">
            <ul class="menu">
                <li>&copy; Group Member: Jun Liu, Qianwen Li, Huan Wang.  All rights reserved.</li>
                <li>Design: <a href="http://html5up.net/">Everyone</a></li>
            </ul>
        </div>

    </body>
</html>