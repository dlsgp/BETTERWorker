<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<html lang="ko">
<head>
<meta charset="utf-8" />
<title>고객 헤더</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet" />
<link href="css/side_header.css" rel="stylesheet" type="text/css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<c:choose>
		<c:when test="${loginUserBean.userLogin == true }">
			<!--default 사이드메뉴바 -->
			<div class="defaultHeader" style="background-color: white">
				<nav class="navbar  fixed-top">
					<div class="sidebarContent">

						<div class="offcanvas-body" id="contentBody">
							<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="main">메인</a></li>
								<li class="nav-item"><a class="nav-link" href="modify"><i
										class="fa-solid fa-user"></i>내정보</a></li>
								<li class="nav-item"><a class="nav-link"
									href="qr?reg_num=${loginUserBean.reg_num}"><i
										class="fa-solid fa-qrcode"></i>QR코드 </a></li>
								<li class="nav-item"><a class="nav-link"
									href="resume_write"><i class="fa-regular fa-clipboard"></i>알바이력
								</a>
								<li class="nav-item"><a class="nav-link"
									href="mypage_pay?reg_num=${loginUserBean.reg_num}&type_num=${loginUserBean.type_num}"><i
										class="fa-solid fa-dollar-sign"></i>급여관리 </a></li>
								<li class="nav-item"><a class="nav-link" href="logout"><i
										class="fa-solid fa-right-from-bracket"></i>로그아웃</a></li>

							</ul>
						</div>

					</div>
				</nav>
			</div>




			<!-- 넓이 574 이하일 때 왼쪽 사이드바 버튼 -->
			<div class="buttonHeader">
				<nav class="navbar  fixed-top">
					<div class="container-fluid">
						<button class="navbar-toggler" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
							aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="offcanvas offcanvas-start" tabindex="-1"
							id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
							<div class="offcanvas-header">
								<h5 class="offcanvas-title" id="offcanvasNavbarLabel">안녕하세요</h5>
								<button type="button" class="btn-close"
									data-bs-dismiss="offcanvas" aria-label="Close"></button>
							</div>
							<div class="offcanvas-body">
								<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#">메인</a></li>
									<li class="nav-item"><a class="nav-link" href="#"><i
											class="fa-solid fa-user"></i>내정보</a></li>
									<li class="nav-item"><a class="nav-link" href="qr"><i
											class="fa-solid fa-qrcode"></i>QR코드 </a></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"><i
											class="fa-regular fa-calendar-check"></i> 근무일정 </a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="#">Action</a></li>
											<li>
												<hr class="dropdown-divider" />
											</li>
											<li><a class="dropdown-item" href="#">Something else
													here</a></li>
										</ul></li>
									<li class="nav-item"><a class="nav-link" href="logout"><i
											class="fa-solid fa-right-from-bracket"></i>로그아웃</a></li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
			</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</body>