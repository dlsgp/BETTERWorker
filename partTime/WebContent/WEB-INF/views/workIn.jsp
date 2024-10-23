<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR 스캐너</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
            background-color: #f0f0f0;
        }

        #qr-reader {
            width: 100%;
            max-width: 400px;
            height: auto;
        }

        #result {
            margin-top: 20px;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <h1>QR 코드 스캐너</h1>
    <div id="qr-reader"></div>
    <div id="result"></div>

    <!-- QR 코드 라이브러리 스크립트 로드 -->
    <script src="https://unpkg.com/html5-qrcode/minified/html5-qrcode.min.js"></script>
    
    <!-- QR 스캐너 초기화 스크립트 -->
    <script>
        function onScanSuccess(qrCodeMessage) {
            document.getElementById('result').innerText = "스캔된 QR 코드: " + qrCodeMessage;
        }

        function onScanError(errorMessage) {
            // 스캔 에러 처리 (필요시)
        }

        // QR 스캐너 초기화
        const html5QrCode = new Html5Qrcode("qr-reader");
        const config = {
            fps: 10,
            qrbox: 250
        };

        html5QrCode.start(
            { facingMode: "environment" },
            config,
            onScanSuccess,
            onScanError
        ).catch(err => {
            console.error("QR 스캐너 초기화 실패: ", err);
        });
    </script>
</body>
</html>
