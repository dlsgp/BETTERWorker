<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BETTERworker 회원가입</title>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<link rel="stylesheet" href="css/join.css" />
</head>


<script>
	function checkUserIdExist() {
		var id = $("#id").val();

		if (id.length === 0) {
			alert('아이디를 입력해주세요');
			return;
		}

		$.ajax({
			url : '${pageContext.request.contextPath}/checkUserIdExist/' + id,
			type : 'GET',
			dataType : 'json', // JSON 데이터 요청
			success : function(result) {
				if (result.duplicated) {
					alert('사용할 수 없는 아이디입니다');
				} else {
					alert('사용할 수 있는 아이디입니다');
				}
			},
			error : function(xhr, status, error) {
				console.error(xhr.responseText); // 오류 메시지 출력
				alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
			}
		});
	}

	function checkUserEmailExist() {
		var email = $("#email").val().trim();

		if (email.length === 0) {
			alert('이메일을 입력해주세요');
			return;
		}
		
		console.log("입력한 이메일: ", email); //이메일 로그 추가

		$.ajax({
		    url: '${pageContext.request.contextPath}/checkUserEmailExist/' + encodeURIComponent(email),
		    type: 'GET',
		    dataType: 'json',
		    contentType: 'application/json; charset=utf-8',
		    headers: {
		        'Accept': 'application/json'
		    },
		    success: function(result) {
		        if (result.duplicated) {
		            alert('사용할 수 없는 이메일입니다');
		        } else {
		            alert('사용할 수 있는 이메일입니다');
		        }
		    },
		    error: function(xhr, status, error) {
		        console.error(xhr.responseText);
		        alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
		    }
		});


		}

	//        var email = $("#email").val().trim();

	//        console.log("Entered Email: ", email);

	//       if (email.length === 0) {
	//          alert('이메일을 입력해주세요');
	//          return;
	//       }

	//       // 이메일 형식 검증
	//       var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	//       if (!emailPattern.test(email)) {
	//          alert('유효한 이메일 주소를 입력해주세요');
	//          return;
	//       }

	//       $.ajax({
	//          url : '${pageContext.request.contextPath}/checkUserEmailExist/' + encodeURIComponent(email),
	//          type : 'get',
	//          dataType : 'json', // JSON으로 변경
	//          success : function(result) {
	//             if (result.exists) {
	//                alert('사용할 수 없는 이메일입니다');
	//                $("#userEmailExist").val('false');
	//             } else {
	//                alert('사용할 수 있는 이메일입니다');
	//                $("#userEmailExist").val('true');
	//             }
	//          },
	//          error : function() {
	//             alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
	//          }
	//       });
	//    }

	// 사업자 번호 중복확인
	function checkUserJobNum() {
		var jobNum = $("#jobNum").val();

		if (jobNum.length === 0) {
			alert('사업자번호를 입력해주세요');
			return;
		}

		$.ajax({
			url : '${pageContext.request.contextPath}/checkUserJobNum',
			type : 'GET',
			data : {
				jobNum : jobNum
			},
			dataType : 'json',
			success : function(result) {
				if (result.valid === 'false') {
					alert('사용 중인 사업자번호입니다.');
				} else {
					alert('사용 가능한 사업자번호입니다.');
				}
			},
			error : function(xhr, status, error) {
				console.error(xhr.responseText);
				alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
			}
		});
	}

	function resetUserIdExist() {
		$("#userIdExist").val('false');
	}

	function resetUserEmailExist() {
		$("#userEmailExist").val('false');
	}

	function resetUserjobNumExist() {
		$("#userjobNumExist").val('false');
	}

	function chooseFields() {
		var userType = document.getElementById('type_num').value;
		if (userType == "1") {
			document.getElementById('personal').style.display = 'block';
			document.getElementById('business').style.display = 'none';
		} else if (userType == "2") {
			document.getElementById('personal').style.display = 'none';
			document.getElementById('business').style.display = 'block';
		}
	}
	window.onload = function() {
		// 전체 동의 체크박스, 서비스 모달 본문, 서비스 확인 버튼, 개인정보 모달 본문, 개인정보 확인 버튼을 변수에 할당
		const overallCheckbox = document.getElementById('flexCheckDefault0'); // 전체 동의 체크박스
		const serviceModalBody = document.getElementById('serviceModalBody'); // 서비스 이용약관 모달 본문
		const confirmServiceButton = document.getElementById('confirmService'); // 서비스 모달의 확인 버튼
		const privacyModalBody = document.getElementById('privacyModalBody'); // 개인정보 수집 및 이용동의 모달 본문
		const confirmPrivacyButton = document.getElementById('confirmPrivacy'); // 개인정보 모달의 확인 버튼

		// 전체 동의 체크박스에 change 이벤트 리스너 추가
		// 전체 동의 체크박스 상태가 변경되면 개별 동의 체크박스 상태도 변경됨
		overallCheckbox
				.addEventListener(
						'change',
						function() {
							const isChecked = this.checked; // 전체 동의 체크박스의 체크 상태
							const checkboxes = document
									.querySelectorAll('#flexCheckDefault1, #flexCheckDefault2'); // 개별 체크박스들 선택
							// 각 개별 체크박스의 상태를 전체 동의 체크박스 상태와 동일하게 설정
							checkboxes.forEach(function(checkbox) {
								checkbox.checked = isChecked;
							});
						});

		// 모달 내에서 스크롤이 끝까지 내려갔을 때만 확인 버튼을 활성화하는 함수
		function enableConfirmButton(modalBody, confirmButton) {
			modalBody
					.addEventListener(
							'scroll',
							function() {
								// 모달의 스크롤이 끝까지 내려갔는지 확인
								const isAtBottom = modalBody.scrollTop
										+ modalBody.clientHeight >= modalBody.scrollHeight - 1;
								confirmButton.disabled = !isAtBottom; // 스크롤이 끝까지 내려간 경우에만 확인 버튼 활성화
							});
		}

		// 서비스 이용약관 모달과 개인정보 수집 및 이용동의 모달에 대해 enableConfirmButton 함수를 호출하여 확인 버튼을 제어
		enableConfirmButton(serviceModalBody, confirmServiceButton); // 서비스 이용약관 모달에 대한 설정
		enableConfirmButton(privacyModalBody, confirmPrivacyButton); // 개인정보 수집 및 이용동의 모달에 대한 설정

		// 서비스 확인 버튼 클릭 시 실행되는 이벤트 리스너
		confirmServiceButton.addEventListener('click', function() {
			document.getElementById('flexCheckDefault1').checked = true; // 서비스 동의 체크박스를 체크
			updateOverallAgreement(); // 전체 동의 체크박스 상태 업데이트

			// 모달을 수동으로 닫기
			$('#serviceModal').removeClass('show').css('display', 'none'); // 모달 닫기
			$('.modal-backdrop').remove(); // 모달의 백드롭 제거
			$('body').removeClass('modal-open'); // 모달이 열릴 때 추가된 클래스 제거
			$('body').css('padding-right', ''); // 모달이 열릴 때 추가된 padding 제거
		});

		// 개인정보 확인 버튼 클릭 시 실행되는 이벤트 리스너
		confirmPrivacyButton.addEventListener('click', function() {
			document.getElementById('flexCheckDefault2').checked = true; // 개인정보 동의 체크박스를 체크
			updateOverallAgreement(); // 전체 동의 체크박스 상태 업데이트

			// 모달을 수동으로 닫기
			$('#privacyModal').removeClass('show').css('display', 'none'); // 모달 닫기
			$('.modal-backdrop').remove(); // 모달의 백드롭 제거
			$('body').removeClass('modal-open'); // 모달이 열릴 때 추가된 클래스 제거
			$('body').css('padding-right', ''); // 모달이 열릴 때 추가된 padding 제거
		});

		// 서비스 동의 체크박스 클릭 시 실행되는 이벤트 리스너
		// 체크가 해제된 상태에서만 모달을 열도록 함
		document.getElementById('flexCheckDefault1').addEventListener('click',
				function(event) {
					if (!this.checked) {
						event.preventDefault(); // 기본 클릭 동작을 막고
						$('#serviceModal').modal('show'); // 모달을 열기
					} else {
						this.checked = false; // 체크박스 해제
					}
				});

		// 개인정보 동의 체크박스 클릭 시 실행되는 이벤트 리스너
		// 체크가 해제된 상태에서만 모달을 열도록 함
		document.getElementById('flexCheckDefault2').addEventListener('click',
				function(event) {
					if (!this.checked) {
						event.preventDefault(); // 기본 클릭 동작을 막고
						$('#privacyModal').modal('show'); // 모달을 열기
					} else {
						this.checked = false; // 체크박스 해제
					}
				});

		// 모달을 수동으로 닫을 때 체크박스 상태 확인
		function closeModalAndCheckCheckbox(modal, checkboxId) {
			const checkbox = document.getElementById(checkboxId);
			if (!checkbox.checked) {
				checkbox.checked = false; // 체크박스 해제
			}
		}

		// 서비스 모달 닫기 함수
		function closeServiceModal() {
			closeModalAndCheckCheckbox('#serviceModal', 'flexCheckDefault1');
		}

		// 개인정보 모달 닫기 함수
		function closePrivacyModal() {
			closeModalAndCheckCheckbox('#privacyModal', 'flexCheckDefault2');
		}

		// 모달 닫기 시 체크박스 상태 업데이트
		$('#serviceModal').on('hidden.bs.modal', closeServiceModal);
		$('#privacyModal').on('hidden.bs.modal', closePrivacyModal);

		// 전체 동의 체크박스의 상태를 개별 동의 체크박스의 상태에 따라 업데이트하는 함수
		function updateOverallAgreement() {
			const isServiceChecked = document
					.getElementById('flexCheckDefault1').checked; // 서비스 동의 체크박스 상태
			const isPrivacyChecked = document
					.getElementById('flexCheckDefault2').checked; // 개인정보 동의 체크박스 상태
			overallCheckbox.checked = isServiceChecked && isPrivacyChecked; // 둘 다 체크된 경우에만 전체 동의 체크박스를 체크
		}
	};

	function checkNull(value) {
		return value === null || value === undefined || value === '';
	}

	function rrn(str) {
		let originStr = str;
		let rrnStr;
		let maskingStr;
		let strLength;

		if (checkNull(originStr) == true) {
			return originStr;
		}

		rrnStr = originStr
				.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
		if (checkNull(rrnStr) == false) {
			strLength = rrnStr.toString().split('-').length;
			maskingStr = originStr.toString().replace(
					rrnStr,
					rrnStr.toString().replace(/(-?)([1-4]{1})([0-9]{6})\b/gi,
							"$1$2******"));
		} else {
			rrnStr = originStr.match(/\d{13}/gi);
			if (checkNull(rrnStr) == false) {
				strLength = rrnStr.toString().split('-').length;
				maskingStr = originStr.toString().replace(rrnStr,
						rrnStr.toString().replace(/([0-9]{6})$/gi, "******"));
			} else {
				return originStr;
			}
		}
		return maskingStr;
	}
