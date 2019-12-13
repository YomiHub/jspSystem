package com.wordmanage.bean;

public class User {
    private String username;
    private String password;
    private String rePass;
    private String infoBackNews;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRePass() {
        return rePass;
    }

    public void setRePass(String rePass) {
        this.rePass = rePass;
    }

    public String getInfoBackNews() {
        return infoBackNews;
    }

    public void setInfoBackNews(String infoBackNews) {
        this.infoBackNews = infoBackNews;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", rePass='" + rePass + '\'' +
                '}';
    }
}
