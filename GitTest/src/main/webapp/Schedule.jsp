<%@page import="com.aischool.model.WebMember"%>
<%@page import="com.aischool.model.FirstScreenDAO"%>
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



<h1>일정짜기</h1>



<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<String> arr = (ArrayList)session.getAttribute("locationList");
	ArrayList<String> latitude = (ArrayList)session.getAttribute("latiList");
	ArrayList<String> longitude = (ArrayList)session.getAttribute("longList");
	ArrayList<String> array = (ArrayList)session.getAttribute("day1List");

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
	if(array == null){
		array = new ArrayList<String>();
		session.setAttribute("day1List", array);
	}

	
	double[] lati1= new double[arr.size()];
	double[] long1= new double[arr.size()];

	for(int i=0; i<arr.size(); i++)
	{	
		lati1[i]= Double.parseDouble(latitude.get(i));
		long1[i]= Double.parseDouble(longitude.get(i));		
	} 
	
	
%>

<% for(int i=0 ;i<arr.size(); i++){ %>
	<form action="Day1.jsp" >
		<input type="submit" value="<%=arr.get(i)%>" name="day1">
		<input type="button" onclick="func(<%=lati1[i]%>,<%=long1[i]%>)" value="위치보기">
	</form>
<% } %> 

<%! int count =0; %>

<div id="map" style="width:700px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f01ec291f2bda3241e8f86688fef41c"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(<%=lati1[0]%>, <%=long1[0]%>), // 지도의 중심좌표
	    level: 7 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	function func(a,b){
		
		//마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(a, b); 
		
		//마커를 생성합니다
		var marker = new kakao.maps.Marker({
		position: markerPosition
		});
		
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}

	
</script>  	
<button onclick="func2()">저장하기</button>
<br>

<h2>일정</h2>

<% 
	
	String day1="";
	for(int i=0; i<array.size(); i++)
	{
		day1=day1+array.get(i)+" -> ";
	}
	
	out.println(day1);

%>
<script type="text/javascript">
function func2()
{
	<%
    WebMember member = (WebMember) session.getAttribute("logindata");
    FirstScreenDAO dao = new FirstScreenDAO();

	int cnt=dao.update(member,day1);
	
	%>
	alert("저장 되었습니다.");
	
}

</script>



</body>
</html>