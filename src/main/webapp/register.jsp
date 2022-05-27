<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style1.css">
    <link rel="icon" type="image/x-icon" href="images/shopping-cart.png"/>
    <link rel="shortcut icon" href="images/buy-button" type="image/x-icon" />
    <title>註冊會員</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"></head>
</head>
<body>
    <div>
        <h1><a href="/Diggo/Home.jsp"><span id="home"><i><span>D</span>i<sub>ggo</sub></i></span></a></h1>
    </div>
    <form action="checkRegister.jsp" class="register" method="post" onsubmit="return checkAll(this)" style="width:350px;">
        <h2>註冊會員</h2>
    <h3>USER REGISTER</h3>
    <i class="fa-solid fa-user-pen"></i>
       <table>
        <tr>
            <td><label for="username">帳號</label></td>
            <td><input type="text" name="username" id="username" placeholder="請輸入帳號" required="required" autofocus><span id="usid"></span>
            </td>
        </tr>
        <tr>
            <td><label for="password">密碼</label></td>
            <td><input type="password" name="password" id="password" placeholder="請輸入密碼" required="required"><span id="pass"></span></td>
        </tr>
        <tr>
            <td><label for="check">確認密碼</label></td>
            <td><input type="password" name="checkPassword" id="checkPassword" placeholder="請再輸入密碼" required="required"><span id="checkid"></span></td>
        </tr>
        <tr>
            <td><label for="idnum">身分證字號</label></td>
            <td><input type="text" name="idnum" id="idnum" placeholder="請輸入身分證字號" required="required"><span id="idn"></span></td>
        </tr>
        <tr>
            <td><label for="email">Email</label></td>
            <td><input type="text" name="email" id="email" placeholder="請輸入電子郵件" required="required"><span id="emid"></span></td>
        </tr>
        <tr>
            <td><label for="phonenum">手機號碼</label></td>
            <td><input type="text" name="phonenum" id="phonenum"placeholder="請輸入手機號碼" required="required"><span id="phone_id"></span></td>
        </tr>
        <tr>
            <td><label for="birthday">出生日期</label></td>
            <td><input type="date" name="birthday"id="birthday" required="required"></td>
        </tr>
        <tr>
            <td><label for="address">地址</label></td>
            <td><input type="text" name="address" id="address" placeholder="請輸入地址" required="required"></td>
        </tr>
       </table>
       <button type="submit">確認送出</button>
       <p>已經有會員？<a href="/Diggo/login.jsp">立即登入</a></p>
    </form>
    <script type="text/javascript" src="js/register.js"></script>
</body>
</html>