</script>

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
</script>
<script type="text/javascript">
	function checkNull(value) {
		return value === null || value === undefined || value === '';
	}

	function rrn(str) {
		let originStr = str;
		let rrnStr;
		let maskingStr;

		if (checkNull(originStr)) {
			return originStr;
		}

		rrnStr = originStr
				.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
		if (!checkNull(rrnStr)) {
			maskingStr = originStr.replace(rrnStr, rrnStr.toString().replace(
					/(-?)([1-4]{1})([0-9]{6})\b/gi, "$1$2******"));
		} else {

			rrnStr = originStr.match(/\d{13}/gi);
			if (!checkNull(rrnStr)) {
				maskingStr = originStr.replace(rrnStr, rrnStr.toString()
						.replace(/([0-9]{6})([0-9]{7})/gi, "$1-$2").replace(
								/([0-9]{7})$/gi, "******"));
			} else {
				return originStr;
			}
		}
		return maskingStr;
	}
	function applyRrnMasking() {
		let inputField = document.querySelector("[name='birthNum']");
		inputField.addEventListener("input", function() {
			this.value = rrn(this.value);
		});
	}

	document.addEventListener("DOMContentLoaded", function() {
		applyRrnMasking();
	});
</script>


<body>

	<%-- <c:import url="/WEB-INF/views/include/top_menu.jsp" /> --%>

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form:form action="join_pro" method='post'
							modelAttribute="joinUserBean">

							<form:hidden path="reg_date" />

							<div class="form-group">
							
								<form:label path="type_num">가입자유형</form:label>
								<form:select path="type_num" class='form-control' id="type_num"
									onchange="chooseFields()">

									<form:option value="1">개인회원</form:option>
									<form:option value="2">기업회원</form:option>

								</form:select>
							</div>

							<div class="form-group">

								<form:label path="id">아이디</form:label>
								<div class="input-group">
									<form:input path="id" class='form-control'
										onkeypress="resetUserIdExist()" />
									<div class="input-group-append">
										<button type="button" class="btn btn-primary"
											onclick='checkUserIdExist()'>중복확인</button>
									</div>
								</div>
								<form:errors path="id" style='color:red' />
							</div>

							<div class="form-group">
								<form:label path="pwd">비밀번호</form:label>
								<form:password path="pwd" class='form-control' />
								<form:errors path='pwd' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="pwd2">비밀번호 확인</form:label>
								<form:password path="pwd2" class='form-control' />
								<form:errors path='pwd2' style='color:red' />
							</div>

							<div class="form-group">
								<form:label path="email">이메일</form:label>
								<div class="input-group">
									<form:input path="email" 
										class='form-control' onkeypress="resetUserEmailExist()" />
