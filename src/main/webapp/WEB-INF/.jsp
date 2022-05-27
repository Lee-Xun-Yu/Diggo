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
	String s="<a href='/Diggo/login.jsp'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ;'>免費註冊</a><a href='' style='margin-left: 30% ; display:none'>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px; display:none;'>會員管理</a>";
	String a="<a href='/Diggo/outLogin'>登 出</a>";
	String name=(String) session.getAttribute("user");
	if(name==null){
		name="";
	}
	if(name.equals("")){
		a="<a href='/Diggo/outLogin' style='display:none'>登 出</a>";
	}
	if(!name.equals("")){
		s="<a href='/Diggo/login.jsp' style='display:none'>請登入</a><a href='/Diggo/register.jsp' style='margin-left:10px ; display:none'>免費註冊</a><a href='' style='margin-left: 30% ;'>我的訂單</a><a href='/Diggo/CheckPermission' style='margin-left:10px;'>會員管理</a>";
	}
	session.setMaxInactiveInterval(10*60);//這裡設定使用者登入保持的最大時長(單位：秒)
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Diggo - 最佳二手用品交易網</title>
	<link rel="stylesheet" type="text/css" href="css/style2.css">
	<meta name="description" content="Diggo 二手交易網，包含衣服書籍滑鼠手機電腦3C家電書櫃桌子盒子交易"><!--說明網站內容 提高曝光率-->
    <meta name="robots" content="INDEX,FOLLOW"><!--允許此網頁被google搜索-->
    <link rel="shortcut icon" type="image/png" href="https://..."/><!--加入網站小圖標-->
    <link rel="shortcut icon" href="https://..." type="image/x-icon" /><!--備用圖標-->
    <link type="text/css" href="/public/stylesheets/index.css" rel="stylesheet" /><!--css物件設定導向-->
    <script>
         const media_path = "https://.../images/"; 
        function startIntro(target = 'member') { /*若客戶點擊帶有target"member"的標籤 將以現有網址加上這裡第15行的內容(詳細位於15行和24行註解)---這裡的功能則預想為和潛在普通會員(遊客)的介紹網站的經營內容來吸引加入---連接的程式會位於/body內 這裡指第41行*/
            let url = '/member/product';/*以此為例 假設客戶當前網站為"http://google.com" 點擊帶有target"member"的標籤後 將更變為"http://google.com/member/product"*/
            if (target == 'partner') {/*若客戶點擊帶有target"member"的標籤 將以現有網址加上這裡第17行的內容(詳細位於17行和24行註解)---這裡的功能則預想為和潛在合作夥伴(賣家)的介紹網站的經營內容進以吸引加入會員---連接的程式會位於/body內 這裡指第50行*/
                url = '/partner';/*以此為例 假設客戶當前網站為"http://google.com" 點擊帶有target"partner"的標籤後 將更變為"http://google.com/partner"*/
            }
            
            /*else if (target == 'partner') { 此行無意義 用於解釋該語法可加入else做編寫"
                url = '/partner';
            }*/

            window.location.href = url;/*此行可理解為"為使用者當前網站加上網址"之語法*/
        }
        function login(type = 'login') { /*該行程式用於登入*/
            let url = 'https://login.diggo.com.tw';/*在點選帶有type"login"的標籤後(登入)後 將跳轉至此網址---連接的程式會位於/body內 這裡指第42行*/
            window.open(url, 'login');/*此行可理解為"為使用者開啟網站"之語法*/
        }
    </script>
</head>
<body>
	<div class="header">
		<ul>
			<li id="head" style="position:fixed; width:960px">您好<%=name %><%=a %>，歡迎來到Diggo！<%=s %></li>
		</ul>
		<div>
			<a href="/Diggo/Home.jsp"><h1><span id="home"><i><span>D</span>i<sub>ggo</sub></h1></a></i></span>
		</div>
		<form action="index.html">
			<input type="text" id="search" placeholder="輸入您想找的商品">
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
					<li class="current">
						<a href="">3C</a>
					</li>
					<li>
						<a href="">日用</a>
					</li>
					<li>
						<a href="">家電</a>
					</li>
					<li>
						<a href="">數位</a>
					</li>
					<li>
						<a href="">衣物</a>
					</li>
					<li>
						<a href="">通訊</a>
					</li>
				</ul>
			</div>
			<div class="body">
				<div id="content">
					<div>
						<ul>
							<li class="pro">
								<a href=""><img src="images/001.jpg" alt="Image" style="height:200px; width: 200px;"></a>
									<span><a href="">商品名稱</a></span><br><br><hr><span style="text-align: left;">單價:</span><span style="text-align: left;">數量:</span>
									<hr>
									<span style="text-align: left; font-size:15px">商品描述：</span>
							</li>
							<li class="pro">
								<a href=""><img src="images/001.jpg" alt="Image" style="height:200px; width: 200px;"></a>
									<span><a href="">商品名稱</a></span><br><br><hr><span style="text-align: left;">單價:</span><span style="text-align: left;">數量:</span>
									<hr>
									<span style="text-align: left; font-size:15px">商品描述：</span>
							</li>
							<li class="pro">
								<a href=""><img src="images/001.jpg" alt="Image" style="height:200px; width: 200px;"></a>
									<span><a href="">商品名稱</a></span><br><br><hr><span style="text-align: left;">單價:</span><span style="text-align: left;">數量:</span>
									<hr>
									<span style="text-align: left; font-size:15px">商品描述：</span>
							</li>
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