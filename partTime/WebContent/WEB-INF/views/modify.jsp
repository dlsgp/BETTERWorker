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
<title>마이 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/mypage.css" />
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/include/side_header.jsp" />

	<div class="container d-flex justify-content-center">
		<div class="col-md-10">
			<div class="mb-4"></div>

			<div class="row">
				<div class="col-md-2 flex justify-content-center">
					<img src="img/profilek.jpeg" alt="Profile Image"
						class="img-fluid profile-image mb-4" />
				</div>

				<div class="col-md-8">


					<form:form action='modify_pro' method='post'
						modelAttribute="modifyUserBean">

						<form:hidden path="reg_num" />
						<div class="form-group">
							<form:label path="name">이름</form:label>
							<form:input path="name" class="form-control" />
						</div>
						
						<div class="form-group">
							<form:label path="id">아이디</form:label>
							<form:input path="id" class="form-control" disabled="true" />
						</div>

						<div class="form-group">
							<form:label path="pwd">비밀번호</form:label>
							<form:input path="pwd" class="form-control" />
						</div>

						<div class="form-group">
							<form:label path="tel">전화번호</form:label>
							<form:input path="tel" class="form-control" />
						</div>
						<div class="form-group">
							<form:label path="email">이메일</form:label>
							<form:input path="email" class="form-control" />
						</div>
						<div class="form-group">
						<form:label path="add1" id="sample6_postcode" >주소</form:label>
						<div class="input-group">
							<form:input path="add1" id="sample6_address" class="form-control" />
							<button type="button" class="btn btn-secondary"
								onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
						</div>
					</div>

					<div class="form-group">
						<form:label path="add2" id="sample6_detailAddress" >상세주소</form:label>
						<form:input path="add2" id="sample6_detailAddress"
							class="form-control" />
					</div>
						

						<div class="button-container text-right">
							<button type="submit" class="btn btn-outline-dark btn-lg"
								onclick="">수정하기</button>
						</div>

						<div class="form-group">
							<form:label path="hourWage">시급</form:label>
							<form:input path="hourWage" class="form-control" disabled="true" />
						</div>

						<div class="form-group">
							<form:label path="employ_date">입사일</form:label>
							<div class="input-group">
								<form:input path="employ_date"
									value="${modifyUserBean.employ_date != null ? modifyUserBean.employ_date : ''}"
									class="form-control datepicker" disabled="true" />
							</div>
						</div>
						<div class="form-group">
							<form:label path="exp_periodstart" class="label">수습기간 시작</form:label>
							<div class="input-Egroup">
								<form:input path="exp_periodstart"
									value="${modifyUserBean.exp_periodstart != null ? modifyUserBean.exp_periodstart : ''}"
									class="form-control datepicker" disabled="true" />
							</div>
							<form:label path="exp_periodend" class="label">수습기간 종료</form:label>
							<div class="input-Egroup">
								<form:input path="exp_periodend"
									value="${modifyUserBean.exp_periodend != null ? modifyUserBean.exp_periodend : ''}"
									class="form-control datepicker" disabled="true" />
							</div>
						</div>

						<div class="form-group">
							<form:label path="insurance">4대보험 유무</form:label>
							<form:input path="insurance"
								value="${modifyUserBean.insurance != null ? modifyUserBean.insurance : ''}"
								class="form-control" disabled="true" />
						</div>


					</form:form>
				</div>
			</div>
		</div>
	</div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';

						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;

						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();

	}

		function submitForm() {
		}
	</script>
</body>