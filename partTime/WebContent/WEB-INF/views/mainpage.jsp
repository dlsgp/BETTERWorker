<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>메인 페이지</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/mainpage.css" />

</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.loginUserBean and loginUserBean.userLogin == true and loginUserBean.type_num == 2}">
            <c:import url="/WEB-INF/views/include/manage_header.jsp"></c:import>
        </c:when>
        <c:when test="${not empty sessionScope.loginUserBean and loginUserBean.userLogin == true and loginUserBean.type_num == 1}">
            <c:import url="/WEB-INF/views/include/side_header.jsp"></c:import>
        </c:when>
        <c:otherwise>
            <!-- 비로그인 사용자에 대한 옵션 내용 -->
        </c:otherwise>
    </c:choose>

    <div class="main_container container justify-content-center">
        <!-- 텍스트 섹션 -->
        <div class="row">
            <div class="col-12 text-center my-5">
                <h2>안녕하세요</h2>
                <h2>찾아주셔서 감사합니다.</h2>
            </div>
        </div>

        <!-- 카드 섹션 -->
        <div class="row">
            <c:choose>
                <c:when test="${empty sessionScope.loginUserBean or loginUserBean.userLogin == false}">
                    <div class="card-deck row row-cols-1 row-cols-md-2 g-4 mx-auto w-50">
                        <div class="col mb-4">
                            <div class="card text-bg-light" style="cursor: pointer;" onclick="window.location.href='join'">
                                <img src="img/time.jpg" class="card-img" alt="join image" style="flex: 1">
                                <div class="card-img-overlay d-flex align-items-center justify-content-center">
                                    <h3 class="card-title text-center">회원가입</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card text-bg-light" style="cursor: pointer;" onclick="window.location.href='login'">
                                <img src="img/work.jpg" class="card-img" alt="login image" style="flex: 1">
                                <div class="card-img-overlay d-flex align-items-center justify-content-center">
                                    <h3 class="card-title text-center">로그인</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
</body>
</html>
