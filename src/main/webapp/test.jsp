<%--
  Created by IntelliJ IDEA.
  User: mr_morrison
  Date: 2/24/2023
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload PDF File</title>
</head>
<body>
<h1>Upload PDF File</h1>
<form action="uploadPDF.jsp" method="post" enctype="multipart/form-data">
    <label for="pdfFile">Select PDF file to upload:</label><br>
    <input type="file" id="pdfFile" name="pdfFile"><br><br>
    <input type="submit" value="Upload PDF">
</form>
</body>
</html>