package edu.pitt.domain;

import edu.pitt.utilities.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

/**
 * Result class
 *
 * @author Liu
 */
public class Result {

    private String resultID;
    private String resultName;
    private String groupID;
    private Hashtable<Integer, User> userList = new Hashtable<Integer, User>();
    private ArrayList<Comment> commentList = new ArrayList<Comment>();

    /**
     * Result constructor 1 : Retrieve data for provided resultID from MySQL
     * WEat.Result table; Use retrieved data to populate corresponding
     * properties of the Result object.
     * @param resultID
     * @param groupID
     */
    public Result(String resultID, String groupID) {
        String sql = "SELECT * FROM WEat.Result  ";
        sql += "WHERE resultID = '" + resultID + "' AND `groupID` = '" + groupID + "' ; ";
        System.out.println("[Result(String resultID, String groupID)] sql = " + sql);
        DbUtilities db = new DbUtilities();
        try {
            ResultSet rs = db.getResultSet(sql);
            while (rs.next()) {
                this.resultID = resultID;
                this.resultName = rs.getString("resultName");
                this.groupID = groupID;
                int userID = Integer.parseInt(rs.getString("userID"));       
                User user = new User(userID);
                this.userList.put(userID, user);
                System.out.println("[Result]userList = " + userList);         
            }
        } catch (SQLException e) {
            System.out.println("Cannot construct Result with resultID");
            e.printStackTrace();
        }
         finally {
            db.closeDbConnection();
        }
        loadCommentList();
        
    }

    /**
     * Insert a record into MySQL WEat.Result table.
     *
     * @param userID
     * @param groupID
     * @param resultID
     */
    public static void addResult(String resultName, int userID,  String groupID, String resultID) {

        String sql = "INSERT INTO WEat.Result ";
        sql += "(resultName, userID,`groupID`,resultID) ";
        sql += " VALUES ";
        sql += "('" + resultName + "', ";
        sql += userID + ", ";
        sql += "'" + groupID + ", ";
        sql += "'" + resultID + "');";

        DbUtilities db = new DbUtilities();
        db.executeUpdate(sql);
        db.closeDbConnection();
    }

    /**
     * load all comments for this result
     */
    public void loadCommentList() {
        String sql = "SELECT * FROM  WEat.Comment ";
        sql += " WHERE resultID = '" + this.resultID + "' ";
        sql += " AND groupID = '"  + this.groupID  +  "' ; ";
        System.out.println("[loadCommentList]sql = " + sql);
        DbUtilities db = new DbUtilities();
        try {
            ResultSet rs = db.getResultSet(sql);
            while (rs.next()) {
                int commentID = Integer.parseInt(rs.getString("commentID"));
                // Create Result  object here for each commentID
                Comment comment = new Comment(commentID, groupID);
                // Add each account to customerList
                commentList.add(comment);
                System.out.println("[loadCommentList]commentList = " + commentList);
            } 
        } catch (SQLException e) {
            System.out.println("Cannot load result comments.");
            e.printStackTrace();
        } finally {
            db.closeDbConnection();
        }
        
    }
    
    public Hashtable<Integer, User> getUserList()
    {
        return this.userList;
    }
    
    public String getResultID()
    {
        return resultID;
    }
    
    public String getResultName()
    {
        return resultName;
    }

    /**
     * output username in the list
     * @return 
     */
    public String userListToString()
    {
        StringBuffer s = new StringBuffer();
        User user;
        int userID;
        //userID = userIDList.get(0);
        Enumeration<Integer> userIDList = userList.keys();
        user = userList.get(userIDList.nextElement());
        s.append(user.getUserName());
        while(userIDList.hasMoreElements())
        {
          user = userList.get(userIDList.nextElement());
            s.append(", " + user.getUserName());
        }
        s.append("<br>");
        return new String(s);
    }
    
    public String commenListToString()
    {
        StringBuffer s = new StringBuffer();
        if(commentList.size() == 0)
        {
            return "";
        }
        for(Comment c : commentList )
        {
           String userName = "";
           //if a user in the userList
            if(userList.containsKey(c.getUserID()))
            {
                userName = userList.get(c.getUserID()).getUserName();
            }
            else//if not a user in the userList, retrieve username from database(WEat.user table)
            {
                 User user = new User(c.getUserID());
                 userName = user.getUserName();
            }
            s.append(userName + " : " + c.getCommentText() + "<br>");
        }
        return new String(s);
    }  
}
