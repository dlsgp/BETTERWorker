<%@ page import="java.util.UUID" %> // UUID를 생성하여 무작위 문자열을 생성
<%@ page import="kr.co.partTime.util.QRCodeGenerator" %> // QRCodeGenerator를 사용하여 QR 코드를 생성
<%@ page import="org.apache.commons.codec.binary.Base64" %> // Base64 인코딩을 위해 Commons Codec 라이브러리를 사용

<% // 무작위 문자열 생성
    String randomText = UUID.randomUUID().toString(); // UUID를 기반으로 무작위 문자열 생성
    
    // QR 코드 생성
    byte[] qrCodeImage = QRCodeGenerator.generateQRCode(randomText, 200, 200); // 200x200 크기의 QR 코드 이미지 생성
    
    // 생성된 무작위 문자열을 세션에 저장
    session.setAttribute("qrCodeText", randomText); // QR 코드에 대한 텍스트를 세션에 저장
%>

<!-- 생성된 QR 코드를 이미지로 표시 -->
<img src="data:image/png;base64,<%= org.apache.commons.codec.binary.Base64.encodeBase64String(qrCodeImage) %>" alt="QR Code" />
