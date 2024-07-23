<%@page import="java.util.ArrayList"%>
<%@page import="com.aischool.model.FirstScreenVO"%>
<%@page import="com.aischool.model.FirstScreenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<button onclick="location.href='Basket.jsp'">장바구니</button>
<br><br>
<button onclick="location.href='Schedule.jsp'">일정짜기</button>
<br><br>
<%
	FirstScreenDAO dao = new FirstScreenDAO();
	
	ArrayList<FirstScreenVO> list = dao.YeosuList();
	double[] latitude= new double[list.size()];
	double[] longitude= new double[list.size()];
	
	for(int i=0; i<200; i++)
	{	
		latitude[i]= Double.parseDouble(list.get(i).getLatitude());
		longitude[i]= Double.parseDouble(list.get(i).getLongitude());		
	}
		
	
%>

<div id="map" style="width:50%;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f01ec291f2bda3241e8f86688fef41c"></script>
<script>


	var x= <%=latitude[0] %>;
	var y= <%=longitude[0] %>;

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	    	content: '<div><%=list.get(0).getLocationName()%></div>', 
	        latlng: new kakao.maps.LatLng(<%=latitude[0] %>, <%=longitude[0] %>)
	    },
	    {
	    	content: '<div><%=list.get(1).getLocationName()%></div>',  
	        latlng: new kakao.maps.LatLng(<%=latitude[1] %>, <%=longitude[1] %>)
	    },
	    {
	    	content: '<div><%=list.get(2).getLocationName()%></div>',  
	        latlng: new kakao.maps.LatLng(<%=latitude[2] %>, <%=longitude[2] %>)
	    },
	    {
	    	content: '<div><%=list.get(3).getLocationName()%></div>',  
	        latlng: new kakao.maps.LatLng(<%=latitude[3] %>, <%=longitude[3] %>)
	    },
	    {
	    	content: '<div><%=list.get(4).getLocationName()%></div>',  
	        latlng: new kakao.maps.LatLng(<%=latitude[4] %>, <%=longitude[4] %>)
	    },
	    {
	    	content: '<div><%=list.get(5).getLocationName()%></div>',  
	        latlng: new kakao.maps.LatLng(<%=latitude[5] %>, <%=longitude[5] %>)
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

	<% for(int i=0 ;i< list.size(); i++){ %>
	<form action="AddList.jsp" >
		<input type="hidden" value="<%=list.get(i).getLatitude()%>" name="lati">
		<input type="hidden" value="<%=list.get(i).getLongitude()%>" name="long">
		<input type="submit" value="<%=list.get(i).getLocationName()%>" name="place"> 
	</form>
	<% } %> 


</body>
</html>