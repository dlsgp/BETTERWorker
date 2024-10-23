<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>급여관리 폼</title>
<link href="css/salary_form.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
   <script>
      function chooseFields() {
         var userWork = document.getElementById('workTimeSelect').value;
         if (userWork == "1") {
            document.getElementById('work1').style.display = 'block';
            document.getElementById('work2').style.display = 'none';
            document.getElementById('work3').style.display = 'none';
            document.getElementById('work4').style.display = 'none';
            document.getElementById('work5').style.display = 'none';
            
         } else if (userWork == "2") {
            document.getElementById('work1').style.display = 'none';
            document.getElementById('work2').style.display = 'block';            
            document.getElementById('work3').style.display = 'none';
            document.getElementById('work4').style.display = 'none';
            document.getElementById('work5').style.display = 'none';
         } else if (userWork == "3") {
            document.getElementById('work1').style.display = 'none';
            document.getElementById('work2').style.display = 'none';            
            document.getElementById('work3').style.display = 'block';
            document.getElementById('work4').style.display = 'none';
            document.getElementById('work5').style.display = 'none';
         } else if (userWork == "4") {
            document.getElementById('work1').style.display = 'none';
            document.getElementById('work2').style.display = 'none';            
            document.getElementById('work3').style.display = 'none';
            document.getElementById('work4').style.display = 'block';
            document.getElementById('work5').style.display = 'none';
         } else if (userWork == "5") {
            document.getElementById('work1').style.display = 'none';
            document.getElementById('work2').style.display = 'none';            
            document.getElementById('work3').style.display = 'none';
            document.getElementById('work4').style.display = 'none';
            document.getElementById('work5').style.display = 'block';
         }

      }
   </script>


   <!-- top -->
   <c:import url="/WEB-INF/views/include/manage_header.jsp"></c:import>
   <div class="container" style="margin-top: 100px; color:black;">
      <div class="row">
         <div class="col-sm-3"></div>
         <div class="col-sm-6">
            <div class="card shadow">
               <div class="card-body d-flex">


                  <div class="col-sm-12">
                     <h4>
                        <b>급여관리</b>
                     </h4>


                     <form:form action="salaryForm_pro" method="post"
                        modelAttribute="salaryFormBean">
                        <form:input path="id" type="hidden" />
                        <div class="form-group">

                           <form:label path="id" style="color: black;">아이디</form:label>
                           <form:input type="text" path="id" class="form-control"
                              disabled="true" />
                        </div>

                        <div class="form-group">
                           <form:label path="name" style="color: black;">이름</form:label>
                           <div class="input-group">
                              <form:input path="name" type="text" class='form-control'
                                 disabled="true" />
                           </div>
                           <form:errors path="name" style='color:red' />
                        </div>

                        <div class="form-group">
                           <form:label path="hourWage style="color: black;"">시급</form:label>
                           <form:input type="text" path="hourWage" class="form-control" />
                        </div>

                        <div class="form-group">
                           <form:label path="insurance" style="color: black;">4대보험 유무</form:label>

                           <div class="form-check">
                              <form:radiobuttons path="insurance" items="${inradio }"
                                 itemLabel="key" itemValue="value" readonly="false" />
                           </div>
                        </div>


                        <div class="form-group">
                           <form:label path="holiday_pay" style="color: black;">주휴수당</form:label>
                           <form:input path="holiday_pay" class="form-control" />
                        </div>
                        <div class="form-group">
                           <form:label path="etc" style="color: black;">기타수당</form:label>
                           <form:input path="etc" class="form-control" />
                        </div>


                        <div class="form-group">
                           <form:label path="workTimeSelect" style="color: black;">근무시간 선택</form:label>
                           <form:select path="workTimeSelect" class='form-control'
                              id="workTimeSelect" onchange="chooseFields()">
                              <form:option value="1">첫째주</form:option>
                              <form:option value="2">둘째주</form:option>
                              <form:option value="3">셋째주</form:option>
                              <form:option value="4">넷째주</form:option>
                              <form:option value="5">다섯째주</form:option>
                           </form:select>
                        </div>


                        <div id="work1" style="display: block;">
                           <div class="form-group">
                              <form:label path="workTime1" style="color: black;">1주차 근무시간</form:label>
                              <form:input path="workTime1" class='form-control'
                                 id="workTime1" onchange="chooseFields()" />
                              <form:errors path="workTime1" style='color:red' />
                           </div>

                           <div class="form-group">
                              <form:label path="pay1" style="color: black;">1주차 급여</form:label>
                              <form:input path="pay1" id="pay1" class='form-control'
                                 disabled="true" />
                              <form:errors path="pay1" style='color:red' />
                           </div>
                        </div>

                        <div id="work2" style="display: none;">
                           <div class="form-group">
                              <form:label path="workTime2">2주차 근무시간</form:label>
                              <form:input path="workTime2" class='form-control'
                                 id="workTime2" onchange="chooseFields()" />
                              <form:errors path="workTime2" style='color:red' />
                           </div>

                           <div class="form-group">
                              <form:label path="pay2" style="color: black;">2주차 급여</form:label>
                              <form:input path="pay2" id="pay2" class='form-control'
                                 disabled="true" />
                              <form:errors path="pay2" style='color:red' />
                           </div>
                        </div>

                        <div id="work3" style="display: none;">
                           <div class="form-group">
                              <form:label path="workTime3" style="color: black;">3주차 근무시간</form:label>
                              <form:input path="workTime3" class='form-control'
                                 id="workTime3" onchange="chooseFields()" />
                              <form:errors path="workTime3" style='color:red' />
                           </div>

                           <div class="form-group">
                              <form:label path="pay3" style="color: black;">3주차 급여</form:label>
                              <form:input path="pay3" id="pay3" class='form-control'
                                 disabled="true" />
                              <form:errors path="pay3" style='color:red' />
                           </div>
                        </div>

                        <div id="work4" style="display: none;">
                           <div class="form-group">
                              <form:label path="workTime4" style="color: black;">4주차 근무시간</form:label>
                              <form:input path="workTime4" class='form-control'
                                 id="workTime4" onchange="chooseFields()" />
                              <form:errors path="workTime4" style='color:red' />
                           </div>

                           <div class="form-group">
                              <form:label path="pay4" style="color: black;">4주차 급여</form:label>
                              <form:input path="pay4" id="pay4" class='form-control'
                                 readonly="true" />
                              <form:errors path="pay4" style='color:red' />
                           </div>
                        </div>

                        <div id="work5" style="display: none;">
                           <div class="form-group">
                              <form:label path="workTime5" style="color: black;">5주차 근무시간</form:label>
                              <form:input path="workTime5" class='form-control'
                                 id="workTime5" onchange="chooseFields()" />
                              <form:errors path="workTime5" style='color:red' />
                           </div>

                           <div class="form-group">
                              <form:label path="pay5" style="color: black;">5주차 급여</form:label>
                              <form:input path="pay5" id="pay5" class='form-control'
                                 disabled="true" />
                              <form:errors path="pay5" style='color:red' />
                           </div>
                        </div>


                        <div class="form-group">
                           <form:label path="workTime" style="color: black;">총 근무 시간(분)</form:label>
                           <form:input path="workTime" id="workTime" class='form-control'
                              disabled="true" />
                        </div>


                        <div class="form-group">
                           <form:label path="pay" style="color: black;">총 급여</form:label>
                           <form:input path="pay" id="pay" class='form-control'
                              disabled="true" />
                        </div>

                        <!--                         <button type="button" class="btn btn-secondary" -->
                        <!--                            data-bs-dismiss="modal">닫기</button> -->
                        <button type="submit" class="btn btn-primary">수정하기</button>
                     </form:form>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-sm-3"></div>
      </div>
   </div>
</body>

</html>