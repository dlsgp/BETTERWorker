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
				<h1>직원 등록</h1>
			</div>

			<div class="row">
				<div class="col-md-3 flex justify-content-center">
					<img src="${root}img/profile.jpg" alt="Profile Image"
						class="img-fluid profile-image mb-4" />
				</div>

				<div class="col-md-9">
					<form action="staffForm_key" method="post">
						<div class="form-group search-container text-right">
							<input name="key" class="form-search" type="text"
								placeholder="아이디 검색" />
							<button class="btn btn-outline-dark" type="submit">Search</button>
						</div>
					</form>

					<%--                name = ${searchBean.name } id = ${searchBean.id } --%>
				</div>

				<form:form action="staffForm_pro" method="post"
					modelAttribute="searchBean">
					<form:hidden path="reg_num" />
					<form:hidden path="type_num" />




					<div class="form-group">
						<form:label path="name">이름</form:label>
						<form:input path="name" class="form-control" />
					</div>
					<%-- <div class="form-group">
                  <form:label path="position">직급</form:label>
                  <form:input path="position" class="form-control" placeholder="직급"
                     required="true" />
               </div> --%>
					<div class="form-group">
						<form:label path="tel">전화번호</form:label>
						<form:input path="tel" class="form-control"
							pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" />
						<!--'-' 표시 -->
					</div>
					<div class="form-group">
						<form:label path="email">이메일</form:label>
						<form:input path="email" class="form-control" />
					</div>

					<div class="form-group">
						<form:label path="add1" id="sample6_postcode" disabled="true">주소</form:label>
						<div class="input-group">
							<form:input path="add1" id="sample6_address" class="form-control" />
							<button type="button" class="btn btn-secondary"
								onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
						</div>
					</div>

					<div class="form-group">
						<form:label path="add2" id="sample6_detailAddress" disabled="true">상세주소</form:label>
						<form:input path="add2" id="sample6_detailAddress"
							class="form-control" />
					</div>



					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						등록하기</button>


					<!-- Modal -->
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<div class="modal-body">

									<div class="form-group">
										<span>아이디</span> <input name="work_id"
											value="${searchBean.id}" class="form-control" />
									</div>
									<div class="form-group">
										<span>사원번호</span> <input name="staff_number"
											class="form-control" />
									</div>
									<div class="form-group">
										<span>시급</span> <input name="hourWage" class="form-control" />
									</div>

									<div class="form-group">
										<span>수습기간 시작</span>
										<div class="input-group">
											<input type="text" name="exp_periodstart"
												id="exp_periodstart" class="form-control datepicker"
												required />
											<div class="input-group-calender-icon">
												<button type="button" class="btn btn-outline-secondary" 
													onclick="showDatePicker('exp_periodstart')">📅</button> 
										</div>
										</div>
									</div>

									<div class="form-group">
										<span>수습기간 종료</span>
										<div class="input-group">
											<input type="text" name="exp_periodend" id="exp_periodend"
												class="form-control datepicker" required />
