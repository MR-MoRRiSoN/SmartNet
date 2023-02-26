package com.example.smartnet.service;

import com.example.smartnet.algorithm.RandomString;
import com.example.smartnet.connection.Connection;
import com.example.smartnet.initialization.Storage;
import com.example.smartnet.initialization.StorageHistory;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StorageService {


    public static List<Storage> getAllStorage(String script) throws SQLException {

        Statement statement = Connection.connect();
        assert statement != null;
        ResultSet resultSet = statement.executeQuery(script);
        List<Storage> storage = new ArrayList<>();


        while (resultSet.next()) {
            Long productId = resultSet.getLong("ProductId");
            String productType = resultSet.getString("ProductType");
            String vendorName = resultSet.getString("VendorName");
            String serialNumber = resultSet.getString("SerialNumber");
            String partNumber = resultSet.getString("PartNumber");
            String description = resultSet.getString("Description");
            String storageName = resultSet.getString("StorageName");
            Date incomeDate = resultSet.getDate("IncomeDate");
            String status = resultSet.getString("Status");

            storage.add(new Storage(productId, productType, vendorName, serialNumber, partNumber, description, storageName, incomeDate, status));
        }
        return storage;
    }

    public static List<StorageHistory> getStorageHistory(String script) throws SQLException {
        Statement statement = Connection.connect();
        assert statement != null;
        ResultSet resultSet = statement.executeQuery(script);
        List<StorageHistory> storage = new ArrayList<>();


        while (resultSet.next()) {
            Long historyId = resultSet.getLong("historyId");
            String vendorName = resultSet.getString("vendorName");
            String productType = resultSet.getString("productType");
            String serialNUmber = resultSet.getString("serialNUmber");
            String partNumber = resultSet.getString("partNumber");
            String storageName = resultSet.getString("storageName");
            Date incomeDate = resultSet.getDate("incomeDate");
            Timestamp operationDate = resultSet.getTimestamp("operationDate");
            String operatorName = resultSet.getString("operatorName");
            String operationName = resultSet.getString("operationName");

            storage.add(new StorageHistory(historyId,vendorName,productType,serialNUmber,partNumber,storageName,incomeDate,operationDate,operatorName,operationName));
        }
        return storage;
    }

    public static ArrayList<String> selectDistincts() throws SQLException {
        String script = "SELECT DISTINCT ProductType FROM Storage;";
        Statement statement = Connection.connect();
        assert statement != null;
        ResultSet resultSet = statement.executeQuery(script);
       ArrayList<String> storage = new ArrayList<>();


        while (resultSet.next()) {
            String productType = resultSet.getString("ProductType");

            storage.add(productType);
        }
        return storage;
    }


    public static String sendGmail(String mail) throws Exception {
        GMailer gMailer = new GMailer();
        String checkingGmail = "SELECT * FROM Users WHERE userMail = '" + mail + "';";
        Statement statement = Connection.connect();

        assert statement != null;
        ResultSet resultSet = statement.executeQuery(checkingGmail);
        String getUserMail = null;
        String randomPassword;
        while (resultSet.next()) {
            getUserMail = resultSet.getString("userMail");
        }
        if (getUserMail != null) {
            System.out.println(getUserMail);
            randomPassword = RandomString.getAlphaNumericString(8);
            gMailer.sendMail("Recover Password", "Your Code Is " + randomPassword, getUserMail);
        } else {
            return "null";
        }
        return randomPassword;


    }

    public static void updateScript(String script) throws SQLException {
        Statement statement = Connection.connect();
        assert statement != null;
        statement.executeUpdate(script);
    }

    public static void insertScript(String script) throws SQLException {
        Statement statement = Connection.connect();
        assert statement != null;
        statement.execute(script);
    }
}

