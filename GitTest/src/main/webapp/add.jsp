<%@page import="com.aischool.model.FirstScreenVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.aischool.model.FirstScreenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	
  	<link rel="stylesheet"  href="design/add.css" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@400;700&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />
  	
  	
  	
</head>
<body>
<%
	FirstScreenDAO dao = new FirstScreenDAO();
	
	ArrayList<FirstScreenVO> list = dao.list();
	double[] latitude= new double[list.size()];
	double[] longitude= new double[list.size()];
	
	for(int i=0; i<list.size(); i++)
	{	
		latitude[i]= Double.parseDouble(list.get(i).getLatitude());
		longitude[i]= Double.parseDouble(list.get(i).getLongitude());		
	}
		
	
%>

    <div class="header">
        <div class="link-wrapper">
              <div class="link">
                    <div class="wrapper2">
                          <a href="login.jsp"class="div3">로그인</a>
                    </div>
              </div>
        </div>
        <div class="header-inner">
              <div class="group-parent">
                  
                    <div class="group-item">
                      <img class="group-child2" alt="" src="image/bucket2.png">
                     <img class="group-child" alt="" src="image/bucket1.png">
                    </div>
                    <div class="link1">
                          <span class="count">7</span>
                    </div>
              </div>
        </div>
        <a class="b14" href="Basket.jsp">내가 담은 여행지</a>
        <a href="main.jsp"><img class="logo-icon" alt="" src="image/KakaoTalk_20240722_104503600.jpg"></a>
        
        <div class="header-line"></div>
        
  </div>

  	<div class="body-parent">
    		<div class="body">
      			<div class="background">
        				<div class="title">
          					<b class="b">부산</b>
          					<b class="date">2024.08.07~2024.08.08</b>
        				</div>

        				<div class="parent">
          					<b class="b5">거리순 </b>
          					<img class="icon-menu" alt="" src="image/menu.png">
          					
        				</div>
        				<b class="b6">해운대 해수욕장 근처</b>
        				<img class="vector-icon" alt="" src="image/mark.png">
        				
        				<b class="b7">예상시간: 총 시간 분</b>

        				
        				<div class="contentbox">
        					<% for(int i=0 ;i< list.size(); i++){ %>
        					<div class="content<%=i+1%>">
								<form action="AddList.jsp" >
	      						<div class="img">
            							<img src="">
            						</div>
            						<div class="place-info">
            							<input type="hidden" value="<%=list.get(i).getLatitude()%>" name="lati">
										<input type="hidden" value="<%=list.get(i).getLongitude()%>" name="long">
              							<input type="submit" value="<%=list.get(i).getLocationName()%>" name="place">
              							<div class="div"><%=list.get(i).getAddress()%></div>
              							<div class="div"><%=list.get(i).getPhone()%></div>
            						</div>
          						</form>
          					</div>
          					
							<% } %> 
        				</div>

        				
      			</div>
                  
      			<div class="map" id="map" style="width:50%;height:400px;">
        				
      			</div>
                <a class="b14" href="Schedule.jsp">장소 확정하기</a>
    		</div>
    		<div class="vector-parent">
      			
      			
    		</div>
    		<div class="frame-parent">
      			<div class="wrapper1">
        				
      			</div>
      			
      			
    		</div>
    		
    		
    		
  	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f01ec291f2bda3241e8f86688fef41c"></script>
<script>


	var x= <%=latitude[0] %>;
	var y= <%=longitude[0] %>;

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
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
  	
  	
  	<script>
    		var text = document.getElementById("text");
    		if(text) {
      			text.addEventListener("click", function (e) {
        				// Add your code here
      			});
    		}</script></body>
</html>