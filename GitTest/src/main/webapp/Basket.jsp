<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, width=device-width">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />
<link rel="stylesheet" href="design/Basket.css" />
</head>
<body>

<div class="header">
    <a href="main.jsp"><img class="logo-icon" alt="" src="image/KakaoTalk_20240722_104503600.jpg"></a>
    
    <div class="header-inner">
        <div class="group-parent">
            <div class="group-item">
                <img class="group-child2" alt="" src="image/bucket2.png">
                <img class="group-child" alt="" src="image/bucket1.png">
            </div>
            <div class="link1"></div>
        </div>
        
    </div>
    <div class="header-line"></div>
</div>

<h1>  내가 선택한 여행지</h1>

<div class="body-parent">
    <div class="body">
        <div class="contentbox">
            <div class="title">
                <b class="b">부산</b>
                <b class="date">2024.08.07~2024.08.08</b>
            </div>
            <br><br>
            <div class="sort-option">
                <b class="b5">거리순</b>
                <img class="icon-menu" alt="" src="image/menu.png">
            </div>
            <br>
            <b class="location">해운대 해수욕장 근처</b>
            <img class="vector-icon" alt="" src="image/mark.png">

            <% 
                request.setCharacterEncoding("UTF-8");
                ArrayList<String> arr = (ArrayList)session.getAttribute("locationList");
                ArrayList<String> latitude = (ArrayList)session.getAttribute("latiList");
                ArrayList<String> longitude = (ArrayList)session.getAttribute("longList");

                // 세션에 ArrayList 등록
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
                <div class="content">
                    <form action="DeleteList.jsp" method="post">
                        <div class="place-info">
                            <input type="hidden" value="<%=arr.get(i)%>" name="text">
                            
                            <input type="hidden" value="<%=latitude.get(i)%>" name="lati">
                            <input type="hidden" value="<%=longitude.get(i)%>" name="long">
                            <span><%=arr.get(i)%></span>
                            <input type="submit" value="제거" class="remove-button">
                        </div>
                    </form>
                </div>
            <% } %>
        </div>
    </div>
</div>

<button onclick="location.href='add.jsp'" class="back-button">돌아가기</button>

<% for(int i=0 ;i< arr.size(); i++){ %>
<form action="DeleteList.jsp" >
	<input type="button" value="<%=arr.get(i)%>" name="text">
	<input type="hidden" value="<%=latitude.get(i)%>" name="lati">
	<input type="hidden" value="<%=longitude.get(i)%>" name="long">
	<input type="submit" value="제거" name="place">
	<br>  
</form>
<% } %> 


<button onclick="history.back()">돌아가기</button>
</body>
</html>
