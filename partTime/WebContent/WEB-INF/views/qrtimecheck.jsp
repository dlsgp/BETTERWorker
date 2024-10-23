<%
    // 세션에서 QR 코드 텍스트를 가져옴
    String sessionQRCodeText = (String) session.getAttribute("qrCodeText");
    // 요청 파라미터에서 QR 코드 텍스트를 가져옴
    String userQRCodeText = request.getParameter("qrCode");

    // 세션에서 가져온 QR 코드 텍스트와 사용자가 입력한 QR 코드 텍스트 비교
    if (sessionQRCodeText == null || !sessionQRCodeText.equals(userQRCodeText)) {
        out.println("QR 코드가 일치하지 않습니다!"); // QR 코드가 일치하지 않음을 출력
    } else {
        out.println("QR 코드가 일치합니다!"); // QR 코드가 일치함을 출력
    }
%>
