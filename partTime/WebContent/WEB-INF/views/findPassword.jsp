<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
    <%@ include file="/WEB-INF/views/include/manage_header.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://sweetalert.js"></script>
</head>
<body>
<div class="find_password_page">
	<div class="find_info">
		<h3>가입하신 아이디를 입력해주세요</h3>
		<input type="text" name="username" class="username">
		<button type="button" class="next_page">다음</button>
	</div>
</div>

<script>
$(document).ready(function() {
	function usernameCheck() {
	    const username = $("input[name=username]").val().trim();
	    if (!username) {
	        return Promise.resolve(false);
	    }

	    return $.ajax({
	        url: "/overlapCheck",
	        type: "GET",
	        data: {
	            value: username,
	            valueType: "username"
	        }
	    }).then(function(result) {
	        if (result == 1) {
	            return true;
	        } else {
	            swal("아이디가 존재하지 않습니다.");
	            return false;
	        }
	    }).fail(function() {
	        alert("서버와의 통신 중 에러가 발생했습니다.");
	        return false;
	    });
	}
	return submit;
	

	$(".next_page").click(function() {
		if (!usernameCheck()) {
			swal("아이디를 정확히 입력해주세요");
			return;
		}
		const data = {
			username: $(".username").val()
		};

		$.ajax({
			url: "/find/password/auth",
			type: "POST",
			data: data
		})
		.then(function(result) {
			location.href = "/find/password/auth?username=" + result;
		})
		.fail(function() {
			alert('에러가 발생했습니다.');
		});
	});
});
</script>
</body>
</html>
