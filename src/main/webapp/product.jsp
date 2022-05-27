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
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='buyList?id="+""+name+"'"+" style='margin-left: 30% ;'><i class='fa-solid fa-cart-shopping' style='margin-right:3px;'></i>購物車</a><a href='orderList?id="+""+name+"'"+" style='margin-left:10px;'><i class='fa-solid fa-clipboard-list' style='margin-right:3px;'></i>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px; display:none'><i class='fa-solid fa-user-gear'></i>會員管理</a>";
	}
	if(!name.equals("")&& permission.equals("管理者")){
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='buyList?id="+""+name+"'"+" style='margin-left: 30% ;'><i class='fa-solid fa-cart-shopping' style='margin-right:3px;'></i>購物車</a><a href='orderList?id="+""+name+"'"+" style='margin-left:10px;'><i class='fa-solid fa-clipboard-list' style='margin-right:3px;'></i>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px;'><i class='fa-solid fa-user-gear'></i>會員管理</a>";
	}
	session.setMaxInactiveInterval(10*60);//這裡設定使用者登入保持的最大時長(單位：秒)
	
	String pro =(String) session.getAttribute("pro");
	String[] str=new String[7];
	for(int i=0;i<str.length;i++){
		str[i]="";
	}
	switch (pro){
	case"3C":str[0]="class='current'";
	break;
	case"日用":str[1]="class='current'";
	break;
	case"家電":str[2]="class='current'";
	break;
	case"數位":str[3]="class='current'";
	break;
	case"衣物":str[4]="class='current'";
	break;
	case"通訊":str[5]="class='current'";
	break;
	case"其他":str[6]="class='current'";
	break;
	}
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
	<div class="body">
		<div>
			<div class="header">
				<ul>
					<li>
						<a href="Home.jsp">首頁</a>
					</li>
					<li <%=str[0] %>>
						<a href="doproduct?kind=3C">3C</a>
					</li>
					<li <%=str[1] %>>
						<a href="doproduct?kind=日用">日用</a>
					</li>
					<li <%=str[2] %>>
						<a href="doproduct?kind=家電">家電</a>
					</li>
					<li <%=str[3] %>>
						<a href="doproduct?kind=數位">數位</a>
					</li>
					<li <%=str[4] %>>
						<a href="doproduct?kind=衣物">衣物</a>
					</li>
					<li <%=str[5] %>>
						<a href="doproduct?kind=通訊">通訊</a>
					</li>
					<li <%=str[6] %>>
						<a href="doproduct?kind=其他">其他</a>
					</li>
				</ul>
			</div>
			<div class="body">
				<div id="content">
					<div>
						<ul>
							<c:forEach items="${proList}" var="list">
								<li class="pro">
									<a href="buy.jsp?P_id=${list.p_id }&P_name=${list.p_name }&P_price=${list.p_price }&P_qty=${list.p_qty }&describe=${list.describe }"><img src="images/${list.p_id }.jpg" alt="Image" style="height:190px; width: 200px;margin-top: 0;"></a>
									<span><a href="buy.jsp?P_id=${list.p_id }&P_name=${list.p_name }&P_price=${list.p_price }&P_qty=${list.p_qty }&describe=${list.describe }">${list.p_name }</a></span><br><br><hr><span style="text-align: left;">單價:${list.p_price }</span><span style="text-align: left;">數量:${list.p_qty }</span>
									<hr>
									<span style="text-align: left; font-size:15px">${list.describe }</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
			<div>
				<h3>信用卡優惠</h3>
				<a href="https://www.citibank.com.tw/sim/index.htm"><img src="images/111.jpeg" alt="Image" style="width:230px ;"></a>
				<a href="https://www.esunbank.com.tw/bank/personal"><img src="images/444.jpeg" alt="Image" style="width:230px ;"></a>

			</div>
			<div>
				<h3>消費回饋</h3>
				<ul id="featured">
					<li>
						<a href="https://buy.line.me/"><img src="images/222.png" alt="Image" style="width:230px ;"></a>
						<div>
							<h3>最新活動</h3>
							<a href="https://www.realme.tw/SalePage/Index/7411759?lang=zh-TW"><img src="images/333.jpeg" alt="Image" style="width:230px ;"></a>
						</div>
					</li>
				</ul>
			</div>
		<div>
			<div>
				<h3>最新消息</h3>
				<ul id="blog">
					<li>
						<a href="">全館消費滿5000元，送折價券500元！</a>
						<span class="date">刊登日期：2022/5/14</span>
					</li>
					<li>
						<a href="https://www.ttvs.ntct.edu.tw/ischool/widget/main_menu/show.php?id=215&map=0">警政署為加強預防詐欺犯罪，設立「反詐騙諮詢專線165」電話，提供民眾諮詢。凡遇可疑電話，不論手機或市話，撥打「165」即可由專人為您說明並研判是否為詐騙事件。</a>
						<span class="date">刊登日期：2022/4/20</span>
					</li>
					<li>
						<a href="https://www.tydep.gov.tw/tydep/">做個有意識的消費者!!<br>讓你的舊愛，成為別人的新歡。<br>精選真心喜愛的物品，不任意丟棄，造成地球負擔，馬上加入Diggo行列！</a>
						<span class="date">刊登日期：2022/3/30</span>
					</li>
				</ul>
			</div>
			<div>
				<h3>關於我們</h3>
				<a href="https://www.facebook.com/" target="_blank" id="facebook">Facebook</a>
				<a href="https://twitter.com/?lang=zh-Hant" target="_blank" id="twitter">Twitter</a>
				<a href="https://www.youtube.com/" target="_blank" id="youtube">Youtube</a>
				<a href="https://www.google.com.tw/?hl=zh_TW" target="_blank" id="googleplus">Google&#43;</a>
			</div>
		</div>
	</div>
	<div class="footer">
		<div>
			<p>
				&copy; Diggo線上購物 -xxxxxxxxx股份有限公司 版權所有. 轉載必究 <a href="" style="margin-left:10% ;">聯絡我們</a><a href="" style="margin-left:3% ;">隱私權聲明</a><a href="" style="margin-left:3% ;">服務條款</a>
			</p>
		</div>
	</div>
</body>
</html>