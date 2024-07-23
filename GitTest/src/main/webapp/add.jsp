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
        <b class="b14">내가 담은 여행지</b>
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
        				<div class="button">
          					<button class="wrapper">
            						<b class="b1">숙소</b>
                            </button>
        				</div>

        				<button class="button1 wrapper">
                                <b class="b1">식당</b>
                        </button>
        				<button class="button2 wrapper">
            						<b class="b1">카페</b>
                        </button>
        				<button class="button3 wrapper">
            						<b class="b4">관광명소</b>
                        </button>
        				<div class="parent">
          					<b class="b5">거리순 </b>
          					<img class="icon-menu" alt="" src="image/menu.png">
          					
        				</div>
        				<b class="b6">해운대 해수욕장 근처</b>
        				<img class="vector-icon" alt="" src="image/mark.png">
        				
        				<b class="b7">예상시간: 총 시간 분</b>

        				
        				<div class="contentbox">
          					<div class="content1">
            						<div class="img">
            						</div>
            						<div class="place-info">
              							<b class="b8">여행지 이름</b>
              							<div class="div">주소</div>
              							<div class="div">연락처</div>
            						</div>
            						<button class="plus1">
              							<b class="b2">+담기</b>
                                    </button>
          					</div>
          					<div class="content2">
                                <div class="place-info">
                                    <b class="b8">여행지 이름</b>
                                    <div class="div">주소</div>
                                    <div class="div">연락처</div>
                              </div>
            						<div class="content2-item">
            						</div>
            						<button class="put">
              							<b class="b10">담기 완료</b>
                                    </button>
          					</div>
          					<div class="content3">
                                <div class="place-info">
                                    <b class="b8">여행지 이름</b>
                                    <div class="div">주소</div>
                                    <div class="div">연락처</div>
                              </div>
            						<div class="content3-child">
            						</div>
            						<button class="plus1">
              							<b class="b2">+담기</b>
                                    </button>
          					</div>
        				</div>

        				<div class="div2"> 더보기 </div>
      			</div>
                  <button class="more"><img class="morebtnpng-icon" alt="" src="image/moreBtn.png.png"></button>
      			<div class="map">
        				<img class="image-3-icon" alt="" src="image/부산지도.jfif">
      			</div>
                
    		</div>
    		<div class="vector-parent">
      			<button class="back"><img class="vector-icon2" alt="" src="image/back.png"></button>
      			<b class="b12">뒤로 가기</b>
    		</div>
    		<div class="frame-parent">
      			<div class="wrapper1">
        				<b class="b13" id="text">장소 확정하기</b>
      			</div>
      			<button class="front"><img class="vector-icon3" alt="" src="image/front.png"></button>
      			
    		</div>
    		
    		
    		
  	</div>
  	
  	
  	
  	
  	<script>
    		var text = document.getElementById("text");
    		if(text) {
      			text.addEventListener("click", function (e) {
        				// Add your code here
      			});
    		}</script></body>
</html>