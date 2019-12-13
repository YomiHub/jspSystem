package com.wordmanage.dao;

import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class TestWordDao {
    @Test

    public void test() throws SQLException {
        /*Word word = new Word();
        word.setId(4);
        word.setEnglish("English");
        word.setChinese("英语");
        word.setType("学科");
        word.setComm("测试");
        addTest.addWord(word);*/
        WordDao Test = new WordDao();
       /* System.out.println(Test.getChineseByEng("english"));
        List<Word> list = Test.getList();*/
        System.out.println("delete"+Test.delete(4));
    }
}
