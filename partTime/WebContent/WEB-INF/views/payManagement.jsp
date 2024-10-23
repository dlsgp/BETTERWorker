<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여관리</title>
<!-- Bootstrap CDN -->
<link href="css/payManagement.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="js/jquery-3.5.1.min.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/manage_header.jsp"></c:import>
	<%-- <c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import> --%>

	<!-- 테이블  -->
	<div>
		<table class="table">
			<thead class="tableHead">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">사원번호</th>
					<th scope="col">이름</th>
					<th scope="col">직급</th>
					<th scope="col">시급</th>
					<th scope="col">4대보험유무</th>
					<th scope="col">주휴수당</th>
					<th scope="col">기타</th>
					<th scope="col">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								href="#" role="button" aria-expanded="false"><span>근무시간</span></a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">근무시간(1)</a></li>
								<li><a class="dropdown-item" href="#">근무시간(2)</a></li>
								<li><a class="dropdown-item" href="#">근무시간(3)</a></li>
								<li><a class="dropdown-item" href="#">근무시간(4)</a></li>
								<li><a class="dropdown-item" href="#">근무시간(5)</a></li>
							</ul>
						</div>
					</th>

					<th scope="col">전체급여</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>0001</td>
					<td>김리리</td>
					<td>아르바이트생</td>
					<td>10,000</td>
					<td>o</td>
					<td>300,000</td>
					<td>-50,000</td>
					<td>20시간</td>
					<td>780,000</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>0002</td>
					<td>박미리</td>
					<td>아르바이트생</td>
					<td>10,000</td>
					<td>o</td>
					<td>300,000</td>
					<td>-50,000</td>
					<td>20시간</td>
					<td>780,000</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>0022</td>
					<td>이미리</td>
					<td>아르바이트생</td>
					<td>10,000</td>
					<td>o</td>
					<td>300,000</td>
					<td>-50,000</td>
					<td>20시간</td>
					<td>780,000</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>0020</td>
					<td>이철수</td>
					<td>아르바이트생</td>
					<td>10,000</td>
					<td>x</td>
					<td>300,000</td>
					<td>-50,000</td>
					<td>20시간</td>
					<td>780,000</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>0032</td>
					<td>주미리</td>
					<td>아르바이트생</td>
					<td>10,000</td>
					<td>o</td>
					<td>300,000</td>
					<td>-50,000</td>
					<td>20시간</td>
					<td>780,000</td>
				</tr>
			</tbody>
		</table>
	</div>


	<!-- 페이지네이션  -->
	<div class="paginationButton">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">«</span>
			</a></li>
			<li class="page-item active" aria-current="page"><span
				class="page-link">1</span></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">...</a></li>
			<li class="page-item"><a class="page-link" href="#">8</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">»</span>
			</a></li>
		</ul>
	</nav></div>

</body>

</html>