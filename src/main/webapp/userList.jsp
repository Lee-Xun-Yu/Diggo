<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<%
	String user =(String) session.getAttribute("permission");
	if(user==null){
		response.sendRedirect("Home.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="icon" type="image/x-icon" href="images/shopping-cart.png"/>
<link rel="shortcut icon" href="images/buy-button" type="image/x-icon" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src="js/bootstrap.min.js"></script>
<title>用戶列表</title>
<style>
	#home{
	color: red; 
    font-size: 40px;
    text-shadow: 
        0 1px 0 #ef0505,
        0 2px 0 #c50303,
        0 3px 0 #ad0505,
        0 4px 0 #8f0303,
        0 5px 0 #1c0202;
}
a{
	text-decoration: none !important;
}
</style>
</head>
<body>
<div id="home">
	<h1><a href="/Diggo/Home.jsp"><span id="home"><i><span>D</span>i<sub>ggo</sub></i></span></a></h1>
</div>
<h1 style=" text-align: center">會員管理 &nbsp<i class='fa-solid fa-user-gear'></i></h1>
	<section class="container">
		<div class="row">
			<span class="col-md-3">
				<button class="btn btn-danger" data-toggle="modal"
					data-target="#addModal">新增</button>
			</span>
			<form action="search" style=" margin-left: 70%;" method="post">
				<input type="text" name="search"placeholder="用戶帳號">
				<button type="submit">搜 尋</button><button style="margin-left: 10px;" type="button" onclick="allUsers()">顯 示 全 部</button>
			</form>
			
		</div>
		
		<table class="table table-striped table-bordered table-hover">
		<tr>
			<th>會員編號</th>
			<th>帳號</th>
			<th>密碼</th>
			<th>身分證</th>
			<th>email</th>
			<th>手機電話</th>
			<th>生日</th>
			<th>地址</th>
			<th>權限</th>
			<th>操作</th>
		</tr>
			<c:forEach items="${userList}" var="list">
				<tr>
					<td>${list.id }</td>
					<td>${list.username }</td>
					<td>${list.password }</td>
					<td>${list.idcard }</td>
					<td>${list.email }</td>
					<td>${list.phone }</td>
					<td>${list.birthday }</td>
					<td>${list.address }</td>
					<td>${list.permission }</td>
					<td colspan="2"><button class="btn btn-primary edBtn"
							data-toggle="modal" data-target="#edModal" value="${list.id }" n="${ list.username}" p="${list.password }">編輯</button>
						<button class="btn btn-danger delBtn" data-toggle="modal"
							data-target=".delModal" value="${list.id }">刪除</button></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>

<div class="modal fade delModal" tabindex="-1" role="dialog"
	aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<h4>確定刪除?</h4>
			</div>
			<div class="modal-footer">
				<form action="delServlet" method="post">
					<input id="delid" name="id" value="" type="hidden">
					<button type="button" class="btn btn-primary" data-dismiss="modal">留着</button>
					<button type="submit" class="btn btn-danger">刪除</button>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="edModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">用戶信息</h4>
			</div>
			<form action="updateServlet" method="post">
				<div class="modal-body">
					<input id="edId" name="id" value="" type="hidden">
					<div class="form-group">
						<label for="username" class="control-label">帳號:</label> <input
							type="text" name="username" class="form-control" id="username"
							value="${list.username }" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">密 碼:</label> <input
							type="text" name="password" class="form-control" id="password"
							value="${list.password }" required>
					</div>
					<div class="form-group">
						<label for="permission" class="control-label">權 限（管理者、普通會員）:</label>
						<select name='permission'>
							<option>普通會員</option>
							<option>管理者</option>
						</select>
							
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">更新</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 添加模態框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">用戶信息</h4>
			</div>
			<form name='userform' action="addServlet" method="post" onsubmit="return checkAll(this)">
				<div class="modal-body">
					<input id="edId" name="id" value="" type="hidden">
					<div class="form-group">
						<label for="username" class="control-label">帳號:</label> <input
							type="text" name="username" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">密 碼:</label> <input
							type="password" name="password" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="idnum" class="control-label">身 份 證:</label> <input
							type="text" name="idnum" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="email" class="control-label">email:</label> <input
							type="text" name="email" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="phonenum" class="control-label">手 機 電 話:</label> <input
							type="text" name="phonenum" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="birthday" class="control-label">生 日:</label> <input
							type="date" name="birthday" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="address" class="control-label">地 址:</label> <input
							type="text" name="address" class="form-control" value="" required>
					</div>
					<div class="form-group">
						<label for="permission" class="control-label">權 限（管理者、普通會員）:</label> 
						<select name='permission'>
							<option>普通會員</option>
							<option>管理者</option>
						</select>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">添加</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">
	// 刪除按鈕
	$(".delBtn").on("click", function() {
		$("#delid").val($(this).val());	// 獲取當前點擊按鈕的值value值,並賦值給刪除模態框的<input name="id"
	});
	// 編輯按鈕
	$(".edBtn").on("click", function() {
		$("#edId").val($(this).val());	// 獲取當前點擊按鈕的值value值,並賦值給編輯模態框的<input name="id"
		$("#username").val($(this).attr("n"));	//取按鈕上的自定義屬性值
		$("#password").val($(this).attr("p"));	//取按鈕上的自定義屬性值
	});
	function allUsers(){
		window.location.href='allUsers';
	}
</script>
</html>