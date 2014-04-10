<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.pitt.utilities.StringUtilities"%>
<%@page import="edu.pitt.domain.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("isValidUser") == null) {
        response.sendRedirect("login.jsp?error=Unauthenticated user!");
    }

    Workspace myWorkspace;
    int userID = (Integer) session.getAttribute("userID");
    int groupID = (Integer) session.getAttribute("groupID");
    String defaultResultID = null;
    String selectedResultID = null;

    //chaching
    if (session.getAttribute("myWorkspace") == null) {
        myWorkspace = new Workspace(userID, groupID);
        session.setAttribute("Workspace", myWorkspace);
        //out.println("new");
    } else {
        myWorkspace = (Workspace) session.getAttribute("Workspace");
    }

    //if Button addComment  is clicked
    if (request.getParameter("btnAddComment") != null && request.getParameter("txtComment") != null) {
            String txtComment = request.getParameter("txtComment");
            selectedResultID = request.getParameter("cboResult");
            //insert the new commnet into database WEat.Comment
            Comment newComment = new Comment(selectedResultID, userID, groupID, txtComment);
            //update the commentList of the result by reloading from databse table  WEat.Comment 
            Result updateResult  = new Result(selectedResultID, groupID);
            myWorkspace.getReultList().put(selectedResultID, updateResult);
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Workspace Page</title>
    </head>
    <body>
        <%                ArrayList<Result> results = new ArrayList(myWorkspace.getReultList().values());

            class resultComparator implements Comparator<Result> {

                @Override
                public int compare(Result a, Result b) {
                    return a.getUserList().size() > b.getUserList().size() ? -1 : a.getUserList().size() == b.getUserList().size() ? 0 : 1;
                }
            }

            //sort resultList based on the number of user likes
            //more users like a result, the higher a result ranks
            Collections.sort(results, new resultComparator());

            for (int i = 0; i < results.size(); i++) {
                out.println("<a href='http://www.yelp.com/biz/?resultID=" + results.get(i).getResultID() + "'> " + results.get(i).getResultName() + " </a>");
                out.println("liked by" + results.get(i).userListToString() + "</br>");
                out.println("<p>" + results.get(i).commenListToString() + "</p>");
            }

        %> 

        Add comment on:  
        <select id ="cboResult" name="cboResult" >
            <%                    if (myWorkspace != null) {
                    String[] resultIDList = myWorkspace.getResultIDList();
                    defaultResultID = resultIDList[0];
                    for (int i = 0; i < resultIDList.length; i++) {
                        if (i == 0) {
                            out.println("<option selected value = '" + defaultResultID + "'>result # " + defaultResultID + "</option>");
                        } else {
                            out.println("<option value = '" + resultIDList[i] + "'>account # " + resultIDList[i] + "</option>");
                        }
                    }
                }
            %>
        </select>
        <br>
        <input type="text" name="txtComment" id="txtComment" value=""/>
        <input type="submit" name="btnAddComment" id="btnAddComment" value = "Add"><br>
    </form>
</body>
</html>
