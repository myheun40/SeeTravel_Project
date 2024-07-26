<%@page import="com.aischool.model.WebMember"%>
<%@ page import="com.select.place_info" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.select.placeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String region = request.getParameter("region");
if (region == null || region.isEmpty()) {
    region = "busan"; // 기본값 설정
}
session.setAttribute("selectedRegion", region); // 세션에 저장

placeDAO dao = new placeDAO();
ArrayList<place_info> places = dao.getPlacesByRegion(region);
request.setAttribute("places", places);
WebMember member =  (WebMember) session.getAttribute("logindata");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="design/select.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />
    
    <style>
    .selected {
        background-color: #e0e0e0;
        font-weight: bold;
    }
    </style>
    
    <script type="text/javascript">
    var placesCount = 8;  // 총 아이템 수
    var currentIndex = 0; // 현재 인덱스

    function showItems(startIndex) {
        var options = document.querySelectorAll('.option');
        options.forEach(option => {
            option.style.display = 'none';
        });

        for (var i = startIndex; i < startIndex + 4 && i < options.length; i++) {
            options[i].style.display = 'block';
        }
    }

    function next() {
        currentIndex += 4;
        if (currentIndex >= placesCount) {
            currentIndex = 0;
        }
        showItems(currentIndex);
    }

    function prev() {
        currentIndex -= 4;
        if (currentIndex < 0) {
            currentIndex = Math.floor((placesCount - 1) / 4) * 4;
        }
        showItems(currentIndex);
    }

    function openPopup(placeName) {
        var width = 600;
        var height = 400;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;
        var url = "popup.jsp?placeName=" + encodeURIComponent(placeName) + "&region=" + encodeURIComponent("<%= region %>");
        var name = "popupWindow";
        var specs = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes";
        window.open(url, name, specs);
    }

    document.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        let region = urlParams.get('region');
        if (!region) {
            region = '<%= session.getAttribute("selectedRegion") %>' || 'busan';
        }
        updateSelectedRegionUI(region);
        showItems(currentIndex);
    });

    function updateSelectedRegionUI(region) {
        document.querySelectorAll('.item-link, .item-link1, .item-link2').forEach(item => {
            item.classList.remove('selected');
        });
        
        switch(region) {
            case 'busan':
                document.querySelector('.item-link').classList.add('selected');
                break;
            case 'yangyang':
                document.querySelector('.item-link1').classList.add('selected');
                break;
            case 'yeosu':
                document.querySelector('.item-link2').classList.add('selected');
                break;
        }
    }
    </script>
</head>
<body>
    <div class="header">
        <a href="main.jsp"><img class="logo-icon" alt="" src="./image/KakaoTalk_20240722_104503600.jpg"></a>
        <%if (member == null){%>
            <a href="login.jsp"><div class="login">
                <div class="div3">로그인</div>
            </div></a>
        <%}else{%>
            <a href="Mypage.jsp"><div class="mypage">
                <div class="div3">마이페이지</div>
            </div></a>
            <a href="logout.jsp"><div class="logout">
                <div class="div3">로그아웃</div>
            </div></a>
        <%}%>
    </div>
   
    <div class="image-1-parent">
        <img class="image-1-icon" alt="" src="image/main_img1.jpg">
        <div class="place">
            <div class="wrapper">
                <div class="div">추천 관광명소</div>
            </div>
        </div>
        <div class="have-to-place">HAVE TO PLACE</div>
        <div class="container">
            <p class="div1">꼭 가고 싶은 주요 명소를 선택해주세요</p>
            <div class="listbox">
                <% for (int i = 0; i < 8 && i < places.size(); i++) { %> <!-- 8개의 아이템만 표시 -->
                    <div class="option option<%= i %>" style="display: none;">
                        <div class="link" onclick="openPopup('<%= places.get(i).getPlace_Name() %>')">
                            <img class="container-icon" alt="이미지" src="<%= places.get(i).getPlace_Img() %>">
                            <img class="markersvg-icon" alt="마커" src="image/marker.svg.svg">
                            <div class="div2"><%= places.get(i).getPlace_Name() %></div>
                        </div>
                    </div>
                <% } %>
            </div>
            <div class="button-container">
                <button onclick="prev()" class="nav-button">
                    <img class="nav-icon" alt="이전" src="image/prevBtn.png">
                </button>
                <button onclick="next()" class="nav-button">
                    <img class="nav-icon" alt="다음" src="image/nextBtn.png">
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
                </a>
            </div>
        </div>
    </div>
</body>
</html>