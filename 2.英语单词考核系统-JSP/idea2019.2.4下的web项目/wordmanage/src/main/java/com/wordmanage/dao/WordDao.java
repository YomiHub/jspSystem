package com.wordmanage.dao;

import com.wordmanage.bean.PageResult;
import com.wordmanage.bean.Word;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WordDao {
    //参数多于3个的时候可以考虑使用对象传递（向表word添加数据项）
    Connection con;
    public void addWord(Word word) throws SQLException {
        con = GetDBConnection.connectDB();
        if (con == null){
            return;
        }
       /*   Statement sql;
        boolean insertRs;
        try{
            sql = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            insertRs = sql.execute("INSERT INTO `word` (`id`, `english`, `chinese`, `type`, `comm`) VALUES ('"+word.getId()+"','"+ word.getEnglish()+"','"+ word.getChinese()+"','"+word.getType()+"','"+ word.getComm()+"')");

            if(!insertRs){
                System.out.println("插入成功");
            }
            con.close();
        }catch(SQLException e){
            System.out.println(e);
        }*/
        String sql = "insert into word(english,chinese,type,comm) values (?,?,?,?)";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        int index=1;
//      给预编译参数进行传值
        preparedStatement.setObject(index++,word.getEnglish());
        preparedStatement.setObject(index++,word.getChinese());
        preparedStatement.setObject(index++,word.getType());
        preparedStatement.setObject(index++,word.getComm());
//      执行sql
        preparedStatement.executeUpdate();
    }

    //更新词汇
    public void updateWord(Word word) throws SQLException {
        con = GetDBConnection.connectDB();
        if (con == null){
            return;
        }
        String sql = "update word set english=?,chinese=?,type=?,comm=? where id=?";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        int index=1;

        preparedStatement.setObject(index++,word.getEnglish());
        preparedStatement.setObject(index++,word.getChinese());
        preparedStatement.setObject(index++,word.getType());
        preparedStatement.setObject(index++,word.getComm());
        preparedStatement.setObject(index++,word.getId());
        preparedStatement.executeUpdate();
    }

    //根据英文查询中文词汇
    public String getChineseByEng(String english) throws SQLException {
        con = GetDBConnection.connectDB();
        if (con == null){
            return null;
        }
        String sql = "select chinese from word where english=?";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
//       给preparestatement传参
        preparedStatement.setObject(1,english);

        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getObject(1).toString();
        }
        return null;
    }

    //随机获取单词
    public Word getWord() throws SQLException {
        con = GetDBConnection.connectDB();
        if (con == null){
            return null;
        }
        Statement statement = con.createStatement();
        ResultSet resultSet = statement.executeQuery(
                "select * from word order by rand() LIMIT 1");
        Word word = new Word();
        if (resultSet.next()) {
            word.setId(resultSet.getInt(1));
            word.setEnglish(resultSet.getString(2));
            word.setChinese(resultSet.getString(3));
            word.setType(resultSet.getString(4));
            word.setComm(resultSet.getString(5));
            return word;
        }
        return null;
    }

    //列表返回word表所有记录
    public List<Word> getList(String key){
        con = GetDBConnection.connectDB();
        if(con == null){
            return null;
        }
        List<Word> list = new ArrayList<>();
        try{
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from word where english like '%"
                    + key + "%' or chinese like '%" + key + "%'");
            while(resultSet.next()){
                Word word = new Word();
                word.setId(resultSet.getInt(1));
                word.setEnglish(resultSet.getString(2));
                word.setChinese(resultSet.getString(3));
                word.setType(resultSet.getString(4));
                word.setComm(resultSet.getString(5));
                list.add(word);
            }
            return list;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    //分页查询word表中记录
    public PageResult queryByPage(Integer currentPage, Integer pageSize) {
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        PreparedStatement prepareStatement2 = null;
        ResultSet resultSet2 = null;
        PageResult pageResult = null;
        try {
            con =GetDBConnection.connectDB();
            String sql = "select * from (select * from word order by id desc) AS temp4 limit ?,?";
            prepareStatement = con.prepareStatement(sql);
            prepareStatement.setInt(1, (currentPage - 1) * pageSize);
            prepareStatement.setInt(2, pageSize);

            resultSet = prepareStatement.executeQuery();
            List<Word> findInfoList = new ArrayList<>();
            while (resultSet.next()) {
                Word word = new Word();
                word.setId(resultSet.getInt(1));
                word.setEnglish(resultSet.getString(2));
                word.setChinese(resultSet.getString(3));
                word.setType(resultSet.getString(4));
                word.setComm(resultSet.getString(5));
                findInfoList.add(word);
            }
            // 查询表总数
            String sql2 = "select * from word ";
            prepareStatement2 = con.prepareStatement(sql2);
            resultSet2 = prepareStatement2.executeQuery();
            Long totalRecord = 0L;
            while (resultSet2.next()) {
                totalRecord = totalRecord + 1;
            }
            pageResult = new PageResult(findInfoList, totalRecord, pageSize, currentPage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageResult;
    }

    //根据Id删除项
    public boolean delete(int id){
        con  = GetDBConnection.connectDB();
        try{
            PreparedStatement preparedStatement = con.prepareStatement("delete from word where id=?");
            preparedStatement.setObject(1,id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
