package com.example.smartnet.initialization;

public class User {
    private Long userID;
    private String userProfession;
    private String userName;
    private String userSurname;
    private String userLogInNickname;
    private String userMail;
    private String userPassword;

    public User() {
    }

    public User(Long userID, String userProfession, String userName, String userSurname, String userLogInNickname, String userMail, String userPassword) {
        this.userID = userID;
        this.userProfession = userProfession;
        this.userName = userName;
        this.userSurname = userSurname;
        this.userLogInNickname = userLogInNickname;
        this.userMail = userMail;
        this.userPassword = userPassword;
    }

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long userID) {
        this.userID = userID;
    }

    public String getUserProfession() {
        return userProfession;
    }

    public void setUserProfession(String userProfession) {
        this.userProfession = userProfession;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }

    public String getUserLogInNickname() {
        return userLogInNickname;
    }

    public void setUserLogInNickname(String userLogInNickname) {
        this.userLogInNickname = userLogInNickname;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", userProfession='" + userProfession + '\'' +
                ", userName='" + userName + '\'' +
                ", userSurname='" + userSurname + '\'' +
                ", userLogInNickname='" + userLogInNickname + '\'' +
                ", userMail='" + userMail + '\'' +
                ", userPassword='" + userPassword + '\'' +
                '}';
    }
}
