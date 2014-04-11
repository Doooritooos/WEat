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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Doris
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import edu.pitt.utilities.*;

public class User {

    private int userID;
    private String email;
    private String password;
    private String username;
    public boolean valid;

    DbUtilities db = new DbUtilities();
    ResultSet rs;

    public User(String email, String password) {
        this.email = email;
        this.password = password;

        String sql = "SELECT * FROM WEat.user WHERE email = '"
                + this.email + "' AND password = '"
                + this.password + "'";
        try {
            rs = db.getResultSet(sql);
            boolean userExists = rs.next();

            if (!userExists) {
                System.out.println("Email/Password entered is Incorrect or User doesnot Exists.");
                this.valid = false;
            } else if (userExists) {
                this.userID = rs.getInt("userID");
                this.username = rs.getString("username");
                this.valid = true;
            }
        } catch (SQLException ex) {
            // TODO Auto-generated catch block
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        } finally {
            db.closeDbConnection();
        }

    }

    public User(String email, String password, String username) {
        this.email = email;
        this.password = password;
        this.username = username;

        if (this.email != null && this.password != null && this.username != null) {
            String sql = "INSERT INTO WEat.user(email, password, username)";
            sql += "VALUES ('" + this.email + "', '" + this.password + "', '"
                    + this.username + "')";
            db.executeUpdate(sql);
        }
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getUserName() {
        return username;
    }

    public int getUserID() {
        return userID;
    }

    public boolean isValid() {
        return valid;
    }
    


}
