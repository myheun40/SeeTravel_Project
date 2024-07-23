<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1, width=device-width">

<link rel="stylesheet" href="design/register-global.css" />
<link rel="stylesheet" href="design/register.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Times New Roman:ital,wght@1,400&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />

<title>Register page</title>

</head>
<body>

	<div class="register">

		<div class="header">
			<a href="main.jsp"><img class="logo-icon" alt="로고"
				src="image/KakaoTalk_20240722_104503600.jpg"></a>
			<div class="right">
				<div class="nav">
					<span class="navTxt"><a href="main.jsp#plan"><u>여행 일정 만들기</u></a></span>
				</div>
				<a href="login.html"><div class="login">
						<div class="div3">로그인</div>
					</div></a>
			</div>
			<div class="header-line"></div>
		</div>

		<div class="register-container">
			<div class="parent">
				<div class="div">회원가입</div>
				<div class="input-form">
					<form action="">
						<div class="private">
							<span class="agree">개인정보 제 3자 제공 동의 여부</span> <input
								type="checkbox">
						</div>
						<i class="name txt">Name</i>
						<div class="inputName">
							<input class="input" type="text" placeholder="이름을 입력해주세요">
						</div>
						<div class="name-parent">
							<i class="name1">Nickname</i>
							<div class="input1">
								<input class="input" type="text" placeholder="닉네임을 입력해주세요">
							</div>
						</div>
						<div class="input-parent">
							<div class="input1">
								<input class="input" type="text"
									placeholder="아이디로 사용할 E-mail 입력해주세요">
							</div>
							<i class="email txt">E-mail</i>
						</div>
						<div class="pw-parent">
							<i class="pw txt">Password</i>
							<div class="input1">
								<input class="input" type="password" minlength="8"
									placeholder="8자리 이상의 비밀번호를 입력해주세요">
							</div>
						</div>
						<div class="input-group">
							<div class="input1">
								<input class="input" type="password" placeholder="비밀번호 재입력해주세요">
							</div>
							<i class="pw1 txt">Password</i>
						</div>
						<button class="div1">
							<span class="check">중복확인</span>
						</button>
					</form>
				</div>
				<button class="register1">
					<i class="register2">Register</i>
				</button>
			</div>
		</div>



	</div>

</body>
</html>