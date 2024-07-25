<%@ page import="com.select.place_info" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.select.placeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String region = request.getParameter("region");
placeDAO dao = new placeDAO();
ArrayList<place_info> places = dao.getPlacesByRegion(region);
request.setAttribute("places", places);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="design/select.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Arial:wght@400&display=swap" />
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
        if (currentIndex >= places.length) {
            currentIndex = 0;
        }

        for (var i = currentIndex; i < currentIndex + 4 && i < places.length; i++) {
            document.querySelector('.option' + i).style.display = 'block';
        }
    }

    function openPopup(placeName) {
    	console.log("placeName:", placeName);
    	var width = 600;
        var height = 400;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;
        var url = "popup.jsp?placeName=" + encodeURIComponent(placeName) + "&region=" + "<%= region %>";
        var name = "popupWindow";
        var specs = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes";
        window.open(url, name, specs);
    }
    </script>
</head>
<body>
    <div class="header">
        <a href="main.jsp"><img class="logo-icon" alt="" src="./image/KakaoTalk_20240722_104503600.jpg"></a>
        <div class="login">
            <a href="login.jsp" style="color: white">로그인</a>
        </div>
    </div>
    
    <div class="image-1-parent">
        <img class="image-1-icon" alt="" src="image/main_img1.jpg">
        <div class="place">
            <div class="wrapper">
                <div class="div">추천 관광명소</div>
            </div>
        </div>
        <div class="have-to-place">HAVE TO PLACE</div>
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
    
    <div class="container">
        <p class="div1">꼭 가고 싶은 주요 명소를 선택해주세요</p>
        <div class="listbox">
            <% for (int i = 0; i < places.size(); i++) { %>
                <div class="option option<%= i %>" style="display:<%= i < 4 ? "block" : "none" %>;">
                    <div class="link" onclick="openPopup('<%= places.get(i).getPlace_Name() %>')">
                        <img class="container-icon" alt="" src="<%= places.get(i).getPlace_Img() %>">
                        <img class="markersvg-icon" alt="" src="image/marker.svg.svg">
                        <div class="div2"><%= places.get(i).getPlace_Name() %></div>
                    </div>
                </div>
            <% } %>
        </div>
        <div class="button-container">
            <button onclick="next()" class="nav-button">
                <img class="nav-icon" alt="" src="image/prevBtn.png">
            </button>
            <button onclick="next()" class="nav-button">
                <img class="nav-icon" alt="" src="image/nextBtn.png">
            </button>
        </div>
    </div>
</body>
</html>
