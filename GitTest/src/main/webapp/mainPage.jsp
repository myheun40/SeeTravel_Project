<%@page import="com.aischool.model.WebMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  WebMember member = (WebMember) session.getAttribute("logindata");
  String errorMsg = (String) request.getAttribute("errorMsg");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .error { color: red; }
    </style>
</head>

<body>

	<%if(member == null){%>
	<h1>로그인한 세션 아이디 출력</h1>
	<%} else {%>
	<h1><%= member.getId()%>님 환영합니다</h1>	
	<%}%>
	
	<h1>로그인</h1>
			<form action="loginService" method="post">
				<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
	
	<h1>회원가입</h1>
	<form action="JoinService" method="post">
		<li><input type="text" name="email" placeholder="이메일을 입력하세요"></li>
		<li><input type="text" name="pw" placeholder="비밀번호를 입력하세요"></li>
		<li><input type="text" name="name" placeholder="이름을 입력하세요"></li>
		<li><input type="text" name="id" placeholder="아이디를 입력하세요"></li>
		<li><input type="submit" value="JoinUs"></li>
	</form>
	
	<% if (member == null) { %>
        <p>로그인한 후에 회원탈퇴를 시도해주세요.</p>
    <% } else { %>
        <h1>회원탈퇴</h1>
        <form action="deleteService" method="post">
            <p>이메일: <%= member.getEmail() %></p>
            <p><input type="password" name="pw" placeholder="비밀번호를 입력하세요" required></p>
            <% if (errorMsg != null) { %>
                <p class="error"><%= errorMsg %></p>
            <% } %>
            <p><input type="submit" value="Delete"></p>
        </form>
    <% } %>
	
	
	<h1>로그아웃</h1>
		<form action="logoutService" method = "post">
		<li><input type="submit" value="logout"></li>
		</form>
		
	<h1>회원정보 수정</h1>
		<form action = "editService" method = "post ">
		<p>수정할 정보를 입력하세요</p>
		<p><input type = "text" name = pw>비밀번호 입력</p>
		<p><input type = "text" name = name>이름 입력</p>
		<p><input type = "text" name = id>닉네임 입력</p>
		 <% if (errorMsg != null) { %>
                <p class="error"><%= errorMsg %></p>
         <% } %>
		<p><input type="submit" value="Edit"></p>
		
		</form>

	
	

</body>
</html>