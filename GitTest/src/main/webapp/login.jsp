<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1, width=device-width">

<link rel="stylesheet" href="design/register-gobal.css" />
<link rel="stylesheet" href="design/register.css" />
<link rel="stylesheet" href="design/login.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Times New Roman:ital,wght@1,400&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />

<title>Login page</title>
</head>
<body>
	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	<div class="register">

		<div class="header">
			<a href="main.jsp"><img class="logo-icon" alt="로고"
				src="design/KakaoTalk_20240722_104503600.jpg"></a>
			<div class="right">
				<div class="nav">
					<span class="navTxt"><u>여행 일정 만들기</u></span>
				</div>
				<a href="login.html"><div class="login">
						<div class="div3">로그인</div>
					</div></a>
			</div>
			<div class="header-line"></div>
		</div>

		<div class="login-container">
			<div class="parent">
				<div class="div">로그인</div>
				<div class="login-form">
					<form action="loginService">
						<div class="email-input">
							<div class="input1">
								<input class="input" type="text" name="email"
									placeholder="이메일(ID)을 입력해주세요">
							</div>
							<i class="email txt">E-mail</i>
						</div>
						<div class="pw-input">
							<i class="pw txt">Password</i>
							<div class="input1">
								<input class="input" type="password" name="pw"
									placeholder="비밀번호를 입력해주세요">
							</div>
						</div>
				</div>
				<button class="register1">
					<i class="register2">Login</i>
				</button>
			</div>

			</form>

		</div>



	</div>



</body>
</html>