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
<title>BETTERworker 로그인</title>
<!-- 카카오 CDN -->
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 네이버 CDN -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/login.css" />

<!-- 카카오 로그인 -->
<script type="text/javascript">
    Kakao.init('6d88e161c1c3977fa73d3b671e2a3f1f');
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                // 사용자 정보를 요청합니다.
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        // 사용자 정보를 서버로 전송
                        fetch('http://localhost:8080/kakao-login', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(response)
                        })
                        .then(res => res.json())
                        .then(data => {
                            if (data.success) {
                                alert('로그인 성공!');
                                window.location.href = '/home';
                            } else {
                                alert('로그인 실패: ' + data.message);
                            }
                        })
                        .catch(error => {
                            alert('에러 발생: ' + error);
                        });
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error));
                    },
                });
            },
            fail: function (error) {
                alert(JSON.stringify(error));
            },
        });
    }
</script>


<!-- 네이버 로그인 -->
<script>
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "o6s2ePpRDhsOFtMBao23",
        callbackUrl: "http://localhost:8086/partTime/naver_callback",
        isPopup: false,
        loginButton: {color: "green", type: 3, height: 60}
    });
    naverLogin.init();
    $("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());
    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) {
                setLoginStatus();
            }
        });
    }); 
    
    function redirectToNaverLogin() {
        // 네이버 인증 URL 생성 및 이동
        var authorizeUrl = naverLogin.generateAuthorizeUrl();
        window.location.href = authorizeUrl;
    }
    function setLoginStatus() {
        console.log(naverLogin.user);
        var uid = naverLogin.user.getId();
        var profileImage = naverLogin.user.getProfileImage();
        var uName = naverLogin.user.getName();
        var nickName = naverLogin.user.getNickName();
        var eMail = naverLogin.user.getEmail();
        $("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + 
                '" height=50 /> <p>' + uid + "-" + uName + '님 반갑습니다.</p>');
        $("#gnbLogin").html("Logout");
        $("#gnbLogin").attr("href", "#");
        $("#gnbLogin").click(function () {
            naverLogin.logout();
            location.reload();
        });
    }
   
   
</script>


	
	<script>
	// 페이지가 로드되면 실행되는 함수
	window.onload = function() {
	    // 쿠키에서 userId와 userPwd 가져오기
	    const id = getCookie("userId");
	    const encryptedPwd = getCookie("userPwd");
	    
	    // userId가 존재하면 입력 필드에 값을 설정하고 자동 로그인 체크
	    if (id) {
	        document.querySelector("input[name='id']").value = id; // id 입력 필드에 값 설정
	        document.getElementById("autoLogin").checked = true; // 자동 로그인 체크박스 체크
	    }
	    
	    // userPwd가 존재하면 복호화 후 입력 필드에 값 설정
	    if (encryptedPwd) {
	        document.querySelector("input[name='pwd']").value = decryptPassword(encryptedPwd); // pwd 입력 필드에 복호화한 값 설정
	    }
	}

	// 비밀번호를 암호화하는 함수
	function encryptPassword(pwd) {
	    return btoa(pwd); // base64로 인코딩
	}

	// 암호화된 비밀번호를 복호화하는 함수
	function decryptPassword(encryptedPwd) {
	    return atob(encryptedPwd); // base64로 디코딩
	}

	// 쿠키 값을 가져오는 함수
	function getCookie(name) {
	    let cookieArr = document.cookie.split(";"); // 쿠키를 세미콜론으로 분리
	    for (let i = 0; i < cookieArr.length; i++) {
	        let cookiePair = cookieArr[i].split("="); // 각 쿠키를 이름과 값으로 분리
	        if (name === cookiePair[0].trim()) {
	            return decodeURIComponent(cookiePair[1]); // 요청한 이름의 쿠키 값을 디코딩하여 반환
	        }
	    }
	    return null; // 쿠키가 없으면 null 반환
    }
    
    function toggleAutoLogin() {
        const autoLoginChecked = document.getElementById("autoLogin").checked;
        if (autoLoginChecked) {
            const id = document.querySelector("input[name='id']").value;
            const pwd = document.querySelector("input[name='pwd']").value;
            document.cookie = "userId=" + encodeURIComponent(id) + "; max-age=" + 24 * 60 * 60 + "; path=/";
            document.cookie = "userPwd=" + encodeURIComponent(encryptPassword(pwd)) + "; max-age=" + 24 * 60 * 60 + "; path=/";
        } else {
            document.cookie = "userId=; max-age=0; path=/";
            document.cookie = "userPwd=; max-age=0; path=/";
        }
    }
    function logout() {
        location.href = "login.jsp";
    }
</script>

</head>
<body>

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<c:if test="${logcheck == false }">
							<div class="alert alert-danger">
								<h3>로그인 실패</h3>
								<p>아이디 비밀번호를 확인해주세요</p>
							</div>
						</c:if>
						<form:form action="login_pro" method='post'
							modelAttribute="tempLoginUserBean">
							<div class="form-group">
								<form:label path="id">아이디</form:label>
								<form:input path="id" class='form-control' />
								<form:errors path='id' style='color:red' />
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" id="autoLogin"
									onclick="toggleAutoLogin()"> <label
									class="form-check-label" for="autoLogin">자동 로그인</label>
							</div>
							<div class="form-group">
								<form:label path="pwd">비밀번호</form:label>
								<form:password path="pwd" class='form-control' />
								<form:errors path='pwd' style='color:red' />
							</div>
							<div class="form-group text-left">
								<button type="button" class="btn btn-link"
									onclick="location.href='findPassword'">비밀번호 찾기</button>
							</div>
							<div class="form-group text-center">
								<form:button class='btn btn-primary btn-block'>로그인</form:button>
							</div>
							<div class="form-group text-center">
								<button type="button" class="btn btn-link"
									onclick="location.href='join'">회원가입</button>
							</div>
							<div class="line-login">
								<span>소셜 로그인</span>
							</div>
							<div class="icon">
								<a href="javascript:kakaoLogin()"><img
									src="<c:url value='/img/kakaologin.png'/>" /></a>
								<!-- 네이버 로그인 버튼 추가 -->

								<div id="naverIdLogin">
									<a id="naverIdLogin_loginButton"
										href="javascript:redirectToNaverLogin()" role="button"> <img
										src='img/naver_login.png' width="40" height="40"></a>
								</div>

							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>

</html>
