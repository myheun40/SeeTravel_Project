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
	
	
	
	double[] lati1= new double[arr.size()];
	double[] long1= new double[arr.size()];

	for(int i=0; i<arr.size(); i++)
	{	
		lati1[i]= Double.parseDouble(latitude.get(i));
		long1[i]= Double.parseDouble(longitude.get(i));		
	} 
	

%>


<form action="" >
<% for(int i=0 ;i< arr.size(); i++){ %>
	<input type="button" value="<%=arr.get(i)%>" name="choice">
	<select name="place<%=i%>">
		<option value="1">1일차</option>
		<option value="2">2일차</option>
		<option value="3">3일차</option>
		<option value="4">4일차</option>
	</select>
	<br> 
<% } %>  
	<input type="submit" value="생성하기" name="choice">
</form>

	
	
<div id="map" style="width:700px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f01ec291f2bda3241e8f86688fef41c"></script>
<script>


	var a= <%=lati1[0]%>;
	var b= <%=long1[0]%>;

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(a, b), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커를 표시할 위치와 title 객체 배열입니다 

	
	var positions = [
	    {
	    	content: '<div><%=arr.get(0)%></div>', 
	        latlng: new kakao.maps.LatLng(<%=lati1[0]%>, <%=long1[0]%>)
	    }
	 
	];


	// 마커 이미지의 이미지 주소입니다
   
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	

</script>	
</body>
</html>