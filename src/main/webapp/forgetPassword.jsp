<%@ page import="com.example.smartnet.service.StorageService" %><%--
  Created by IntelliJ IDEA.
  User: mr_morrison
  Date: 2/14/2023
  Time: 10:35 PM
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

        <a href="Sing_In.html"><img src="src/image/Logo.png" alt="Logo" width="250"></a>
        <h2>Password Recovery</h2>

        <form action="tes" method="post" class="form">
            <div class="form__field send">
                <input type="email" name="email"
                       value="<%if (request.getParameter("email")!=null){out.println(request.getParameter("email"));}%>"
                       placeholder="YourEmail@gmail.com"
                       style="display: <%if (request.getParameter("check")!=null){out.println("none");}%>">
                <input name="check" value="true" style="display: none">

                <%--        <a href="forgetPassword.jsp">Send</a>--%>
            </div>
            <div class="form__field">
                <input type="text" id="verificationCode" name="verificationCode" placeholder="Verification Code"
                       style="display: <%if (request.getParameter("check")==null){out.println("none");}%>">
            </div>
            <div class="form__field">
                <input type="password" id="password" name="password" placeholder="Write Good Password"
                       style="display: <%if (request.getParameter("check")==null){out.println("none");}%>">
            </div>
            <div class="form__field">
                <input type="password" id="password2" name="password2" placeholder="Confirm Your Password"
                       style="display: <%if (request.getParameter("check")==null){out.println("none");}%>">
            </div>
            <div class="form__field">
                <input id="button" type="submit" value="Submit">
            </div>
            <%
                String status = "";
                if (request.getParameter("check") != null && request.getParameter("password2").isEmpty()) {
                    status = StorageService.sendGmail(request.getParameter("email"));
                }
            %>
            <input name="verificationCode2" style="display: none"
                   value="<%if (status!=""){out.println(status);}else{out.println(request.getParameter("verificationCode2"));}%>">
            <%

                if (request.getParameter("check") != null) {
            %>

        </form>


    </div>

</div>
<%

    if (request.getParameter("password").isEmpty()) {

    } else {
        if (request.getParameter("verificationCode").equals(request.getParameter("verificationCode2")) && request.getParameter("password").equals(request.getParameter("password2"))) {
            StorageService.updateScript("UPDATE Users SET userPassword = '" + request.getParameter("password") + "' WHERE userMail = 'qiriagivi@gmail.com';");
%>
<Script>
    window.open('index.jsp', '_self');
</Script>
<%
} else {
%>
<Script>
    let verificationInput = document.getElementById("verificationCode");
    verificationInput.style.background = "red";
</Script>
<%
            }

        }
    }
%>
<%
    if (request.getParameter("email") != null) {
%>
<script>
    let verificationInput = document.getElementById("verificationCode");
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
        button.disabled = verificationInput.value === "" || passwd === "" || repPasswd === "";

    }

    setInterval(compareInputs, 500);
</script>
<%
    }
%>
</body>
</html>

