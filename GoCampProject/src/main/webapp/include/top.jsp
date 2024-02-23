<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Camp Book project</title>

    <!-- JQuery CDN -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <link href="/include/top.css" rel="stylesheet" type="text/css" />
    <style>
        /* 초기에는 하위 항목을 숨김 */
        .dropdown-content {
            font-size: 15px;
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            flex-direction: column;
        }

        /* 맨 위에 항목에 마우스를 올리면 하위 항목을 보여줌 */
        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* 간격을 위한 스타일링 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .menu {
            display: flex;
        }

        .menu a {
            padding: 10px;
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<header>
    go Camp Project
</header>
<nav>
    <div class="menu">
        <c:choose>
            <c:when test="${session.role == 'ROLE_ADMIN'}">
                &emsp;
                <div class="dropdown">
                    [어드민]
                    <div class="dropdown-content">
                        <a href="getLoginList.do">[회원목록]</a><br>
                        <a href="jsonInsert.do">[데이터입력]</a>
                    </div>
                </div>
                &emsp;
                <div class="dropdown">
                    [관리자]
                    <div class="dropdown-content">
                        <a href="getBookingList.do">[전체예약조회]</a><br>
                        <a href="boardInsert.do">[소개글작성]</a>
                    </div>
                </div>
            </c:when>
            <c:when test="${session.role == 'ROLE_MANAGER'}">
                &emsp;
                <div class="dropdown">
                    [관리자]
                    <div class="dropdown-content">
                        <a href="getBookingList.do">[전체예약조회]</a>
                    </div>
                </div>
            </c:when>
            
        </c:choose>
        &emsp;
        <div class="dropdown">
            [캠핑장]
            <div class="dropdown-content">
                <a href="/getCampList.do">[캠핑장목록]</a> <br>
                <a href="/getBooking.do?username=${session.username}">[예약조회]</a><br>
            </div>
        </div>
        &emsp;
        <div class="dropdown">
            [로그인]
            <div class="dropdown-content">
                <a href="/login.do">[로그인]</a> <br>
                <a href="/logout">[로그아웃]</a><br>
                <a href="/memberInsert.do">[회원가입]</a><br>
            </div>
        </div>
        &emsp;
        <div>
            <a href="/index.do">[홈]</a>
        </div>
        <c:if test="${not empty session.name and not empty session.role}">
            &emsp; ${session.name}님&nbsp;${session.role}
        </c:if>
    </div>
</nav>
</body>
</html>