<!-- 											<div class="input-group-calender-icon"> -->
<!-- 												<button type="button" class="btn btn-outline-secondary" -->
<!-- 													onclick="showDatePicker('exp_periodend')">📅</button> -->
<!-- 											</div> -->
										</div>
									</div>

									<div class="form-group">
										<span>4대보험유무</span> <select name="insurance"
											class="form-control">
											<option value="1">Yes</option>
											<option value="0">No</option>
										</select>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary">등록하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!--                <button type="button" class="btn btn-danger" data-bs-toggle="modal" -->
					<!--                   data-bs-target="#staticBackdrop">삭제하기</button> -->

					<!-- Modal -->
					<!--                <div class="modal fade" id="staticBackdrop" -->
					<!--                   data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" -->
					<!--                   aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
					<!--                   <div class="modal-dialog modal-dialog-centered"> -->
					<!--                      <div class="modal-content"> -->

					<!--                         <div class="modal-body"> -->
					<!--                            <div class="form-group"> -->
					<!--                               <span>기업 아이디</span> <input name="ceo_id" class="form-control" /> -->
					<!--                            </div> -->
					<!--                            <div class="form-group"> -->
					<!--                               <span>고용자 아이디</span> <input name="work_id" -->
					<!--                                  class="form-control" /> -->
					<!--                            </div> -->
					<!--                            <div class="form-group"> -->
					<!--                               <span>사원번호</span> <input name="staff_number" -->
					<!--                                  class="form-control" /> -->
					<!--                            </div> -->
					<!--                            <div class="form-group"> -->
					<%--                               <form:label path="hourlyWage">시급</form:label> --%>
					<%--                               <form:input path="hourlyWage" type="number" --%>
					<%--                                  class="form-control" placeholder="시급" required="true" /> --%>
					<!--                            </div> -->
					<!--                            <div class="form-group"> -->
					<%--                               <form:label path="join_Date">입사일</form:label> --%>
					<!--                               <div class="input-group"> -->
					<%--                                  <form:input path="join_Date" class="form-control datepicker" --%>
					<%--                                     placeholder="입사일" required="true" /> --%>
					<!--                                  <div class="input-group-calender-icon"> -->
					<!--                                     <button type="button" class="btn btn-outline-dark" -->
					<!--                                        onclick="showDatePicker('join_Date')">📅</button> -->
					<!--                                  </div> -->
					<!--                               </div> -->
					<!--                            </div> -->

					<!--                            <div class="calendar-form-group d-flex align-items-center"> -->
					<%--                               <form:label path="intern_Start">수습기간 시작</form:label> --%>
					<!--                               <div class="input-group mb-2"> -->
					<%--                                  <form:input path="intern_Start" --%>
					<%--                                     class="form-control datepicker" placeholder="수습기간 시작" --%>
					<%--                                     required="" /> --%>
					<!--                                  <div class="input-group-calender-icon"> -->
					<!--                                     <button type="button" class="btn btn-outline-dark" -->
					<!--                                        onclick="showDatePicker('intern_Start')">📅</button> -->
					<!--                                  </div> -->
					<!--                               </div> -->
					<!--                               <span class="mx-2">~</span> -->
					<!--                               <div class="input-group mb-2"> -->
					<%--                                  <form:input path="intern_End" class="form-control datepicker" --%>
					<%--                                     placeholder="수습기간 종료" required="true" /> --%>
					<!--                                  <div class="input-group-calender-icon"> -->
					<!--                                     <button type="button" class="btn btn-outline-dark" -->
					<!--                                        onclick="showDatePicker('intern_End')">📅</button> -->
					<!--                                  </div> -->
					<!--                               </div> -->
					<!--                            </div> -->

					<!--                         </div> -->
					<!--                         <div class="modal-footer"> -->
					<!--                            <button type="button" class="btn btn-secondary" -->
					<!--                               data-bs-dismiss="modal">닫기</button> -->
					<!--                            <button type="submit" class="btn btn-primary">등록하기</button> -->
					<!--                         </div> -->
					<!--                      </div> -->
					<!--                   </div> -->
					<!--                </div> -->







					<%-- <div class="form-group">
                     <span class="mr-2">4대보험 유무:</span>
                     <div class="form-check form-check-inline">
                        <form:radio path="insurance" value="yes"
                           class="form-check-input" id="insuranceYes" />
                        <form:label class="form-check-label" for="insuranceYes">예</form:label>
                     </div>
                     <div class="form-check form-check-inline">
                        <form:radio path="insurance" value="no" class="form-check-input"
                           id="insuranceNo" />
                        <form:label class="form-check-label" for="insuranceNo">아니요</form:label>
                     </div>
                  </div> --%>

					<!--                <div class="button-container text-right"> -->
					<!--                   <button type="submit" class="btn btn-outline-dark btn-lg">등록하기</button> -->
					<!--                </div> -->
				</form:form>
			</div>
		</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(document).ready(function() {
			$(".datepicker").datepicker({
				dateFormat : "yy-mm-dd"
			});

			$(".input-group-calender-icon button").on(
					"click",
					function() {
						var inputId = $(this).parent()
								.siblings("input").attr("id");
						$("#" + inputId).datepicker("show");
					});
		});

		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = ''; // 주소 변수
							if (data.userSelectedType === 'R') { // 도로명 주소
								addr = data.roadAddress;
							} else { // 지번 주소
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
			// 추가적인 폼 검증 로직을 여기에 추가
		}
	</script>
</body>
</html>
