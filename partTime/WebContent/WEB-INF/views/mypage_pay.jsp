<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>급여관리</title>
<link rel="stylesheet" href="css/mypage_pay.css" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet" />

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>


<body>
	<c:import url="/WEB-INF/views/include/side_header.jsp" />
	<div class="container d-flex justify-content-center">
		<div class="col-md-6">
			<div class="sum_container" style="margin-top: 25%;">
				<h5></h5>
				<p>
				<h6>
					<i class="fa-solid fa-chevron-left"></i> <span>24.08</span> <i
						class="fa-solid fa-chevron-right"></i>
				</h6>
			</div>
			<div class="col-md-12">
				<form>
					<c:forEach var="pay" items="${payList}">
						<div class="form-group">
							<label for="pay">근무 시간</label>
							<div class="d-flex align-items-center">
								<input type="text" class="form-control" required id="time"
									value="${pay.workin_date}  ${pay.workin_time} ~ ${pay.workout_time}"
									readonly />

							</div>
						</div>
					</c:forEach>
				</form>

			</div>
		</div>
	</div>

</body>
</html>
