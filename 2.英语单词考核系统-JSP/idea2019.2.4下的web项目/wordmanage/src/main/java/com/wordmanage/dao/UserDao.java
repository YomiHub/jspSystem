package com.wordmanage.dao;

import com.wordmanage.bean.User;
import com.wordmanage.bean.Word;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    Connection con;
    public void addUser(User user) throws SQLException {
        con = GetDBConnection.connectDB();
        if (con == null){
            return;
        }

        String sql = "insert into user(username,password) values (?,?)";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        int index=1;
        preparedStatement.setObject(index++,user.getUsername());
        preparedStatement.setObject(index++,user.getPassword());
        preparedStatement.executeUpdate();
    }

    public Boolean getUser(User user){
        con = GetDBConnection.connectDB();
        if(con == null){
            return null;
        }
        List<User> list = new ArrayList<>();
        try{
            PreparedStatement preparedStatement =
                    con.prepareStatement("select * from user where username=? and password=?");
            preparedStatement.setObject(1,user.getUsername());
            preparedStatement.setObject(2,user.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                return true;
            }
            return false;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
