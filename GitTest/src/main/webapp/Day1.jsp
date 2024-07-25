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
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<String> arr = (ArrayList)session.getAttribute("day1List");
		//세션에 ArrayList 등록
	if(arr == null)
	{
		arr = new ArrayList<String>();
		session.setAttribute("day1List", arr);
	}
	
	String day1Place= request.getParameter("day1");
	arr.add(day1Place);
	
	request.setCharacterEncoding("UTF-8");
	
	
		
%>	
<script type="text/javascript">
	alert("<%=day1Place%> 일정 추가.");
	location.replace('Schedule.jsp');
</script>
</body>
</html>