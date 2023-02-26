<%@ page import="com.example.smartnet.service.StorageService" %>
<%@ page import="com.example.smartnet.connection.Connection" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: mr_morrison
  Date: 2/17/2023
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>SmartNetStorage Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://www.dafontfree.net/embed/bGVtb25hZGEtbGlnaHQmZGF0YS83NTcvbC8xODE2MzYvTGVtb25hZGEtTGlnaHQudHRm"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="src/style/sing_up_style.css">

</head>
<body class="align">

<div class="grid align__item">

    <div class="register">

        <img src="src/image/Logo.png" alt="Logo" width="250">
        <h2>Sign Up</h2>

        <form action="" method="post" class="form">
            <div class="form__field">
                <input type="text" name="FirstName" placeholder="First Name">
            </div>
            <div class="form__field">
                <input type="text" name="LastName" placeholder="Last Name">
            </div>
            <div class="form__field">
                <input type="text" name="jobPosition" placeholder="Job Position">
            </div>
            <div class="form__field">
                <input type="text" name="NickName" placeholder="User Name ">
            </div>
            <div class="form__field">
                <input type="email" name="Email" placeholder="YourEmail@gmail.com">
            </div>
            <div class="form__field">
                <input id="password" type="password" name="password" placeholder="Write Good Password">
            </div>
            <div class="form__field">
                <input id="password2" type="password" name="password2" placeholder="Confirm Your Password">
            </div>

            <div class="form__field">
                <input id="button" type="submit" value="Sign Up">
            </div>
            <input name="checked" value="true" style="display: none">
            <div>
            </div>

        </form>

        <p>Already have an account? <a href="index.jsp">Sing In</a></p>

    </div>

</div>
<script>


    let input1 = document.getElementById("password");
    let input2 = document.getElementById("password2");
    let button = document.getElementById("button");


    function compareInputs() {
        const passwd = input1.value;
        const repPasswd = input2.value;
        if (passwd !== "" && repPasswd !== "" && passwd !== repPasswd) {
            input1.style.color = "red";
            input2.style.color = "red";
            button.disabled = true;
        } else {
            input1.style.color = "black";
            input2.style.color = "black";
            button.disabled = false;
        }

    }

    setInterval(compareInputs, 500);
</script>
<%
    if (request.getParameter("checked") != null) {
        String jobPosition = request.getParameter("jobPosition");
        String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        String NickName = request.getParameter("NickName");
        String Email = request.getParameter("Email");
        String password = request.getParameter("password");


        String script = "INSERT INTO Users (userProfession, userName, userSurname, userLogInNickname, userMail, userPassword) VALUES ('" + jobPosition + "', '" + FirstName + "', '" + LastName + "', '" + NickName + "', '" + Email + "', '" + password + "');";
        StorageService.insertScript(script);
%>
<script>
    window.open('index.jsp', '_self');
</script>
<%
    }
%>


</body>
</html>

