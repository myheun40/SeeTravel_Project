<%@page import="com.aischool.model.WebMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    WebMember member = (WebMember) session.getAttribute("logindata");
    String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
    <style>
        .error { color: red; }
    </style>
</head>
<body>

    <% if (member == null) { %>
        <p>로그인한 후에 회원탈퇴를 시도해주세요.</p>
    <% } else { %>
        
    <% } %>

</body>
</html>
