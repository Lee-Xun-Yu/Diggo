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
	String name=(String) session.getAttribute("user");
	String permission=(String) session.getAttribute("permission");
	if(name==null){
		name="";
	}
	String s="<a href='/Diggo/login.jsp'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ;'>免費註冊</a><a href='orderList' style='margin-left: 30% ; display:none;'>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px; display:none;'>會員管理</a>";
	String a="<a href='/Diggo/outLogin'>登 出</a>";
	String icon="<i class='fa-solid fa-user' style='display:none'></i>";
	if(name.equals("")){
		a="<a href='/Diggo/outLogin' style='display:none'>登 出</a>";
	}
	if(!name.equals("")){
		icon="<i class='fa-solid fa-user'></i>";
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='buyList?id="+""+name+"'"+" style='margin-left: 30% ;'><i class='fa-solid fa-cart-shopping' style='margin-right:3px;'></i>購物車</a><a href='orderList?id="+""+name+"'"+" style='margin-left:10px;'><i class='fa-solid fa-clipboard-list' style='margin-right:3px;'></i>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px; display:none;'><i class='fa-solid fa-user-gear'></i>會員管理</a>";
	}
	if(!name.equals("")&& permission.equals("管理者")){
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='buyList?id="+""+name+"'"+" style='margin-left: 30% ;'><i class='fa-solid fa-cart-shopping' style='margin-right:3px;'></i>購物車</a><a href='orderList?id="+""+name+"'"+" style='margin-left:10px;'><i class='fa-solid fa-clipboard-list' style='margin-right:3px;'></i>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px;'><i class='fa-solid fa-user-gear'></i>會員管理</a>";
	}
	session.setMaxInactiveInterval(10*60);//這裡設定使用者登入保持的最大時長(單位：秒)
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
					<li class="current">
						<a href="">首頁</a>
					</li>
					<li>
						<a href="doproduct?kind=3C">3C</a>
					</li>
					<li>
						<a href="doproduct?kind=日用">日用</a>
					</li>
					<li>
						<a href="doproduct?kind=家電">家電</a>
					</li>
					<li>
						<a href="doproduct?kind=數位">數位</a>
					</li>
					<li>
						<a href="doproduct?kind=衣物">衣物</a>
					</li>
					<li>
						<a href="doproduct?kind=通訊">通訊</a>
					</li>
					<li>
						<a href="doproduct?kind=其他">其他</a>
					</li>
				</ul>
			</div>
			<div class="body">
				<div>
					<a href="https://www.megabank.com.tw/personal/credit-card/event/111incometax"><img src="images/555.jpeg" alt="Image" style="width: 98%;"></a>
					<div style="margin-left: 5px;font-size: 20px;letter-spacing: 3px;width: 100%; "><span style="font-size:25px ;"><i class="fa-solid fa-bullhorn"></i>重要公告</span><hr>
						Diggo購物嚴格取締違法販賣快篩劑、偽造小黃卡以及疫苗接種相關防疫物品及證明
						一經查獲屬實立即停權，依傳染病防治法及相關政策，最高將處以100萬新台幣！
					</div>
				</div>
			</div>
			<div class="footer">
				<ul>
					<li>
						<h2><a href="http://localhost:8080/Diggo/buy.jsp?P_id=1019&P_name=AIRPODS%20PRO%209%E6%88%90%E6%96%B0&P_price=4500&P_qty=1&describe=9%E6%88%90%E6%96%B0">AirPods Pro 9成新</a></h2>
						<a href="http://localhost:8080/Diggo/buy.jsp?P_id=1019&P_name=AIRPODS%20PRO%209%E6%88%90%E6%96%B0&P_price=4500&P_qty=1&describe=9%E6%88%90%E6%96%B0"><img src="images/1019.jpg" alt="Image" style="width:340px ; height: 300px;"></a>
					</li>
					<li>
						<h2><a href="http://localhost:8080/Diggo/buy.jsp?P_id=1014&P_name=Apple%20iPhone%2013%20Pro%20Max&P_price=38888&P_qty=1&describe=6.7%20%E5%90%8B%E8%B6%85%20Retina%20XDR%20%E9%A1%AF%E7%A4%BA%E5%99%A8%EF%BC%8C%E5%85%B7%E5%82%99%20ProMotion%20%E8%87%AA%E5%8B%95%E9%81%A9%E6%87%89%E6%9B%B4%E6%96%B0%E9%A0%BB%E7%8E%87%E6%8A%80%E8%A1%93%EF%BC%8C%E5%B8%B6%E4%BE%86%E6%9B%B4%E5%BF%AB%E9%80%9F%E3%80%81%E6%9B%B4%E9%9D%88%E6%95%8F%E7%9A%84%E9%AB%94%E9%A9%97,%E9%9B%BB%E5%BD%B1%E7%B4%9A%E6%A8%A1%E5%BC%8F%E7%82%BA%E5%BD%B1%E7%89%87%E5%A2%9E%E6%B7%BB%E6%B7%BA%E6%99%AF%E6%B7%B1%E6%95%88%E6%9E%9C%EF%BC%8C%E4%B8%A6%E8%87%AA%E5%8B%95%E8%AE%8A%E6%8F%9B%E7%84%A6%E9%BB%9E,%E5%B0%88%E6%A5%AD%E7%B4%9A%E7%9B%B8%E6%A9%9F%E7%B3%BB%E7%B5%B1%EF%BC%8C%E9%85%8D%E5%82%99%E5%85%A8%E6%96%B0%201200%20%E8%90%AC%E5%83%8F%E7%B4%A0%E6%9C%9B%E9%81%A0%E3%80%81%E5%BB%A3%E8%A7%92%E8%88%87%E8%B6%85%E5%BB%A3%E8%A7%92%E7%9B%B8%E6%A9%9F%EF%BC%9B%E5%85%89%E5%AD%B8%E9%9B%B7%E9%81%94%E6%8E%83%E6%8F%8F%E5%84%80%EF%BC%9B6%20%E5%80%8D%E5%85%89%E5%AD%B8%E8%AE%8A%E7%84%A6%E7%AF%84%E5%9C%8D%EF%BC%9B%E5%BE%AE%E8%B7%9D%E6%94%9D%E5%BD%B1%EF%BC%9B%E5%85%B7%E5%82%99%E6%94%9D%E5%BD%B1%E9%A2%A8%E6%A0%BC%E3%80%81ProRes%20%E5%BD%B1%E7%89%874%E3%80%81%E6%99%BA%E6%85%A7%E5%9E%8B%20HDR%204%E3%80%81%E5%A4%9C%E9%96%93%E6%A8%A1%E5%BC%8F%E3%80%81Apple%20ProRAW%E3%80%814K%20%E6%9D%9C%E6%AF%94%E8%A6%96%E7%95%8C%20HDR%20%E9%8C%84%E8%A3%BD">APPLE IPHONE 13 PRO MAX</a></h2>
						<a href="http://localhost:8080/Diggo/buy.jsp?P_id=1014&P_name=Apple%20iPhone%2013%20Pro%20Max&P_price=38888&P_qty=1&describe=6.7%20%E5%90%8B%E8%B6%85%20Retina%20XDR%20%E9%A1%AF%E7%A4%BA%E5%99%A8%EF%BC%8C%E5%85%B7%E5%82%99%20ProMotion%20%E8%87%AA%E5%8B%95%E9%81%A9%E6%87%89%E6%9B%B4%E6%96%B0%E9%A0%BB%E7%8E%87%E6%8A%80%E8%A1%93%EF%BC%8C%E5%B8%B6%E4%BE%86%E6%9B%B4%E5%BF%AB%E9%80%9F%E3%80%81%E6%9B%B4%E9%9D%88%E6%95%8F%E7%9A%84%E9%AB%94%E9%A9%97,%E9%9B%BB%E5%BD%B1%E7%B4%9A%E6%A8%A1%E5%BC%8F%E7%82%BA%E5%BD%B1%E7%89%87%E5%A2%9E%E6%B7%BB%E6%B7%BA%E6%99%AF%E6%B7%B1%E6%95%88%E6%9E%9C%EF%BC%8C%E4%B8%A6%E8%87%AA%E5%8B%95%E8%AE%8A%E6%8F%9B%E7%84%A6%E9%BB%9E,%E5%B0%88%E6%A5%AD%E7%B4%9A%E7%9B%B8%E6%A9%9F%E7%B3%BB%E7%B5%B1%EF%BC%8C%E9%85%8D%E5%82%99%E5%85%A8%E6%96%B0%201200%20%E8%90%AC%E5%83%8F%E7%B4%A0%E6%9C%9B%E9%81%A0%E3%80%81%E5%BB%A3%E8%A7%92%E8%88%87%E8%B6%85%E5%BB%A3%E8%A7%92%E7%9B%B8%E6%A9%9F%EF%BC%9B%E5%85%89%E5%AD%B8%E9%9B%B7%E9%81%94%E6%8E%83%E6%8F%8F%E5%84%80%EF%BC%9B6%20%E5%80%8D%E5%85%89%E5%AD%B8%E8%AE%8A%E7%84%A6%E7%AF%84%E5%9C%8D%EF%BC%9B%E5%BE%AE%E8%B7%9D%E6%94%9D%E5%BD%B1%EF%BC%9B%E5%85%B7%E5%82%99%E6%94%9D%E5%BD%B1%E9%A2%A8%E6%A0%BC%E3%80%81ProRes%20%E5%BD%B1%E7%89%874%E3%80%81%E6%99%BA%E6%85%A7%E5%9E%8B%20HDR%204%E3%80%81%E5%A4%9C%E9%96%93%E6%A8%A1%E5%BC%8F%E3%80%81Apple%20ProRAW%E3%80%814K%20%E6%9D%9C%E6%AF%94%E8%A6%96%E7%95%8C%20HDR%20%E9%8C%84%E8%A3%BD"><img src="images/1014.jpg" alt="Image" style="width: 340px; height: 300px; "></a>
					</li>
				</ul>
				<ul>
					<li>
						<h2><a href="http://localhost:8080/Diggo/buy.jsp?P_id=1005&P_name=COACH%20%E6%94%B6%E7%B4%8D%E5%8C%85%20%E7%B4%8410%E5%AF%B8%E5%A4%A7&P_price=34999&P_qty=1&describe=9.9%E6%88%90%E6%96%B0">coach 收納包 約10寸大</a></h2>
						<a href="http://localhost:8080/Diggo/buy.jsp?P_id=1005&P_name=COACH%20%E6%94%B6%E7%B4%8D%E5%8C%85%20%E7%B4%8410%E5%AF%B8%E5%A4%A7&P_price=34999&P_qty=1&describe=9.9%E6%88%90%E6%96%B0"><img src="images/1005.jpg" alt="Image" style="width: 340px; height: 300px; "></a>
					</li>
					<li>
						<h2><a href="http://localhost:8080/Diggo/buy.jsp?P_id=1020&P_name=%E4%BA%8C%E6%89%8B%E6%9B%B8%E7%B1%8D&P_price=300&P_qty=10&describe=%E6%AD%A1%E8%BF%8E%E8%B3%BC%E8%B2%B7">二手書籍</a></h2>
						<a href="http://localhost:8080/Diggo/buy.jsp?P_id=1020&P_name=%E4%BA%8C%E6%89%8B%E6%9B%B8%E7%B1%8D&P_price=300&P_qty=10&describe=%E6%AD%A1%E8%BF%8E%E8%B3%BC%E8%B2%B7"><img src="images/1020.jpg" alt="Image" style="width: 340px; height: 300px; "></a>
					</li>
				</ul>
			</div>
		</div>
		<div>
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