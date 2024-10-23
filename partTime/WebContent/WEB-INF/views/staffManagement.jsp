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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<link href="css/staffManagement.css" rel="stylesheet" type="text/css">
</head>
<body>

	<c:import url="/WEB-INF/views/include/manage_header.jsp"></c:import>


	<div>
		<!-- 수습직원 + 작성하기 버튼-->
		<div class="main_container justify-content-center"
			style="margin-top: 20px;">
			<div class="row fullscreen">
				<div class="col expstaff">
					<div class="button-container text-right">
						<button type="button" class="btn btn-outline-dark btn-lg"
							onclick="location.href='staffForm'">직원등록</button>
					</div>
				</div>
			</div>
		</div>


		<div class="stafflist" style="margin-top: 10%;">
			<div class="card shadow">
				<div class="card-body">
					<h4 class="card-title">직원목록</h4>
					<table class="table table-hover">
						<thead class="tableHead">
							<tr>
								<th class="text-center d-none d-md-table-cell">사원번호</th>
								<th class="text-center d-none d-md-table-cell">이름</th>
								<th class="text-center d-none d-md-table-cell">시급</th>
								<th class="text-center d-none d-md-table-cell">입사일</th>
								<th class="text-center d-none d-md-table-cell"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="obj" items="${employlist}">
								<tr>
									<td class="text-center d-none d-md-table-cell">${obj.staff_number}</td>
									<td class="text-center d-none d-md-table-cell">${obj.name}</td>
									<td class="text-center d-none d-md-table-cell">${obj.hourWage}</td>
									<td class="text-center d-none d-md-table-cell">${obj.employ_date}</td>
									<td class="text-center d-none d-md-table-cell"><a
										href="staffFormDetail?id=${obj.work_id}"> <i
											class="fas fa-pencil-alt" style="cursor: pointer;"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


				</div>

			</div>
		</div>



		<!-- 페이지네이션 -->

		<div class="paginationButton">

			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
					<li class="page-item active" aria-current="page"><span
						class="page-link">1</span></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">...</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span></a></li>
				</ul>
			</nav>
		</div>

		<!-- 수습직원 목록(카드 형태) -->
		<div class="text-left" style="margin-bottom: 20px;">
			<h3 class="expStaff">수습직원</h3>

		</div>
		<div class="card-deck row g-4 mx-auto w-300"
			style="margin-top: 5%; justify-content: space-around; display: flex;">

			<c:forEach var="obj" items="${employFormlist}">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="card text-bg-light" style="cursor: pointer;">
						<a href="expForm?work_id=${obj.work_id}"> <img
							src="img/profile.jpg" class="card-img" alt=""
							style="width: 180px; height: 180px; border-radius: 50%; top: 30%; left: 50%; position: absolute; transform: translate(-50%, -50%);">
						</a>
						<div class="card-body"
							style="top: 30%; left: 80%; margin-top: 50%; border-radius: 50%; padding-bottom: 10%;">

							<h3 class="card-title text-center">${obj.name}</h3>
							<h4 class="card-text text-center">수습종료 :
								${obj.exp_periodend}</h4>

							<div class="card-content"
								style="margin-top: 10%; display: flex; flex-direction: column;">
								<div
									class="form-check d-flex align-items-center justify-content-between"
									style="margin-bottom: 10px;">
									<label class="form-check-label" for="inlineCheckbox1"
										style="flex-grow: 1; margin-left: 30px; color: black;">입사일
										: ${obj.employ_date} </label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>

</body>
</html>

