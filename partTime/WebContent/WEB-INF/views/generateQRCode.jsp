<%@ page import="java.util.UUID"%>
<%@ page import="kr.co.partTime.util.QRCodeGenerator"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>관리자 QR</title>


<!--   // 클라이언트 IP 주소 확인 (주석 처리된 부분은 필요 시 활성화)
  
   String clientIp = request.getRemoteAddr(); // 클라이언트의 IP 주소를 가져옴 -->
<!--    String sessionIp = (String) session.getAttribute("clientIp"); // 세션에서 저장된 IP 주소를 가져옴 -->

<!--    if (sessionIp == null) { -->
<!--        // 세션에 IP 주소가 없으면, 현재 클라이언트 IP 주소를 세션에 저장 -->
<!--        session.setAttribute("clientIp", clientIp); -->
<!--        sessionIp = clientIp; // 세션 IP를 현재 클라이언트 IP로 설정 -->
<!--    } -->

<!--    // 현재 클라이언트 IP와 세션 IP가 다르면 접근 거부 -->
<!--    if (!clientIp.equals(sessionIp)) { -->
<!--        out.println("접근이 허용되지 않습니다. 같은 Wi-Fi에 접속해야 합니다."); -->
<!--        return; // 접근이 허용되지 않으면 이후 코드를 실행하지 않음 -->
<!--    } -->

<%
	String id = request.getParameter("id");

byte[] qrCodeImage = null;

// id가 null인지 체크하여 QR 코드 데이터 생성
if (id != null) {
	// QR 코드에 포함할 데이터 생성
	String qrData = "{\"ceo_id\":\"" + id + "\", \"uuid\":\"" + UUID.randomUUID().toString() + "\"}";

	// QR 코드 이미지 생성
	qrCodeImage = QRCodeGenerator.generateQRCode(qrData, 400, 400); // QR 코드 이미지 생성
	session.setAttribute("qrCodeText", qrData); // 세션에 생성된 QR 데이터 저장

	// 생성된 QR 코드를 이미지로 표시
	out.println("<img src='data:image/png;base64," + Base64.encodeBase64String(qrCodeImage) + "' alt='QR Code' />");
} else {
	out.println("<h1>ID가 없습니다.</h1>");
}
%>

<script>
	// 1분 후 자동 새로고침
	setTimeout(function() {
		window.location.reload(); // 페이지를 새로고침
	}, 120000); // 2분
</script>