<!-- 									<div class="input-group-append"> -->
<!-- 										<button type="button" class="btn btn-primary" -->
<!-- 											onclick='checkUserEmailExist()'>중복확인</button> -->
<!-- 									</div> -->
								</div>
								<form:errors path="email" style='color:red' />
							</div>

							<form:hidden path="userIdExist" />
							<div class="form-group">
								<form:label path="name">이름/대표자이름</form:label>
								<form:input path="name" class='form-control' />
								<form:errors path="name" style='color:red' />
							</div>


							<div class="form-group">
								<span>주소</span>
								<form:label path="add1" for="sample6_postcode"></form:label>

								<div class="input-group">
									<input type="text" id="sample6_postcode" class="form-control"
										placeholder="우편번호" readonly>

									<button type="button" class="btn btn-secondary"
										onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
								</div>

								<div class="form-group" style="margin-top: 10px;">
									<form:input path="add1" id="sample6_address"
										class="form-control" placeholder="주소" />
									<form:errors path="add1" style='color:red' />
								</div>

								<div class="form-group">
									<form:input path="add2" id="sample6_detailAddress"
										class='form-control' placeholder="상세주소" />
									<form:errors path='add2' style='color:red' />
								</div>



							</div>


							<form>
								<div id="personal" style="display: block;">
									<div class="form-group">
										<form:label path="birthNum">주민번호</form:label>
										<form:input path="birthNum" class='form-control' />
										<form:errors path="birthNum" style='color:red' />
									</div>

									<div class="form-group">
										<form:label path="birth">생년월일</form:label>
										<form:input path="birth" class='form-control' />
										<form:errors path="birth" style='color:red' />
									</div>
								</div>

								<div id="business" style="display: none;">
									<div class="form-group">
										<form:label path="jobNum">사업자번호</form:label>
										<div class="input-group">
											<form:input path="jobNum" class='form-control' id="jobNum"
												onkeypress="resetUserjobNumExist()" />
											<div class="input-group-append">
												<button type="button" class="btn btn-primary"
													onclick='checkUserJobNum()'>중복확인</button>
											</div>
										</div>
										<form:errors path="jobNum" style='color:red' />
									</div>
								

								<div class="form-group">
									<form:label path="phoneNum">대표자전화번호</form:label>
									<form:input path="phoneNum" class='form-control' />
									<form:errors path="phoneNum" style='color:red' />
								</div>
					</div>



					<div class="form-group">
						<form:label path="tel">전화번호</form:label>
						<form:input path="tel" class='form-control' />
						<form:errors path="tel" style='color:red' />
					</div>







					<div
						style="border: 1px solid #e5e5e5; padding: 15px; margin: 10px; border-radius: 10px;">
						<div class="form-check d-flex text-align-center">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault0"> <label class="form-check-label"
								for="flexCheckDefault0">이용약관에 전체동의</label>
						</div>

						<div class="form-check d-flex text-align-center">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault1" data-bs-toggle="modal"
								data-bs-target="#serviceModal"> <label
								class="form-check-label" for="flexCheckDefault1">[필수]
								서비스 이용약관 동의</label>
						</div>

						<div class="form-check d-flex text-align-center">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault2" data-bs-toggle="modal"
								data-bs-target="#privacyModal"> <label
								class="form-check-label" for="flexCheckDefault2">[필수]
								개인정보 수집 및 이용동의</label>
						</div>
					</div>

					<div class="form-group">
						<div class="text-right">
							<form:button class='btn btn-primary'>회원가입</form:button>
						</div>
					</div>
					</form>


					<!-- 서비스 이용약관 모달 -->
					<div class="modal fade" id="serviceModal" tabindex="-1"
						aria-labelledby="serviceModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="serviceModalLabel">서비스 이용약관</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body"
									style="max-height: 400px; overflow-y: auto;"
									id="serviceModalBody">
									<jsp:include page="service_modal.jsp" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary"
										id="confirmService" disabled>확인</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 개인정보 수집 및 이용동의 모달 -->
					<div class="modal fade" id="privacyModal" tabindex="-1"
						aria-labelledby="privacyModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="privacyModalLabel">개인정보 수집 및
										이용동의</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body"
									style="max-height: 400px; overflow-y: auto;"
									id="privacyModalBody">
									<jsp:include page="privacy.jsp" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary"
										id="confirmPrivacy" disabled>확인</button>
								</div>
							</div>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
	</div>



	<%--    <c:import url="/WEB-INF/views/include/bottom_info.jsp" /> --%>


</body>
</html>
