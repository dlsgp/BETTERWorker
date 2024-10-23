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
<title>직원 등록</title>
<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/staffForm.css" />

</head>

<body>
	<div class="container d-flex justify-content-center">
		<div class="col-md-8">
			<div class="text-left mb-4">
				<h1>직원 경력 정보</h1>
			</div>

			<div class="row">
				<div class="col-md-3 flex justify-content-center">
					<img src="${root}img/profile.jpg" alt="Profile Image"
						class="img-fluid profile-image mb-4" />
				</div>

				<div class="col-md-9"></div>


				<form:form action="resume_pro" method="post"
					modelAttribute="resumeBean">


					<form:hidden path="reg_num" />
					<form:hidden path="history_num" />
					<form:hidden path="type_num" />


					<div class="form-group">
						<form:label path="name">이름</form:label>
						<form:input path="name" class="form-control" readonly="true"
							value="${resumeBean.name}" />
					</div>


					<div class="form-group">
						<form:label path="comName">전 직장명</form:label>
						<form:input path="comName" class="form-control" />
					</div>

					<div class="form-group">
						<form:label path="todo">직무</form:label>
						<form:input path="todo" class="form-control" />
					</div>

					<div class="form-group">
						<form:label path="past_join_date">전 직장 입사일</form:label>
						<form:input path="past_join_date" class="form-control" />
					</div>

					<div class="form-group">
						<form:label path="past_leaveDate">전 직장 퇴사일</form:label>
						<form:input path="past_leaveDate" class="form-control" />
					</div>

					<div class="button-container text-right">
						<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
