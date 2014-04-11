/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pitt.domain;

/**
 *
 * @author Doris
 */
import edu.pitt.utilities.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;


public class Group {

    private int userID;
    private String groupID;
    private String groupname;
    public boolean valid;

    DbUtilities db = new DbUtilities();
    ResultSet rs;

    public Group(int userID) {
        this.userID = userID;

        String sql = "SELECT * FROM WEat.groups WHERE userID = '"
                + this.userID + "'";
        try {
            rs = db.getResultSet(sql);
            boolean groupExists = rs.next();

            if (!groupExists) {
                System.out.println("This group doesnot Exists.");
                this.valid = false;
            } else if (groupExists) {
                this.groupID = rs.getString("groupID");
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

    public Group(int userID, String groupID) {
        this.userID = userID;
        this.groupID = groupID;

        String sql = "SELECT * FROM WEat.groups WHERE userID = '"
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
        this.groupID =UUID.randomUUID().toString();
        this.groupname = groupname;
        this.userID = userID;

        if (this.groupname != null && this.groupID!=null) {
            String sql = "INSERT INTO WEat.groups(userID, groupname, groupID)";
            sql += "VALUES ('" + this.userID + "', '" + this.groupname + "','"+this.groupID+"')";
            db.executeQuery(sql);
        }
    }

    public String getGroupName() {
        return groupname;
    }

    public String getGroupID() {
        return groupID;
    }

    public int getUserID() {
        return userID;
    }

    public boolean isValid() {
        return valid;
    }

}
