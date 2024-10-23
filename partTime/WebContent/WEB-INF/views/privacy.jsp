<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<script>
	document.getElementById('flexCheckDefault2').addEventListener('click',
			function() {
				$('#privacyModal').modal('show');
			});

	window.onclick = function(event) {
		if (event.target === document.getElementById('flexCheckDefault2')) {
			document.getElementById('flexCheckDefault2').style.display = 'true';
		}
	}
</script>

<body>

	<div class="modal-body">
		<p>귀하의 소중한 개인정보는 다음과 같은 목적으로 수집 및 이용됩니다. 본 동의서에 서명하시면, 개인정보의 수집 및
			이용에 동의하는 것으로 간주됩니다.</p>
		<br />

		<p>개인정보 수집 항목</p>
		<br />
		<p>
			필수 항목: 이름, 생년월일, 성별, 주소, 전화번호, 이메일 주소 <br />선택 항목: 직업, 취미, 관심사, 기타
			개인적인 정보
		</p>
		<br />
		<p>개인정보 수집 및 이용 목적</p>
		<br />
		<p>
			회원 관리: 회원제 서비스 이용에 따른 본인 확인, 개인 식별, 가입 의사 확인, 부정 이용 방지, 고지사항 전달 등 <br />서비스
			제공: 서비스 제공에 관련된 계약 이행 및 서비스 제공에 따른 요금정산 <br />마케팅 및 광고: 이벤트 정보 및 참여
			기회 제공, 광고성 정보 제공 등 <br />고객 지원: 고객 문의 및 불만 처리, 서비스 개선을 위한 분석 등
		</p>

		<br />
		<p>개인정보 보유 및 이용 기간</p>

		<p>
			개인정보는 수집 및 이용 목적이 달성된 후에는 지체 없이 파기합니다. 단, 관련 법령에 따라 보관이 필요한 경우 해당
			법령에서 정한 기간 동안 보관합니다. <br />예: 계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래 등에서의 소비자
			보호에 관한 법률) <br />대금 결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래 등에서의 소비자 보호에 관한
			법률) <br />소비자의 불만 또는 분쟁 처리에 관한 기록: 3년 (전자상거래 등에서의 소비자 보호에 관한 법률)
		</p>

		<br />
		<p>개인정보 제3자 제공</p>

		<p>
			원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. <br />이용자가 사전에
			동의한 경우 <Br />법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는
			경우
		</p>

		<Br />
		<p>개인정보 처리 위탁</p>

		<p>
			원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리 업무를 위탁하고 있습니다. <br />수탁자: [수탁자명] <br />위탁하는
			업무의 내용: [업무 내용] <br />위탁 계약 시 개인정보 보호의 안전을 기하기 위해 필요한 사항을 규정하고, 수탁자가
			개인정보를 안전하게 처리하는지를 감독하고 있습니다.
		</p>

		<br />
		<p>이용자의 권리</p>

		<p>
			이용자는 언제든지 개인정보 보호 관련 법령에 따라 자신의 개인정보에 대한 열람, 정정, 삭제, 처리 정지 등의 권리를 행사할
			수 있습니다. <Br />권리 행사는 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, 이에 대해 지체 없이
			조치하겠습니다.
		</p>

		<br />
		<p>[동의 철회]</p>

		<p>귀하는 개인정보 제공에 대한 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부하실 경우 서비스
			이용에 제한이 있을 수 있습니다.</p>

		<br />
		<p>[문의처]</p>

		<p>개인정보와 관련한 문의 및 요청은 아래의 연락처로 해주시기 바랍니다.</p>

		<p>
			담당자: [담당자명] <br />연락처: [전화번호] 이메일: [이메일 주소] 본인은 위와 같은 내용으로 개인정보 수집 및
			이용에 동의합니다.
		</p>
	</div>

</body>
</html>