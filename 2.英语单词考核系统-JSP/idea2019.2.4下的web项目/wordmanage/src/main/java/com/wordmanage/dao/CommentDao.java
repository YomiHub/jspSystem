package com.wordmanage.dao;

import com.wordmanage.bean.Word;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CommentDao {
    Connection con;
    public void addComment(String comment,String username) throws SQLException {
        con = GetDBConnection.connectDB();
        if (con == null){
            return;
        }
        String sql = "insert into comment(content,username) values (?,?)";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        int index=1;
        preparedStatement.setObject(index++,comment);
        preparedStatement.setObject(index++,username);

        preparedStatement.executeUpdate();
    }
}
