<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<style>
	body {
		background-color:#EEFFFF;
		padding-top:100px;
	}

	.together {
		width: 700px;
		margin: 0px auto;
		background-color: #FFF;
		border: 1px solid #ccc;
		border-radius: 5px;
	}

	.together .choose {
		width: 100%;
		/*height: 300px;*/
		margin: 10px auto;
		text-align: center;
		height: 50px;
		line-height: 50px;
	}


	ul {
		margin: 0;
		padding: 50px;
		padding-top: 0;
	}

	li {
		display: flex;
		margin: 20px 0;
	}

	li span {
		min-width: 200px;
		font-size: 12px;
		line-height: 46px;
		float: left;
		text-align: center;
		opacity: 0.3
	}
	input,
	label {
		display: block;
		float: left;
		height: 46px;
		font-size: 23px;
		box-sizing: border-box;
		color: #333;
	}

	label {
		width: 200px;
		line-height: 46px;
		margin-right: 30px;
		text-align: right;
		font-weight: 700;
	}

	input {
		width: 320px;
		padding: 8px;
		border: 1px solid #cccccc;
		outline: none;
		/*text-align: center;*/
	}

	input.code {
		width: 120px;
	}

	input.verify {
		width: 190px;
		margin-left: 10px;
		background-color: red;
		color: #fff;
		text-align: center;

	}

	input[type=submit] {
		border: none;
		color: #fff;
		background-color:#00FF66;
		border: 4px;
		cursor: pointer;

	}
	.tips {
		/*固定定位*/
		position: fixed;
		top: 0;
		width: 100%;
		height: 40px;
		text-align: center;
		display: none;

	}
	.tips p {
		min-width: 300px;
		max-width: 400px;
		margin: 0 auto;
		line-height: 40px;
		color: #fff;
		background-color: #C91623;

	}
</style>
<body>
<div class="together">
		<div class="choose">
			<h1>后台管理登录</h1>
		</div>
		<!-- 登录 -->
		<div class="login">
			<form action="${pageContext.request.contextPath }/servlet/ManagementLogin"  method="post">
				<ul>
					<li>
						<label for="username">用户名</label>
						<input type="text" name="phone" id="username" placeholder="请输入手机号" class="username">
					</li>
					<li>
						<label for="psw">密码</label>
						<input type="password" name="password" placeholder="请输入密码" id="psw" class="psw">
					</li>
					<li>
						<label for=""></label>
						<input type="submit"  class="loginBtn" value="登录">
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>