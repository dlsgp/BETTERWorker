<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/view/include/manage_header.jsp"%> --%>
<script>
$(document).ready(function() {
    $(".modify_btn").click(function() {
        const newPassword = $(".new_password").val().trim();
        const confirmPassword = $(".confirm_password").val().trim();

        if (!newPassword || !confirmPassword) {
            swal("비밀번호를 입력해주세요");
            return;
        }

        if (newPassword !== confirmPassword) {
            swal("비밀번호가 일치하지 않습니다");
            return;
        }

        const username = new URLSearchParams(location.search).get("username");

        $.ajax({
                url: "/modify/password",
                type: "POST",
                data: {
                    username: username,
                    password: newPassword
                }
            })
            .then(function() {
                swal("비밀번호가 성공적으로 변경되었습니다").then(function() {
                    location.href = "/login";
                });
            })
            .fail(function(result) {
                swal(result.responseText);
            })
    });
});

</script>
<div>
    <div class="find_info">
        <h3>새로운 비밀번호를 입력해주세요</h3>
        <div class="password_modify_page">
            <div class="box">
                <span>새 비밀번호</span>
                <input type="password" name="newPassword" class="new_password">
            </div>
            <div class="box">
                <span>비밀번호 확인</span>
                <input type="password" name="confirmPassword" class="confirm_password">
            </div>
            <button class="modify_btn">비밀번호 재설정</button>
        </div>
        <div class="password_check_msg"></div>
    </div>
</div>




</body>
</html>
