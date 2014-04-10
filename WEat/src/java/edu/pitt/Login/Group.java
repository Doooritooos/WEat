/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pitt.Login;

/**
 *
 * @author Doris
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import edu.pitt.utilities.*;

public class Group {

    private int userID;
    private int groupID;
    private String groupname;
    public boolean valid;

    DbUtilities db = new DbUtilities();
    ResultSet rs;

    public Group(int userID) {
        this.userID = userID;

        String sql = "SELECT * FROM WEat.group WHERE userID = '"
                + this.userID + "'";
        try {
            rs = db.getResultSet(sql);
            boolean groupExists = rs.next();

            if (!groupExists) {
                System.out.println("This group doesnot Exists.");
                this.valid = false;
            } else if (groupExists) {
                this.groupID = rs.getInt("groupID");
                this.groupname = rs.getString("groupname");
                this.valid = true;
            }
        } catch (SQLException ex) {
            // TODO Auto-generated catch block
            System.out.println("An Exception has occurred! " + ex);
        } finally {
            db.closeDbConnection();
        }

    }

    public Group(int userID, int groupID) {
        this.userID = userID;
        this.groupID = groupID;

        String sql = "SELECT * FROM WEat.group WHERE userID = '"
                + this.userID + "' AND groupID= '"
                + this.groupID + "'";
        try {
            rs = db.getResultSet(sql);
            boolean groupExists = rs.next();

            if (!groupExists) {
                System.out.println("This group doesnot Exists.");
                this.valid = false;
            } else if (groupExists) {
                this.groupname = rs.getString("groupname");
                this.valid = true;
            }
        } catch (SQLException ex) {
            // TODO Auto-generated catch block
            System.out.println("An Exception has occurred! " + ex);
        } finally {
            db.closeDbConnection();
        }

    }

    public Group(String groupname, int userID) {
        this.groupname = groupname;
        this.userID = userID;

        if (this.groupname != null) {
            String sql = "INSERT INTO WEat.group(userID, groupname)";
            sql += "VALUES ('" + this.userID + "', '" + this.groupname + "')";
            db.executeQuery(sql);
        }
    }

    public String getGroupName() {
        return groupname;
    }

    public int getGroupID() {
        return groupID;
    }

    public int getUserID() {
        return userID;
    }

    public boolean isValid() {
        return valid;
    }

}
