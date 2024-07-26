<%@page import="com.aischool.model.WebMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String errorMsg = (String) request.getAttribute("errorMsg");
%>
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

<script>
	
	let isEmailChecked = false;
	let isEmailAvailable = false;

	function checkEmail() {
		var email = document.getElementById('email').value;
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText;
				document.getElementById('emailResult').innerHTML = result;
				isEmailChecked = true;
				isEmailAvailable = (result === "사용가능한 이메일입니다.");
			}
		};
		xhr.open('GET', 'CheckEmailServlet?email=' + encodeURIComponent(email),
				true);
		xhr.send();
	}

	function validateForm() {
		if (!isEmailChecked) {
			alert("이메일 중복 확인을 해주세요.");
			return false;
		}
		if (!isEmailAvailable) {
			alert("사용 가능한 이메일을 입력해주세요.");
			return false;
		}
		return true;
	}
	
	
</script>
<body>

	<div class="register">

		<div class="header">
			<a href="main.jsp"><img class="logo-icon" alt="로고"
				src="image/KakaoTalk_20240722_104503600.jpg"></a>
			<div class="right">
				<div class="nav">
					<span class="navTxt"><a href="main.jsp#plan"><u>여행
								일정 만들기</u></a></span>
				</div>
				<a href="login.jsp"><div class="login">
						<div class="div3">로그인</div>
					</div></a>
			</div>
			<div class="header-line"></div>
		</div>

		<div class="register-container">
			<div class="parent">
				<div class="div">회원가입</div>
				<div class="input-form">
					<form action="JoinService" method="post"
						onsubmit="return validateForm()">
						<div class="private">
							<span class="agree">개인정보 제 3자 제공 동의 여부</span> <input
								type="checkbox">
						</div>
						<i class="name txt">Name</i>
						<div class="inputName">
							<input class="input" type="text" name="name"
								placeholder="이름을입력해주세요">
						</div>
						<div class="name-parent">
							<i class="name1">Nickname</i>
							<div class="input1">
								<input class="input" type="text" name="id"
									placeholder="닉네임을 입력해주세요">
							</div>
						</div>
						<div class="input-parent">
							<div class="input1">
								<input class="input" type="text" name="email" id="email"
									required placeholder="아이디로 사용할 E-mail 입력해주세요">
							</div>
							<i class="email txt">E-mail</i>
						</div>
						<div class="pw-parent">
							<i class="pw txt">Password</i>
							<div class="input1">
								<input class="input" type="password" minlength="8" name="pw"
									placeholder="8자리 이상의 비밀번호를 입력해주세요">
							</div>
						</div>
						<div class="input-group">
							<div class="input1">
								<input class="input" type="password" placeholder="비밀번호 재입력해주세요">
							</div>
							<i class="pw1 txt">Password</i>
						</div>
						<button class="div1" type="button" onclick="checkEmail()">
							<span class="check">중복확인</span>
						</button>
						<span id="emailResult"></span>
				</div>
				
				<button class="register1" type="submit">
					<i class="register2">Register</i>
				</button>
			</div>
			</form>

		</div>
	</div>

</body>
</html>