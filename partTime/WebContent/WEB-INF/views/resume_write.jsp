<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>직원관리</title>
<link href="css/staffManagement.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="js/jquery-3.5.1.min.js"></script>
</head>
<body>



	<!-- 수습직원 + 작성하기 버튼-->
	<!-- 사이드바 import -->
	<c:import url="/WEB-INF/views/include/side_header.jsp"></c:import>

	<div class="container-fluid" style="margin-top: 70px;">
		<div class="row">
			<!-- 사이드바 정렬 -->
			<div class="col-lg-2 col-md-3"></div>

			<!-- 페이지 정렬 -->
			<div class="col-lg-10 col-md-9">
				<!-- 수습직원 목록 (카드 형태) -->
				<div class="text-left mb-4">
					<h3 class="expStaff">아르바이트 이력</h3>
				</div>

				<div class="button-container text-center mb-4">
					<button type="button" class="btn btn-outline-warning btn-lg"
						onclick="location.href='resumeForm?reg_num=${loginUserBean.reg_num}&type_num=${loginUserBean.type_num}'">작성하기</button>
				</div>


				<div
					class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 justify-content-center">
					<!-- 중앙 정렬 추가 -->
					<c:forEach var="resume" items="${resumelist}">
						<!-- 직원 카드 1 -->
						<div class="col">
							<div class="card text-bg-light h-100" style="cursor: pointer;">
								<img src="img/profiley.jpg"
									class="card-img-top mx-auto d-block mt-3 rounded-circle"
									alt="프로필 이미지" style="width: 50%;">
								<div class="card-body text-center">
									<div class="d-flex justify-content-end mt-5">
										<a
											href="resumeModify?reg_num=${loginUserBean.reg_num}&type_num=${loginUserBean.type_num}&history_num=${resume.history_num}">
											<i class="fas fa-pencil-alt" style="cursor: pointer;"></i>
										</a>
									</div>
									<h5 class="card-title"></h5>
									<div class="d-flex justify-content-center mt-2">
										<label class="form-check-label text-center">${resume.name}</label>
									</div>
									<div class="d-flex justify-content-center mt-2">
										<label class="form-check-label">${resume.comName}</label>
									</div>
									<div class="d-flex justify-content-center mt-2">
										<label class="form-check-label">${resume.todo}</label>
									</div>
									<div class="d-flex justify-content-center mt-2">
										<label class="form-check-label">${resume.past_join_date}</label>
									</div>
									<div class="d-flex justify-content-center mt-2">
										<label class="form-check-label">${resume.past_leaveDate}</label>
									</div>
									
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>




</body>
</html>