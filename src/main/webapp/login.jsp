<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/x-icon" href="images/shopping-cart.png"/>
    <link rel="shortcut icon" href="images/buy-button" type="image/x-icon" />
    <title>登入</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
    <div>
        <h1><a href="/Diggo/Home.jsp"><span id="home"><i><span>D</span>i<sub>ggo</sub></i></span></a></h1>
    </div>
    <form action="checkLogin.jsp" class="login" method="post">
        <h1>登入</h1>
        <h1>Login</h1>
        <i class="fa-solid fa-circle-user"></i>
        <h2>帳號</h2>
        <input type="text" name="username" id="username" placeholder="請輸入帳號" required="required" autofocus>
        <h2>密碼</h2>
        <input type="password" name="password" id="password" placeholder="請輸入密碼" required="required">
        <button type="submit">登入</button>
        <P></P>
        <p>沒有會員？<a href="/Diggo/register.jsp">註冊會員</a></p>
    </form>
</body>
</html>