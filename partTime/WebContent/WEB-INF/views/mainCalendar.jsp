<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 달력</title>
<!-- FullCalendar CDN-->
<link
   href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css'
   rel='stylesheet' />
<script
   src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>

<!-- Bootstrap CDN-->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
   rel="stylesheet">
<link
   href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css'
   rel="stylesheet">
<link
   href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css'
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap5@6.1.14/index.global.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://cdn.jsdelivr.net/npm/tooltip.js@1.4.0"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="css/mainCalendar.css" />
<style>
.custom-icon {
   color: white;
}
</style>

</head>

<body>
   <script>
      document
            .addEventListener(
                  'DOMContentLoaded',
                  function() {
                     var calendarEl = document
                           .getElementById('calendar');
                     var calendar = new FullCalendar.Calendar(
                           calendarEl,
                           {
                              timeZone : 'UTC',
                              initialView : 'dayGridMonth',
                              themeSystem : 'sketch',
                              headerToolbar : {
                                 left : 'title',
                                 //                center : '',
                                 right : 'prev,next,today,dayGridMonth,timeGridWeek,timeGridDay,customButton'
                              },
                              customButtons : {
                                 customButton : {
                                    text : '추가',
                                    click : function() {
                                       alert("버튼 클릭됨");
                                    },
                                    icon : 'plus',
                                    iconContent : '<i class="fas fa-plus custom-icon"></i>'
                                 }
                              },
                              buttonText : {
                                 today : 'today',
                                 month : '월',
                                 week : '주',
                                 day : '일',
                                 list : '목록'
                              },
                           });

                     calendar.render();
                  });
   </script>

   <div id='calendar'></div>


   <form id="eventForm" action="mainCalendar_pro" method="post">
      <!-- 스케쥴 모달창 -->
      <div class="modal fade" id="eventModal" tabindex="-1"
         aria-labelledby="eventModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="eventModalLabel">스케줄 등록</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>

               <div class="modal-body">


                  <div class="form-group">
                     <label for="staffName"><i class="fas fa-user"></i>직원 이름</label> <select
                        class="form-control" id="name" name="name" required
                        onchange="fetchStaffDetails(this)">
                        <c:forEach var="staff" items="${stafflist }">
                           <option value="${staff.reg_num}"
                              data-work-id="${staff.work_id}"
                              data-staff-number="${staff.staff_number }"
                              data-type-num="${staff.type_num}"
                              data-reg-num="${staff.reg_num}">${staff.name}</option>
                        </c:forEach>


                     </select> <input type="hidden" id="work_id" name="work_id"> <input
                        type="hidden" id="staff_number" name="staff_number"> <input
                        type="hidden" id="type_num" name="type_num"> <input
                        type="hidden" id="reg_num" name="reg_num">
                  </div>

                  <div class="form-group">
                     <label for="workPeriodStart"><i
                        class="fas fa-calendar-alt"></i> 근무날짜</label> <input type="date"
                        class="form-control" id="sch_workDate" name="sch_workDate"
                        required>
                  </div>

                  <div class="form-group">
                     <label for="workTime"><i class="fas fa-clock"></i> 근무시간</label><br>
                     시작 <input type="time" class="form-control" id="sch_workTime"
                        name="sch_workTime" required> 끝 <input type="time"
                        class="form-control" id="sch_workEndTime" required
                        name="sch_workEndTime">
                  </div>



                  <div class="form-group">
                     <label for="restTime">휴게시간</label> <input type="text"
                        class="form-control" id="sch_restTime" name="sch_restTime">
                  </div>

                  <div class="form-group">
                     <label for="color">일정 색상</label> <select class="form-control"
                        id="color" name="color">
                        <option value="blue">파랑색</option>
                        <option value="red">빨강색</option>
                        <option value="green">초록색</option>
                        <option value="purple">보라색</option>
                     </select>
                  </div>

                  <div class="form-group">
                     <label for="memo">메모</label>
                     <textarea class="form-control" id="memo" name="memo"></textarea>
                  </div>

                  <div class="form-group">
                     <label for="restDate">휴무일</label>
                     <div class="form-check">
                        <input type="radio" name="restDate" value="1" id="restDateYes">
                        <label for="restDateYes">예</label>
                     </div>
                     <div class="form-check">
                        <input type="radio" name="restDate" value="0" id="restDateNo">
                        <label for="restDateNo">아니오</label>
                     </div>
                  </div>


                  <button type="submit" class="btn btn-primary">등록</button>
               </div>

            </div>
         </div>

      </div>
   </form>

   <script>
      function fetchStaffDetails(selectElement) {
         var selectedOption = selectElement.options[selectElement.selectedIndex];
         var workId = selectedOption.getAttribute('data-work-id');
         var staffNumber = selectedOption.getAttribute('data-staff-number');
         var typeNum = selectedOption.getAttribute('data-type-num');
         var regNum = selectedOption.getAttribute('data-reg-num');

         document.getElementById('work_id').value = workId;
         document.getElementById('staff_number').value = staffNumber;
         document.getElementById('type_num').value = typeNum;
         document.getElementById('reg_num').value = regNum;

         console.log("Selected Work ID: " + workId);
         console.log("Selected Staff Number: " + staffNumber)
         console.log("Selected type Num: " + typeNum);
         console.log("Selected reg_num : " + regNum);

      }

      document
            .getElementById('eventForm')
            .addEventListener(
                  'submit',
                  function(e) {
                     const workDate = document
                           .getElementById('sch_workDate').value;
                     const workStartTime = document
                           .getElementById('sch_workTime').value;
                     const workEndTime = document
                           .getElementById('sch_workEndTime').value;

                     const workStartDateTime = workDate + ' '
                           + workStartTime + ':00';
                     const workEndDateTime = workDate + ' '
                           + workEndTime + ':00';

                     document.getElementById('startDateTime').value = workStartDateTime;
                     document.getElementById('endDateTime').value = workEndDateTime;

                     console.log(startDateTime);
                     console.log(endDateTime);
                  });
   </script>




   <script>
      document.getElementById('sch_workTime').addEventListener(
            'change',
            function() {
               const startTime = this.value;
               document.getElementById('sch_workEndTime').setAttribute(
                     'min', startTime);
            }); //최소시간 설정 : 끝을 시작 이후로 하기위해

      document.addEventListener('DOMContentLoaded', function() {
         var calendarEl = document.getElementById('calendar');

         var calendar = new FullCalendar.Calendar(calendarEl, {
            themeSystem : 'sketch',
            height : 650,
            initialView : 'dayGridMonth', // 초기 뷰: 월간 달력
            headerToolbar : {
               left : 'prev,next today',
               center : 'title',
               right : 'dayGridMonth,timeGridWeek,timeGridDay' // 월, 주, 일 단위 보기 버튼 추가
            },
            buttonText : {
               today : '오늘날짜',
               month : '월',
               week : '주',
               day : '일',
               list : '목록'
            },
            events : '/getSchedules',

            // 날짜 클릭 시 모달 표시
            dateClick : function(info) {
               $('#sch_workTime').val(info.dateStr); // 시작 날짜 설정
               $('#sch_workEndTime').val(info.dateStr); // 종료 날짜 기본값 설정
               $('#eventModal').modal('show'); // 모달 띄우기
            }

         });

         calendar.render();

         $('#eventForm').on(
               'submit',
               function(e) {
                  e.preventDefault(); // 기본 폼 제출 방지

                  var name = $('#name option:selected').val();
                  var sch_workDate = $('#sch_workDate').val();
                  var sch_workTime = $('#sch_workTime').val();
                  var sch_workEndTime = $('#sch_workEndTime').val();
                  var color = $('#color').val();
                  var memo = $('#memo').val();

                  var workTime = sch_workTime;
                  var workEndTime = sch_workEndTime;

                  var event = {
                     title : name + 'T' + sch_workTime + ' ~ '
                           + sch_workEndTime,
                     end : sch_workDate + 'T' + sch_workEndTime,
                     backgroundColor : color,
                     description : memo,
                     allDay : false
                  };

                  calendar.addEvent(event);

                  //                                     // 선택된 요일 필터링
                  //                                     var weekDays = [];
                  //                                     $(
                  //                                           "input[name='weekDays']:checked")
                  //                                           .each(
                  //                                                 function() {
                  //                                                    weekDays
                  //                                                          .push($(
                  //                                                                this)
                  //                                                                .val());
                  //                                                 });

                  //                                     // 입력한 날짜의 요일들을 반복하여 이벤트 등록
                  //                                     var startDate = new Date(
                  //                                           sch_workDate); // 모달에서 선택한 날짜
                  //                                     var endDate = new Date(
                  //                                           startDate); // 필요한 경우 종료 날짜를 설정
                  //                                     endDate.setDate(startDate
                  //                                           .getDate() + 6); // 예를 들어, 1주일 후

                  //                                     var currentDate = new Date(
                  //                                           startDate);

                  //                                     while (currentDate <= endDate) {
                  //                                        var dayOfWeek = currentDate
                  //                                              .getDay(); // 현재 날짜의 요일 (0: 일, 1: 월, ... 6: 토)
                  //                                        var dayOfWeekKor = [ '일',
                  //                                              '월', '화', '수', '목',
                  //                                              '금', '토' ][dayOfWeek];

                  //                                        // 현재 날짜의 요일이 선택된 요일 중 하나일 경우
                  //                                        if (weekDays
                  //                                              .includes(dayOfWeekKor)) {
                  //                                           var eventTitle = `${name} ${sch_workTime} ~ ${sch_workEndTime}`; // 이벤트 제목
                  //                                           var event = {
                  //                                              title : eventTitle,
                  //                                              start : new Date(
                  //                                                    currentDate
                  //                                                          .getFullYear(),
                  //                                                    currentDate
                  //                                                          .getMonth(),
                  //                                                    currentDate
                  //                                                          .getDate(),
                  //                                                    sch_workTime
                  //                                                          .split(':')[0],
                  //                                                    sch_workTime
                  //                                                          .split(':')[1]),
                  //                                              end : new Date(
                  //                                                    currentDate
                  //                                                          .getFullYear(),
                  //                                                    currentDate
                  //                                                          .getMonth(),
                  //                                                    currentDate
                  //                                                          .getDate(),
                  //                                                    sch_workEndTime
                  //                                                          .split(':')[0],
                  //                                                    sch_workEndTime
                  //                                                          .split(':')[1]),
                  //                                              backgroundColor : color, // 모달에서 입력받은 색상
                  //                                              description : memo, // 모달에서 입력받은 메모
                  //                                              allDay : false
                  //                                           };

                  //                                           calendar
                  //                                                 .addEvent(event);
                  //                                        }

                  //                                        // 다음 날로 이동
                  //                                        currentDate
                  //                                              .setDate(currentDate
                  //                                                    .getDate() + 1);
                  //                                     }

                  $('#eventModal').modal('hide'); // 모달 닫기

                  $('#eventForm')[0].reset(); // 폼 초기화
                  this.submit();

               });

      });
   </script>


</body>
</html>