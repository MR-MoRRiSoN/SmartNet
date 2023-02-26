<%@ page import="com.example.smartnet.service.StorageService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.smartnet.initialization.User" %>
<%@ page import="com.example.smartnet.initialization.Storage" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: mr_morrison
  Date: 2/20/2023
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<%
    Boolean backMainPage = false;
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    HttpSession httpSession = (HttpSession) request.getSession();
    String name = (String) httpSession.getAttribute("name");
    String surname = (String) httpSession.getAttribute("Surname");
    String formattedDateTimeNow = now.format(formatter);
    if (request.getParameter("uid")!=null){
    String uid = request.getParameter("uid");
    List<Storage> storage = StorageService.getAllStorage("SELECT * FROM Storage WHERE ProductId = "+uid+";");

    if (request.getParameter("addNew") != null) {
        String addNew = request.getParameter("addNew");
        String addIncomeDate = request.getParameter("addIncomeDate");
        String storageName = request.getParameter("storageName");


        String script = "INSERT INTO Storage (ProductType,VendorName, SerialNumber, PartNumber,Description,StorageName,IncomeDate,Status) " +
                "VALUES ('"+storage.get(0).getProductType()+"','"+storage.get(0).getVendorName()+"','"+addNew+"','"+storage.get(0).getPartNumber()+"','"+storage.get(0).getDescription()+"','"+storageName+"','"+addIncomeDate+"','Available');";

        String historyScript = "INSERT INTO StorageHistory ( vendorName, productType, serialNumber, partNumber, storageName, incomeDate, operationDate, operatorName, operationName)" +
                "VALUES ( '"+storage.get(0).getVendorName()+"', '"+storage.get(0).getProductType()+"', '"+storage.get(0).getSerialNumber()+"', '"+storage.get(0).getPartNumber()+"', '"+storageName+"', '"+addIncomeDate+"', '"+formattedDateTimeNow+"', '"+name+" "+surname+"', 'Add New Product');";
        StorageService.insertScript(script);
        StorageService.insertScript(historyScript);
        backMainPage=true;
    } else {
        if (request.getParameter("reserve") != null) {
            String reserve ="Reserved Until "+ request.getParameter("reserve");

            String script = "UPDATE Storage SET Status='"+reserve+"' WHERE ProductId="+uid+";";
            String historyScript = "INSERT INTO StorageHistory ( vendorName, productType, serialNumber, partNumber, storageName, incomeDate, operationDate, operatorName, operationName)" +
                    "VALUES ( '"+storage.get(0).getVendorName()+"', '"+storage.get(0).getProductType()+"', '"+storage.get(0).getSerialNumber()+"', '"+storage.get(0).getPartNumber()+"', '"+storage.get(0).getStorageName()+"', '"+storage.get(0).getIncomeDate()+"', '"+formattedDateTimeNow+"', '"+name+" "+surname+"', '"+reserve+"');";
            StorageService.updateScript(script);
            StorageService.insertScript(historyScript);
            backMainPage = true;

        } else {
            if (request.getParameter("export") != null) {
                String export = "Exported In " + request.getParameter("export");
                String script = "UPDATE Storage SET Status='"+export+"' WHERE ProductId="+uid+";";


                String historyScript = "INSERT INTO StorageHistory ( vendorName, productType, serialNumber, partNumber, storageName, incomeDate, operationDate, operatorName, operationName)" +
                        "VALUES ( '"+storage.get(0).getVendorName()+"', '"+storage.get(0).getProductType()+"', '"+storage.get(0).getSerialNumber()+"', '"+storage.get(0).getPartNumber()+"', 'Out of stock', '"+storage.get(0).getIncomeDate()+"', '"+formattedDateTimeNow+"', '"+name+" "+surname+"', '"+export+"');";
                StorageService.updateScript(script);
                StorageService.insertScript(historyScript);
               backMainPage = true;

            }
        }
    }
    }

    if (backMainPage == true) {

%>
<script>
    window.open('mainPage.jsp', '_self');
</script>
<%
    }else {
     out.println("ERROR");
    }

%>


</body>
</html>
