<%@page import="com.aischool.model.WebMember"%>
<%@page import="com.aischool.model.WebMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 WebMember member = (WebMember)session.getAttribute("logindata");
%>

  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	
  	<link rel="stylesheet"  href="design/mypage.css" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@500;700&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Raleway:wght@400&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Font Awesome 5 Free:wght@400&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@400&display=swap" />
  	
  	
  	
</head>
<body>
  	<div class="frame5">
        <div class="header">
            <div class="nav">
                  <div class="div7"><a href="main.jsp#plan" style="color:#20303c">여행 일정 만들기</a></div>
                  <div class="link">
                        <div class="wrapper">
							<div class="div8"><a href="main.jsp">로그아웃</a></div>
                        </div>
                  </div>
            </div>
            <div><a href="main.jsp"><img class="logo" alt="로고" src="image/KakaoTalk_20240722_104503600.jpg"></a></div>      
      </div>
    		<div class="frame5-child">
    		</div>
    		<div class="plan-content">
      			<div class="div">
        				<b class="b">나의 일정</b>
      			</div>
      			<div class="content-box">
        				<div class="item">
          					<img class="jpg-icon" alt="" src="image/해운대.jfif">
          					
          					<img class="image-icon" alt="" src="image/marker.svg.svg">
          					
          					<div class="button">
          					</div>
        				</div>
        				<div class="item">
          					<div class="title-wrapper">
            						<div class="title">여행 title을 입력하세요</div>
          					</div>
          					<img class="jpg-icon1" alt="" src="image/해운대.jfif">
          					
          					<img class="image-icon1" alt="" src="image/marker.svg.svg">
          					
          					<div class="title1">여행 title을 입력하세요</div>
          					<div class="button1">
          					</div>
          					<div class="div1">경로 한눈에 보기</div>
        				</div>
        				<div class="item">
          					<div class="title2">여행 title을 입력하세요</div>
          					<img class="jpg-icon1" alt="여행지사진" src="image/해운대.jfif">
          					
          					<img class="image-icon1" alt="로고" src="image/marker.svg.svg">
          					
          					<div class="button2">
          					</div>
        				</div>
      			</div>
    		</div>

    		<div class="sidebar">
				<div class="side-title">
					<div class="div3">마이페이지</div>
			  </div>
      			<div class="sidemenu">
        				<div class="div4"><button class="menu bucket">내가 담은 여행지</button></div>
						<div class="div4"><button class="menu correct">회원 정보 확인</button></div>
<<<<<<< HEAD
        				<div class="div4"><button class="menu correct" onclick="window.location.href='modify.jsp'">개인정보수정</button></div>
=======
        				<div class="div4"><button class="menu correct" onclick="navigateToModify()">개인정보수정</button></div>
>>>>>>> refs/heads/장소브랜치추가
        				<div class="div4"><button class="out menu">회원탈퇴</button></div>
      			</div>
    		</div>
    	
    		<img class="main-img1-icon" alt="" src="image/main_img1.jpg">
    		
    		<b class="nickname"><%=member.getId() %>님의 여행 기록</b>
    		<img class="shoe-print-icon" alt="" src="image/shoe-print.png">
    		
  	</div>
  	
  	<script>
  	function navigateToModify() {
        window.location.href = 'modify.jsp';
    }
  	</script>
  	
  	
</body>
</html>
