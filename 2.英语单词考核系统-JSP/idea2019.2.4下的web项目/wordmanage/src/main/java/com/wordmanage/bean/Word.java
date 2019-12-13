package com.wordmanage.bean;


public class Word {
    private int id;
    private String english;
    private String chinese;
    private String type;
    private String comm;

    public String getInfoBackNews() {
        return infoBackNews;
    }

    public void setInfoBackNews(String infoBackNews) {
        this.infoBackNews = infoBackNews;
    }

    private String infoBackNews;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getChinese() {
        return chinese;
    }

    public void setChinese(String chinese) {
        this.chinese = chinese;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getComm() {
        return comm;
    }

    public void setComm(String comm) {
        this.comm = comm;
    }

    @Override
    public String toString() {
        return "Word{" +
                "id=" + id +
                ", english='" + english + '\'' +
                ", chinese='" + chinese + '\'' +
                ", type='" + type + '\'' +
                ", comm='" + comm + '\'' +
                '}';
    }
}
