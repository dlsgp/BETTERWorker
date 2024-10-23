<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>수습직원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Bootstrap CDN -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet"> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/exp.css" />

</head>

<body>
	<%
		SimpleDateFormat simpleDate = new SimpleDateFormat("YYYY-MM-DD");
	%>



	<div class="container d-flex justify-content-center">
		<div class="col-md-8">
			<div class="text-left mb-4">
				<h1>수습직원 정보 수정</h1>
			</div>

			<div class="row">
				<div class="col-md-3 flex justify-content-center">
					<img src="${root}img/profile.jpg" alt="Profile Image"
						class="img-fluid profile-image mb-4" />
				</div>

				<div class="col-md-9"></div>


				<form:form action='expForm_pro' method='post'
					modelAttribute="modifyUserBean">

					<form:hidden path="work_id" />
					<form:hidden path="schedule_num" />

					<div class="form-group">
						<form:label path="name">이름</form:label>
						<form:input path="name" class="form-control" disabled="true" />
					</div>

					<div class="form-group">
						<form:label path="employ_date">입사일</form:label>
						<div class="input-group">
							<form:input path="employ_date" class="form-control datepicker"
								disabled="true" />
						</div>
					</div>

					<div class="form-group">
						<form:label path="exp_periodstart" class="label">수습기간 시작</form:label>
						<div class="input-group">
							<form:input path="exp_periodstart"
								class="form-control datepicker" disabled="true" />
						</div>
						<form:label path="exp_periodend" class="label">수습기간 종료</form:label>
						<div class="input-group">
							<form:input path="exp_periodend" class="form-control datepicker"
								disabled="true" />
						</div>
					</div>
					
					<div class="form-group">
						<form:label path="sch_workDate">근무날짜</form:label>
						<div class="input-group">
							<form:input path="sch_workDate" class="form-control datepicker"
								required="true" />
							<div class="input-group-calender-icon">
								<button type="button" class="btn btn-outline-secondary"
									onclick="showDatePicker('sch_workDate')">📅</button>
							</div>
						</div>
					</div>


					<div class="button-container text-right">
						<button type="submit" class="btn btn-primary btn-lg">수정하기</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".datepicker").datepicker({
				dateFormat : "yy-mm-dd",
			});

			// 아이콘 클릭 시 datepicker 표시
			$(".input-group-calender-icon button").on("click", function() {
				var inputId = $(this).parent().siblings("input").attr("id");
				$("#" + inputId).datepicker("show");
			});
		});
		
		function submitForm() {
		}
	</script>

</body>
</html>
