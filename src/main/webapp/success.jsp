<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("refresh","3;URL=login.jsp") ;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="images/shopping-cart.png"/>
    <link rel="shortcut icon" href="images/buy-button" type="image/x-icon" />
    <title>success</title>
</head>
<style>
    body{
        background: url(images/bg-body.jpg) repeat;
    }
    div{
        margin-left: 30%;
        margin-right: 30%;
        border: solid crimson 5px;
        margin-top: 250px;
        text-align: center;
    }
    h1{
    margin: 0;
    color: red; 
    font-size: 40px;
    text-shadow: 
        0 1px 0 #ef0505,
        0 2px 0 #c50303,
        0 3px 0 #ad0505,
        0 4px 0 #8f0303,
        0 5px 0 #1c0202;
    }
    p{
        color: rgb(18, 25, 228);
    }
</style>
<body>
    <div>
        <h1>註冊成功</h1>
        <p><b>3秒後自動轉跳</b></p>
    </div>
</body>
</html>