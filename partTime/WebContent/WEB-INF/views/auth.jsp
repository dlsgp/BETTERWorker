<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/userInfo/find.css">
<%@ include file="/WEB-INF/views/include/manage_header.jsp" %>
<script>
$(document).ready(function() {
	const URLSearch = new URLSearchParams(location.search);
	const username = URLSearch.get("username");

	const authNum = (function() {
		let send = false;
		const isSend = function(set) {
			if (!set) {
				return send;
			} else {
				send = set;
			}
		}
		return { isSend: isSend };
	})();

	function sendAuthNum(data, func) {
		$.ajax({
			url: "/send/authNum",
			type: "POST",
			data: data
		})
		.then(function(result) {
			swal({ text: result }).then(function() {
				func();
			});
		})
		.fail(function() {
			alert("에러");
		});
	}

	function sendAuthNumFnc(inputBox) {
		inputBox.prop("readonly", false);
		inputBox.focus();
		timer.start();
		authNum.isSend(true);
	}

	$(".auth_num_send_email").click(function() {
		const data = {
			email: $(".email").val(),
			username: username
		};
		if (!emailCheck(data.email)) {
			swal("이메일을 정확히 입력해주세요");
			return;
		}

		if (!timer.status().isStart) {
			swal('잠시 후 다시 시도해주세요');
			return;
		}

		const inputBox = $(this).siblings(".auth_num");

		$.ajax({
			url: "/find/password/emailCheck",
			type: "GET",
			data: data
		})
		.then(function(result) {
			if (result) {
				sendAuthNum({ email: data.email }, function() {
					sendAuthNumFnc(inputBox);
				});
			



</script>
	


<body>
	<div class="find_info">
		<div class="find">
			<div id="find_by_email">
				<input type="radio" id="email" value="email" name="find">
				<label for="email">가입한 이메일로 찾기</label>
				<div class="auth">
					<input type="email" class="email" placeholder="이메일을 입력해주세요" maxlength="50">
					<button type="button" class="auth_num_send_email">인증번호받기</button>
					<input type="text" class="auth_num" name="authNum" readonly maxlength="6" placeholder="인증번호6자리입력">
					<span class="timer"></span>
				</div>
			</div>

			<div id="find_by_phone">
				<input type="radio" id="phone" value="phone" name="find">
				<label for="phone">전화번호로 찾기</label>
				<div class="auth">
					<input type="text" class="phone" maxlength="11" placeholder="전화번호를 입력해주세요">
					<button type="button" class="auth_num_send_phone">인증번호받기</button>
					<input type="text" class="auth_num" name="authNum" readonly maxlength="6" placeholder="인증번호6자리입력">
					<span class="timer"></span>
				</div>
			</div>
		</div>
		<button class="move_modify">다음</button>
	</div>






</body>
</html>
