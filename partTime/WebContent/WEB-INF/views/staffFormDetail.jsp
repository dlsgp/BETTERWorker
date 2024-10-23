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
<title>직원정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/staffFormDetail.css" />
</head>


<body>
	<div class="container d-flex justify-content-center">
		<div class="col-md-8">
			<div class="text-left mb-4">
				<h1>상세보기</h1>
			</div>

			<div class="row">
				<div class="col-md-3 flex justify-content-center">
					<img src="img/profilel.jpg" alt="Profile Image"
						class="img-fluid profile-image mb-4" />
				</div>

				<div class="col-md-9">
					<form:form action="staffmodify_pro" method='post' modelAttribute="staffmodifyUserBean">
						
						 <form:hidden path="id" />
						<form:hidden path="work_id" />


						<div class="form-group">
							<form:label path="name">이름</form:label>
							<form:input path="name" class="form-control" disabled="true" />
						</div>

						<div class="form-group">
							<form:label path="tel">전화</form:label>
							<form:input path="tel" class="form-control" disabled="true" />
						</div>

						<div class="form-group">
							<form:label path="email">이메일</form:label>
							<form:input path="email" class="form-control" disabled="true" />
						</div>

						<div class="form-group">
							<form:label path="add1" id="sample6_postcode">주소</form:label>
							<div class="input-group">
								<form:input path="add1" id="sample6_address"
									class="form-control"  />
								<button type="button" class="btn btn-secondary"
									onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
							</div>
						</div>

						<div class="form-group">
							<form:label path="add2" id="sample6_detailAddress">상세주소</form:label>
							<form:input path="add2" id="sample6_detailAddress"
								class="form-control" />
						</div>

						<div class="form-group">
							<form:label path="hourWage">시급</form:label>
							<form:input path="hourWage" class="form-control"
								required="true" />
						</div>

						<div class="form-group">
							<form:label path="employ_date">입사일</form:label>
							<div class="input-group">
								<form:input path="employ_date"
									class="form-control datepicker" required="true" />
								<div class="input-group-calender-icon">
									<button type="button" class="btn btn-outline-secondary"
										onclick="showDatePicker('employ_date')">📅</button>
								</div>
							</div>
						</div>

						<div class="form-group">
							<form:label path="exp_periodstart">수습기간 시작</form:label>
							<div class="input-group ">
								<form:input path="exp_periodstart"
									class="form-control datepicker" required="true" />
								<div class="input-group-calender-icon">
									<button type="button" class="btn btn-outline-secondary"
										onclick="showDatePicker('exp_periodstart')">📅</button>
								</div>
							</div>
							<form:label path="exp_periodend">수습기간 종료</form:label>
							<div class="input-group ">
								<form:input path="exp_periodend"
									class="form-control datepicker" required="true" />
								<div class="input-group-calender-icon">
									<button type="button" class="btn btn-outline-secondary"
										onclick="showDatePicker('exp_periodend')">📅</button>
								</div>
							</div>
						</div>

						<div class="form-group">
							<form:label path="insurance">4대보험 유무</form:label>

							<div class="form-check">
								<form:radiobuttons path="insurance" items="${inradio}"
									itemLabel="key" itemValue="value" readonly="false" />
							</div>
						</div>

						<div class="button-container text-right">
							<button type="submit" class="btn btn-primary btn-lg">수정하기</button>
						</div>
					</form:form>
				</div>
				</div>
			</div>
</div>

<!-- DAUM 우편번호 API 스크립트 로드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 문서가 준비되면 실행되는 함수
    $(document).ready(function() {
        // datepicker 초기화 및 형식 설정
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd", // 날짜 형식을 "년-월-일"로 설정
        });

        // 아이콘 클릭 시 datepicker 표시
        $(".input-group-calender-icon button").on("click", function() {
            // 클릭한 버튼의 부모 요소에서 형제인 input 요소의 ID를 가져옴
            var inputId = $(this).parent().siblings("input").attr("id");
            // 해당 ID를 가진 datepicker를 표시
            $("#" + inputId).datepicker("show");
        });
    });

    // Daum 우편번호 검색 기능
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            // 주소 선택 완료 시 실행되는 콜백 함수
            oncomplete: function(data) {
                var addr = ''; // 주소를 저장할 변수

                // 사용자가 선택한 주소 타입에 따라 주소 값을 가져옴
                if (data.userSelectedType === 'R') { // 도로명 주소인 경우
                    addr = data.roadAddress; // 도로명 주소를 저장
                } else { // 지번 주소인 경우
                    addr = data.jibunAddress; // 지번 주소를 저장
                }

                // 우편번호와 주소 정보를 해당 필드에 입력
                document.getElementById('sample6_postcode').value = data.zonecode; // 우편번호 입력
                document.getElementById("sample6_address").value = addr; // 주소 입력
                // 커서를 상세주소 입력 필드로 이동
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open(); // 우편번호 검색 창 열기
    }

    // 폼 제출 함수 (현재 비어 있음)
    function submitForm() {
        // 폼 제출 관련 로직을 여기에 추가할 수 있음
    }
</script>

</body>