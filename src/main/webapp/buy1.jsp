<%@page import="servlet.outLogin"%>
<%@page import="java.io.Console"%>
<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" import="java.util.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<%	
	String icon="<i class='fa-solid fa-user' style='display:none'></i>";
	String s="<a href='/Diggo/login.jsp'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ;'>免費註冊</a><a href='' style='margin-left: 30% ; display:none'>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px; display:none;'>會員管理</a>";
	String a="<a href='/Diggo/outLogin'>登 出</a>";
	String name=(String) session.getAttribute("user");
	String permission=(String) session.getAttribute("permission");
	if(name==null){
		name="";
	}
	if(name.equals("")){
		a="<a href='/Diggo/outLogin' style='display:none'>登 出</a>";
	}
	if(!name.equals("")){
		icon="<i class='fa-solid fa-user'></i>";
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='buyList?id="+""+name+"'"+" style='margin-left: 30% ;'><i class='fa-solid fa-cart-shopping' style='margin-right:3px;'></i>購物車</a><a href='orderList?id="+""+name+"'"+" style='margin-left:10px;'><i class='fa-solid fa-bag-shopping' style='margin-right:3px;'></i>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px; display:none'><i class='fa-solid fa-user-gear'></i>會員管理</a>";
	}
	if(name==""){
		out.print("<script>alert('請先登入會員');window.location.href='login.jsp';</script>");
	}
	if(!name.equals("")&& permission.equals("管理者")){
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='buyList?id="+""+name+"'"+" style='margin-left: 30% ;'><i class='fa-solid fa-cart-shopping' style='margin-right:3px;'></i>購物車</a><a href='orderList?id="+""+name+"'"+" style='margin-left:10px;'><i class='fa-solid fa-clipboard-list' style='margin-right:3px;'></i>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px;'><i class='fa-solid fa-user-gear'></i>會員管理</a>";
	}
	session.setMaxInactiveInterval(10*60);//這裡設定使用者登入保持的最大時長(單位：秒)
	String P_name=request.getParameter("P_name");
	String P_price=request.getParameter("P_price");
	String P_qty=request.getParameter("P_qty");
	String P_id=request.getParameter("P_id");
	String car_id=request.getParameter("car_id");
	int i=Integer.parseInt(P_price);
	int k=Integer.parseInt(P_qty);
	int total=i*k;
	String P_total=String.valueOf(total);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Diggo - 最佳二手用品交易網</title>
	<link rel="stylesheet" type="text/css" href="css/style2.css">
	<meta name="description" content="Diggo 二手交易網，包含衣服書籍滑鼠手機電腦3C家電書櫃桌子盒子交易">
    <meta name="robots" content="INDEX,FOLLOW">
    <link rel="icon" type="image/x-icon" href="images/shopping-cart.png"/>
    <link rel="shortcut icon" href="images/buy-button" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
	<div class="header">
		<ul>
			<li id="head" style="position:fixed; width:960px">您好<%=icon%><%=name %><%=a %>，歡迎來到Diggo！<%=s %></li>
		</ul>
		<div>
			<h1><a href="/Diggo/Home.jsp"><span id="home"><i><span>D</span>i<sub>ggo</sub></i></span></a></h1>
		</div>
		<form action="searchP">
			<input type="text" name="search" id="search" placeholder="輸入您想找的商品">
			<input type="submit" value="" id="searchbtn">
		</form>
	</div>
<div class="body" style="width: 800px;">
	<div>
		<div class="header">
			<P>商品編號：<%=P_id %></P>
		</div>
		<div class="body">
			<div id="content">
				<div>
					<div>
						<img src="images/<%=P_id %>.jpg" alt="Image" style="width: 200px; height: 200px; float:left;">
						<div style="margin-top:0; margin-left:190px;">
						<span style="text-align: left;">單價:<%=P_price %></span><span style="text-align: left;">數量:<%=P_qty %></span><span style="text-align: left;">總金額：<%=P_total %></span>
						</div>
						<hr>
					<form action="orderServlet" method="post">
						<table style="border-spacing: 10px 5px;">
						 	<tr>
						 		<td><label for="rev">收件人姓名</label></td>
						 		<td><input type="text" name="rev" required="required" autofocus></td>
						 	</tr>
						 	<tr>
						 		<td><label for="O_tel">收件人電話</label></td>
						 		<td><input type="text" name="O_tel" required="required"></td>
						 	</tr>
						 	<tr>
						 		<td><label for="O_add">收件人地址</label></td>
						 		<td><input type="text" name="O_add" required="required"></td>
						 	</tr>
						 	<tr>
						 		<td><label for="pay">付款方式</label></td>
						 		<td><input type="radio" name="pay" value="信用卡">信用卡
						 		<input type="radio" name="pay" value="ATM轉帳">ATM轉帳
						 		</td>
						 	</tr>
						 </table>
						 <input type="hidden" name="car_id" value=<%=car_id %>>
						 <input type="hidden" name="P_Price" value=<%=P_price %>>
						 <input type="hidden" name="P_qty" value=<%=P_qty %>>
						 <input type="hidden" name="P_id" value=<%=P_id %>>
						 <input type="hidden" name="P_total" value=<%=total %>> 
						 <input type="hidden" name="buy_id" value=<%=name %>>
						 <input type="hidden" name=P_price value=<%=P_price %>>
						 <input type="hidden" name=O_qty value=<%=P_qty %>>
						 <button class="btn" type="submit"style="margin-left: 100px; margin-top:20px; font-size:15px;">付款</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="footer" style="width:800px ;">
	<div>
		<p>
			&copy; Diggo線上購物 -xxxxxxxxx股份有限公司 版權所有. 轉載必究 <a href="" style="margin-left:10% ;">聯絡我們</a><a href="" style="margin-left:3% ;">隱私權聲明</a><a href="" style="margin-left:3% ;">服務條款</a>
		</p>
	</div>
</div>
</body>
</html>