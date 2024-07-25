<!DOCTYPE html>
<%@page import="com.select.place_info"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% ArrayList<place_info> places = (ArrayList<place_info>)request.getAttribute("places"); %>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1, width=device-width">

<link rel="stylesheet" href="./frame2.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />
<%
    if (request.getAttribute("places") == null) {
        response.sendRedirect("getPlace?region=busan"); // 기본값으로 'busan' 사용
        return;
    }
%>
<script type="text/javascript">
var currentIndex = 0;

function next() {
    
    for (var i = currentIndex; i < currentIndex + 4; i++) {
        document.querySelector('.option' + i).style.display = 'none';
    }

   
    currentIndex += 4;
    if (currentIndex >= 8) {
        currentIndex = 0; 
    }

    
    for (var i = currentIndex; i < currentIndex + 4; i++) {
        document.querySelector('.option' + i).style.display = 'block';
    }
}
</script>

</head>
<body>

	<div class="image-1-parent">
		<img class="image-1-icon" alt="" src="image 1.png">

		<div class="place">
			<div class="wrapper">
				<div class="div">추천 관광명소</div>
			</div>
		</div>
		<div class="have-to-place">HAVE TO PLACE</div>
		<div class="footer2"></div>
		<div class="container">
			<div class="div1">꼭 가고 싶은 주요 명소를 선택해주세요</div>
			<div class="listbox">
			<%for(int i =0; i<8; i++) {%>
        				<div class="option<%=i%>" style="display:<%=i < 4 ? "block" : "none" %>;">
          					<div class="link">
            						<img class="container-icon" alt="" src="<%=places.get(i).getPlace_Img() %>">
            						
            						<img class="markersvg-icon" alt="" src="image/marker.svg.svg">
            						
            						<div class="div2"><%=places.get(i).getPlace_Name() %></div>
          					</div>
          					
          					<div class="container1">
            						<div class="link1">
              							<div class="div3">당일치기</div>
            						</div>
            						<div class="link2">
              							<div class="div3">체험코스</div>
            						</div>
          					</div>
        				</div>
        				
    				<%} %>
        		<button onclick="next()">		
				<div class="button-parent">
					<div class="button">
						<img class="prevbtnpng-icon" alt="" src="prevBtn.png.png">
                     </div>
                     </div>
					</button>
					
					<button onclick="next()">
					<div class="button1">
						<img class="prevbtnpng-icon" alt="" src="nextBtn.png.png">
							</div>
						</button>

				
				</div>
			</div>
		</div>
		<div class="list">
			<div class="item-link">
			<a href="getPlace?region=busan">
				<div class="frame">
					<div class="div10">부 산</div>
				</div>
				</a>
			</div>
			<div class="item-link1">
				<a href="getPlace?region=yangyang">
					    <div class="frame-div">
						<div class="div11">양 양</div>
					</div>
				</a>
			</div>
			<div class="item-link2">
				<div class="item-link-inner">
				<a href="getPlace?region=yeosu">
					<div class="wrapper1">
						<div class="div10">여 수</div>
					</div>
				</div>
				</a>
			</div>
		</div>
		<div class="header">
			<div class="div13">자세히 보기</div>
			<div class="header-child"></div>

		</div>
		<div class="link8">
			<div class="div15">로그인</div>
		</div>
		<img class="kakaotalk-20240722-104503600-3-icon" alt=""
			src="KakaoTalk_20240722_104503600 3.png">



</body>
</html>

