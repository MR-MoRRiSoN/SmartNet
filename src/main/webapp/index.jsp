<%@ page import="com.example.smartnet.service.StorageService" %>
<%@ page import="com.example.smartnet.connection.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.smartnet.initialization.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page import="com.example.smartnet.service.UserService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>SmartNetStorage Sing In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://www.dafontfree.net/embed/bGVtb25hZGEtbGlnaHQmZGF0YS83NTcvbC8xODE2MzYvTGVtb25hZGEtTGlnaHQudHRm" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="src/style/sing_in_style.css">

</head>
<body class="align">

<div class="grid align__item">

    <div class="register">

        <img src="src/image/Logo.png" alt="Logo" width="250">
        <h2>Sign In</h2>

        <form action="index.jsp" method="post" class="form">

            <div class="form__field">
                <input id="username" name="username" type="text" placeholder="User Name">
            </div>

            <div class="form__field">
                <input id="password" name="password" type="password"  placeholder="Password">
            </div>

            <div class="form__field">
                <input type="submit" value="Sign In">
            </div>
            <input name="check" value="true" style="display: none">
        </form>

        <p>Dont have account?  <a href="signUp.jsp">Sing up</a></p>
        <a href="forgetPassword.jsp">Forget Password? </a>

    </div>
</div>
<%
    if (request.getParameter("check")!=null)
    {

        List<User> user = UserService.checkLogin(request.getParameter("username"), request.getParameter("password"));
        if (user.isEmpty()) {
%>
<Script>
    let usernameInput = document.getElementById("username");
    let passwordInput = document.getElementById("password");

    usernameInput.style.backgroundColor = "red";
    passwordInput.style.backgroundColor = "red";
</Script>
<%
} else {
    HttpSession httpSession = (HttpSession) request.getSession(true);
    httpSession.setAttribute("uid", user.get(0).getUserID());
    httpSession.setAttribute("name", user.get(0).getUserName());
    httpSession.setAttribute("Surname", user.get(0).getUserSurname());
    httpSession.setAttribute("position", user.get(0).getUserProfession());
%>
<Script>
    window.open('mainPage.jsp', '_self');
</Script>
<%
        }
    }
%>
</body>
</html>
