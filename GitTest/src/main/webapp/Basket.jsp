<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>장바구니</h1>

<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<String> arr = (ArrayList)session.getAttribute("locationList");
	ArrayList<String> latitude = (ArrayList)session.getAttribute("latiList");
	ArrayList<String> longitude = (ArrayList)session.getAttribute("longList");
	
	//세션에 ArrayList 등록
	if(arr == null){
		arr = new ArrayList<String>();
		session.setAttribute("locationList", arr);
	}
	if(latitude == null){
		latitude = new ArrayList<String>();
		session.setAttribute("latiList", latitude);
	}
	if(longitude == null){
		longitude = new ArrayList<String>();
		session.setAttribute("longList", longitude);
	}
	

%>

<% for(int i=0 ;i< arr.size(); i++){ %>
<form action="DeleteList.jsp" >
	<input type="text" value="<%=arr.get(i)%>" name="text">
	<input type="hidden" value="<%=latitude.get(i)%>" name="lati">
	<input type="hidden" value="<%=longitude.get(i)%>" name="long">
	<input type="submit" value="제거" name="place">
	<br>  
</form>
<% } %> 
<br>
<button onclick="location.href='add.jsp'">돌아가기</button>
<br>

</body>
</html>