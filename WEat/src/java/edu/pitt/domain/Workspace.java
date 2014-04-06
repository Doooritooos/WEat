package edu.pitt.domain;

import edu.pitt.utilities.DbUtilities;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Liu
 */
public class Workspace {

    private int userID;
    private int groupID;
    private ArrayList<Result> resutlList = new ArrayList<Result>();
    
    public Workspace(int userID, int groupID)
    {
        userID = this.userID;
        groupID = this.groupID;
        loadGroupResults();
    }

    /**
     * retrieve all results into the resutlList, of which group the
     * authenticatedUser is in
     * @param groupID
     */
    public void loadGroupResults() {
        String sql = "SELECT * FROM  WEat.Result ";
        sql += " WHERE groupID = " +  this.groupID + " ;";
        DbUtilities db = new DbUtilities();
        try {
            ResultSet rs = db.getResultSet(sql);
            while (rs.next()) {
                String resultID = rs.getString("resultID");
                // Create Result  object here for each resultID
                Result result = new Result(resultID, groupID);
                // Add each account to customerList
                resutlList.add(result);
            }
        } catch (SQLException e) {
            System.out.println("Cannot load group results.");
            e.printStackTrace();
        }
    }//end of loadGroupResults
    
    public ArrayList<Result> getReultList()
    {
        return this.resutlList;
    }
}
