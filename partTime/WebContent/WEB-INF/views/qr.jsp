<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QR 코드 스캐너</title>
<script src="https://unpkg.com/@zxing/library@latest"></script>
<style>
    /* 모달 다이얼로그 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 80%;
        height: 80%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4); /* 반투명 배경 */
    }

    .modal-content {
        background-color: #fefefe;
        margin: 10% auto;
        padding: 10px;
        border: 1px solid #888;
        width: 50%;
    }

    .modal-header {
        padding: 10px;
        background-color: #5cb85c;
        color: white;
        text-align: center;
    }

    .modal-body {
        padding: 10px;
        text-align: center;
    }

    .modal-footer {
        padding: 10px;
        text-align: center;
    }

    .form-hidden {
        display: none; /* 폼 숨기기 */
    }
</style>
</head>
<body>
   <form id="qrForm" action="qr_pro" method="POST" class="form-hidden">
      <div class="form-group">
         <input type="text" name="ceo_id" /> <!-- CEO ID 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" name="reg_num" value="${reg_num}" placeholder="등록 번호" /> <!-- 등록 번호 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" name="type_num" value="${type_num}" placeholder="타입 번호" /> <!-- 타입 번호 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" name="work_id" value="${id}" /> <!-- 작업 ID 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" name="staff_number" placeholder="사원 번호" /> <!-- 사원 번호 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" name="workIn" id="workTime" placeholder="출근 시간" /> <!-- 출근 시간 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" name="workOut" id="workTime2" placeholder="퇴근 시간" /> <!-- 퇴근 시간 입력 필드 -->
      </div>
      <div class="form-group">
         <input type="text" id="hasCheckedIn" name="hasCheckedIn" value="false"> <!-- 출근 여부 -->
      </div>
      <!-- submit type을 hidden으로 설정하여 폼 자동 제출 버튼 표시 안함 -->
      <div class="form-group">
         <input type="hidden" name="qrForm" value="false" /> <!-- 폼 제출 버튼 -->
      </div>
   </form>

   <!-- 모달 다이얼로그 -->
   <div id="alertModal" class="modal">
       <div class="modal-content">
           <div class="modal-header">
               <h2 id="modalHeader">알림</h2>
           </div>
           <div class="modal-body">
               <p id="modalMessage"></p>
           </div>
           <div class="modal-footer">
               <button id="modalCloseButton">닫기</button>
           </div>
       </div>
   </div>

   <video id="video" width="700" height="700" autoplay></video>

   <script>
    let isScanningEnabled = true;

    document.addEventListener("DOMContentLoaded", function() {
        let hasCheckedIn = localStorage.getItem('hasCheckedIn') === 'true';
        document.getElementById('hasCheckedIn').value = hasCheckedIn;
    });

    function getCurrentTime() {
        const now = new Date();
        const options = { 
            year: 'numeric', 
            month: '2-digit', 
            day: '2-digit', 
            hour: '2-digit', 
            minute: '2-digit', 
            second: '2-digit', 
            hour12: false 
        };
        const currentTime = now.toLocaleString('ko-KR', options);
        console.log('getCurrentTime() 호출됨:', currentTime); // 디버깅용 로그 추가
        return currentTime;
    }

    function showAlert(message, header) {
        console.log('showAlert() 호출됨:', message); // 디버깅용 로그 추가
        document.getElementById('modalMessage').textContent = message;
        document.getElementById('modalHeader').textContent = header;
        document.getElementById('alertModal').style.display = 'block';

        // 모달 창이 닫힌 후에 폼이 제출되도록 변경
        setTimeout(function() {
            document.getElementById('alertModal').style.display = 'none';
            document.getElementById('qrForm').submit();
        }, 1000);
    }

    document.getElementById('modalCloseButton').onclick = function() {
        document.getElementById('alertModal').style.display = 'none';
    };

    const codeReader = new ZXing.BrowserQRCodeReader();
    codeReader.getVideoInputDevices()
        .then((videoInputDevices) => {
            if (videoInputDevices.length > 0) {
                const firstDeviceId = videoInputDevices[0].deviceId;
                codeReader.decodeFromVideoDevice(firstDeviceId, 'video', (result, err) => {
                    if (result && isScanningEnabled) {
                        const qrData = JSON.parse(result.text);
                        document.querySelector('input[name="ceo_id"]').value = qrData.ceo_id;

                        let hasCheckedIn = document.getElementById('hasCheckedIn').value === 'true';
                        const currentTime = getCurrentTime(); // 현재 시간을 가져옴

                        if (!hasCheckedIn) {
                            // 출근 시간 설정
                            document.getElementById('workTime').value = currentTime;
                            document.getElementById('workTime2').value = ""; // 퇴근 시간 비움
                            localStorage.setItem('hasCheckedIn', 'true');
                            document.getElementById('hasCheckedIn').value = 'true';

                            showAlert(`어서오세요 \n오늘 하루도 힘내세요.`, '출근 완료');
                        } else {
                            // 퇴근 시간 설정
                            document.getElementById('workTime2').value = currentTime;
                            localStorage.setItem('hasCheckedIn', 'false');
                            document.getElementById('hasCheckedIn').value = 'false';

                            showAlert(`안녕히 가세요 \n오늘 하루도 수고하셨어요.`, '퇴근 완료');
                        }

                        isScanningEnabled = false; // 스캔 비활성화
                        setTimeout(() => {
                            isScanningEnabled = true; // 2분 후에 스캔 활성화
                        }, 120000);

                    } else if (err && !(err instanceof ZXing.NotFoundException)) {
                        console.error(err);
                    }
                });
            } else {
                console.error('비디오 장치가 없습니다.');
            }
        })
        .catch(err => {
            console.error('카메라 접근 오류:', err);
            alert('카메라에 접근할 수 없습니다. 설정을 확인하세요.');
        });
</script>

</body>
</html>