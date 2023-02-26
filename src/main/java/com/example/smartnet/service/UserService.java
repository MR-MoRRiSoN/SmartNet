package com.example.smartnet.service;

import com.example.smartnet.connection.Connection;
import com.example.smartnet.initialization.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    public static List<User> checkLogin(String username, String password) throws SQLException {
        String script = "SELECT * FROM Users WHERE userLogInNickname = '" + username + "' AND userPassword = '" + password + "';";
        Statement statement = Connection.connect();

        assert statement != null;
        ResultSet resultSet = statement.executeQuery(script);

        List<User> users = new ArrayList<>();
        while (resultSet.next()) {
            Long userId = resultSet.getLong("userId");
            String userProfession = resultSet.getString("userProfession");
            String userName = resultSet.getString("userName");
            String userSurname = resultSet.getString("userSurname");
            String userLogInNickname = resultSet.getString("userLogInNickname");
            String userMail = resultSet.getString("userMail");
            String userPassword = resultSet.getString("userLogInNickname");
            users.add(new User(userId, userProfession, userName, userSurname, userLogInNickname, userMail, userPassword));
        }

        return users;
    }
}
