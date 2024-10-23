<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캘린더</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
	window.onload = function() {
		if (window.innerWidth <= 768) {
			document.querySelector('.side-header').style.display = 'none';
		} else {
			document.querySelector('.side-header').style.display = 'block';
		}
	};

	window.onresize = function() {
		if (window.innerWidth <= 768) {
			document.querySelector('.side-header').style.display = 'none';
		} else {
			document.querySelector('.side-header').style.display = 'block';
		}
	};
</script>


<style>
@font-face {
	font-family: 'MangoDdobak-B';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/MangoDdobak-B.woff2')
		format('woff2');
	font-weight: 700;
	font-style: bold;
}

/* 모든 요소에 대한 기본 스타일 설정 */
* {
	background-color: #ffffff; /* 배경색을 흰색으로 설정 */
	font-family: 'MangoDdobak-B'; /* 정의한 폰트를 사용 */
	font-size: 20px; /* 기본 폰트 크기 설정 */
}

/* 컨테이너 클래스 스타일 */
.calender-container {
	max-width: 700px; /* 최대 너비 500px */
	width: 100%;
	padding: 0 10px;
	margin: 0 auto; /* 수평 중앙 정렬 */
	object-fit: cover;
}

/* 행을 위한 스타일 설정 */
.row {
	display: flex; /* 플렉스 박스 레이아웃 사용 */
	flex-wrap: wrap; /* 자식 요소들이 래핑되도록 설정 */
	justify-content: center; /* 자식 요소들을 중앙 정렬 */
}

/* 각 날짜를 나타내는 박스 스타일 */
.day {
	height: 100px; /* 기본 높이 100px */
	display: flex; /* 플렉스 박스 레이아웃 사용 */
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	border: 1px solid #dee2e6; /* 테두리 설정 */
	flex: 0 0 13%; /* 플렉스 속성 설정 (비율) */
	padding-right: 5px;
	box-sizing: border-box; /* 테두리와 패딩이 요소의 전체 너비에 포함되도록 설정 */
}

/* 반응형 디자인을 위한 미디어 쿼리 */
@media ( max-width : 768px) {
	/* 화면 너비가 768px 이하일 때 */
	.day {
		height: 80px; /* 높이를 80px로 조정 */
		font-size: 16px; /* 폰트 크기를 16px로 조정 */
	}
}

@media ( min-width : 768px) and (max-width: 992px) {
	/* 화면 너비가 768px 이상 992px 이하일 때 */
	.day {
		height: 70px; /* 높이를 70px로 조정 */
		font-size: 18px; /* 폰트 크기를 18px로 조정 */
	}
	.calender {
		width: "70%";
	}
	.row{
		widht: "70%";
	}
}

@media ( max-width : 576px) {
	/* 화면 너비가 576px 이하일 때 */
	.day {
		height: 60px; /* 높이를 60px로 조정 */
		font-size: 14px; /* 폰트 크기를 14px로 조정 */
	}
}
</style>
</head>
<body>

	<!-- 사이드 헤더 JSP 파일을 포함합니다. 경로가 올바르면 정상적으로 동작합니다. -->
	<%-- <jsp:include page="/WEB-INF/views/include/side_header.jsp" /> --%>


	<div class="side-header">
		<c:import url="/WEB-INF/views/include/side_header.jsp" />
	</div>



	<div class="calender-container mt-5">
		<!-- 컨테이너 시작 -->
		<div class="text-center mb-4">
			<!-- 중앙 정렬된 텍스트 영역 -->
			<h2 class="display-4"
				style="text-decoration: underline; text-decoration-color: yellow; text-decoration-thickness: 10px; text-underline-offset: 10px;">
				2024.08</h2>
		</div>
		<div class="calendar">
			<!-- 캘린더 시작 -->
			<div class="row text-center">
				<!-- 행 시작, 중앙 정렬 -->
				<div class="col">일</div>
				<!-- 일요일 -->
				<div class="col">월</div>
				<!-- 월요일 -->
				<div class="col">화</div>
				<!-- 화요일 -->
				<div class="col">수</div>
				<!-- 수요일 -->
				<div class="col">목</div>
				<!-- 목요일 -->
				<div class="col">금</div>
				<!-- 금요일 -->
				<div class="col">토</div>
				<!-- 토요일 -->
			</div>

			<div class="row">
				<%
					java.util.Calendar cal = java.util.Calendar.getInstance(); // 현재 날짜를 가져옴
				int year = cal.get(java.util.Calendar.YEAR); // 현재 연도
				int month = cal.get(java.util.Calendar.MONTH); // 현재 월 (0부터 시작)

				cal.set(year, month, 1); // 현재 연도와 월의 첫 날로 설정
				int firstDayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK); // 첫 날의 요일
				int daysInMonth = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); // 해당 월의 총 일 수

				// 빈 공간을 출력 (첫 주의 빈 날)
				for (int i = 1; i < firstDayOfWeek; i++) {
					out.write("<div class='col'></div>"); // 요일에 맞춰 빈 공간 생성
				}

				// 각 날짜를 출력
				for (int day = 1; day <= daysInMonth; day++) {
					out.write("<div class='col day'>" + day + "</div>"); // 날짜 출력
					if ((day + firstDayOfWeek - 1) % 7 == 0) { // 7일마다 줄바꿈
						out.write("</div><div class='row'>");
					}
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
