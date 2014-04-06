package edu.pitt.domain;

import edu.pitt.utilities.DbUtilities;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Result class
 *
 * @author Liu
 */
public class Result {

    private String resultID;
    private int groupID;
    private ArrayList<Integer> userIDList;
    private ArrayList<Comment> commentList;

    /**
     * Result constructor 1 : Retrieve data for provided resultID from MySQL
     * WEat.Result table; Use retrieved data to populate corresponding
     * properties of the Result object.
     * @param resultID
     * @param groupID
     */
    public Result(String resultID, int groupID) {
        String sql = "SELECT * FROM WEat.Result  ";
        sql += "WHERE yelpID = '" + resultID + "' AND groupID = " + groupID;
        DbUtilities db = new DbUtilities();
        try {
            ResultSet rs = db.getResultSet(sql);
            while (rs.next()) {
                this.resultID = resultID;
                this.groupID = groupID;
                this.userIDList.add(Integer.parseInt(rs.getString("userID")));
            }
        } catch (SQLException e) {
            System.out.println("Cannot construct Result with resultID");
            e.printStackTrace();
        }

        loadCommnetList();
    }

    /**
     * Insert a record into MySQL WEat.Result table.
     *
     * @param userID
     * @param groupID
     * @param resultID
     */
    public static void addResult(int userID, int groupID, String resultID) {

        String sql = "INSERT INTO WEat.Result ";
        sql += "(userID,groupID,yelpID) ";
        sql += " VALUES ";
        sql += "(" + userID + ", ";
        sql += groupID + ", ";
        sql += "'" + resultID + "');";

        DbUtilities db = new DbUtilities();
        db.executeQuery(sql);
    }

    /**
     * load all comments for this result
     */
    public void loadCommnetList() {
        String sql = "SELECT * FROM  WEat.Comment ";
        sql += " WHERE groupID = " + this.groupID;
        sql += " AND resultID = '" + this.resultID + "' ; ";
        DbUtilities db = new DbUtilities();
        try {
            ResultSet rs = db.getResultSet(sql);
            while (rs.next()) {
                int commentID = Integer.parseInt(rs.getString("commentID"));
                // Create Result  object here for each commentID
                Comment comment = new Comment(commentID);
                // Add each account to customerList
                commentList.add(comment);
            }
        } catch (SQLException e) {
            System.out.println("Cannot load result comments.");
            e.printStackTrace();
        }
    }
    
    public ArrayList<Integer> getUserList()
    {
        return this.userIDList;
    }
    
    public String getResultID()
    {
        return resultID;
    }

    public String userListToString()
    {
        StringBuffer s = new StringBuffer();
        s.append(userIDList.get(0));
        for(int i = 0; i < userIDList.size(); i ++)
        {
            s.append(", " + i);
        }
        return new String(s);
    }
    
    public String commenListToString()
    {
        StringBuffer s = new StringBuffer();
        s.append("Comments on " + resultID + "\n");
        for(Comment c : commentList )
        {
            s.append(c.toString());
        }
        return new String(s);
    }
    
}
