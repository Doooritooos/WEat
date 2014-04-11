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
    String userID=null;
    String groupID=null;
    if(request.getParameter("userID")!=null&&request.getParameter("groupID")!=null){
        userID=request.getParameter("userID");
        groupID=request.getParameter("groupID");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/checkForm.js"></script>
        <title>Search</title>
    </head>
    <body>
        <form id="frmSearch" method="get" action="SearchServlet" onsubmit="return validateForm()">
            <input type="text" id="txtBusinessName" name="txtBusinessName">
            <br>
            <input type="text" id="txtCity" name="txtCity">
            <br>
            <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByBusinessName" checked>Search by business
            <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByCategory">Search by category
            <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByCity">Search by city
            <input type="radio" id="rdoSearchMethod" name="rdoSearchMethod" value="SearchByNeighborhood">Search by neighborhood
            <input type="submit" id="btnSearch" name="btnSearch">

        </form>    

        <%
            String result = null;
            JSONObject jsonObj = null;
            JSONParser parser = new JSONParser();
            if (session.getAttribute("resultObj") != null) {
                if (session.getAttribute("result").equals("business")) {
                    SearchForBusinessResultSet resultObj = (SearchForBusinessResultSet) session.getAttribute("resultObj");
                    result = resultObj.get_Response();
                } else if (session.getAttribute("result").equals("category")) {
                    SearchByCategoryResultSet resultObj = (SearchByCategoryResultSet) session.getAttribute("resultObj");
                    result = resultObj.get_Response();
                } else if (session.getAttribute("result").equals("city")) {
                    SearchByCityResultSet resultObj = (SearchByCityResultSet) session.getAttribute("resultObj");
                    result = resultObj.get_Response();
                } else {
                    SearchByNeighborhoodResultSet resultObj = (SearchByNeighborhoodResultSet) session.getAttribute("resultObj");
                    result = resultObj.get_Response();
                }
                jsonObj = (JSONObject) parser.parse(result);
                if (jsonObj.containsKey("businesses")) {
                    JSONArray businesses = (JSONArray) jsonObj.get("businesses");
                    Iterator<String> iterator = businesses.iterator();
                    while (iterator.hasNext()) {
                        JSONObject jsonObjBusinesses = (JSONObject) parser.parse(String.valueOf(iterator.next()));
        %>
        <br/>
        <br/>
        <div>
            <a href="<%=jsonObjBusinesses.get("url")%>"><%=jsonObjBusinesses.get("name")%></a>
            <p><%=jsonObjBusinesses.get("id")%></p>
            <img src='<%=jsonObjBusinesses.get("image_url")%>'/>
            <%
                JSONObject location = (JSONObject) parser.parse(String.valueOf(jsonObjBusinesses.get("location")));
                JSONArray displayAddress = (JSONArray) location.get("display_address");
                String address = (String) displayAddress.get(0);
            %>
            <p><%=address%></p>
            <p><%=location.get("city")%>, <%=location.get("state_code")%> <%=location.get("postal_code")%></p>          
            <img src='<%=jsonObjBusinesses.get("rating_img_url")%>'/>
            <p><%=jsonObjBusinesses.get("display_phone")%></p>

            <form id="frmShare" method="post" action="ShareServlet">
                <input type="hidden" name="resultId" value="<%=jsonObjBusinesses.get("id")%>">   
                <input type="hidden" name="resultName" value="<%=jsonObjBusinesses.get("name")%>">
                <input type="submit" name="btnShare" value="share"/>
            </form>

        </div>
        <%
            }
        } else {
        %>

        <br/>
        <br/>
        <div>
            <a href="<%=jsonObj.get("url")%>"><%=jsonObj.get("name")%></a>
            <p><%=jsonObj.get("id")%></p>
            <img src='<%=jsonObj.get("image_url")%>'/>    
            <%
                JSONObject location = (JSONObject) parser.parse(String.valueOf(jsonObj.get("location")));
                JSONArray displayAddress = (JSONArray) location.get("display_address");
                String address = (String) displayAddress.get(0);
            %>
            <p><%=address%></p>
            <p><%=location.get("city")%>, <%=location.get("state_code")%> <%=location.get("postal_code")%></p>          
            <img src='<%=jsonObj.get("rating_img_url")%>'/>
            <p><%=jsonObj.get("display_phone")%></p>

            <form id="frmShare" method="post" action="ShareServlet">
                <input type="hidden" name="resultId" value="<%=jsonObj.get("id")%>">    
                <input type="hidden" name="resultName" value="<%=jsonObj.get("name")%>">
                <input type="submit" name="btnShare" value="Share"/>
            </form>

        </div>  
        <%
                }
            }
        %>



    </body>
</html>
